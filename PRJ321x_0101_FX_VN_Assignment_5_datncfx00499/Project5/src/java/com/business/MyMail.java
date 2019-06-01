/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business;

import com.bean.MailMessage;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author tiny
 */
public class MyMail {

  private String USERNAME = "ncd.ccpn@gmail.com";
  private String APPICATION_PASSWORD = "vpgwmvfbtolyrslr";  //vzgkwkrvyrfjisxa

  public MyMail() {

  }

  public Session getMailSession() {
    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.socketFactory.port", "587");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.auth", "true");

    // Get the Session Object
    Session session = Session.getDefaultInstance(props,
            new javax.mail.Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(USERNAME, APPICATION_PASSWORD);
      }
    });
    return session;

  }

  public boolean sendMail(MailMessage mm, Session session) throws Exception {
    // Create a default MimeMessenge object
    Message message = new MimeMessage(session);

    // Set From: header field of the header.
    message.setFrom(new InternetAddress(USERNAME));

    // Set To: header field of the header.
    message.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse(mm.getToAddress()));

    // Set Subject: header field
    message.setSubject(mm.getSubject());

    // Now set the actual message
    message.setText(mm.getMessage());

    // Send message
    Transport.send(message);

    return true;
  }

}
