package org.exfly.ctrls.admin;

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
 * Servlet implementation class IndexAdminAction
 */
@WebServlet("/admin")
public class IndexAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see BaseAdminServlet#BaseAdminServlet()
     */
    public IndexAdminAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession session = request.getSession();
//		String userid= (String)session.getAttribute("user_id");
//		boolean current_user_has_permision = org.exfly.models.auth.User.hasPermission(userid);
//		if(!current_user_has_permision) {
//			response.sendError(401,"当前没有权限");
//			return;
//		}
		
		ServletContext application = this.getServletContext();
		RequestDispatcher rd = application.getRequestDispatcher("/templates/admin/index.jsp");
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
