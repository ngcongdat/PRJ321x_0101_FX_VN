/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author tiny
 */
public class User {

  private Pattern pattern;
  private Matcher matcher;

  private String email;
  private String username;
  private String password;

  private List<String> errors = new ArrayList<>();

  private final String RULES_OF_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
  private final String RULES_OF_USERNAME = "^(\\w|_|-){6,}$";
  private final String RULES_OF_PASSWORD = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,}$";

  public User() {
  }

  public User(String email, String username, String password) {
    this.email = email;
    this.username = username;
    this.password = password;
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

  public List<String> getErrors() {
    return errors;
  }

  public void setErrors(List<String> errors) {
    this.errors = errors;
  }

  public boolean validate(User user) {

    boolean isValid = true;
    
    if (this.email.trim().equals("") || this.email == null) {
      errors.add("Invalid email!");
      isValid = false;
    }
    if (this.username.trim().equals("") || this.username == null) {
      errors.add("Invalid username!");
      isValid = false;
    }
    if (this.password.trim().equals("") || this.password == null) {
      errors.add("Invalid password!");
      isValid = false;
    }
    if (this.password.length() < 8) {
      errors.add("Password must be at least 8 characters");
      isValid = false;
    }

    return true;
  }

}
