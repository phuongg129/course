<%@ page import="java.util.List" %>
<%@ page import="com.example.demo2.entity.Order" %><%--
  Created by IntelliJ IDEA.
  User: MSII
  Date: 6/16/2024
  Time: 12:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ẾCH HỌC BÀI</title>
    <link rel="website icon" type="png" href="${pageContext.request.contextPath}/public/img/logo.png">
    <!-- Style CSS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,400;1,500;1,600;1,700;1,800;1,900&family=Sen:wght@700&display=swap"
          rel="stylesheet">
    <!-- Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin.css">
</head>
<body>
<%
    String messages = (String) request.getAttribute("message");
    if (messages != null) {
%>
<div class="message">
    <span><%= messages %></span>
    <i class="fas fa-times" onclick="this.parentElement.style.display='none';"></i>
</div>
<%
    }
%>
<%@include file="admin-header.jsp" %>

<div class="container mt-3">
    <div class="search-form">
        <form action="/admin/order" method="get">
            <input type="text" name="search" placeholder="enter key to search" class="search box"
                   value="<%= (request.getParameter("search") != null) ? request.getParameter("search") : "" %>">
            <input type="submit" value="search" name="search_user" class="btn">
        </form>
    </div>
    <section class="display-table mt-3">
        <table>
            <thead>
            <th>name</th>
            <th>number</th>
            <th>gmail</th>
            <th>method</th>
            <th>diachi</th>
            <th>total products</th>
            <th>total price</th>
            <th>Action</th>
            </thead>
            <tbody>
            <%
                List<Order> orderList = (List<Order>) request.getAttribute("orderList");
                if (orderList != null) {
                    for (Order row : orderList) {
            %>

            <tr>
                <td><%= row.getName() %>
                </td>
                <td><%= row.getNumber() %>
                </td>
                <td><%= row.getGmail() %>
                </td>
                <td><%= row.getMethod() %>
                </td>
                <td><%= row.getDiachi() %>
                </td>
                <td><%= row.getTotal_products() %>
                </td>
                <td><%= row.getTotal_price() %>
                </td>
                <td>
                    <a href="/admin/order?delete=<%= row.getId() %>" class="delete-btn"
                       onclick="return confirm('are your sure you want to delete this?');"><i
                            class="fas fa-trash"></i>delete</a>

                    <a href="/admin/order?edit=<%= row.getId() %>" class="option-btn"><i
                            class="fas fa-edit"></i>update</a>
                </td>
            </tr>

            <%
                }
            } else {
            %>
            <tr>
                <td colspan="15">no order added</td>
            </tr>

            <%
                }
            %>
            </tbody>
        </table>
    </section>
    <section class="edit-form-container" style="display: none">

        <%
            Order editOrder = (Order) request.getAttribute("editOrder");
            if (editOrder != null) {
        %>
        <script> document.querySelector('.edit-form-container').style.display = 'flex'; </script>";
        <form action="/admin/order" method="post" enctype="multipart/form-data">
            <input type="hidden" name="update_o_id" value="<%= editOrder.getId() %>">
            <input type="text" class="box" required name="update_o_name" value="<%= editOrder.getName() %>">
            <input type="text" class="box" required name="update_o_number"
                   value="<%= editOrder.getNumber() %>">
            <input type="text" class="box" required name="update_o_gmail" value="<%= editOrder.getGmail() %>">
            <input type="text" class="box" required name="update_o_method"
                   value="<%= editOrder.getMethod() %>">
            <input type="text" class="box" required name="update_o_diachi"
                   value="<%= editOrder.getDiachi() %>">
            <input type="submit" value="update info order" name="update_order" class="btn">
            <a href="/admin/order" id="close-edit" class="option-btn">Cancel</a>
        </form>
        <%
            }
        %>

    </section>

</div>
<script src="${pageContext.request.contextPath}/public/js/script.js"></script>


</body>
</html>
