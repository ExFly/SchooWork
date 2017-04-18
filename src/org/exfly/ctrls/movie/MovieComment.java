package org.exfly.ctrls.movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class MovieComment
 */
@WebServlet("/movie/comment")
public class MovieComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String movieid = request.getParameter("movieid");
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("user_id");
		if(userid == null) {
			response.sendRedirect(request.getContextPath()+"/auth/login.jsp");
			return;
		}
		if(type.equals("want")){
			org.exfly.models.Movie.wantedMovie(userid, movieid);
			response.sendRedirect(request.getContextPath()+"/movie/id?id="+movieid);
		}else if(type.equals("hadsaw")){
			org.exfly.models.Movie.hadsawMovie(userid, movieid);
			response.sendRedirect(request.getContextPath()+"/movie/id?id="+movieid);
			return;
			
		}else if(type.equals("comment")){
			request.setAttribute("movieid", movieid);
			ServletContext application = this.getServletContext();
			RequestDispatcher rd = application.getRequestDispatcher("/templates/moviecomment.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movieid = request.getParameter("movieid");
		String comment = request.getParameter("comment");
		float score = Float.parseFloat(request.getParameter("score"));
		
		if(score>10) {
			response.sendRedirect(request.getContextPath()+"/movie/id?id="+movieid);
			return;
		}
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("user_id");
		
		org.exfly.models.Movie.commentMovie(userid, movieid, score, comment);
		response.sendRedirect(request.getContextPath()+"/movie/id?id="+movieid);
	}

}
