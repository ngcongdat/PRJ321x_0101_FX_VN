/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tiny
 */
public class Cookies extends HttpServlet {
  
  public static String COOKIES = "reader-cookies";

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    Cookie c = new Cookie(Cookies.COOKIES, "reader-back");
    c.setMaxAge(1800);
    response.addCookie(c);
    request.getRequestDispatcher("home").forward(request, response);
  }

}
