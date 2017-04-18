<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="base/_base.jsp"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Feature List | Movie Share</title>
  <link rel="stylesheet" type="text/css" href="${path}assets/css/style-exfly.css">
</head>
<body>
  <ul>
  	<li>
  		<h1>Simple User</h1>
  		<ul>
	  		<li><a href="<%= request.getContextPath()%>">主页</a></li>
	  		<li><a href="<%= request.getContextPath()%>/signup">注册</a></li>
	  		<li><a href="<%= request.getContextPath()%>/login">登陆</a></li>
	  		<li><a href="<%= request.getContextPath()%>/logout">注销</a></li>
	  		<li><a href="<%= request.getContextPath()%>/movie/rank">排行榜</a></li>
	  		<li><a href="<%= request.getContextPath()%>/movie/id?id=1">肖申克的救赎 详细信息</a></li>
  		</ul>
  	</li>
  	<li>
  		<h2>Administrator</h2>
  		<ul>
  			<li><a href="<%= request.getContextPath()%>/admin">admin</a></li>
  		</ul>
  	</li>
  </ul>
  
  <ul>
  	<li><a href="#"><img src="${path}assets/img/movies/BeautyandtheBeast.png"></a></li>
  </ul>
</body>
</html>
