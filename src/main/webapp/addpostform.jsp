<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="addpost.jsp" method="post" enctype="multipart/form-data">
<table>
    <tr><td>Photo</td><td><input type="file" name="photo"/></td></tr>
    <tr><td>Name:</td><td><input type="text" name="name"/></td></tr>
    <tr><td>Price:</td><td><input type="number" name="price" /></td></tr>
    <tr><td>Type:</td><td><input type="text" name="type" /></td></tr>
    <tr><td>Number:</td><td><input type="number" name="num"/></td></tr>
    <tr><td>Size:</td><td><input type="text" name="size" /></td></tr>
    <tr><td>Seller:</td><td><input type="text" name="seller" /></td></tr>
    <tr><td>Country:</td><td><input type="text" name="country" /></td></tr>

<tr><td><a href="posts.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>
</table>
</form>

</body>
</html>