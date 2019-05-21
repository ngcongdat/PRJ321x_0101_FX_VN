/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author tiny
 */
public class UsersMap {

  private static Map<String, String> users = new HashMap<>();
  
  public UsersMap() {
    users.put("admin", "admin");
  }
  
  public Map<String, String> getUsers() {
    return users;
  }

  public void setUsers(Map<String, String> users) {
    this.users = users;
  }

  public void addUsers(String username, String password) {
    this.users.put(username, password);
  }
}
