/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.bean.Post;
import com.context.DBContext;
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

/**
 *
 * @author tiny
 */
public class PostController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action == null) {
      response.sendRedirect("home");
    }

    Connection conn = null;
    String postID = request.getParameter("id");

    try {
      conn = new DBContext().getConnection();
    } catch (Exception ex) {
      response.getWriter().println(ex.toString());
      return;
    }

    if (action.equals("viewpost")) {
      DBPosts DBPost = new DBPosts(conn);
      try {
        Post post = DBPost.viewPost(Integer.parseInt(postID));
        request.setAttribute("post", post);
        request.getRequestDispatcher("post").forward(request, response);
      } catch (SQLException ex) {
        Logger.getLogger(PostController.class.getName()).log(Level.SEVERE, null, ex);
      }
    } else if (action.equals("editpost")) {
      DBPosts DBPost = new DBPosts(conn);
      try {
        Post post = DBPost.viewPost(Integer.parseInt(postID));
        request.setAttribute("post", post);
        request.getRequestDispatcher("editpost").forward(request, response);
      } catch (SQLException ex) {
        Logger.getLogger(PostController.class.getName()).log(Level.SEVERE, null, ex);
      }

    }

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
