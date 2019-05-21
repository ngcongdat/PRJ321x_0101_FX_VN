/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author tiny
 */
public class ValidateUser {

  private final String RULES_OF_USERNAME = "^(\\w|_|-){6,}$";
  private final String RULES_OF_PASSWORD = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,}$";

  // Check user when login and return errors
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

  // Check user when sign in and return errors
  public static List<String> ValidateUserSignin(String errorUsername, String errorPassword) {

    List<String> errors = new ArrayList<>();

    if (errorUsername.length() != 0) {
      errors.add(errorUsername);
    }
    if (errorPassword.length() != 0) {
      errors.add(errorPassword);
    }
    return errors;

  }

  // Check username when sign in
  public String ValidateUsername(String username) {

    String error = "";
    Pattern pattern = Pattern.compile(RULES_OF_USERNAME);
    Matcher matcher = pattern.matcher(username);

    UsersMap uMap = new UsersMap();
    Map<String, String> users = uMap.getUsers();

    if (matcher.matches() == false) {
      error = "Username must be length than 6 character <br/> Username can't contains \"$#@%^&*\"";
      return error;
    }

    if (users.containsKey(username)) {
      error = "Username is exists";
      return error;
    }

    return error;

  }

  // Check password when sign in
  public String ValidatePassword(String password) {

    String error = "";
    Pattern pattern = Pattern.compile(RULES_OF_PASSWORD);
    Matcher matcher = pattern.matcher(password);

    if (matcher.matches() == false) {
      error = "Password must be 1 uppercase, 1 lowercase, 1 special character <br/> Password must be lengh 8 character";
      return error;
    }
    return error;
  }

}
