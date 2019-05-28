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
    if (rs1.next()) {
      userID = rs1.getInt("userID");
    }

    String getCategory = "select categoryID from Categories where title = ?";
    PreparedStatement ps2 = conn.prepareStatement(getCategory);
    ps2.setString(1, category);
    ResultSet rs2 = ps2.executeQuery();
    if (rs2.next()) {
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

  // View a post in database
  public Post viewPost(int postID) throws SQLException {
    Post post = null;
    DBUsers DBUser = new DBUsers(conn);
    DBCategory DBCategory = new DBCategory(conn);
    String sql = "select * from Posts where postID = ?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setInt(1, postID);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
      String title = rs.getString("title");
      String desc = rs.getString("description");
      String content = rs.getString("content");
      String category = DBCategory.queryCategory(rs.getInt("category"));
      String author = DBUser.queryUser(rs.getInt("user"));
      Date dateCreate = rs.getDate("dateCreate");
      Date dateUpdate = rs.getDate("dateUpdate");
      post = new Post(postID, title, desc, content, category, author, dateCreate, dateUpdate);
    }
    return post;
  }

  // Edit a post in database
  public void editPost(Users user, int postID, String title, String desc, String category, String content) throws SQLException {
    int categoryID = 1;

    String getCategory = "select categoryID from Categories where title = ?";
    PreparedStatement ps = conn.prepareStatement(getCategory);
    ps.setString(1, category);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
      categoryID = rs.getInt("categoryID");
    }

    String update = "update Posts set title = ?, description = ?, content = ?, category = ?, dateUpdate = now() where postID = ?";
    PreparedStatement ps1 = conn.prepareStatement(update);
    ps1.setString(1, title);
    ps1.setString(2, desc);
    ps1.setString(3, content);
    ps1.setInt(4, categoryID);
    ps1.setInt(5, postID);
    ps1.executeUpdate();
    ps1.close();
  }

  // Delete a post in database
  public void deletePost(int postID) throws SQLException {
    String delete = "delete from Posts where postID = ?";
    PreparedStatement ps = conn.prepareStatement(delete);
    ps.setInt(1, postID);
    ps.executeUpdate();
    ps.close();
  }

  // Query all posts in datebase
  public List<Post> showAllPosts() throws SQLException {
    List<Post> posts = new ArrayList<Post>();
    DBUsers DBUser = new DBUsers(conn);
    DBCategory DBCategory = new DBCategory(conn);
    String sql = "select * from Posts order by dateCreate desc";
    PreparedStatement ps = conn.prepareStatement(sql);

    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
      int postID = rs.getInt("postID");
      String title = rs.getString("title");
      String desc = rs.getString("description");
      String content = rs.getString("content");
      String category = DBCategory.queryCategory(rs.getInt("category"));
      String author = DBUser.queryUser(rs.getInt("user"));
      Date dateCreate = rs.getDate("dateCreate");
      Date dateUpdate = rs.getDate("dateUpdate");
      posts.add(new Post(postID, title, desc, content, category, author, dateCreate, dateUpdate));
    }
    return posts;
  }

  // Query all posts of user in database
  public List<Post> showMyPosts(Users user) throws SQLException {
    int userID = 1;
    List<Post> mPosts = new ArrayList<Post>();
    DBUsers DBUser = new DBUsers(conn);
    DBCategory DBCategory = new DBCategory(conn);

    String getUser = "select userID from Users where username = ?";
    PreparedStatement ps = conn.prepareStatement(getUser);

    ps.setString(1, user.getUsername());
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
      userID = rs.getInt("userID");
    }

    String sql = "select * from Posts where user = ? order by dateCreate desc";
    PreparedStatement ps1 = conn.prepareStatement(sql);
    ps1.setInt(1, userID);
    ResultSet rs1 = ps1.executeQuery();
    while (rs1.next()) {
      int postID = rs1.getInt("postID");
      String title = rs1.getString("title");
      String desc = rs1.getString("description");
      String content = rs1.getString("content");
      String category = DBCategory.queryCategory(rs1.getInt("category"));
      String author = DBUser.queryUser(userID);
      Date dateCreate = rs1.getDate("dateCreate");
      Date dateUpdate = rs1.getDate("dateUpdate");
      mPosts.add(new Post(postID, title, desc, content, category, author, dateCreate, dateUpdate));
    }

    return mPosts;
  }

}
