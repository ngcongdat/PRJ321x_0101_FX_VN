/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editoAddressr.
 */
package com.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author tiny
 */
public class MailMessage {

  // Declare instance
  private Pattern pattern;
  private Matcher matcher;

  private String message, subject, toAddress, ccAddress;
  private List<String> errors = new ArrayList<>();

  private final String RULE_OF_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

  // Contructors
  public MailMessage() {

  }

  public MailMessage(String message, String subject, String toAddress, String ccAddress) {
    this.message = message;
    this.subject = subject;
    this.toAddress = toAddress;
    this.ccAddress = ccAddress;
  }

  // Setter - Getter
  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getSubject() {
    return subject;
  }

  public void setSubject(String subject) {
    this.subject = subject;
  }

  public String getToAddress() {
    return toAddress;
  }

  public void setToAddress(String toAddress) {
    this.toAddress = toAddress;
  }

  public String getCcAdress() {
    return ccAddress;
  }

  public void setCcAdress(String toAddress) {
    this.ccAddress = ccAddress;
  }

  public List<String> getErrors() {
    return errors;
  }

  public void setErrors(List<String> errors) {
    this.errors = errors;
  }

  public boolean validate(MailMessage mm) {

    boolean isValid = true;

    pattern = Pattern.compile(RULE_OF_EMAIL);
    matcher = pattern.matcher(toAddress);
    if (!matcher.matches()) {
      isValid = false;
      errors.add("Invalid email!");
    }
    if (subject.trim().equals("") || subject == null) {
      isValid = false;
      errors.add("Subject is required!");
    }
    return isValid;
  }

}
