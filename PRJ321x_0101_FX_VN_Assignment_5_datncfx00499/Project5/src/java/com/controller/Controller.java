/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.database.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tiny
 */
public class Controller extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    
//    String action = request.getParameter("action");
//    if(action.equals("") || action == null) {
      response.sendRedirect("home");
//    }
    
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    
    String action = request.getParameter("action");
  
    if(action.equals("") || action == null) {
      response.sendRedirect("home");
    }
    
    Connection conn = null;
    
    try {
      conn = new DBContext().getConnection();
    } catch (Exception ex) {
      Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
      return;
    }
    
    response.getWriter().println("Hello");
    
    try {
      conn.close();
    } catch (SQLException ex) {
      Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
      return;
    }
    
  }

}
