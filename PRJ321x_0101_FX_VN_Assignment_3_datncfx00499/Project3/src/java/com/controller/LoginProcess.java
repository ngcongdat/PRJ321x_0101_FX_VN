/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.UsersMap;
import com.model.ValidateUser;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tiny
 */
public class LoginProcess extends HttpServlet {

  UsersMap uMap = new UsersMap();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    HttpSession session = request.getSession();

    List<String> errors = ValidateUser.ValidateUserLogin(username, password);

    if (errors.size() != 0) {
      request.setAttribute("errors", errors);
      request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    HashMap<String, String> users = uMap.getUsers();
    if (!users.containsKey(username)) {
      errors.add("Username is not exist");
      request.setAttribute("errors", errors);
      request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    if (users.containsKey(username)) {
      if (!users.get(username).equals(password)) {
        errors.add("Password is wrong");
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("login.jsp").forward(request, response);
      } else {
        session.setAttribute("logged", username);
        request.getRequestDispatcher("index.jsp").forward(request, response);
      }
    }
  }

  @Override
  public String getServletInfo() {
    return "Process user login to system";
  }// </editor-fold>

}
