<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>go to index</title>
</head>
<body>
	<%
	// 默认页面，通过重定向重新回到指定的页面 index。jsp
	response.sendRedirect(request.getContextPath()+"/index");
	%>
</body>
</html>
