<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../base/_base.jsp"%>

<%
    //String admin_path = basePath + "assets/admin/";
	String admin_path = request.getAttribute("path") + "assets/admin/";
	request.setAttribute("admin_path", admin_path);
%>
