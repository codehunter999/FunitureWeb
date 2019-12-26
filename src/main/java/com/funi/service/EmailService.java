package com.funi.service;


import java.io.File;

import javax.inject.Inject;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.funi.dao.MemberDAO;
import com.funi.domain.MemberDTO;
import com.funi.util.MailHandler;
import com.funi.util.TempKey;


@Service
public class EmailService implements EmailImpl{
	
	@Inject
	private JavaMailSender mailSender;
	@Inject
	private MemberDAO memberdao;
	@Override
	public void regist(MemberDTO memberdto) throws Exception {
		System.out.println("service register ");
		String key = new TempKey().getKey(50,false);
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("KAARE KLINT Auth Email");
		sendMail.setText(
					new StringBuffer().append("<html>")
									  .append("<body>")
									  .append("<br/><br/><img src=\"cid:mailKlogo.jpg\" style=\"width: 800px;height: 500px\" ><br/>")								  					                 
									  .append("<h2><a href=\"http://192.168.16.12:8080/furnitureweb/emailConfirm.fu?email="+memberdto.getEmail()+"\">Check Email Link</a></h2>")
					                  .append("</body></html>").toString());
		
		sendMail.setFrom("tb25271@gmail.com","service center");
		FileSystemResource imagefile = new FileSystemResource(new File("D:/email/klogo.jpg"));

		sendMail.addInline("mailKlogo.jpg",imagefile);
	
		sendMail.setTo(memberdto.getEmail());
		sendMail.send();				
	}
	@Override
	public MemberDTO userAuth(MemberDTO memberdto) throws Exception {
		MemberDTO userdto = new MemberDTO();
		userdto = memberdao.chkAuth(userdto);
		if(userdto != null) {
			try {
			memberdao.userAuth(memberdto);
			memberdao.chkAuth(userdto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return userdto;
	}
	@Override
	public void searchPwdMail(MemberDTO memberdto) throws Exception {

		String key = new TempKey().getKey(50,false);
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("KAARE KLINT Auth Email");
		sendMail.setText(
					new StringBuffer().append("<html>")
									  .append("<body>")
									  .append("<br/><br/><img src=\"cid:mailKlogo.jpg\" style=\"width: 800px;height: 500px\" ><br/>")								  					                 
									  .append("<h2><a href=\"http://192.168.16.12:8080/furnitureweb/changPwd.fu?email="+memberdto.getEmail()+"\">Check Email Link</a></h2>")
					                  .append("</body></html>").toString());
		
		sendMail.setFrom("tb25271@gmail.com","service center");
		FileSystemResource imagefile = new FileSystemResource(new File("D:/email/klogo.jpg"));
		sendMail.addInline("mailKlogo.jpg",imagefile);
		sendMail.setTo(memberdto.getEmail());
		sendMail.send();
		
	}  
}
