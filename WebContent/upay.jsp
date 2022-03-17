<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Gateway</title>
<link rel="stylesheet" href="css/upay.css">

<%@include file="components/header.jsp"%>
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

	params.put("amount", "100");
	params.put("firstname", "satya");
	params.put("email", "satyajeet.senapati.5@gmail.com");
	params.put("phone", "7982785460");
	params.put("productinfo", "Go4Food");
	params.put("surl", "success.jsp");
	params.put("furl", "fail.jsp");

	while (paramNames.hasMoreElements()) {
		String paramName = (String) paramNames.nextElement();

		String paramValue = request.getParameter(paramName);

		if (empty(params.get(paramName))) {
			params.put(paramName, paramValue);
		}
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
				hashString = (empty(params.get(part)))
						? hashString.concat("")
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
</head>
<body onload="submitPayuForm();">
	<script>
var hash='<%=hash%>';
		function submitPayuForm() {

			if (hash == '')
				return;

			var payuForm = document.forms.payuForm;
			payuForm.submit();
		}
	</script>
	
	<%@include file="components/navigationbar.jsp"%>
	
	<div class="body">
		<div class="pay">
			<h1 class="make">Make your Payment</h1>
		</div>
		<div class="option-box">
			<p class="choose">Choose the method</p>
			<br> <br> <br>
			<!-- <span class="pt">Through Paytm </span>  -->
			<a href="#"> <img src="paytm.jpeg" alt="" class="paytm"><br>
				<br> <br></a>
			<!-- <span class="pt">Through PayUMoney </span> <br> -->
			<a href="transaction.jsp"> <img src="images/payumoney.png" alt=""
				class="paytm"><br> <br> <br></a>
			<!-- <span class="pt">Through Card </span> <br>  -->
			<a href="#"> <img src="visa.jfif" alt="" class="paytm"></a> <br>
			<br> <br> <a href=""><img src="images/cod.jpeg" alt=""
				class="cash1"></a>
		</div>
		<!-- <div class="amount-box">
            <label class="amount"> Amount-Rs <label>2,060</label></label>
            </div> -->
		<div class="detail-box">
			<form action="<%=action1%>" method="post" name="payuForm">
				<input type="hidden" name="key" value="<%=merchant_key%>" /> <input
					type="hidden" name="hash" value="<%=hash%>" /> <input
					type="hidden" name="txnid" value="<%=txnid%>" /> <input
					type="hidden" name="udf2" value="<%=txnid%>" /> <input
					type="hidden" name="service_provider" value="payu_paisa" />
				<table>
					<tr>
						<td><b>Mandatory Parameters</b></td>
					</tr>
					<tr>
						<td>Amount:</td>
						<td><input name="amount"
							value="<%=(empty(params.get("amount"))) ? "" : params.get("amount")%>" /></td>
						<td>First Name:</td>
						<td><input name="firstname" id="firstname"
							value="<%=(empty(params.get("firstname"))) ? "" : params.get("firstname")%>" /></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><input name="email" id="email"
							value="<%=(empty(params.get("email"))) ? "" : params.get("email")%>" /></td>
						<td>Phone:</td>
						<td><input name="phone"
							value="<%=(empty(params.get("phone"))) ? "" : params.get("phone")%>" /></td>
					</tr>
					<tr>
						<td>Product Info:</td>
						<td colspan="3"><input name="productinfo"
							value="<%=(empty(params.get("productinfo"))) ? "" : params.get("productinfo")%>"
							size="64" /></td>
					</tr>
					<tr>
						<td colspan="3"><input type="hidden" name="surl"
							value="<%=(empty(params.get("surl"))) ? "" : params.get("surl")%>"
							size="64" /></td>
					</tr>
					<tr>
						<td colspan="3"><input type="hidden" name="furl"
							value="<%=(empty(params.get("furl"))) ? "" : params.get("furl")%>"
							size="64" /></td>
					</tr>
					<tr>

						<%
							if (empty(hash)) {
						%>
						<td colspan="4"><input type="submit" value="Submit" /></td>
						<%
							}
						%>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<%@include file="components/footer.jsp"%>
	
</body>
</html>