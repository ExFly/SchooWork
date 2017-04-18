<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.exfly.models.auth.User" %>

<%
User user = (User)request.getAttribute("user_admin_action");
if(user == null) {
	user = new User();
}
%>

<div class="row-fluid">
  <div class="navbar">
    <div class="navbar-inner">
      <ul class="breadcrumb">
        <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
        <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
        <li>
            <a href="#">用户信息</a> <span class="divider">/</span>  
        </li>
        <li class="active">修改</li>
          </ul>
      </div>
    </div>
</div>

<div class="row-fluid">
    <!-- block -->
    <div class="block">
        <div class="navbar navbar-inner block-header">
            <div class="muted pull-left">用户信息</div>
        </div>
        <div class="block-content collapse in">
            <div class="span12">
                 <form class="form-horizontal" method="post" action="<%= request.getContextPath()%>/admin/user">
                  <fieldset>
                  
                  	<input class="hidden" type="text" value="<%= user.getId() %>" name="userid">
                  	
                    <legend><%= user.getUsername() %></legend>
                    <div class="control-group">
                      <label class="control-label" for="focusedInput">用户名</label>
                      <div class="controls">
                        <input class="input-xlarge focused" id="focusedInput" type="text" value="<%= user.getUsername() %>" name="username">
                      </div>
                    </div>
                   
                   <div class="control-group">
                      <label class="control-label" for="focusedInput">权限</label>
                      <div class="controls">
                      	<input class="input-xlarge focused" id="focusedInput" type="text" value="<%= user.getPermission() %>" name="permission">
                      </div>
                    </div>
                   
                    <div class="form-actions">
                      <input type="submit" class="btn btn-primary">
                      <button type="reset" class="btn">Cancel</button>
                    </div>
                  </fieldset>
                </form>

            </div>
        </div>
    </div>
    <!-- /block -->
</div>
