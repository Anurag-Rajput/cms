package com.cvc.user.controller;

import java.io.File;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Collection;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cvc.dto.AccessControlDto;
import com.cvc.dto.ComplainDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.NotingDto;
import com.cvc.dto.ResetPasswordDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.dto.VigClearanceDto;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.user.service.impl.VigCleranceServiceImpl;
import com.cvc.util.FileUpload;
import com.cvc.util.RandomUnqieId;
import com.cvc.util.SingletonProperties;

@Controller
public class VigillanceClearanceController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	VigCleranceServiceImpl vigCleranceServiceImpl;

	@Autowired
	CommonServiceImpl commonServiceImpl;

	@Autowired
	UserServiceImpl userServiceImpl;

	String fileNo;

	@RequestMapping(value = "/user/clr/vigClearance", method = RequestMethod.GET)
	public String vigClearance(Model model, HttpServletRequest request) throws SQLException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		model.addAttribute("allDiary", commonServiceImpl.findAllDiaryForBo(uSection, loginId));
		logger.info("Welcome vigClearance! The client locale is {}.");
		return "clearanceMenu";
	}

	@RequestMapping(value = "/user/clr/searchClearance", method = RequestMethod.GET)
	public String searchClearance(@ModelAttribute("vigform") VigClearanceDto vigClearanceDto, Model model) {
		logger.info("addClearance method is called.");
		return "searchClearance";
	}

	@RequestMapping(value = "/user/clr/addClearance", method = RequestMethod.GET)
	public String addClearance(@ModelAttribute("vigform") VigClearanceDto vigClearanceDto, Model model) {
		logger.info("addClearance method is called.");
		model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
		return "addClearance";
	}

	@RequestMapping(value = "/user/clr/pwdChanged", method = RequestMethod.GET)
	public String clrPwdChanged(@ModelAttribute("pwdFrom") ResetPasswordDto resetPasswordDto, Model model) {
		logger.info("clrPwdChanged method is called.");
		return "vigPwdChanged";
	}

	@RequestMapping(value = "/user/getDetailsByFileNo", method = RequestMethod.POST)
	public @ResponseBody List<VigClearanceDto> getDetailsByFileNo(@RequestParam("fileNo") String fileNo,
			HttpServletRequest request) {
		logger.info("getDetailsByFileNo method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		return commonServiceImpl.findDetailsByFileNoForClearance(fileNo);
	}

	@RequestMapping(value = "/user/updateAddClearanceDetails", method = RequestMethod.GET)
	public String getupdateaddclearance(Model model, VigClearanceDto vigClearanceDto, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		String fileNo11 = complaintnumber.toString();

		model.addAttribute("updateFileNoValue", commonServiceImpl.viewClearance(fileNo11));
		model.addAttribute("updateOfficerFileNoValue", commonServiceImpl.viewClearanceOfficerDetail(fileNo11));
		model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
		logger.info("updateAddClearance page is call");
		return "updateAddClearance";
	}

	@RequestMapping(value = "/user/clr/changedPassword", method = RequestMethod.POST)
	public String updateVigilancePassword(@ModelAttribute("pwdFrom") @Valid ResetPasswordDto resetPasswordDto,
			BindingResult result, HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		Integer pwdFlag = 0;
		if (result.hasErrors()) {
			logger.info("Validation Error in Password Changed.");
			return "vigPwdChanged";
		} else {
			pwdFlag = commonServiceImpl.insertNewPassword(resetPasswordDto, loginId);
		}
		if (pwdFlag == 1) {
			return "vigClearPwdSuccess";
		} else if (pwdFlag == 0) {
			model.addAttribute("pwdError", "Look like your last password was same.");
			return "vigPwdChanged";
		}
		return "vigPwdChanged";
	}

	@RequestMapping(value = "/user/clr/insertClerance", method = RequestMethod.POST)
	public String insertClearance(Model model, @Valid @ModelAttribute("vigform") VigClearanceDto vigClearanceDto,
			BindingResult result, HttpServletRequest request) {
		if (result.hasErrors()) {
			return "addClearance";
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);

		UserLoginAuthenticationDto userLoginAuthenticationDto = null;
		if (userServiceImpl.getUserAuthentication(loginId) != null) {
			userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		} else {
			userLoginAuthenticationDto = userServiceImpl.getCitizenAuthentication(loginId);
		}

		CsrfToken token = (CsrfToken) request.getAttribute("_csrf");
		if (token.getToken().equals(vigClearanceDto.getCsrf())) {

			String clearanceid = loginId + "/" + Long.toString(RandomUnqieId.unique());
			HttpSession httpSession1 = request.getSession();
			httpSession1.setAttribute("clearanceid", clearanceid);
			String roll = userLoginAuthenticationDto.getLoginRoll();
			String uDesiganation = userLoginAuthenticationDto.getDesiganation();
			String fileno = vigClearanceDto.getFileNo();

			try {
				if (vigClearanceDto.getUploadScanDocument() != null
						&& vigClearanceDto.getUploadScanDocument().getSize() != 0) {
					if (FileUpload.fileValidate(vigClearanceDto.getUploadScanDocument())) {
						/*String rootPath = request.getSession().getServletContext()
								.getRealPath("/CVC/clearance-documents");*/
						
						String rootPath=SingletonProperties.getUploadclearanceProperty().getProperty("fileUploadPath").trim();
						File fileUpload = FileUpload.uploadFile(vigClearanceDto.getUploadScanDocument(), rootPath);
						commonServiceImpl.addClearance(vigClearanceDto, fileUpload, loginId, roll, request);
						commonServiceImpl.addVijClearanceOfficerDetail(vigClearanceDto, fileno, loginId, uDesiganation);
					} else {
						model.addAttribute("errMessage", "Only Pdf is allowed or pdf is not a valid file.");
						return "addClearance";
					}

				} else {
					commonServiceImpl.addClearance(vigClearanceDto, null, loginId, roll, request);
					commonServiceImpl.addVijClearanceOfficerDetail(vigClearanceDto, fileno, loginId, uDesiganation);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "doneVijClear";
		}
		return "addClearance";
	}

	@RequestMapping(value = "/user/updateClearanceDetails", method = RequestMethod.POST)
	public String insertUpdatedClearance(@ModelAttribute("userForm") @Valid VigClearanceDto vigClearanceDto,
			BindingResult bindingResult,  HttpServletRequest request, Model model)
					throws ParseException {
		if (bindingResult.hasErrors()) {
			logger.info("validation error in updateAddClearance.");
			/*
			 * attr.addFlashAttribute(
			 * "org.springframework.validation.BindingResult.dairyDetailsDto",
			 * bindingResult); attr.addFlashAttribute("userForm",
			 * dairyDetailsDto);
			 */
			model.addAttribute("errMessage", bindingResult.getErrorCount() + " errors.");
			return "redirect:/user/updateAddClearanceDetails";
		} else {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String loginId = auth.getName(); // get logged in loginId
												// HttpSession
			HttpSession httpSession = request.getSession();
			AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
			Integer complaintnumber = accessControlDto.getComplainNumber();
			UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
			String uDesiganation = userLoginAuthenticationDto.getDesiganation();
			String fileNo11 = complaintnumber.toString();
			
			userServiceImpl.updateClearance(vigClearanceDto, fileNo11, loginId);
			
			logger.info("updateAddClearance page is call");
		}

		return "redirect:/user/clr/searchClearance";
	}
	
	
	
	
	
	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

}
