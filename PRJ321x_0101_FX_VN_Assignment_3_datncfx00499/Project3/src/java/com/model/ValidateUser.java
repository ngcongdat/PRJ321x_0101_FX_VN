/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tiny
 */
public class ValidateUser {
  
  public static List<String> ValidateInfoUser(String username, String password) {
    
    List<String> errors = new ArrayList<>();
    
    if(username.trim().equals("") || username == null) {
      errors.add("Username is invalid");
    }
    if(password.trim().equals("") || password == null) {
      errors.add("Password is invalid");
    }
    return errors;
  }
}
