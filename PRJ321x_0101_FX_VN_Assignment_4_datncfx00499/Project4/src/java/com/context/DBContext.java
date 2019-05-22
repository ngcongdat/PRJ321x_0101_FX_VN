/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.context;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author tiny
 */
public class DBContext {
  
  public Connection getConnection() throws Exception {
    InitialContext initialContext = new InitialContext();
    
    Context env = (Context) initialContext.lookup("java:comp/env");
    
    ds = (DataSource) env.lookup("jdbc/myblog");
    
    return ds.getConnection();
  }
  
  private DataSource ds;
}
