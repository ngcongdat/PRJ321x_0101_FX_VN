/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.sql.Date;

/**
 *
 * @author tiny
 */
public class Post {

  private int postID;
  private String title;
  private String desc;
  private String content;
  private String category;
  private String author;
  private Date dateCreate;
  private Date dateUpdate;

  private String error = "";

  public Post() {
  }

  public Post(String title, String desc) {
    this.title = title;
    this.desc = desc;
  }

  public Post(int postID, String title, String desc, String content, String category, String author, Date dateCreate, Date dateUpdate) {
    this.postID = postID;
    this.title = title;
    this.desc = desc;
    this.content = content;
    this.author = author;
    this.dateCreate = dateCreate;
    this.dateUpdate = dateUpdate;
  }

  public int getPostID() {
    return postID;
  }

  public void setPostID(int postID) {
    this.postID = postID;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getDesc() {
    return desc;
  }

  public void setDesc(String desc) {
    this.desc = desc;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public String getAuthor() {
    return author;
  }

  public void setAuthor(String author) {
    this.author = author;
  }

  public Date getDateCreate() {
    return dateCreate;
  }

  public void setDateCreate(Date dateCreate) {
    this.dateCreate = dateCreate;
  }

  public Date getDateUpdate() {
    return dateUpdate;
  }

  public void setDateUpdate(Date dateUpdate) {
    this.dateUpdate = dateUpdate;
  }

  public String getError() {
    return error;
  }

  public void setError(String error) {
    this.error = error;
  }

  public boolean validate(String title, String desc) {

    if (title == null || title.trim().equals("")) {
      error = "Title must be required";
      return false;
    }

    if (desc == null || desc.trim().equals("")) {
      error = "Invalid password";
      return false;
    }
    
    if(title.length() > 255) {
      error = "Title must be less than 255 characters";
      return false;
    }

    if(desc.length() > 255) {
      error = "Description must be less than 255 characters";
      return false;
    }
    return true;
  }

}
