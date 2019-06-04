/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import com.bean.User;
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

  // Create new user and insert into database
  public void createUser(User user) throws SQLException {
    String insert = "INSERT INTO Users (email, username, password) VALUES (?, ?, ?)";
    PreparedStatement ps = conn.prepareStatement(insert);
    ps.setString(1, user.getEmail());
    ps.setString(2, user.getUsername());
    ps.setString(3, user.getPassword());
    ps.executeUpdate();
    ps.close();
  }
  
  // Check exist user by username
  public boolean isExistUsername(String username) throws SQLException {

    int count = 0;
    String query = "SELECT count(*) FROM Users WHERE username = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      count = rs.getInt("count(*)");
    }

    if (count != 0) {
      return true;
    } else {
      return false;
    }

  }

  // Check password of user
  public boolean checkPassword(String username, String password) throws SQLException {
    String query = "SELECT password FROM Users WHERE username = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();
    
    String passwordInDatabase = "";
    if(rs.next()) {
      passwordInDatabase = rs.getString("password");
    }

    if (password.equals(passwordInDatabase)) {
      return true;
    } else {
      return false;
    }
  }

  // Get user id by username
  public int getUserID(String username) throws SQLException {

    int userId = 0;
    String query = "SELECT userId FROM Users WHERE username = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, username);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      userId = rs.getInt("userId");
    }

    return userId;
  }

}
