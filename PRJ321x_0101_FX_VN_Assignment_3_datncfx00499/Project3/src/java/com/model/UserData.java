/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tiny
 */
public class UserData {

  // Save user data
  public static void saveData(Map<String, String> uMap) {
    try {
      File file = new File("DATA.txt");
      if (!file.exists()) {
        file.createNewFile();
      }
      FileOutputStream fos = new FileOutputStream(file);
      ObjectOutputStream oos = new ObjectOutputStream(fos);

      oos.writeObject(uMap);

      oos.close();
      fos.close();
      System.out.println("Save data success");
    } catch (IOException ex) {
      Logger.getLogger(UserData.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  // Read user data
  public static Map<String, String> readFile() {
    Map<String, String> uMap = null;
    try {
      File file = new File("DATA.txt");
      FileInputStream fis = new FileInputStream(file);
      ObjectInputStream ois = new ObjectInputStream(fis);

      uMap = (Map<String, String>) ois.readObject();

    } catch (FileNotFoundException ex) {
      Logger.getLogger(UserData.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IOException ex) {
      Logger.getLogger(UserData.class.getName()).log(Level.SEVERE, null, ex);
    } catch (ClassNotFoundException ex) {
      Logger.getLogger(UserData.class.getName()).log(Level.SEVERE, null, ex);
    }
    return uMap;
  }

}
