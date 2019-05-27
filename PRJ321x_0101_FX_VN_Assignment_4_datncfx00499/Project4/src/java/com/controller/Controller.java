/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Users;
import com.context.DBContext;
import com.database.Account;
import com.database.DBPosts;
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
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    HttpSession session = request.getSession();
    if(action.equals("dologout")) {
      session.invalidate();
      response.sendRedirect("blogs");
    }
    
  }
  
  

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    String action = request.getParameter("action");

    if (action == null) {
      request.getRequestDispatcher("index").forward(request, response);
    }

    HttpSession session = request.getSession();

    Connection conn = null;
    // Connect to database
    try {
      conn = new DBContext().getConnection();
    } catch (Exception ex) {
      response.getWriter().println(ex.toString());
      return;
    }
    Account account = new Account(conn);

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    /**
     * Login Process
     *
     * Validate, query in database and login
     */
    if (action.equals("dologin")) {
      Users user = new Users(username, password);

      try {
        // Query user in database        
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
    } /**
     * Sign Up Process
     *
     * Validate, create new user and insert into database
     */
    else if (action.equals("dosignup")) {
      Users user = new Users(username, password);
      // Validate user info from sign up form        
      if (!user.validate(username, password)) {
        request.setAttribute("user", user);
        request.getRequestDispatcher("signup").forward(request, response);
      } else {
        try {
          // Check user is exist or not?        
          if (account.exist(username)) {
            user.setError("Username is exist");
            request.setAttribute("user", user);
            request.getRequestDispatcher("signup").forward(request, response);
          } else {
            account.create(username, password);
            request.getRequestDispatcher("login").forward(request, response);
          }
        } catch (SQLException ex) {
          Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
      }

    } /**
     * Create Post Process
     *
     * Create new post and insert into database
     */
    else if (action.equals("dopost")) {
      Users user = (Users) session.getAttribute("user");
      String title = request.getParameter("title");
      String desc = request.getParameter("description");
      String category = request.getParameter("category");
      String content = request.getParameter("content");

      DBPosts post = new DBPosts(conn);
      try {
        post.createPost(user, title, desc, category, content);
        System.out.println("Post created");
      } catch (SQLException ex) {
        Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
      }
    } /**
     * Log out Process
     *
     * Clean session and log out
     */
    else {
      
    }

    try {
      conn.close();
    } catch (SQLException ex) {
      response.getWriter().println(ex.toString());
      return;
    }

  }

}
