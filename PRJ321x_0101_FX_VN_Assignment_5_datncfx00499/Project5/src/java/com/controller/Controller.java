/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.User;
import com.database.DBContext;
import com.database.DBUser;
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
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    HttpSession session = request.getSession();

    String action = request.getParameter("action");
    if (action.equals("") || action == null) {
      response.sendRedirect("home");
    } else if (action.equals("logout")) {
      session.invalidate();
      response.sendRedirect("home");
    }

  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    String action = request.getParameter("action");

    if (action.equals("") || action == null) {
      response.sendRedirect("home");
    }

    HttpSession session = request.getSession();
    Connection conn = null;

    try {
      conn = new DBContext().getConnection();
    } catch (Exception ex) {
      Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
      return;
    }
    DBUser dbUser = new DBUser(conn);

    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    /**
     * Login Process
     *
     * Validate, query in database and login
     */
    if (action.equals("signin")) {
      User user = new User(email, username, password);

      try {
        if (dbUser.login(username, password)) {
          session.setAttribute("user", user);
          request.getRequestDispatcher("home").forward(request, response);
        } else {
          request.setAttribute("errors", user.getErrors());
          request.getRequestDispatcher("sign-in").forward(request, response);
        }
      } catch (SQLException ex) {
        response.sendRedirect("error");
      }
    } /**
     * Sign Up Process
     *
     * Validate, create new user and insert into database
     */
    else if (action.equals("signup")) {
      User user = new User(email, username, password);

      try {
        if (!user.validate(user)) {
          request.setAttribute("errors", user.getErrors());
          request.getRequestDispatcher("sign-up").forward(request, response);
        } else {
          if (dbUser.isExists(username)) {
            request.setAttribute("errors", "Email or Username is exists");
            request.getRequestDispatcher("sign-up").forward(request, response);
          } else {
            dbUser.createUser(user);
            session.invalidate();
            request.getRequestDispatcher("sign-in").forward(request, response);
          }
        }
      } catch (SQLException ex) {
        Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
      }

    }

    try {
      conn.close();
    } catch (SQLException ex) {
      Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
      return;
    }

  }

}
