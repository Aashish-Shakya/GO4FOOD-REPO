<%@page import="entity.Order"%>
<%@page import="BO.BillBO"%>
<%@page import="DAO.BillDAO"%>
<%@page import="entity.Bill"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="css/receipt.css">
</head>
<body>
  <div class="page">
    <%@include file="components/navigationbar.jsp"%>
    <% if (session.getAttribute("showReceipt") == null) {
    	response.sendRedirect("home.jsp");
    }%>
  <br><br>
  <div class="box">
  <div class="pageheading">
    <h1>Receipt</h1>
    <hr>
    <br><br>
    <br>
  </div>
  
  <%
  BillDAO dao = new BillDAO();
  List<Bill> billList = dao.getBillByUsername((String) session.getAttribute("username"));
	Bill bill = billList.get(0);
  %>
  
    <div class="row mt-4">
      <div  >
        <!-- .row -->
        <div class="row">
          <div class="col-sm-1">
            <div>
              <span>To:</span>
              <span class="name">${fname}</span>
            </div>
            <div class="text-grey-m2">
              <div class="my-1">
                ${address}
              </div>
              <div class="my-1"><i class="fa fa-phone fa-flip-horizontal text-secondary"></i> <b
                  >${mobileno}</b></div>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-sm-2">
            <div >
              <div> <span>Bill No: </span><%= bill.getBillNo() %></div>
              <div> <span>Date: </span><%= bill.getDateTime() %></div>
              <div> <span>Status: </span> <span><%= bill.getStatus() %></span></div>
            </div>
          </div>
          <!-- /.col -->
        </div>
        <br><br>
        <div class="mt-4">
          <table class="table">
            <thead>
              <tr>
                <th>S.no</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th width="140">Amount</th>
              </tr>
            </thead>
            <tbody>
              <% List<Order> orderList = bill.getOrdersList();
              for (int i = 0; i < orderList.size(); i++) {
  %>
              <tr>
                <td><%= i+1 %></td>
                <td><%=orderList.get(i).getDish().getName()%></td>
                <td><%=orderList.get(i).getQuantity()%></td>
                <td>Rs. <%=(orderList.get(i).getDish().getPrice()-orderList.get(i).getDish().getDiscount()) %></td>
                <td>Rs. <%=(orderList.get(i).getDish().getPrice()-orderList.get(i).getDish().getDiscount()) *  orderList.get(i).getQuantity()%></td>
              </tr>
              <%} %>
              
            </tbody>
          </table>
          <br><br>
            <div class="total">
              Total Amount: <span>Rs. <%= bill.getTotalAmount() %></span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<%@include file="components/footer.jsp"%>
</body>
</html>