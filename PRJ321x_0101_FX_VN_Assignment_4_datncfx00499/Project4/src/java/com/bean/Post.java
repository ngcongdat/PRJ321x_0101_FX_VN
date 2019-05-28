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

  public Post() {
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

}
