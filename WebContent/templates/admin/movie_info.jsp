<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="base/_base.jsp"%>

<!DOCTYPE html>
<html class="no-js">
    <head>
        <title>用户信息 |Admin</title>
        <%@ include file="base/_head.jsp"%>
        <link href="${admin_path}assets/DT_bootstrap.css" rel="stylesheet" media="screen">
    </head>

    <body>
        <div class="navbar navbar-fixed-top">            
            <%@ include file="base/_header.jsp"%>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
            		<%@ include file="base/_asidenav.jsp"%>
                </div>
                <div class="span9" id="content"> 
            		<%@ include file="_movie_info.jsp"%>
                </div>
            </div>
            <hr>
            <footer>
            	<%@ include file="base/_footer.jsp"%>
            </footer>
        </div>
        <%@ include file="base/_script.jsp"%>
        <script src="${admin_path}assets/DT_bootstrap.js"></script>
        <script>
        $(function() {});
        </script>
    </body>
</html>
