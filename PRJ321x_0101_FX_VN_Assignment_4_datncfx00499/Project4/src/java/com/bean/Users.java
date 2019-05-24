/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author tiny
 */
public class Users {

  private String name = "";
  private String email = "";
  private String username = "";
  private String password = "";

  private String error = "";
  
  private final String RULES_OF_USERNAME = "^(\\w|_|-){6,}$";
  private final String RULES_OF_PASSWORD = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,}$";
  
  private Pattern pattern;
  private Matcher matcher;

  public Users() {

  }

  public Users(String username, String password) {
    this.username = username;
    this.password = password;
  }
  
  public Users(String name, String email, String username, String password) {
    this.username = username;
    this.password = password;
  }
  
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getError() {
    return error;
  }

  public void setError(String error) {
    this.error = error;
  }

  public boolean validate(String username, String password) {
    
    if(username == null || username.trim().equals("")) {
      error = "Invalid username";
      return false;
    }
    
    if(password == null || password.trim().equals("")) {
      error = "Invalid password";
      return false;
    }
    
    if(password.length() < 8) {
      error = "Password must be at least 8 characters";
      return false;
    }
    
    pattern = Pattern.compile(RULES_OF_USERNAME);
    matcher = pattern.matcher(username);
    if(!matcher.matches()) {
      error = "Invalid username";
      return false;
    }
    
    pattern = Pattern.compile(RULES_OF_PASSWORD);
    matcher = pattern.matcher(password);
    if(!matcher.matches()) {
      error = "Invalid password";
      return false;
    }
    
    return true;
  }
  
}
