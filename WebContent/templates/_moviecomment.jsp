<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.exfly.models.Movie" %>

<%
	Movie movie = Movie.getMoviebyID((String)request.getAttribute("movieid")); 

%>

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>评论: <%= movie.getName_zh() %></h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                      <form class="form-horizontal style-form" method="post" action="<%= request.getContextPath()%>/movie/comment">
                          <div class="form-group hidden">
                              <label class="col-sm-2 col-sm-2 control-label">movieid</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" value="<%= request.getAttribute("movieid") %>" name="movieid">
                              </div>
                          </div>

						  <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">评分</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="score">
                              </div>
                          </div>

                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">评论内容</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="comment">
                              </div>
                          </div>
                          
                          <input type="submit" class="btn btn-theme" value="评论">
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
		</section><!-- /wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->