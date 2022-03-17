<%@page import="entity.Order"%>
<%@page import="entity.Bill"%>
<%@page import="java.util.List"%>
<%@page import="DAO.BillDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Orders</title>
<%@include file="components/header.jsp"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Oleo+Script&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Shojumaru&display=swap"
	rel="stylesheet">
<style>


.OD {
	border: 1.4px solid black;
	padding: 5px 8px;
	background-color: rgba(189, 182, 182, 0.089);
	width: 260px;
	border-radius: 8px;
}

.card-link {
	background-color: rgba(0, 0, 255, 0.788);
	color: white;
	padding: 7px 9px;
	font-size: 16px;
	border-radius: 6px;
}

.card-link:hover {
	color: white;
}

.container {
	margin-top: 50px;
}

.card-header {
	height: 40%;
	margin: 25px;
	padding: 10px 10px;
}

.table {
	width: 80%;
	align-items: center;
	justify-content: center;
}

.table1 {
	width: 100%;
	align-items: center;
	justify-content: center;
}

.table {
	width: 80%;
	align-items: center;
	justify-content: center;
	background-color: rgba(189, 182, 182, 0.089);
	border: 2px solid grey;
}

.head {
	font-size: 4x;
}

table, tr {
	margin: 20px 20px;
}

.table1 th {
	font-family: 'Rowdies', cursive;
	font-size: 20px;
}

td.address {
	display: in;
	flex-wrap: wrap;
}

th, tr, td {
	text-align: center;
	max-width: fit-content;
}

.image1 {
	height: 40px;
	width: 50px;
	border-radius: 60px;
}


div#accordion {
	min-height: 210px;
}

h1 {
    text-align: center;
    font-family: 'FontAwesome';
}

.footer{
margin-top: 230px;
}
</style>


</head>
<body>
	<%@include file="components/navigationbar.jsp"%>


	<div class="body">
		<div class="container">
			<h2 class="OD">Order Details</h2>
			<div id="accordion">
				<%
					BillDAO billDao = new BillDAO();

					if (session.getAttribute("username") == null) {
						out.print("<h1 class=\"display-1\" style=\"color: red\"><p style=\"font-size: xxx-large\"> Please Log in first!</p></h1>");
					} else {
						List<Bill> billList = billDao.getBillByUsername((String) session.getAttribute("username"));
						
						
						if (billList.size() < 1) {
							out.print("<h1 style=\"font-size: xxx-large\">NO ORDERS YET.</h1>");
						}
						
						
						for (int i = 0; i < billList.size(); i++) {
				%>
				<div class="card">
					<div class="card-header">
						<!-- <center> -->
							<table class="table1">
								<thead>
									<tr>
										<th scope="col">Bill No</th>
										<th scope="col">TRX ID</th>
										<th scope="col">Total Amount</th>
										<th scope="col">Date & Time</th>
										<th scope="col">Address</th>
										<th scope="col">Status</th>
										<th><a class="card-link" data-toggle="collapse"
											href="#order<%=i+1 %>"> More Details <i
												class="fa fa-angle-down" style="font-size: 25px"></i></a></th>
									</tr>
								</thead>
								<tr>
									<td><%=billList.get(i).getBillNo()%></td>
									<td><%=billList.get(i).getTransactionId()%></td>
									<td><%=billList.get(i).getTotalAmount()%></td>
									<td><%=billList.get(i).getDateTime()%></td>
									<td class="address"><%=billList.get(i).getAddress()%></td>
									<td><%=billList.get(i).getStatus()%></td>
									<td></td>
								</tr>
							</table>
				<!-- </center>  -->
					</div>
					<div id="order<%=i+1%>" class="collapse hide"
						data-parent="#accordion">
						<div class="card-body">
							<!-- <center> -->
								<table class="table">
									<thead>
										<tr>
											<th scope="col" class="head">S.No</th>
											<th scope="col" class="head">Product</th>
											<th scope="col" class="head">Name</th>
											<th scope="col" class="head">Quantity</th>
											<th scope="col" class="head">Price</th>
											<th scope="col" class="head">Cost</th>
										</tr>
									</thead>
									<tbody>
										<%
											List<Order> orderList = billList.get(i).getOrdersList();

													for (int j = 0; j < orderList.size(); j++) {
										%>
										
										
                                        <tr>
                                            <td><%=j+1 %></td>
                                            <td class="image-box"><img src="<%=orderList.get(j).getDish().getImage_url() %>" class="image1"></td>
                                            <div class="info">
                                                <td>
                                                    <h6><%=orderList.get(j).getDish().getName()%></h1>
                                                </td>
                                                <td>
                                                    <div class="count"><%=orderList.get(j).getQuantity()%></div>
                                                    <td><%=(orderList.get(j).getDish().getPrice()-orderList.get(j).getDish().getDiscount()) %></td>
                                                    <td>
                                                        <div><%=(orderList.get(j).getDish().getPrice()-orderList.get(j).getDish().getDiscount()) *  orderList.get(j).getQuantity()%></div>
                                            </div>
                                            </td>
                                        </tr>
										
										<%
											}
										%>
									</tbody>
								</table>
									<!-- </center>  -->
							
						</div>
					</div>
				</div>
				<%
					}
					}
				%>
			</div>
		</div>
	</div>


	<%@include file="components/footer.jsp"%></body>
</html>