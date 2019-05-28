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
public class DBCategory {
  
  private Connection conn;
  
  public DBCategory(Connection conn) {
    this.conn = conn;
  }
  
  public String queryCategory(int categoryID) throws SQLException {
    String category = "";
    String sql = "select title from Categories where categoryID = ?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setInt(1, categoryID);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      category = rs.getString("title");
    }

    return category;
  }
  
}
