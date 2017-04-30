<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.exfly.models.auth.User" %>
    
<%
String userid_header= (String)session.getAttribute("user_id");
User user_header_tmp = User.getUserbyID(userid_header);
%>
<div class="navbar-inner">
    <div class="container-fluid">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
        </a>
        <a class="brand" href="<%= request.getContextPath()%>/admin">Movie Share Admin</a>
        <div class="nav-collapse collapse">
            <ul class="nav pull-right">
                <li class="dropdown">
                    <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> <%= user_header_tmp.getUsername() %> <i class="caret"></i></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a tabindex="-1" href="#">个人信息</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a tabindex="-1" href="<%= request.getContextPath()%>/logout">Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav">
                <li class="active">
                    <a href="#">Dashboard</a>
                </li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">Settings <b class="caret"></b>

                    </a>
                    <ul class="dropdown-menu" id="menu1">
                        <li>
                            <a href="#">Tools <i class="icon-arrow-right"></i>

                            </a>
                            <ul class="dropdown-menu sub-menu">
                                <li>
                                    <a href="#">Reports</a>
                                </li>
                                <li>
                                    <a href="#">Logs</a>
                                </li>
                                <li>
                                    <a href="#">Errors</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">SEO Settings</a>
                        </li>
                        <li>
                            <a href="#">Other Link</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">Other Link</a>
                        </li>
                        <li>
                            <a href="#">Other Link</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>