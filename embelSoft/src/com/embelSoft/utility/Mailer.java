package com.embelSoft.utility;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer {

	
	public static void sendFile(String to,File f) {

		/*
		 * final String user = "sales@embel.co.in";// change accordingly final String
		 * pass = "Embel@sales1";
		 * 
		 * // 1st step) Get the session object Properties props = new Properties();
		 * props.setProperty("mail.transport.protocol", "smtp");
		 * props.setProperty("mail.smtp.host", "host11.dnsfornet.com");
		 * props.put("mail.smtp.auth", "true"); props.put("mail.smtp.port", "25");
		 * props.put("mail.smtp.socketFactory.port", "25");
		 * props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		 * props.put("mail.smtp.starttls.enable","true"); props.put("mail.smtp.debug",
		 * "true"); props.put("mail.smtp.socketFactory.fallback", "false");
		 * props.setProperty("mail.smtp.quitwait", "false");
		 */
		
		
		final String user = "embelbackup@gmail.com";// change accordingly
		final String pass = "xkravkydzqaxguex";

		// 1st step) Get the session object
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
	
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");
		
		
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user, pass);
					}
				});
		// 2nd step)compose message
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("embel_soft database backup By Embel Technologies Pvt Ltd");
			message.setText("DATABASE BACKUP OF Embel Technologies");

			String filename = "E:/dumpbackup/embel_soft.sql";//change accordingly  
			DataSource source = new FileDataSource(filename);  
			message.setDataHandler(new DataHandler(source));
			message.setFileName(filename);
			
			 /* Multipart multipart = new MimeMultipart();  
			   multipart.addBodyPart(message); */ 
			
			// 3rd step)send message
			 Transport.send(message);

			System.out.println("mail sent Done......");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}
	
}
