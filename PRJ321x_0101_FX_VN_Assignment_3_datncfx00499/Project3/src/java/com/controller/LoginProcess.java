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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
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

    // Get parameter from client
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Get session
    HttpSession session = request.getSession();

    // Validate user when login
    List<String> errors = ValidateUser.ValidateUserLogin(username, password);

    if (errors.size() != 0) {
      request.setAttribute("errors", errors);
      request.getRequestDispatcher("login").forward(request, response);
    }

    HashMap<String, String> users = uMap.getUsers();
    if (!users.containsKey(username)) {
      errors.add("Username is not exist");
      request.setAttribute("errors", errors);
      request.getRequestDispatcher("login").forward(request, response);
    }

    if (users.containsKey(username)) {
      if (!users.get(username).equals(password)) {
        errors.add("Password is wrong");
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("login").forward(request, response);
      } else {
        ServletContext context = getServletContext();

        Integer countUserLogin = (Integer) context.getAttribute("countUserLogin");
        HashMap<Integer, String> allUsers = (HashMap<Integer, String>) context.getAttribute("allUsers");

        if (countUserLogin == null) {
          countUserLogin = 1;
          allUsers = new HashMap<>();
          allUsers.put(countUserLogin, username);
        } else {
          if (allUsers.containsValue(username) == false) {
            countUserLogin++;
            allUsers.put(countUserLogin, username);
          }
        }

        context.setAttribute("countUserLogin", countUserLogin);
        context.setAttribute("allUsers", allUsers);

        session.setAttribute("user", new User(username, password));
        request.getRequestDispatcher("index").forward(request, response);
      }
    }
  }

  @Override
  public String getServletInfo() {
    return "Process user login to system";
  }// </editor-fold>

}
