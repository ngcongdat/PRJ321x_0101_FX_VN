package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter p = response.getWriter();
		String name = "Dat";
		int age = 24;
		String countries = "Viet Nam";
		String[] courses = { "Java", "C++" };
		String[] languages = { "VietNam", null };

		p.println("<html>");
		p.println("<head>");
		p.println("<meta charset=\"utf-8\">");
		p.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">");
		p.println("<link href=\"../../../Project2/css/style.css\" rel=\"stylesheet\" type=\"text/css\">");
		p.println(
				"<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">");
		p.println("<title>Register Information</title>");
		p.println("</head>");
		p.println("<body>");
		request.getRequestDispatcher("components/header.html").include(request, response);
		p.println("<div class=\"container info-bg\">");
		p.println("<div class=\"row\">");
		p.println("<div class=\"col-12 col-sm-12 col-md-12 col-lg-12\">");
		p.println("<table class=\"table table-striped table-dark shadow-lg p-3 mb-5 rounded\">");
		p.println("<thead>");
		p.println("<tr><th scope=\"col\" colspan=\"2\" class=\"text-center\">Information</th></tr>");
		p.println("</thead>");
		p.println("<tbody>");
		p.println("<tr><th>Name</th><td>" + name + "</td>");
		p.println("<tr><th>Age</th><td>" + age + "</td>");
		p.println("<tr><th>Country</th><td>" + countries + "</td>");
		p.println("<tr><th rowspan=\"" + courses.length + "\">Courses</th><td>" + courses[0] + "</td>");
		for (int i = 1; i < courses.length; i++) {
			p.println("<tr><td>" + courses[i] + "</td>");
		}
		p.println("<tr><th rowspan=\"" + languages.length + "\">Languages</th><td>" + languages[0] + "</td>");
		for (int i = 1; i < languages.length; i++) {
			if (languages[i] != null) {

				p.println("<tr><td>" + languages[i] + "</td>");
			}
		}
		p.println("</tbody>");
		p.println("</table>");
		p.println("<div class=\"col-12 col-sm-12 col-md-12 col-lg-12 text-center\">");
		p.println("<a href=\"index.jsp\" class=\"btn btn-outline-info\">Confirm</a>");
		p.println("</div>");
		p.println("</div>");
		p.println("</div>");
		p.println("</div>");
		request.getRequestDispatcher("components/footer.html").include(request, response);
		p.println("</body>");
		p.println("</html>");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String countries = request.getParameter("countries");
		String[] courses = request.getParameterValues("courses");
		String[] languages = { request.getParameter("language1"), request.getParameter("language2"),
				request.getParameter("language3") };

		List<String> errors = Validate.ValidateRegister(name, age, languages);
		if (errors.size() != 0) {
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("courseform.jsp").forward(request, response);
		}
		
		response.setContentType("text/html");
		PrintWriter p = response.getWriter();
		p.println("<html>");
		p.println("<head>");
		p.println("<meta charset=\"utf-8\">");
		p.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">");
		p.println("<link href=\"../../../Project2/css/style.css\" rel=\"stylesheet\" type=\"text/css\">");
		p.println(
				"<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">");
		p.println("<title>Register Information</title>");
		p.println("</head>");
		p.println("<body>");
		request.getRequestDispatcher("components/header.html").include(request, response);
		p.println("<div class=\"container info-bg\">");
		p.println("<div class=\"row\">");
		p.println("<div class=\"col-12 col-sm-12 col-md-12 col-lg-12\">");
		p.println("<table class=\"table table-striped table-dark shadow-lg p-3 mb-5 rounded\">");
		p.println("<thead>");
		p.println("<tr><th scope=\"col\" colspan=\"2\" class=\"text-center\">Information</th></tr>");
		p.println("</thead>");
		p.println("<tbody>");
		p.println("<tr><th>Name</th><td>" + name + "</td>");
		p.println("<tr><th>Age</th><td>" + age + "</td>");
		p.println("<tr><th>Country</th><td>" + countries + "</td>");
		p.println("<tr><th rowspan=\"" + courses.length + "\">Courses</th><td>" + courses[0] + "</td>");
		for (int i = 1; i < courses.length; i++) {
			p.println("<tr><td>" + courses[i] + "</td>");
		}
		p.println("<tr><th rowspan=\"" + languages.length + "\">Languages</th><td>" + languages[0] + "</td>");
		for (int i = 1; i < languages.length; i++) {
			if (languages[i] != null) {

				p.println("<tr><td>" + languages[i] + "</td>");
			}
		}
		p.println("</tbody>");
		p.println("</table>");
		p.println("<div class=\"col-12 col-sm-12 col-md-12 col-lg-12 text-center\">");
		p.println("<a href=\"index.jsp\" class=\"btn btn-outline-info\">Confirm</a>");
		p.println("</div>");
		p.println("</div>");
		p.println("</div>");
		p.println("</div>");
		request.getRequestDispatcher("components/footer.html").include(request, response);
		p.println("<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>");
		p.println("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>");
		p.println("<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>");
		p.println("</body>");
		p.println("</html>");
	}

}
