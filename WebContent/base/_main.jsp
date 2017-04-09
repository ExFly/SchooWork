<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper row">
            <p>
            	user_id: <%= (String)session.getAttribute("user_id") %>
            </p>
          </section>
      </section>
      <!--main content end-->