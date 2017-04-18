<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.exfly.models.auth.User" %>

<%
User currentuser = (User)request.getAttribute("current_user_base_template");
if(currentuser==null){
	currentuser = new User();
	currentuser.setUsername("未登录");
}
%>
<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="#"><img src="${path}assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered"><%= currentuser.getUsername() %></h5>
              	  	
                  <li class="mt">
                      <a class="active" href="<%= request.getContextPath()%>">
                          <i class="fa fa-dashboard"></i>
                          <span>首页</span>
                      </a>
                  </li>

				  <li>
                      <a href="#">
                          <i class="fa fa-dashboard"></i>
                          <span>选电影</span>
                      </a>
                  </li>
                  <!--
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>选电影</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="general.html">科幻</a></li>
                          <li><a  href="buttons.html">剧情</a></li>
                          <li><a  href="panels.html">爱情</a></li>
                      </ul>
                  </li>
                  -->
                  
                  <li>
                      <a href="<%= request.getContextPath()%>/movie/rank">
                          <i class="fa fa-dashboard"></i>
                          <span>排行</span>
                      </a>
                  </li>
                  
                  <li>
                      <% if(session.getAttribute("user_id") == null){%>
                      <a href="<%= request.getContextPath()%>/login">
                          <i class="fa fa-dashboard"></i>
                          <span>登陆</span>
                      </a>
                      <% }else{%>
                      <a href="<%= request.getContextPath()%>/logout">
                          <i class="fa fa-dashboard"></i>
                          <span>注销</span>
                      </a>
                      <% } %>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->