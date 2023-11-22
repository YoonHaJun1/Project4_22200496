<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.project4jsp.ProductDAO"%>
<%@ page import="com.example.project4jsp.FileUpload" %>
<%@ page import="com.example.project4jsp.ProductVO" %>


<%--<% request.setCharacterEncoding("utf-8"); %>--%>

<%--<jsp:useBean id="u" class="com.example.project4jsp.ProductVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	request.setCharacterEncoding("utf-8");
	ProductDAO productDAO = new ProductDAO();
	FileUpload upload = new FileUpload();
	ProductVO u = upload.uploadPhoto(request);

	int i = productDAO.insertProduct(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>