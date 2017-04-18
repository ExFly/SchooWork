<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
  <li class="active">
      <a href="<%=request.getContextPath()+"/admin"%>"><i class="icon-chevron-right"></i> 概览信息</a>
  </li>
  <li>
      <a href="<%=request.getContextPath()+"/admin/user" %>"><i class="icon-chevron-right"></i> 用户信息</a>
  </li>
  <li>
      <a href="<%=request.getContextPath()%>/admin/movie"><i class="icon-chevron-right"></i> 电影信息</a>
  </li>
  <li>
      <a href="stats.html"><i class="icon-chevron-right"></i> 统计信息</a>
  </li>
</ul>
