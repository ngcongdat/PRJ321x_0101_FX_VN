/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tiny
 */
public class LogoutProcess extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String username = request.getParameter("username");

    // Get all attributes from servlet context
    ServletContext context = getServletContext();
    Integer countUserLogin = (Integer) context.getAttribute("countUserLogin");
    Map<String, String> allUsers = (Map<String, String>) context.getAttribute("allUsers");
    String keyOfUser = "";

    // Get key of Map from value
    for (Entry<String, String> entry : allUsers.entrySet()) {
      if (entry.getValue().equals(username)) {
        keyOfUser = entry.getKey();
      }
    }

    // Remove this entry and subtract user counter
    allUsers.remove(keyOfUser);
    countUserLogin--;

    // Set all attributes again to servlet context
    context.setAttribute("countUserLogin", countUserLogin);
    context.setAttribute("allUsers", allUsers);

    // Clear session and redirect
    request.getSession().invalidate();
    response.sendRedirect("home");
  }

  @Override
  public String getServletInfo() {
    return "Process when user logout";
  }// </editor-fold>

}
