<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.project4jsp.ProductDAO, com.example.project4jsp.ProductVO"%>
<%@ page import="com.example.project4jsp.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){
		int id = Integer.parseInt(sid);
		ProductVO u = new ProductVO();
		u.setId(id);
		ProductDAO productDAO = new ProductDAO();

//		String filename = ProductDAO.getPhotoFilename(id);
//		if(filename != null)
//			FileUpload.deleteFile(request, filename);
		productDAO.deleteProduct(u);
	}
	response.sendRedirect("posts.jsp");
%>