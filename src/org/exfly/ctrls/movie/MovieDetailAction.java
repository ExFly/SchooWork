package org.exfly.ctrls.movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.exfly.ctrls.BaseAction;

/**
 * Servlet implementation class MovieDetailAction
 */
@WebServlet("/movie/id")
public class MovieDetailAction extends BaseAction {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see BaseAction#BaseAction()
     */
    public MovieDetailAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String movie_id = request.getParameter("id");
		org.exfly.models.Movie movie = org.exfly.models.Movie.getMoviebyID(movie_id);
		request.setAttribute("movie_info", movie);  //添加数据
		ServletContext application = this.getServletContext();
		RequestDispatcher rd = application.getRequestDispatcher("/templates/moviedetail.jsp");
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
