/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business;

import com.bean.MailMessage;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.InternetAddress;

/**
 *
 * @author tiny
 */
public class InboxMail {

  private String USERNAME = "examples@gmail.com"; // change accordingly
  private String APPICATION_PASSWORD = "xxxxxxxxxxxxxxxx";  // change accordingly

  public List<MailMessage> getInboxMail() {

    List<MailMessage> listMail = new ArrayList<>();
    try {

      Properties props = new Properties();
      props.put("mail.pop3.host", "pop.gmail.com");
      props.put("mail.pop3.port", "995");
      props.put("mail.pop3.starttls.enable", "true");
      props.put("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      props.put("mail.store.protocol", "pop3");

      // Get the Session Object
      Session session = Session.getDefaultInstance(props,
              new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
          return new PasswordAuthentication(USERNAME, APPICATION_PASSWORD);
        }
      });

      Store store = session.getStore("pop3");
      store.connect("pop.gmail.com", USERNAME, APPICATION_PASSWORD);

      // Create the folder object and open it
      Folder inbox = store.getFolder("INBOX");
      inbox.open(Folder.READ_ONLY);

      Message[] messages = inbox.getMessages();
      for (int i = 0; i < 10; i++) {
        String from = "";
        InternetAddress[] addresses = (InternetAddress[]) messages[i].getFrom();
        for (InternetAddress address : addresses) {
          from += address.getAddress();
        }
        listMail.add(new MailMessage(from, messages[i].getSubject(), messages[i].getSentDate()));
      }
      inbox.close(false);
      store.close();
    } catch (NoSuchProviderException ex) {
      Logger.getLogger(InboxMail.class.getName()).log(Level.SEVERE, null, ex);
    } catch (MessagingException ex) {
      Logger.getLogger(InboxMail.class.getName()).log(Level.SEVERE, null, ex);
    }
    return listMail;
  }
}
