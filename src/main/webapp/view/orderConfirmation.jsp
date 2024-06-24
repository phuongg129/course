<%@ page import="com.example.demo2.entity.Order" %><%--
  Created by IntelliJ IDEA.
  User: KhiemJP
  Date: 2024-06-18
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="website icon" type="png" href="${pageContext.request.contextPath}/public/image/logo.png">
    <!-- Style CSS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,400;1,500;1,600;1,700;1,800;1,900&family=Sen:wght@700&display=swap"
          rel="stylesheet">
    <!-- Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
</head>
<body>
    <%
    String orderMessage = (String) request.getAttribute("orderMessage");
    Order order = (Order) request.getAttribute("orderDetails");
%>
<div class='order-message-container'>
    <div class='message-container'>
        <h3><%= orderMessage %></h3>
        <div class='order-detail'>
            <span><%= order.getTotal_products() %></span>
            <span class='total'> Total: <%= order.getTotal_price() %></span>
    </div>
    <div class='customer-details'>
        <p>Your name: <span><%= order.getName() %></span></p>
        <p>Your number: <span><%= order.getNumber() %></span></p>
        <p>Your email: <span><%= order.getGmail() %></span></p>
        <p>Your payment mode: <span><%= order.getMethod() %></span></p>
        <p>(*Pay when product arrives*)</p>
    </div>
    <a href='/' class='back_btn btn'>Continue shopping</a>
</div>
    </div>
</body>
</html>
