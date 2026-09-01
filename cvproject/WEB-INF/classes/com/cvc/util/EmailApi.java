package com.cvc.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class EmailApi {
	 
		@Autowired
		private MailSender mail; // MailSender interface defines a strategy
											// for sending simple mails
	 
		public void readyToSendEmail(String toAddress, String fromAddress, String subject, String msgBody) throws Exception {
	 
			/*SimpleMailMessage msg = new SimpleMailMessage();
			msg.setFrom(fromAddress);
			msg.setTo(toAddress);
			msg.setSubject(subject);
			msg.setText(msgBody);
			mail.send(msg);*/
			
			try
		      {
		    	Properties properties = new Properties();
		    	properties.put("mail.smtp.host", "164.100.14.95");
		         properties.put("mail.smtp.socketFactory.port", "25");
		         properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		         properties.put("mail.smtp.auth", "false");
		         properties.put("mail.smtp.port", "25");
		    	// Session session =Session.getDefaultInstance(properties);
		         final String from=fromAddress;
		    	  Session session = Session.getDefaultInstance(properties,  
		    	            new javax.mail.Authenticator() {
		    	            protected PasswordAuthentication 
		    	            getPasswordAuthentication() {
		    	            return new 
		    	            PasswordAuthentication(from, "K!UAi5r%2h"); ///Sender  Email ID Password
		    	            }});	

		         Message message = new MimeMessage(session);
		         message.setFrom(new InternetAddress(fromAddress));
		         message.setRecipients(Message.RecipientType.TO, 
		            InternetAddress.parse(toAddress));
		         message.setSubject(subject);
		         message.setContent(msgBody,"text/html; charset=utf-8");
		        Transport.send(message);
		      }
		      catch(Exception e){				
						throw new Exception(e);				
				}  
		}
	}

