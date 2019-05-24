/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tiny
 */
public class Account {

  private Connection conn;

  public Account(Connection conn) {
    this.conn = conn;
  }

  public boolean login(String username, String password) throws SQLException {

    String sql = "select count(*) from Users where username=? and password=?";
    PreparedStatement ps = conn.prepareStatement(sql);

    ps.setString(1, username);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();

    int result = 0;

    if (rs.next()) {
      result = rs.getInt("count(*)");
    }

    if (result == 0) {
      return false;
    } else {
      return true;
    }
  }

  public boolean exist(String username) throws SQLException {

    String sql = "select count(*) from Users where username=?";
    PreparedStatement ps = conn.prepareStatement(sql);

    ps.setString(1, username);
    
    ResultSet rs = ps.executeQuery();

    int result = 0;

    if (rs.next()) {
      result = rs.getInt("count(*)");
    }

    if (result != 0) {
      return true;
    } else {
      return false;
    }
  }
  
  public void create(String username, String password) throws SQLException {
    
    String sql = "insert into Users (username, password) values (?, ?)";
    PreparedStatement ps = conn.prepareStatement(sql);
    
    ps.setString(1, username);
    ps.setString(2, password);
    
    ps.executeUpdate();
    
    ps.close();
  }
}
