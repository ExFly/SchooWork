<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.exfly.models.Movie" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
<%-- <%
//http://www.jianshu.com/p/bad037991ad2
	List<Movie> movieList = (List<Movie>) request.getAttribute("movie_list_rank_action");
	System.out.println(movieList);
	Iterator<Movie> it = movieList.iterator();
	while (it.hasNext()) {
		Movie movie = it.next();
		%>
		
		<%
	}
%> --%>
<%
int page_number = (Integer)request.getAttribute("page_rank_action");

%>

          <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
        <div class="container-fluid">
        <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 "><div class="hm-hottop">HOT&TOP</div></div>
        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 "><div class="hm-tudou">土豆排行榜</div></div>
        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
        
       <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 center  "><div class="hm-movie">电影排榜行</div></div>
       <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 center  "><div class="hm-100"></div></div>
       </div>
        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
        <div class="col-lg-7 col-md-7 col-xs-12 col-sm-12 center ">
        <div>
<%
//http://www.jianshu.com/p/bad037991ad2
	List<Movie> movieList = (List<Movie>) request.getAttribute("movie_list_rank_action");
	if(movieList == null){
		Logger safelogger = LogManager.getLogger("safe.test");
		safelogger.warn("非法访问templates/rank.jsp文件");
		response.sendRedirect(request.getContextPath()+"/movie/rank");
	}
	try{
		Iterator<Movie> it = movieList.iterator();
		while (it.hasNext()) {
			Movie movie = it.next();
		%>
		<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 center">
        <div class="col-lg-4 col-md-4 col-xs-12 col-sm-12 center "><div class="hm-picture"><a href="<%= request.getContextPath()%>/movie/id?id=<%= movie.getId() %>"><img class="img-responsive center-block " src="<%= movie.getPlaybill() %>>" width="150" height="210" /></a></div></div>
        <div class="col-lg-8 col-md-8 col-xs-12 col-sm-12 center "><div class="hm-div1"><a href="<%= request.getContextPath()%>/movie/id?id=<%= movie.getId() %>"><%=movie.getName_zh() %></a></div>
<div class="hm-div2"><%= movie.getSummary()%></div>
<div class="hm-div3"><%= movie.getScore() %>分 (<%= (int)(Math.random()*100000) %>人评价)</div></div></div>
 <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 center"><div class=" hm-101"></div></div>
		<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%> 
        </div>        
        </div>
        <div class="col-lg-5 col-md-5 col-xs-12 col-sm-12 center "> 
        
        
          <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 "> 
         <div class="hm-fenlei">分类排行</div></div>
           <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 ">
<div class="hm-fenmame center-block"><a href="#"> 剧情</a><a href="#">  &nbsp;喜剧</a><a href="#">   &nbsp;动作</a><a href="#">  &nbsp;爱情</a><a href="#">  &nbsp;科幻</a><a href="#">   &nbsp;动画</a></div>
<div class="hm-fenmame"><a href="#"> 悬疑</a><a href="#">  &nbsp; 惊悚</a><a href="#">   &nbsp;恐怖</a><a href="#">   &nbsp;纪录片</a><a href="#">   &nbsp;短片</a> <a href="#">   &nbsp;情色</a></div>
<div class="hm-fenmame"> <a href="#"> 同性</a><a href="#">   &nbsp;音乐</a><a href="#">   &nbsp;歌舞</a><a href="#">   &nbsp;家庭</a><a href="#">   &nbsp;儿童</a><a href="#">   &nbsp;传记</a></div>

<div class="hm-fenmame"> <a href="#"> 历史</a><a href="#">   &nbsp;战争</a><a href="#">   &nbsp;犯罪</a><a href="#">  &nbsp;西部</a><a href="#">   &nbsp;奇幻</a><a href="#">   &nbsp;冒险</a></div>
<div class="hm-fenmame"><a href="#"> 灾难</a><a href="#">   &nbsp;武侠</a><a href="#">   &nbsp;古装</a><a href="#">   &nbsp;运动</a><a href="#">   &nbsp;黑色电影</a></div></div>
  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 ">
<div  class="hm-picture1"><a href="#"><img class="img-responsive center-block" src="${path}assets/movies/imags/38.jpg" width="300" height="280"/></a></div></div>
 <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 "><div class="hm-benzhou"><div class="hm-koubei">本周口碑榜. . . . . . .</div>
 <div class="hm-li">
 <div class="hm-content" ><a href="#">1 斯隆女士</a></div>
 <div class="hm-content" ><a href="#">2 永远的托词</a></div>
 <div class="hm-content" ><a href="#">3 美女与野兽 斯隆女士</a></div>
 <div class="hm-content" ><a href="#">4 成为沃伦·巴菲特</a></div>
 <div class="hm-content" ><a href="#">5 二次旅程</a></div>
 <div class="hm-content" ><a href="#">6 契克</a></div>
 <div class="hm-content" ><a href="#">7 原野四十九日</a></div>
 <div class="hm-content" ><a href="#">8 被操纵的城市</a></div>
 <div class="hm-content" ><a href="#">9 最后的家庭士</a></div>
 <div class="hm-content" ><a href="#">10 洗脑游戏</a></div>
  </div> 
  
 </div></div>
 <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 "><div class="hm-160"><img src="${path}assets/movies/imags/36.png" class="img-responsive center-block" height="90" width="90"/></div><div class="hm-20"></div>
   <div class="hm-50">
     <div class="hm-105"><div class="hm-25"></div><div class="hm-80"><img src="${path}assets/movies/imags/37.png" class="img-responsive center-block" height="45" width="45"/></div>
   </div></div>
   <div class="hm-20"></div><div class="hm-70"><div class="hm-30-50"></div><div class="hm-30">豆瓣</div><div class="hm-30-100">你的移动观影指南</div>
</div>
      
   </div>
  
    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 ">
    
   <div class="hm-117"><div class="hm-doubanmovie">豆瓣电影</div><div class="hm-top20">TOP20</div></div></div>
   <div class="hm-625-300">
  
  
    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
    
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
    <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div></div>
   
   <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
    
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
    <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div></div>
   <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
    
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
    <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div></div>
   <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
    
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
    <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div></div>
   <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
    
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
     <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div>
    <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6 ">
   <div class="hm-picture2"><div class="hm-left"><a href="#"><img src="${path}assets/movies/imags/8.jpg" class="img-responsive center-block" width="65" height="91"/></a></div><div class="hm-filmname">你好，疯子！</div> </div></div></div>
   
   
    </div></div></div>
    
  <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
  <div class=" hm-fenye center-block" >
  
  <ul class="pagination">
    <li><a href="<%= request.getContextPath()%>/movie/rank?page=<%= page_number-5 %>">&laquo;</a></li>
    <li><a href="<%= request.getContextPath()%>/movie/rank?page=<%= page_number-1 %>"><%= page_number-1 %></a></li>
    <li class="active"><a href="<%= request.getContextPath()%>/movie/rank?page=<%= page_number %>"><%= page_number %></a></li>
    <li><a href="<%= request.getContextPath()%>/movie/rank?page=<%= page_number+1 %>"><%= page_number+1 %></a></li>
    <li><a href="<%= request.getContextPath()%>/movie/rank?page=<%= page_number+2 %>"><%= page_number+2 %></a></li>
    <li><a href="<%= request.getContextPath()%>/movie/rank?page=<%= page_number+3 %>"><%= page_number+3 %></a></li>
    <li><a href="<%= request.getContextPath()%>/movie/rank?page=<%= page_number+10 %>">&raquo;</a></li>
  </ul>
</div>
  </div>
   </div>
   </div> 

</div>
</div>        
        </div></div>
          </section>
      </section>

      <!--main content end-->
