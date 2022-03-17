<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="BO.DishBO, BO.CartBO, java.util.*, entity.Dish"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>
<%@ page import="java.security.*"%>
<%!public boolean empty(String s) {
		if (s == null || s.trim().equals(""))
			return true;
		else
			return false;
	}%>
<%!public String hashCal(String type, String str) {
		byte[] hashseq = str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try {
			MessageDigest algorithm = MessageDigest.getInstance(type);
			algorithm.reset();
			algorithm.update(hashseq);
			byte messageDigest[] = algorithm.digest();
			for (int i = 0; i < messageDigest.length; i++) {
				String hex = Integer.toHexString(0xFF & messageDigest[i]);
				if (hex.length() == 1)
					hexString.append("0");
				hexString.append(hex);
			}
		} catch (NoSuchAlgorithmException nsae) {
		}
		return hexString.toString();
	}%>
<%
	String merchant_key = "WkwBhEbK";
	String salt = "q5EWBuw1lB";
	String action1 = "";
	String base_url = "https://sandboxsecure.payu.in";
	int error = 0;
	String hashString = "";
	Enumeration paramNames = request.getParameterNames();
	Map<String, String> params = new HashMap<String, String>();
	while (paramNames.hasMoreElements()) {
		String paramName = (String) paramNames.nextElement();
		String paramValue = request.getParameter(paramName);
		params.put(paramName, paramValue);
	}
	String txnid = "";
	if (empty(params.get("txnid"))) {
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt()) + (System.currentTimeMillis() / 1000L);
		txnid = hashCal("SHA-256", rndm).substring(0, 20);
	} else {
		txnid = params.get("txnid");
	}
	String udf2 = txnid;
	String txn = "abcd";
	String hash = "";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if (empty(params.get("hash")) && params.size() > 0) {
		if (empty(params.get("key")) || empty(params.get("txnid")) || empty(params.get("amount"))
				|| empty(params.get("firstname")) || empty(params.get("email")) || empty(params.get("phone"))
				|| empty(params.get("productinfo")) || empty(params.get("surl")) || empty(params.get("furl"))
				|| empty(params.get("service_provider")))
			error = 1;
		else {
			String[] hashVarSeq = hashSequence.split("\\|");
			for (String part : hashVarSeq) {
				hashString = (empty(params.get(part))) ? hashString.concat("")
						: hashString.concat(params.get(part));
				hashString = hashString.concat("|");
			}
			hashString = hashString.concat(salt);
			hash = hashCal("SHA-512", hashString);
			action1 = base_url.concat("/_payment");
		}
	} else if (!empty(params.get("hash"))) {
		hash = params.get("hash");
		action1 = base_url.concat("/_payment");
	}
%>

<html>
<head>

<%@include file="components/header.jsp"%>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/cart2.css">

<script src="js/cart.js" async></script>
<style type="text/css">
.display-1 {
	text-indent: 50px;
	text-align: center;
	letter-spacing: 3px;
	font-style: italic;
	font-weight: bold;
	font-size: 40px;
	margin: inherit;
}
</style>

</head>

<body>

	

<%@include file="components/navigationbar.jsp"%>

<div class="cartbody">
				<div class="container">
					<div class="Cart-Container cart">
						<h3 class="Heading">Shopping Cart</h3>
	<%
		CartBO cartBo = new CartBO();

		if (session.getAttribute("username") != null) {

			Map<Dish, Integer> map = cartBo.getCartDetails((String) session.getAttribute("username"));
			if (map.size() > 0) {
				out.print(
						"<div><h5 class=\"Action\" onclick=\"removeAll()\" style=\"text-align: right;\">Remove all</h5>"
								+ "</div>"

								+ "<table class=\"table\">" + "<thead>" + "<tr>" + "<th scope=\"col\">Product</th>"
								+ "<th scope=\"col\">Name</th>" + "<th scope=\"col\">Quantity</th>"
								+ "<th scope=\"col\">Price</th>" + "<th scope=\"col\">Cost</th>"
								+ "<th scope=\"col\">Remove</th>" + "</tr>" + "</thead>" + "<tbody>");

				double totalamount = 0.0;

				for (Map.Entry<Dish, Integer> item : map.entrySet()) {

					if (item.getKey() != null) {
						out.print("<tr><td class=\"image-box\"><img src=\"" + item.getKey().getImage_url()
								+ "\" style=\"height: 120px;\" /></td>" + "<td class=\"about\">"
								+ "<h1 class=\"title\">" + item.getKey().getName() + "</h1>" + "</td>"
								+ "<td class=\"counter\">" + "<div onclick=\"updateQty('" + item.getKey().getName()
								+ "', " + (item.getValue() - 1) + ")\" class=\"btn\">-</div>"
								+ "<div class=\"count\">" + item.getValue() + "</div>"
								+ "<div onclick=\"updateQty('" + item.getKey().getName() + "', "
								+ (item.getValue() + 1) + ")\" class=\"btn\">+</div>" + "</td>"
								+ "<td class=\"unit_price\">"
								+ (item.getKey().getPrice() - item.getKey().getDiscount()) + "</td>"
								+ "<td class=\"prices\">" + "<div class=\"amount\">"
								+ ((item.getKey().getPrice() - item.getKey().getDiscount()) * item.getValue())
								+ "</div>" + "</td><td><div onclick=\"remove('" + item.getKey().getName() + "', "
								+ (item.getValue() + 1) + ")\" class=\"remove\"><u>Remove</u></div></td></tr>");
					}
				}
				out.print("</table>");
				int totalItems = cartBo.total((String) session.getAttribute("username"));

				out.print(
						"<div class=\"checkout\"> <div class=\"total\"><div class=\"grandtotal\"><div class=\"Subtotal\">Sub-Total</div> <div class=\"items\">");
				if (totalItems > 1) {
					out.print(totalItems + "items");
				} else {
					out.print(totalItems + "item");
				}

				out.print("</div> </div> <div class=\"total-amount\">Rs. " + totalamount + "</div> </div></div>");
			} else {
				out.print("<h1 class=\"display-1\"><p> There are no item in the cart.</p></h1>");
			}
		} else {
			out.print("<h1 class=\"display-1\" style=\"color: red\"><p> Please Log in first!</p></h1>");
		}
	%>
	</div>
	</div>


	<div class="container">
		<div class="Cart-Container billing">
			<div class="row">
				<div class="col-75">
					<div>
						<form action="/upay">
							<div class="row">
								<div class="col-50">
									<h3 class="DA">Delivery Address</h3>
									<br> <br> <br> <label for="fname"><i
										class="fa fa-user"></i> Full Name</label> <input type="text"
										id="fname" name="firstname"
										value="<%=(empty((String) session.getAttribute("fname"))) ? "" : session.getAttribute("fname").toString()%>">
									<label for="email"><i class="fa fa-envelope"></i> Email</label>
									<input type="text" id="email" name="email"
										value="<%=(empty((String) session.getAttribute("email"))) ? "" : session.getAttribute("email").toString()%>">
									<label for="mob"><i class="fa fa-phone"></i> Address</label> <input
										type="text" id="mob" name="mobile"
										value="<%=(empty((String) session.getAttribute("mobileno"))) ? ""
					: session.getAttribute("mobileno").toString()%>">
									<label for="adr"><i class="fa fa-address-card-o"></i>
										Address</label> <input type="text" id="adr" name="address"
										value="<%=(empty((String) session.getAttribute("address"))) ? ""
					: session.getAttribute("address").toString()%>">
									<label for="city"><i class="fa fa-institution"></i>
										City</label> <input type="text" id="city" name="city"
										value="<%=(empty((String) session.getAttribute("city"))) ? "" : session.getAttribute("city").toString()%>">
									<div class="row">
										<div class="col-50">
											<label for="state">State</label> <input type="text"
												id="state" name="state"
												value="<%=(empty((String) session.getAttribute("state"))) ? "" : session.getAttribute("state").toString()%>">
										</div>
										<div class="col-50">
											<label for="zip">Zip</label> <input type="text" id="zip"
												name="zip"
												value="<%=(empty((String) session.getAttribute("pincode"))) ? ""
					: session.getAttribute("pincode").toString()%>">
										</div>
									</div>
								</div>
							</div>
							<form action="<%=action1%>" method="post" name="payuForm">
								<input type="hidden" name="key" value="<%=merchant_key%>" /> <input
									type="hidden" name="hash" value="<%=hash%>" /> <input
									type="hidden" name="txnid" value="<%=txnid%>" /> <input
									type="hidden" name="udf2" value="<%=txnid%>" /> <input
									type="hidden" name="service_provider" value="payu_paisa" /> <input
									type="hidden" name="amount"
									value="<%=(empty(params.get("amount"))) ? "" : params.get("amount")%>" />

								<input type="hidden" name="firstname" id="firstname"
									value="<%=(empty(params.get("firstname"))) ? "" : params.get("firstname")%>" />

								<input type="hidden" name="email" id="email"
									value="<%=(empty(params.get("email"))) ? "" : params.get("email")%>" />

								<input type="hidden" name="phone"
									value="<%=(empty(params.get("phone"))) ? "" : params.get("phone")%>" />

								<input type="hidden" name="productinfo"
									value="<%=(empty(params.get("productinfo"))) ? "" : params.get("productinfo")%>"
									size="64" /> <input type="hidden" name="surl"
									value="<%=(empty(params.get("surl"))) ? "" : params.get("surl")%>"
									size="64" /> <input type="hidden" name="furl"
									value="<%=(empty(params.get("furl"))) ? "" : params.get("furl")%>"
									size="64" />

								<%
									if (empty(hash)) {
								%>
								<div class="payu">
									<input type="submit" value="PayUmoney" class="checkoutbtn" />
									<input type="button" onclick="paycod()" value="COD"
										class="checkoutbtn" />
								</div>
								<%
									}
								%>


							</form>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@include file="components/footer.jsp"%>
	</body>
	</html>