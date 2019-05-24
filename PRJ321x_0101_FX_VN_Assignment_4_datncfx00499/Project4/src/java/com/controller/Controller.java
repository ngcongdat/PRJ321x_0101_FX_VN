/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Users;
import com.context.DBContext;
import com.database.Account;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tiny
 */
public class Controller extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    String action = request.getParameter("action");

    if (action == null) {
      request.getRequestDispatcher("index").forward(request, response);
    }
    
    HttpSession session = request.getSession();

    Connection conn = null;
    try {
      conn = new DBContext().getConnection();
    } catch (Exception ex) {
      response.getWriter().println(ex.toString());
      return;
    }

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (action.equals("dologin")) {
      Users user = new Users(username, password);

      Account account = new Account(conn);
      
      try {
        if (account.login(username, password)) {
          session.setAttribute("user", user);
          request.getRequestDispatcher("blogs").forward(request, response);
        } else {
          request.setAttribute("error", "Username or password is incorrect");
          request.getRequestDispatcher("login").forward(request, response);
        }
      } catch (SQLException ex) {
        response.getWriter().println("Error query data! Please check again!");
      }
    }

    try {
      conn.close();
    } catch (SQLException ex) {
      response.getWriter().println(ex.toString());
      return;
    }


  }

}
