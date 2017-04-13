package org.exfly.ctrls.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.exfly.ctrls.BaseAction;
import org.exfly.models.auth.User;
/**
 * Servlet implementation class Signup
 */
@WebServlet("/signup")
public class SignUpAction extends BaseAction {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/auth/signup.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password_same = request.getParameter("password_same");
		if(username.equals("") || password.equals("")) {
			response.sendRedirect(request.getContextPath()+"/auth/signup.jsp");
			return;
		}
		if(!password.equals(password_same)){
			response.sendRedirect(request.getContextPath()+"/auth/signup.jsp");
			return;
		}
		String result = new User().signUp(username, password);
		if(result == null || result.equals("")){
			/* 用户名存在 */
			response.sendRedirect(request.getContextPath()+"/auth/signup.jsp");
			return;
		}else {
			/* 注册成功 */
			
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().append(username).append(password);
	}

}
