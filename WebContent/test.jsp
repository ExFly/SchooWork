<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test 功能列表</title>
</head>
<body>
  <ul>
  	<li><a href="<%= request.getContextPath()%>">主页</a></li>
  	<li><a href="<%= request.getContextPath()%>/signup">signup</a></li>
  	<li><a href="<%= request.getContextPath()%>/login">login</a></li>
  	<li><a href="<%= request.getContextPath()%>/logout">logout</a></li>
  </ul>
</body>
</html>
