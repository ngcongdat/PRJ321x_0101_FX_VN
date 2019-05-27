/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import com.bean.Post;
import com.bean.Users;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tiny
 */
public class DBPosts {
  
  private Connection conn;

  public DBPosts(Connection conn) {
    this.conn = conn;
  }
  
  // Create new post and insert to database
  public void createPost(Users user, String title, String desc, String category, String content) throws SQLException {
    int userID = 0;
    int categoryID = 0;
    
    String getUser = "select userID from Users where username = ?";
    PreparedStatement ps1 = conn.prepareStatement(getUser);
    
    ps1.setString(1, user.getUsername());
    ResultSet rs1 = ps1.executeQuery();
    if(rs1.next()) {
      userID = rs1.getInt("userID");
    }
  
    
    String getCategory = "select categoryID from Categories where title = ?";
    PreparedStatement ps2 = conn.prepareStatement(getCategory);
    ps2.setString(1, category);
    ResultSet rs2 = ps2.executeQuery();
    if(rs2.next()) {
      categoryID = rs2.getInt("categoryID");
    }
    
    String insert = "insert into Posts(title, description, content, category, user, dateCreate) values (?, ?, ?, ?, ?, now())";
    PreparedStatement ps3 = conn.prepareStatement(insert);
    
    ps3.setString(1, title);
    ps3.setString(2, desc);
    ps3.setString(3, content);
    ps3.setInt(4, categoryID);
    ps3.setInt(5, userID);
    
    ps3.executeUpdate();
    ps3.close();
  }
  
  public Post viewPost(int postID) throws SQLException {
    Post post = null;
    DBUsers DBUser = new DBUsers(conn);
    String sql = "select * from Posts where postID = ?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setInt(1, postID);
    ResultSet rs = ps.executeQuery();
    if(rs.next()) {
      String title = rs.getString("title");
      String desc = rs.getString("description");
      String content = rs.getString("content");
      String category = DBUser.queryCategory(rs.getInt("category"));
      String author = DBUser.queryUser(rs.getInt("user"));
      Date dateCreate = rs.getDate("dateCreate");
      post = new Post(postID, title, desc, content, category, author, dateCreate);
    }
    
    return post;
  }
  
  // Query all posts in datebase
  public List<Post> showAllPosts() throws SQLException {
    List<Post> posts = new ArrayList<Post>();
    DBUsers DBUser = new DBUsers(conn);
    String sql = "select * from Posts";
    PreparedStatement ps = conn.prepareStatement(sql);
    
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
        int postID = rs.getInt("postID");
      String title = rs.getString("title");
      String desc = rs.getString("description");
      String content = rs.getString("content");
      String category = DBUser.queryCategory(rs.getInt("category"));
      String author = DBUser.queryUser(rs.getInt("user"));
      Date dateCreate = rs.getDate("dateCreate");
      posts.add(new Post(postID, title, desc, content, category, author, dateCreate));
    }
    
    return posts;
  }
  
}
