package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Validate;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/login")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControllerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();

		int flag = Validate.ValidateUser(username, password);

		if (flag == 1) {
			session.setAttribute("user", "system");
			request.getRequestDispatcher("page1.jsp").forward(request, response);
		} else if (flag == 2) {
			session.setAttribute("user", "admin");
			request.getRequestDispatcher("courseform.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "Login fail! Please check again!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		session.setMaxInactiveInterval(30);
	}

}
