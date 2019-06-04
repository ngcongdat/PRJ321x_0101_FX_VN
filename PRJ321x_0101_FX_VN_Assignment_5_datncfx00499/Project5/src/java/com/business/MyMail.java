/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.business;

import com.bean.MailMessage;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author tiny
 */
public class MyMail {

  private String USERNAME = "examples@gmail.com"; // change accordingly
  private String APPICATION_PASSWORD = "xxxxxxxxxxxxxxxx";  // change accordingly

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

    // Set To and CC: header field of the header.
    message.addRecipient(Message.RecipientType.TO, new InternetAddress(mm.getToAddress()));
    if (!mm.getCcAddress().trim().equals("") && (mm.getCcAddress() != null)) {
      message.addRecipient(Message.RecipientType.CC, new InternetAddress(mm.getCcAddress()));
    }

    // Set Subject: header field
    message.setSubject(mm.getSubject());

    // Creates message part
    MimeBodyPart messageBodyPart = new MimeBodyPart();
    messageBodyPart.setContent(mm.getMessage(), "text/html");

    // Creates multi-part
    Multipart multipart = new MimeMultipart();
    multipart.addBodyPart(messageBodyPart);

    // Set the multi-part as e-mail's content
    message.setContent(multipart);

    // Send message
    Transport.send(message);

    return true;
  }

}
