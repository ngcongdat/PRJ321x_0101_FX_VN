/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editoAddressr.
 */
package com.bean;

/**
 *
 * @author tiny
 */
public class MailMessage {
 
  // Declare instance
    private String message, subject, toAddress, ccAddress;

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
    
}
