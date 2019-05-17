package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Validate;

/**
 * Servlet implementation class CourseValidation
 */
@WebServlet("/coursevalidation")
public class CourseValidation extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public CourseValidation() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String countries = request.getParameter("countries");
		String[] courses = request.getParameterValues("courses");
//		String vietnamese = request.getParameter("language1");
//		String english = request.getParameter("language2");
//		String french = request.getParameter("language3");
		String[] languages = {request.getParameter("language1"), request.getParameter("language2"), request.getParameter("language3")};
	
		List<String> errors = Validate.ValidateRegister(name, age, languages);
		if(errors.size() != 0) {
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("courseform.jsp").forward(request, response);
		}
		
		
	}

}
