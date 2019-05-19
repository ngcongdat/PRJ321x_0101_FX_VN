/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author tiny
 */
public class ValidateUser {

  private final String RULES_OF_USERNAME = "^(\\w|_|-){6,}$";
  private final String RULES_OF_PASSWORD = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,}$";

  public static List<String> ValidateUserLogin(String username, String password) {

    List<String> errors = new ArrayList<>();

    if (username.trim().equals("") || username == null) {
      errors.add("Username is invalid");
    }
    if (password.trim().equals("") || password == null) {
      errors.add("Password is invalid");
    }
    return errors;
  }

  public boolean ValidateUsername(String username) {
    Pattern pattern = Pattern.compile(RULES_OF_USERNAME);
    Matcher matcher = pattern.matcher(username);
    return matcher.matches();
  }

  public boolean ValidatePassword(String password) {
    Pattern pattern = Pattern.compile(RULES_OF_PASSWORD);
    Matcher matcher = pattern.matcher(password);
    return matcher.matches();
  }
}
