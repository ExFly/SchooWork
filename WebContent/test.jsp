<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="base/_base.jsp"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Test 功能列表</title>
  <link rel="stylesheet" type="text/css" href="${path}assets/css/style-exfly.css">
</head>
<body>
  <ul>
  	<li><a href="<%= request.getContextPath()%>">主页</a></li>
  	<li><a href="<%= request.getContextPath()%>/signup">signup</a></li>
  	<li><a href="<%= request.getContextPath()%>/login">login</a></li>
  	<li><a href="<%= request.getContextPath()%>/logout">logout</a></li>
  	<li><a href="<%= request.getContextPath()%>/rank.jsp">rank</a></li>
  	<li><a href="<%= request.getContextPath()%>/moviedetail.jsp">moviedetail</a></li>
  </ul>
  
  <ul>
  	<li><a href="#"><img src="${path}assets/img/movies/BeautyandtheBeast.png"></a></li>
  </ul>
</body>
</html>
