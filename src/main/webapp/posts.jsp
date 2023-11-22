<%@ page import="com.example.project4jsp.ProductDAO" %>
<%@ page import="com.example.project4jsp.ProductVO" %>
<%@ page import="com.example.project4jsp.ProductVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: yoonhajun
  Date: 2023/11/20
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
<style>
    h1{
        border-bottom: 1px solid black;
        padding-left: 1rem;
    }
    #list {
        font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }
    #list td, #list th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align:center;
    }
    #list tr:nth-child(even){
        background-color: #f2f2f2;
    }
    #list tr:hover {
        background-color: #ddd;
    }
    #list th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: #006bb3;
        color: white;
    }
</style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deletepost.jsp?id=' + id;
        }
    </script>
</head>
<body>
    <h1>한동숍</h1>
<%
    ProductDAO productDAO = new ProductDAO();
    String id = request.getParameter("id");
    ArrayList<ProductVO> list = productDAO.getProductList();
    request.setAttribute("list",list);
%>
<table id="list">
    <tr>
        <th>Image</th>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Type</th>
        <th>Number</th>
        <th>Size</th>
        <th>Seller</th>
        <th>Country</th>
        <th>Date</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <c:forEach items="${list}" var="u">
        <tr>
            <td><c:if test="${u.photo ne ''}"><br/>
            <img src="${pageContext.request.contextPath}/upload/${u.photo}" class="photo"></c:if></td>
            <td>${u.id}</td>
            <td>${u.name}</td>
            <td>${u.price}</td>
            <td>${u.type}</td>
            <td>${u.num}</td>
            <td>${u.size}</td>
            <td>${u.seller}</td>
            <td>${u.country}</td>
            <td>${u.regdate}</td>

            <td><a href="editform.jsp?id=${u.id}">Edit</a> </td>
            <td><a href="javascript:delete_ok('${u.id}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="addpostform.jsp">Add new Product</a>
</body>
</html>
