<%--
  Created by IntelliJ IDEA.
  User: yoonhajun
  Date: 2023/11/17
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import ="com.example.project4jsp.*, java.io.File" %>
<%@ page import ="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
    String filename = "";
    int sizeLimit = 15 * 1024 * 1024;
    String realPath = request.getServletContext().getRealPath("upload"); File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();
    MultipartRequest multpartRequest = null;
    multpartRequest = new MultipartRequest(request, realPath,
            sizeLimit, "utf-8",new DefaultFileRenamePolicy());
    filename = multpartRequest.getFilesystemName("img");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    파일 : <%=filename%><br/>
    <img src="${pageContext.request.contextPath}/upload/<%=filename%>">
</body>
</html>
