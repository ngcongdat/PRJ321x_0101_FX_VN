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

  private final String RULE_OF_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
  private final String RULE_OF_USERNAME = "^(\\w|_|-){6,}$";
  private final String RULE_OF_PASSWORD = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,}$";

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

  // Validate email, username, password field from sign up form
  public boolean validate(User user) {

    boolean isValid = true;

    pattern = Pattern.compile(RULE_OF_EMAIL);
    matcher = pattern.matcher(email);
    if (!matcher.matches()) {
      errors.add("Invalid email!");
      isValid = false;
    }
    pattern = Pattern.compile(RULE_OF_USERNAME);
    matcher = pattern.matcher(username);
    if (!matcher.matches()) {
      errors.add("Invalid username!");
      isValid = false;
    }
    pattern = Pattern.compile(RULE_OF_PASSWORD);
    matcher = pattern.matcher(password);
    if (!matcher.matches()) {
      errors.add("Invalid password!");
      isValid = false;
    }
    
    return isValid;
  }

}
