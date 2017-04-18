<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.exfly.models.auth.User" %>

<%
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
	request.setAttribute("path", basePath);
	
	String userid_base_templates = (String)session.getAttribute("user_id");
	if(userid_base_templates==null || userid_base_templates.equals("")){
		
	}else {
		User current_user_base_template = User.getUserbyID(userid_base_templates);
		request.setAttribute("current_user_base_template", current_user_base_template);
	}
%>
