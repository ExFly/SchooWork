<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="base/_base.jsp"%>

<!DOCTYPE html>
<html class="no-js">
    <head>
        <title>Admin Home Page</title>
        <%@ include file="base/_head.jsp"%>
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
            		<%@ include file="_index.jsp"%>
                </div>
            </div>
            <hr>
            <footer>
            	<%@ include file="base/_footer.jsp"%>
            </footer>
        </div>
        <%@ include file="base/_script.jsp"%>
    </body>
</html>
