<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.exfly.models.Movie" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>

<!-- 浏览路径 -->
<div class="row-fluid">
  <div class="navbar">
    <div class="navbar-inner">
      <ul class="breadcrumb">
        <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
        <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
        <li>
            <a href="#">电影信息</a> <span class="divider">/</span>  
        </li>
        <li class="active">查看</li>
      </ul>
    </div>
  </div>
</div>
<!-- end 浏览路径 -->

<!-- 表格 -->
<div class="row-fluid">
  <!-- block -->
  <div class="block">
      <div class="navbar navbar-inner block-header">
          <div class="muted pull-left">用户信息</div>
      </div>
      <div class="block-content collapse in">
          <div class="span12">
             <div class="table-toolbar">
                <div class="btn-group">
                   <a href="#"><button class="btn btn-success">添加电影<i class="icon-plus icon-white"></i></button></a>
                </div>
                <div class="btn-group pull-right">
                   <button data-toggle="dropdown" class="btn dropdown-toggle">Tools <span class="caret"></span></button>
                   <ul class="dropdown-menu">
                      <li><a href="#">Print</a></li>
                      <li><a href="#">Save as PDF</a></li>
                      <li><a href="#">Export to Excel</a></li>
                   </ul>
                </div>
             </div>
              
              <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
                  <thead>
                      <tr>
                      	  <th>海报</th>
                          <th>电影名</th>
                          <th>评分</th>
                          <th>操作</th>
                      </tr>
                  </thead>
                  <tbody>
                  
                  <!-- 防止恶意getjsp文件 -->
                      <%List<Movie> movieList = (List<Movie>) request.getAttribute("movie_list_admin_action");
                  	if(movieList == null){
                		Logger safelogger = LogManager.getLogger("safe.test");
                		safelogger.warn("非法访问templates/admin/movie_info.jsp文件");
                		response.sendRedirect(request.getContextPath()+"/admin/user");
                	}
                  	
                      int page_number = (Integer)request.getAttribute("page_movie_admin_action");
                      
                      try{
                  		Iterator<Movie> it = movieList.iterator();
                  		while (it.hasNext()) {
                  			Movie movie = it.next();
                  		
                      %>
                      <tr class="odd gradeX">
                          <td><a href="<%= request.getContextPath()%>/admin/movie?id=<%= movie.getId() %>"><img src="<%= movie.getPlaybill() %>"></a></td>
                          <td><a href="<%= request.getContextPath()%>/admin/movie?id=<%= movie.getId() %>"><%= movie.getName_zh() %></a></td>
                          <td class="center"><%= movie.getScore() %></td>
                          <td class="center"><a href="#">删除</a></td>
                      </tr>
                      <%	}
                  		}catch(Exception e){e.printStackTrace();}
                      %>
                  </tbody>
              </table>
              <div class="span6">
                <div class="dataTables_paginate paging_bootstrap pagination">
                  <ul>
                    <li class="prev"><a href="<%= request.getContextPath()%>/admin/movie?page=<%= page_number-1%>">← Previous</a></li>
                    <li class="active disabled"><a href="<%= request.getContextPath()%>/admin/movie?page=<%= page_number %>"><%= page_number%></a></li>
                    <li><a href="<%= request.getContextPath()%>/admin/movie?page=<%= page_number+1 %>"><%= page_number+1 %></a></li>
                    <li><a href="<%= request.getContextPath()%>/admin/movie?page=<%= page_number+2 %>"><%= page_number+2 %></a></li>
                    <li><a href="<%= request.getContextPath()%>/admin/movie?page=<%= page_number+3 %>"><%= page_number+3 %></a></li>
                    <li><a href="<%= request.getContextPath()%>/admin/movie?page=<%= page_number+4 %>"><%= page_number+4 %></a></li>
                    <li class="next"><a href="<%= request.getContextPath()%>/admin/movie?page=<%= page_number+1%>">Next → </a></li>
                    </ul>
                </div>
              </div>
          </div>
      </div>
  </div>
  <!-- /block -->
</div>
</div>
</div>
<!-- end 表格 -->