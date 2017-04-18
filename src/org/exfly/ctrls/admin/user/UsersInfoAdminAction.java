package org.exfly.ctrls.admin.user;

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

import org.exfly.models.auth.User;

/**
 * Servlet implementation class UsersInfoAdminAction
 */
@WebServlet("/admin/user")
public class UsersInfoAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersInfoAdminAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("id")==null) {
			int sizePage = Integer.parseInt("20");
			int page;
			if(request.getParameter("page")==null || Integer.parseInt(request.getParameter("page"))<1){
				page = 1;
				request.setAttribute("page_user_admin_action", page);
			}else {
				page = Integer.parseInt(request.getParameter("page"));
				request.setAttribute("page_user_admin_action", page);
			}
			
			Logger runinglogger = LogManager.getLogger("runing.test");
			runinglogger.debug(request.getRequestURI()+"?"+request.getQueryString());
			
			List<User> userList = User.getUserbyPage(page, sizePage);
			request.setAttribute("user_list_admin_action", userList);
			ServletContext application = this.getServletContext();
			RequestDispatcher rd = application.getRequestDispatcher("/templates/admin/user_info.jsp");
			rd.forward(request, response);
		}else{
			// 修改某个user的信息
			String user_id = request.getParameter("id");
			User user = User.getUserbyID(user_id);
			request.setAttribute("user_admin_action", user);
			ServletContext application = this.getServletContext();
			RequestDispatcher rd = application.getRequestDispatcher("/templates/admin/user_info_update.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO 没有真正实现数据的更新
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String permission = request.getParameter("permission");
		System.out.println(userid);
		System.out.println(username);
		System.out.println(permission);
		
		response.sendRedirect(request.getContextPath()+"/admin/user");
	}

}
