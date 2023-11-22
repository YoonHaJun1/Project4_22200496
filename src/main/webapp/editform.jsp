<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.project4jsp.ProductDAO, com.example.project4jsp.ProductVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>

<%
	ProductDAO productDAO = new ProductDAO();
	String id=request.getParameter("id");
	ProductVO u=productDAO.getProduct(Integer.parseInt(id));

%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="<%=u.getId() %>"/>
<table>
<tr><td>Photo:</td><td><input type="file" name="photo" value="<%= u.getPhoto()%>"/></td></tr>
<tr><td>Name:</td><td><input type="text" name="name" value="<%= u.getName()%>"/></td></tr>
<tr><td>Price:</td><td><input type="number" name="price" value="<%= u.getPrice()%>" /></td></tr>
<tr><td>Type:</td><td><input type="text" name="type" value="<%= u.getType()%>" /></td></tr>
<tr><td>Number:</td><td><input type="number" name="num" value="<%= u.getNum()%>"/></td></tr>
<tr><td>Size:</td><td><input type="text" name="size" value="<%= u.getSize()%>"/></td></tr>
<tr><td>Seller:</td><td><input type="text" name="seller" value="<%= u.getSeller()%>"/></td></tr>
<tr><td>Country:</td><td><input type="text" name="country" value="<%= u.getCountry()%>"/></td></tr>

<tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>