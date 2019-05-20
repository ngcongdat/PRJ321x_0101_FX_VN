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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tiny
 */
public class SignupProcess extends HttpServlet {

  UsersMap uMap = new UsersMap();

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    ValidateUser validUser = new ValidateUser();
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    boolean isValidUsername = validUser.ValidateUsername(username);
    boolean isValidPassword = validUser.ValidatePassword(password);

    if (isValidUsername && isValidPassword) {
      uMap.addUsers(username, password);
    }

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
