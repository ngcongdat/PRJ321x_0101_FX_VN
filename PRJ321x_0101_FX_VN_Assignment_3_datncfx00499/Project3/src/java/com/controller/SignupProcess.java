/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.User;
import com.model.UsersMap;
import com.model.ValidateUser;
import java.io.IOException;
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
public class SignupProcess extends HttpServlet {

  UsersMap uMap = new UsersMap();

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    // Get parameter from client
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Get session
    HttpSession session = request.getSession();

    // Validate users when sign in
    ValidateUser validUser = new ValidateUser();
    String errorUsername = validUser.ValidateUsername(username);
    String errorPassword = validUser.ValidatePassword(password);

    List<String> errors = ValidateUser.ValidateUserSignin(errorUsername, errorPassword);

    if (errors.size() != 0) {
      request.setAttribute("errors", errors);
      request.getRequestDispatcher("signup").forward(request, response);
    }

    session.invalidate();
    
    uMap.addUsers(username, password);
    
    request.getRequestDispatcher("login").forward(request, response);
    
    Iterator<String> i = uMap.getUsers().values().iterator();
    while (i.hasNext()) {
      System.out.println(i.next());
    }
  }

  @Override
  public String getServletInfo() {
    return "Process when guest register user";
  }// </editor-fold>

}
