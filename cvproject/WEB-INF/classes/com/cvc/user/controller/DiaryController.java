package com.cvc.user.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cvc.dto.CitizenDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.Email;
import com.cvc.dto.OrganisationDto;
import com.cvc.dto.ResetPasswordDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.DiaryServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.util.FileUpload;
import com.cvc.util.MyUtill;
import com.cvc.util.RandomUnqieId;
import com.cvc.util.SingletonProperties;

import sun.awt.ModalExclude;

@Controller
public class DiaryController {

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);

	@Autowired
	UserServiceImpl userServiceImpl;

	@Autowired
	DiaryServiceImpl diaryServiceImpl;

	@Autowired
	CommonServiceImpl commonServiceImpl;

	@RequestMapping(value = "/user/dairy/addDairyComplain", method = RequestMethod.GET)
	public String addDairyComplain(Model model, @ModelAttribute("userForm") DairyDetailsDto dairyDetailsDto,
			HttpServletRequest request) {
		
		
		logger.info("addDairyCompalin"+ dairyDetailsDto.getOrganisationCode());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
		return "Final";
	}

	@RequestMapping(value = "/user/updateDiaryDetails", method = RequestMethod.POST)
	public String updateDiaryDetails(Model model, @Valid @ModelAttribute("userForm") DairyDetailsDto dairyDetailsDto,
		
			BindingResult bindingResult, HttpServletRequest request) {
		
		logger.info("updateDiaryDetails page is call");
		logger.info("updateDiaryDetails"+ dairyDetailsDto.getOrganisationCode());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		CsrfToken token = (CsrfToken) request.getAttribute("_csrf");
		UserLoginAuthenticationDto userLoginAuthenticationDto = null;
		Email email = new Email();
		if (userServiceImpl.getUserAuthentication(loginId) != null) {
			userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		} else {
			userLoginAuthenticationDto =userServiceImpl.getCitizenAuthentication(loginId);
		}
		Collection<String> rollTpye = userLoginAuthenticationDto.getListRole();
	/*	if (bindingResult.hasErrors()) {
			if (rollTpye.contains("ROLE_CITIZEN")) {
				System.out.println("Citizen Getting error in validation");
				//logger.debug("validation error",bindingResult.hasErrors());
				model.addAttribute("errMessage",bindingResult.getErrorCount()+" errors.");
				return "citizenHome";
			}else{
			System.out.println("Getting error in validation");
			model.addAttribute("errMessage",bindingResult.getErrorCount()+" errors.");
			model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
			return "Final";
			}
		}*/

		if(token.getToken().equals(dairyDetailsDto.getCsrf())){
			Calendar cal = Calendar.getInstance();
		if (rollTpye.contains("ROLE_CITIZEN")) {
			/*if (FileUpload.fileValidate(dairyDetailsDto.getUploadScanDocument())==false) {
			
				//model.addAttribute("pwdError","Only Pdf is allowed.Make sure file size should be less than 1 MB.");
				return "citizenHome";
			}
			*/
			
			model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
			List<CitizenDto> citizenDtoList = commonServiceImpl.getEmailPhone(loginId);
			String citizenEmail = citizenDtoList.get(0).getCitizenEmail()==null?"":citizenDtoList.get(0).getCitizenEmail();
			String citizenSms=citizenDtoList.get(0).getContactNumber()==null?"":citizenDtoList.get(0).getContactNumber();
			
			System.out.println(commonServiceImpl.getEmailPhone(loginId));
			String dairyid = loginId + "/" + Long.toString(RandomUnqieId.unique());
			HttpSession httpSession1 = request.getSession();
			httpSession1.setAttribute("dairyid", dairyid);
			String roll = userLoginAuthenticationDto.getLoginRoll();
			
			List<OrganisationDto> organisationDto=userServiceImpl.findSection(dairyDetailsDto.getOrganization());
			dairyDetailsDto.setSection(organisationDto.get(0).getOrgSection());
			try {
				if (dairyDetailsDto.getUploadScanDocument() != null
						&& dairyDetailsDto.getUploadScanDocument().getSize() != 0) {
					if (FileUpload.fileValidate(dairyDetailsDto.getUploadScanDocument())) {
						/*String rootPath = request.getSession().getServletContext()
								.getRealPath("/resources/admin/complain-documents");*/
								/*.getRealPath("/CVC/complaint-documents");*/
						
						String rootPath=SingletonProperties.getUploadcitizenProperty().getProperty("fileUploadPathCitizen").trim();
						
						
						File fileUpload = FileUpload.uploadFile(dairyDetailsDto.getUploadScanDocument(), rootPath);
						
						diaryServiceImpl.addDairyDetails(dairyDetailsDto, fileUpload, loginId, roll, request);
					}
				} else {
					diaryServiceImpl.addDairyDetails(dairyDetailsDto, null, loginId, roll, request);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String complainNumber = "";

			List<DairyDetailsDto> list = diaryServiceImpl.getDairy(request);
			for (DairyDetailsDto dairyDetailsDto2 : list) {
				complainNumber = dairyDetailsDto2.getComplaintNumber() + "/"
						+ cal.get(Calendar.YEAR) + "/" + "vigilance-"
						+ dairyDetailsDto2.getSection();
			}
			model.addAttribute("compaincell", list);
			model.addAttribute("complainNumber", complainNumber);
			diaryServiceImpl.updateCNumber(complainNumber, request);
			
			if((!citizenEmail.equalsIgnoreCase("")||citizenEmail != null )&& !complainNumber.isEmpty())
			{			
				email.setSenderEmail("portal-cvc@nic.in");
				email.setRecepientEmail(citizenEmail);
				email.setSubject("Central Vigilance Commission");
				email.setEmailContent("Your complaint dated "+dairyDetailsDto.getComplainDate()+" has been successfully received in CVC. For status/action taken on your complaint no. "+complainNumber+" visit:http://portal.cvc.gov.in/cvproject/");
				try {
					sendMail(email);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if((!citizenSms.equalsIgnoreCase("") || citizenSms != null)&& !complainNumber.isEmpty())
			{
				String mobNo = citizenSms;
				String message="Your complaint dated "+dairyDetailsDto.getComplainDate()+" has been successfully received in CVC. For status/action taken on your complaint no. "+complainNumber+" visit:http://portal.cvc.gov.in/cvproject/";
				try
				{
					sendSMS(mobNo,message);
				}catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			
			return "citizenSuccess";
		}

		else if (rollTpye.contains("ROLE_Diary")) {
			model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
			String dairyid = loginId + "/" + Long.toString(RandomUnqieId.unique());
			HttpSession httpSession1 = request.getSession();
			httpSession1.setAttribute("dairyid", dairyid);
			String roll = userLoginAuthenticationDto.getLoginRoll();
			try {
				if (dairyDetailsDto.getUploadScanDocument() != null
						&& dairyDetailsDto.getUploadScanDocument().getSize() != 0) {
					if (FileUpload.fileValidate(dairyDetailsDto.getUploadScanDocument())) {
						/*String rootPath = request.getSession().getServletContext()
								.getRealPath("/resources/admin/complain-documents");*/
								/*.getRealPath("/CVC/complaint-documents");*/
						
						

						if(dairyDetailsDto.getComplaintType().equalsIgnoreCase("Signed"))
						{
							String rootPath=SingletonProperties.getUploadcomplainProperty().getProperty("fileUploadPathComplain").trim();						
							File fileUpload = FileUpload.uploadFile(dairyDetailsDto.getUploadScanDocument(), rootPath);
							diaryServiceImpl.addDairyDetails(dairyDetailsDto, fileUpload, loginId, roll, request);
						}
						else{
								dairyDetailsDto.setUploadScanDocument(null);
								diaryServiceImpl.addDairyDetails(dairyDetailsDto, null, loginId, roll, request);
							}
					/*	String rootPath=SingletonProperties.getUploadcomplainProperty().getProperty("fileUploadPathComplain").trim();						
						
						
						File fileUpload = FileUpload.uploadFile(dairyDetailsDto.getUploadScanDocument(), rootPath);
						diaryServiceImpl.addDairyDetails(dairyDetailsDto, fileUpload, loginId, roll, request);*/
					}else{
						model.addAttribute("errMessage","Only Pdf is allowed or pdf is not a valid file.");
						return "Final";
					}

				} else {
					diaryServiceImpl.addDairyDetails(dairyDetailsDto, null, loginId, roll, request);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String complainNumber = "";
			List<DairyDetailsDto> list = diaryServiceImpl.getDairy(request);
			for (DairyDetailsDto dairyDetailsDto2 : list) {
				complainNumber = dairyDetailsDto2.getComplaintNumber() + "/"
						+ cal.get(Calendar.YEAR) + "/" + "vigilance-"
						+ dairyDetailsDto2.getSection();
			}
			if (dairyDetailsDto.getMoreOraganization() != null
					&& dairyDetailsDto.getMoreDesiganation() != null) {
				diaryServiceImpl.addMoreOrganization(dairyDetailsDto,complainNumber);
			}
			diaryServiceImpl.updateCNumber(complainNumber, request);
			model.addAttribute("compaincell", list);
			model.addAttribute("complainNumber", complainNumber);
			if((dairyDetailsDto.getEmail()!=null || !dairyDetailsDto.getEmail().equalsIgnoreCase(""))&& !complainNumber.isEmpty())
			{			
				email.setSenderEmail("portal-cvc@nic.in");
				email.setRecepientEmail(dairyDetailsDto.getEmail());
				//email.setRecepientEmail("trilokbasista@gmail.com");
				email.setSubject("Central Vigilance Commission");
				email.setEmailContent("Your complaint dated "+dairyDetailsDto.getComplainDate()+" has been successfully received in CVC. For status/action taken on your complaint no. "+complainNumber+" visit:http://portal.cvc.gov.in/cvproject/");
				try {
					sendMail(email);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if((dairyDetailsDto.getMobileNo()!=null || !dairyDetailsDto.getMobileNo().equalsIgnoreCase(""))&& !complainNumber.isEmpty())
			{
				String mobNo = dairyDetailsDto.getMobileNo();
				//String mobNo = "917838999848";
				String message="Your complaint dated "+dairyDetailsDto.getComplainDate()+" has been successfully received in CVC. For status/action taken on your complaint no. "+complainNumber+" visit:http://portal.cvc.gov.in/cvproject/";
				try
				{
					sendSMS(mobNo,message);
				}catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			
		}
		}
		
		return "updateDiaryDetails";
	}
	
	@RequestMapping(value = "/user/dairy/resetPassword", method = RequestMethod.GET)
	public String resetPassword(@ModelAttribute("pwdFrom")ResetPasswordDto resetPasswordDto,HttpServletRequest request) {
		logger.info("resetPassword method is called is called");
		return "dairyChangePassword";
	}
	
	
	
	
	@RequestMapping(value = "/user/dairy/changedPassword", method = RequestMethod.POST)
	public String updatePassword(@ModelAttribute("pwdFrom") @Valid ResetPasswordDto resetPasswordDto,
			BindingResult result,
			HttpServletRequest request,Model model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
	     HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 Integer pwdFlag = 0;
		 if(result.hasErrors()){
			 logger.info("Validation Error in Password Changed.");
			 return "dairyChangePassword";
		 }
		 else{
			 pwdFlag =  commonServiceImpl.insertNewPassword(resetPasswordDto,loginId);
		}
		 
		 if (pwdFlag== 1) {
			 return "dairyPwdSuccess";
		}
		 else if(pwdFlag==0){
			 model.addAttribute("pwdError","Look like your last password was same.");
			 return "dairyChangePassword";
		 }
		 
		return "dairyChangePassword";
	}
	
	public void sendMail(Email mail) throws Exception{	     
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
	         message.setContent(mail.getEmailContent(),"text/html; charset=utf-8");
	        Transport.send(message);
	      }
	      catch(Exception e){				
					throw new Exception(e);				
			}  
	}
	

public void sendSMS(String mobNo, String smsMsg)
	{
		try{
			logger.info("SMS function Calling.");	
		String sms =URLEncoder.encode(smsMsg, "UTF-8" );
		int size = smsMsg.length();
		 String urlString = null;
		 String userName = URLEncoder.encode("cvcportal.sms", "UTF-8" );
		 String pin="Ty%40%23123Qaw";
		 String mobNumber=URLEncoder.encode(mobNo, "UTF-8" );
		 String sign = URLEncoder.encode("CVCCMS", "UTF-8" );
         if(size<160){
     
        	 urlString = " https://smsgw.sms.gov.in/failsafe/HttpLink?username="+userName+"&pin="+pin+"&message="+sms+"&mnumber="+mobNumber+"&signature="+sign;
			//urlString = "https://164.100.14.211:443/failsafe/HttpLink?username="+userName+"&pin="+pin+"&message="+sms+"&mnumber="+mobNumber+"&signature="+sign;
        // System.out.println("abc-------2");
         }else{
         //	System.out.println("abc-------3");
			
			urlString = " https://smsgw.sms.gov.in/failsafe/HttpLink?username="+userName+"&pin="+pin+"&message="+sms+"&mnumber="+mobNumber+"&signature="+sign+"&concat=1";
			//urlString = "https://164.100.14.211:443/failsafe/HttpLink?username="+userName+"&pin="+pin+"&message="+sms+"&mnumber="+mobNumber+"&signature="+sign+"&concat=1";
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
    	
    	System.out.println(xmlBuf);}
    	return new String(xmlBuf);
    }
	
}
