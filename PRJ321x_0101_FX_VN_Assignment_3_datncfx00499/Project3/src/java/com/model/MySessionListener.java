/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author tiny
 */
public class MySessionListener implements HttpSessionListener {

  private List<String> sessions = new ArrayList<String>();
  public static final String COUNTER = "session-counter";

  public MySessionListener() {

  }

  public int getActiveSessionNumber() {
    return sessions.size();
  }

  @Override
  public void sessionCreated(HttpSessionEvent se) {
    HttpSession session = se.getSession(); // get session from HttpSessionEvent
    sessions.add(session.getId());
    session.setAttribute(MySessionListener.COUNTER, this);
  }

  @Override
  public void sessionDestroyed(HttpSessionEvent se) {
    HttpSession session = se.getSession();
    sessions.remove(session.getId());
    session.setAttribute(MySessionListener.COUNTER, this);
  }

}
