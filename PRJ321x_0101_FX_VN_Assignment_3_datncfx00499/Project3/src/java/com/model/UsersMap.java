/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.HashMap;

/**
 *
 * @author tiny
 */
public class UsersMap {

  private static HashMap<String, String> users = new HashMap<>();
  
  public UsersMap() {
    users.put("tinynguyen", "NcDat!0810");
  }
  
  public HashMap<String, String> getUsers() {
    return users;
  }

  public void setUsers(HashMap<String, String> users) {
    this.users = users;
  }

  public void addUsers(String username, String password) {
    this.users.put(username, password);
  }
}
