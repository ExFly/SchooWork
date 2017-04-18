package org.exfly.ctrls.movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.exfly.models.Movie;

/**
 * Servlet implementation class MoveRankAction
 */
@WebServlet("/movie/rank")
public class MoveRankAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveRankAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int sizePage = Integer.parseInt(org.exfly.config.Config.getConfiger().getItem("movie.pagesize"));
		int page;
		if(request.getParameter("page")==null || Integer.parseInt(request.getParameter("page"))<1){
			page = 1;
			request.setAttribute("page_rank_action", page);
		}else {
			page = Integer.parseInt(request.getParameter("page"));
			request.setAttribute("page_rank_action", page);
		}
		Logger runinglogger = LogManager.getLogger("runing.test");
		
		runinglogger.debug(request.getRequestURI()+"?"+request.getQueryString());
		
		List<Movie> movieList = Movie.getMoviesbyPage(page, sizePage);
		
		request.setAttribute("movie_list_rank_action", movieList);  //添加数据
		ServletContext application = this.getServletContext();
		RequestDispatcher rd = application.getRequestDispatcher("/templates/rank.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
