package com.cvc.user.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ContentHandler;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.apache.tika.detect.DefaultDetector;
import org.apache.tika.detect.Detector;
import org.apache.tika.io.TikaInputStream;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tika.sax.BodyContentHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.Email;
import com.cvc.dto.EmailSmsUserDto;
import com.cvc.user.service.impl.CitizenServiceImpl;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;

@Controller
public class EmailSMSController {
	@Autowired
	CommonServiceImpl commonServiceImpl;
	
	@Autowired
	CitizenServiceImpl citizenServiceImpl;
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@RequestMapping(value = "/admin/getRecepientList", method = RequestMethod.POST)
	public @ResponseBody List<EmailSmsUserDto> getRecepientList(HttpServletRequest request,@RequestParam("roleType") String roleType){
		ModelAndView model= new ModelAndView();
		List<EmailSmsUserDto> emailSmsUserDtoList =commonServiceImpl.getEmailSmsReceipientList(roleType);		
		return emailSmsUserDtoList;
	}
	
	@RequestMapping(value = "/admin/viewEmailSMS", method = RequestMethod.POST)
	public ModelAndView viewEmailSMS(HttpServletRequest request,DairyDetailsDto dairyDetailsDto){
		ModelAndView model= new ModelAndView();
		model.addObject("roleTypeList",commonServiceImpl.getRoleTypeList());
		model.setViewName("EmailSMSUI");
		return model;
	}
	
	@RequestMapping(value = "/admin/sendEmailSMS", method = RequestMethod.POST)
	public ModelAndView sendEmailSMS(HttpServletRequest request,@RequestParam("communicationType") String communicationType,@RequestParam("contactData") String contactData,@RequestParam("messageContent") String messageContent,@RequestParam("emailFile") MultipartFile[] fileArr,@RequestParam("subject") String subject  ) throws Exception{
		ModelAndView model= new ModelAndView();
		String contactArray[]= contactData.split(",");
		if(communicationType.equalsIgnoreCase("Email"))
		{
			Multipart multipart = new MimeMultipart();
			boolean isError= false;
			  for (MultipartFile fileObj :fileArr) {
				   if(!checkAttachment(fileObj))
             	 {
					   model.addObject("msg","Mail sending failed! Please check attachement size or file type");
					   isError=true;
             	 }
			         if (fileArr != null && fileArr.length > 0) {
			                 MimeBodyPart attachPart = new MimeBodyPart();
			  
			                 try {
			                	/* if(!checkAttachment(fileObj))
			                	 {
			                		 return false;
			                	 }*/
			                	 if(!fileObj.isEmpty())
			                	 {
			                		 attachPart.attachFile(multipartToFile(fileObj));
			                	 }
			                 } catch (IOException ex) {
			                     ex.printStackTrace();
			                 }
			                 if(!fileObj.isEmpty())
			                 {
			                	 multipart.addBodyPart(attachPart);
			                 }
			         	}
			  }
			  MimeBodyPart messageBodyPart = new MimeBodyPart();
			  messageBodyPart.setContent(messageContent, "text/html; charset=utf-8");
			  multipart.addBodyPart(messageBodyPart);
			  if(!isError)
			  {
				for(String emailId : contactArray)
				{
					Email email = new Email();
					email.setRecepientEmail(emailId.trim().replace(",", ""));
					email.setSubject(subject);
					email.setSenderEmail("portal-cvc@nic.in");
					email.setEmailContent(messageContent);
					email.setFile(fileArr);
					if(!email.getRecepientEmail().equals(""))
					{
						if(!sendMail(email,multipart))
						{					
							model.addObject("msg","Mail sending failed! Please check attachement size or file type");
						}
					}
				}
			  }
		}
		if(communicationType.equalsIgnoreCase("SMS"))
		{
			for(String mobileNo : contactArray)
			{
				System.out.println(mobileNo);
				sendSMS(mobileNo.trim().replace(",", ""),messageContent);
			}
		}
		model.addObject("roleTypeList",commonServiceImpl.getRoleTypeList());
		model.setViewName("EmailSMSUI");
		return model;
	}
	public boolean sendMail(Email mail, Multipart multipart ) throws Exception{	     
	      try
	      {
	    	Properties properties = new Properties();
	    	properties.put("mail.smtp.host", "164.100.14.95");
	         properties.put("mail.smtp.socketFactory.port", "25");
	         properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	         properties.put("mail.smtp.auth", "false");
	         properties.put("mail.smtp.port", "25");
	    	// Session session =Session.getDefaultInstance(properties);
	         final String from=mail.getSenderEmail();
	    	  Session session = Session.getDefaultInstance(properties,  
	    	            new javax.mail.Authenticator() {
	    	            protected PasswordAuthentication 
	    	            getPasswordAuthentication() {
	    	            return new 
	    	            PasswordAuthentication(from, "K!UAi5r%2h"); ///Sender  Email ID Password
	    	            }});

	         Message message = new MimeMessage(session);
	         message.setFrom(new InternetAddress(mail.getSenderEmail()));
	         message.setRecipients(Message.RecipientType.TO, 
	         InternetAddress.parse(mail.getRecepientEmail()));
	         message.setSubject(mail.getSubject());
	         /*MimeBodyPart messageBodyPart = new MimeBodyPart();
	         messageBodyPart.setContent(mail.getEmailContent(), "text/html; charset=utf-8");
	        if(multipart.getCount()>0)
	        {	        
	         multipart.removeBodyPart(0);
	        }
	         multipart.addBodyPart(messageBodyPart);*/
	         /*Multipart multipart = new MimeMultipart();
	         if (mail.getFile() != null && mail.getFile().length > 0) {
	             for (MultipartFile fileObj : mail.getFile()) {
	                 MimeBodyPart attachPart = new MimeBodyPart();
	  
	                 try {
	                	 if(!checkAttachment(fileObj))
	                	 {
	                		 return false;
	                	 }
	                	 if(!fileObj.isEmpty())
	                	 {
	                		 attachPart.attachFile(multipartToFile(fileObj));
	                	 }
	                 } catch (IOException ex) {
	                     ex.printStackTrace();
	                     return false;
	                 }
	                 if(!fileObj.isEmpty())
	                 {
	                	 multipart.addBodyPart(attachPart);
	                 }
	             }
	         }*/
	         if(multipart!=null && multipart.getCount()>0)
	         {
	         message.setContent(multipart);
	         }
	         Transport.send(message);
	         System.out.println("Email Sent for ID-"+mail.getRecepientEmail());
	      }
	      catch(Exception e){	

				System.out.println("Email sending failed for ID-"+mail.getRecepientEmail());
				System.out.println(e);
					return false;
			}  
	      return true;
	}
	

public void sendSMS(String mobNo, String smsMsg)
	{
		try{
		smsMsg = smsMsg.replaceAll("\\<.*?\\>", "");	
		String sms =URLEncoder.encode(smsMsg, "UTF-8" );
		int size = smsMsg.length();
		 String urlString = null;
		 String userName = URLEncoder.encode("cvcportal.sms", "UTF-8" );
		 String pin="Ty%40%23123Qaw";
		 String mobNumber=URLEncoder.encode(mobNo, "UTF-8" );
		 String sign = URLEncoder.encode("CVCCMS", "UTF-8" );
       if(size<160){
   
      	 urlString = " https://smsgw.sms.gov.in/failsafe/HttpLink?username="+userName+"&pin="+pin+"&message="+sms+"&mnumber="+mobNumber+"&signature="+sign;
       }else{
			urlString = " https://smsgw.sms.gov.in/failsafe/HttpLink?username="+userName+"&pin="+pin+"&message="+sms+"&mnumber="+mobNumber+"&signature="+sign+"&concat=1";
       }
       makeHTTPConnection(urlString,60000);
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	private static String makeHTTPConnection(String spec1, int connectTimeOut) 
  {
  	long t = System.currentTimeMillis();
  	StringBuffer xmlBuf = new StringBuffer();
  	//String urlString ="http://google.co.in";
  	try 
  	{
  	URL url = new URL(spec1);
  	/*URL url = new URL(urlString);*/
  	/*URLConnection con = url.openConnection();
  	con.connect();*/
  	HttpURLConnection conn = (HttpURLConnection)url.openConnection();

  	if(conn!= null){
  	}else{
  	}
  	conn.setConnectTimeout(connectTimeOut);
  	conn.setReadTimeout(connectTimeOut);
  	BufferedReader in= new BufferedReader(new InputStreamReader(conn.getInputStream()));
     	String str;
      	while((str = in.readLine()) != null) {
      		xmlBuf.append(str);
      }
      	in.close();
  	}catch(Exception e){
  		System.out.println(e);
  	
  }
  	return new String(xmlBuf);
  }
	
	public boolean checkAttachment(MultipartFile file)
	{
		if(file.isEmpty())
		{
			return true;
		}
		String mimeType = file.getContentType();
		int contentType =file.getOriginalFilename().toString().lastIndexOf('.');
		String fileExtn = file.getOriginalFilename().toString().substring(contentType,file.getOriginalFilename().toString().length());
		TikaInputStream tikaIS = null;
		try {
			try {
				tikaIS = TikaInputStream.get(file.getInputStream());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			final Metadata metadata = new Metadata();
			final Detector detector = new DefaultDetector();
			try {
				mimeType = detector.detect(tikaIS, metadata).toString();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} finally {
			if (tikaIS != null) {
				try {
					tikaIS.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		long fileSize = file.getSize();
		int counter1 = 0;
		for (int i = 0; i < file.getOriginalFilename().length() - 1; i++) {
			if (file.getOriginalFilename().toString().charAt(i) == '.') {
				counter1++;
			}
		}
		if (counter1 == 1 && (fileExtn.equalsIgnoreCase(".pdf")|| fileExtn.equalsIgnoreCase(".jpg"))) {	
			if (fileSize <= 15000 * 1000	&& mimeType != null	&& ( mimeType.equalsIgnoreCase("application/pdf")
					|| mimeType.equalsIgnoreCase("attachment/pdf")
					|| mimeType.equalsIgnoreCase("application/x-pdf") || mimeType.equalsIgnoreCase("image/jpeg"))){
				
				
			} else {
				return false;

			}
		}else {
			return false;

		}
		return true;
	}
	
	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException 
	{
	    File convFile = new File( multipart.getOriginalFilename());
	    multipart.transferTo(convFile);
	    return convFile;
	}
	
	
	
}
