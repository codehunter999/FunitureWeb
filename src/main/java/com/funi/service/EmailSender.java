package com.funi.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;


public class EmailSender {
	 
	 @Autowired
     protected JavaMailSender  mailSender;
	 
     public void SendEmail(Email email) throws Exception {
         
    	 
    	 //JavaMailSenderImpl sender = new JavaMailSenderImpl();
    	 MimeMessage msg = mailSender.createMimeMessage();
		/*
		 * MimeMessageHelper helper = new MimeMessageHelper(msg,true); StringBuilder
		 * strbuilder = new StringBuilder();
		 * strbuilder.append("<html><body><img src='cid:identifier1234'></body></html>"
		 * ); strbuilder.append("check Your email ");
		 */
         try {
			/*
			 * sender.setHost("tb25271@gmail.com");
			 * 
			 * helper.setTo(email.getReceiver()); helper.setText(strbuilder.toString());
			 * FileSystemResource res = new FileSystemResource(new File("D:/logo.png"));
			 * helper.addInline("identifier1234",res); sender.send(msg);
			 */
        	  
			  msg.setSubject(email.getSubject()); msg.setText(email.getContent());
			  msg.setContent("<a href=''>占쏙옙占쏙옙占� 占싱듸옙占싹쇽옙占쏙옙</a>","text/html; charset=utf-8");
			  msg.setRecipients(MimeMessage.RecipientType.TO ,InternetAddress.parse(email.getReceiver()));
			
         }catch(MessagingException e) {
             System.out.println("MessagingException");
             e.printStackTrace();
         }
         try {
             mailSender.send(msg);
         }catch(MailException e) {
             System.out.println("MailException占쌩삼옙");
             e.printStackTrace();
         }
     }

}
