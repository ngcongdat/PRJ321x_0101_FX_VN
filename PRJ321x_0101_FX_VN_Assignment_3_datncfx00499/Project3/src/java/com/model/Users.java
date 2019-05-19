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
public class Users {

  private HashMap<String, String> users;

  public HashMap<String, String> getUsers() {
    return users;
  }

  public void setUsers(HashMap<String, String> users) {
    this.users = users;
  }

  public void addUsers(User u) {
    users.put(u.getUsername(), u.getPassword());
  }
}
