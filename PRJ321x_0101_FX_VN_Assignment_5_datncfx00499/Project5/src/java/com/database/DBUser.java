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
public class DBUser {

  private Connection conn;

  public DBUser(Connection conn) {
    this.conn = conn;
  }

  public boolean login(String username, String password) throws SQLException {
    
    int count = 0;
    String query = "SELECT count(*) from Users where username = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      count = rs.getInt("count(*)");
    }

    if (count == 0) {
      return false;
    } else {
      return true;
    }
          
  }

  public int getUserID(String username) throws SQLException {
    
    int userId = 0;
    String query = "SELECT userId from Users where username = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      userId = rs.getInt("userId");
    }

    return userId;
  }

}
