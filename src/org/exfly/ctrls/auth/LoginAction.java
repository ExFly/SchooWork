package org.exfly.ctrls.auth;

import java.util.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.exfly.ctrls.BaseAction;
import org.exfly.models.auth.User;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login")
public class LoginAction extends BaseAction {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see BaseAction#BaseAction()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/auth/login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String result = new User().login(username, password);
		if(result == null){
			/* 登陆失败 */
			response.sendRedirect(request.getContextPath()+"/auth/login.jsp");
		}else {
			/* 登陆成功 */
			HttpSession session = request.getSession();
			// TODO: 登陆成功后的处理
			session.setAttribute("user_id", result);
			response.sendRedirect(request.getContextPath()+"/");
		}
	}

}
