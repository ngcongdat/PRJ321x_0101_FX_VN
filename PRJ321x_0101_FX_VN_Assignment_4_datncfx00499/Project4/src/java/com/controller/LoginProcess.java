/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.context.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tiny
 */
public class LoginProcess extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    
    Connection conn = null;
    try {
      conn = new DBContext().getConnection();
    } catch (Exception ex) {
      response.getWriter().println(ex.toString());
      return;
    }
    
    response.getWriter().println("Connect database success");
    
    try {
      conn.close();
    } catch (SQLException ex) {
      response.getWriter().println(ex.toString());
      return;
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }


}
