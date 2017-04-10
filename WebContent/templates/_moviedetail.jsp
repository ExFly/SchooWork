<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
org.exfly.models.Movie movie =(org.exfly.models.Movie) request.getAttribute("movie_info");
%>
<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
            <div class="row f-main-container">
              <!-- exfly start -->
              <div class="f-left col-sm-9">
                <section class="row">
                  <h1 class="f-movie-title"><%= movie.getName_zh()%> | <%= movie.getName_en()%></h1>
                  <main>
                    <div class="col-sm-2">
                      <img class="img-responsive" src="${path}<%= movie.getPlaybill() %>">
                    </div>
                      <div class="col-sm-7">
                        <p>导演:<a href="#"> 比尔·康顿</a></p>
                        <p>编剧:<a href="#"> 比尔·康顿</a></p>
                        <p>主演:<a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  <a href="#"> 比尔·康顿</a>/  </p>
                        <p>类型: <%= movie.getFilmtype()%></p>
                        <p>语言: <%= movie.getLanguage()%></p>
                        <p>上映时间: 2017-03-17(中国大陆/美国)</p>
                        <p>片长: 130分钟</p>
                        <p>IMDb链接: <a href="http://www.imdb.com/title/<%= movie.getIMDbURI()%>"><%= movie.getIMDbURI()%></a></p>
                      </div>
                    <div class="col-sm-3">
                      豆瓣评分 <%= movie.getScore()%> <br>
                      好于 67% 爱情片 <br>
                      好于 67% 奇幻片 <br>

                      <div class="progress">
  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="<%= movie.getScore()*10 %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= movie.getScore()*10 %>%"><%= movie.getScore()*10 %>分
    <span class="sr-only"><%= movie.getScore()*10 %> 分</span>
  </div>
</div>
                    </div>
                  </main>

<div class="clearfix"></div>
                  
                  <section>
                    <ul class="list-inline">
                      <li><span class="glyphicon glyphicon-heart" aria-hidden="true"></span> <a href="#">想看</a></li>
                      <li><span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span> <a href="#">看过</a></li>
                      <li><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> <a href="#">评价&写影评</a></li>
                      <li><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> <a href="#">分享到</a></li>
                    </ul>

                  </section>

                  <!-- 电影简介 -->
                  <section class="f-block">
                    <header><%= movie.getName_zh() %>的剧情简介</header>
                    <article><%= movie.getSummary() %> 。。。<a href="#">详细信息</a></article>
                  </section>

                  <!-- 图片区 -->
                  <section class="f-block">
                    <header><%= movie.getName_zh() %>的海报和图片 <a href="#">更多图片...</a></header>
                    <ul class="list-inline  f-poster-picture">
                      <li><img class="img-thumbnail" src="${path}assets/img/movies/playpill.png"></li>
                      <li><img class="img-thumbnail" src="${path}assets/img/movies/playpill.png"></li>
                      <li><img class="img-thumbnail" src="${path}assets/img/movies/playpill.png"></li>
                      <li><img class="img-thumbnail" src="${path}assets/img/movies/playpill.png"></li>
                      <li><img class="img-thumbnail" src="${path}assets/img/movies/playpill.png"></li>
                    </ul>
                  </section>

                  <!-- 评论区 -->
                  <section class="f-comment f-block">
                    <header><%= movie.getName_zh() %>的影评 <a href="#">全部952条</a></header>
                    <ul class="list-unstyled">
                      <li>
                        <header><img class="f-head-sculpture" src="${path}assets/img/friends/fr-03.jpg">Christopher R. 2017-03-17 07:29:25</header>
                        <main>
                          <p>剧情是没啥好说的，但里面的计可是不得了。Disney 这次下重手请来 Jacqueline Durran 来做服装设计，看来是直指明年的奥斯卡服装类大奖了。 Jacqueline Durran 这么多年在世界范围内各个颁奖礼中收获了 22 次提名， 16 次中标，包括 3 次的奥斯卡提名，当中凭借 Anna Kar...<a href="#">(167回应)</a></p>
                        </main>
                        <footer>1461有用 / 92没用</footer>
                        <div class="horizontal-line"></div>
                      </li>
                      <li>
                        <header><img class="f-head-sculpture" src="${path}assets/img/friends/fr-04.jpg">Christopher R. 2017-03-17 07:29:25</header>
                        <main>
                          <p>剧情是没啥好说的，但里面的服装设计可是不得了。Disney 这次下重手请来 Jacqueline Durran 来做服装设计，看来是直指明年的奥斯卡服装类大奖了。 Jacqueline Durran 这么多年在世界范围内各个颁奖礼中收获了 22 次提名， 16 次中标，包括 3 次的奥斯卡提名，当中凭借 Anna Kar...<a href="#">(167回应)</a></p>
                        </main>
                        <footer>1461有用 / 92没用</footer>
                        <div class="horizontal-line"></div>
                      </li>

                      <li>
                        <header><img class="f-head-sculpture" src="${path}assets/img/friends/fr-09.jpg">Christopher R. 2017-03-17 07:29:25</header>
                        <main>
                          <p>剧情是没啥好说的，但里面的服装设计可是不得了。Disney 这次下重手请来 Jacqueline Durran 来做服装设计，看来是直指明年的奥斯卡服装类大奖了。 Jacqueline Durran 这么多年在世界范围内各个颁奖礼中收获了 22 次提名， 16 次中标，包括 3 次的奥斯卡提名，当中凭借 Anna Kar...<a href="#">(167回应)</a></p>
                        </main>
                        <footer>1461有用 / 92没用</footer>
                        <div class="horizontal-line"></div>
                      </li>
                    </ul>
                  </section>
                </section>

              </div>
              <div class="f-right col-sm-3">
                <section>
                  <header>用户常用的标签 · · · · · ·</header>
                  <ul class="list-inline">
                    <li><a href="#">标签</a> <a href="#">标签</a> <a href="#">标签</a> <a href="#">标签</a></li>
                  </ul>
                </section>
                <section>
                  <header>豆列推荐 · · · · · · <a href="#">more</a></header>
                  <ul class="list-unstyled">
                    <li><a href="#">2017—2022值得期待的美国影片</a> (closer)</li>
                    <li><a href="#">【中国内地电影票房总排行】</a> (荔枝超人)</li>
                    <li><a href="#">ღ♪♪生活有这些期待很有动力♫♬ღ</a> (freedom♪)</li>
                    <li><a href="#">【北美周末票房榜冠军影片vol.2】</a> (荔枝超人)</li>
                    <li><a href="#">生命的演绎。</a> (艾克卷西)</li>
                    
                  </ul>
                </section>
              </div>
              <!-- exfly end -->
            </div>
          </section>
      </section>

      <!--main content end-->