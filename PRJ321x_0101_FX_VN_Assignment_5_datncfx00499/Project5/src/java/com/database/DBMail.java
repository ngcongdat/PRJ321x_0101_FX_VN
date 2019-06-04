/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author tiny
 */
public class DBMail {

  private Connection conn;

  public DBMail(Connection conn) {
    this.conn = conn;
  }

  // Create new email and insert into database
  public void createMail(int userId, String toAddress, String ccAddress, String subject, String content) throws SQLException {

    String insert = "INSERT INTO MyMail (user, toAddress, ccAddress, subject, content, dateSend)"
            + "VALUES (?, ?, ?, ?, ?, NOW())";
    PreparedStatement ps = conn.prepareStatement(insert);
    ps.setInt(1, userId);
    ps.setString(2, toAddress);
    ps.setString(3, ccAddress);
    ps.setString(4, subject);
    ps.setString(5, content);
    
    ps.executeUpdate();
    ps.close();
  }
}
