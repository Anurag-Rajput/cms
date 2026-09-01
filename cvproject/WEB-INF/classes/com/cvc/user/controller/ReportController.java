package com.cvc.user.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cvc.dto.ComplainDto;
import com.cvc.dto.ForwardDto;
import com.cvc.dto.MonthlyCommonDto;
import com.cvc.dto.TransferDto;
import com.cvc.dto.UserDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.ReportServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;

@Controller
public class ReportController {
	
	public static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	ReportServiceImpl reportServiceImpl;
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@RequestMapping(value = "/user/complainPending", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> pendingSectionComplain(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,@RequestParam("section") String section,Model model, HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName();
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		logger.info("pendingSectionComplain method is call");	
		return reportServiceImpl.findAllPendingComplain(loginId,fromDate,toDate,section);
	}
	
	
	@RequestMapping(value = "/user/complainDisposed", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> disposedSectionComplain(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,@RequestParam("section") String section,Model model, HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName();
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		logger.info("pendingSectionComplain method is call");	
		return reportServiceImpl.findAllDisposedComplain(loginId,fromDate,toDate,section);
	}
	
	
	@RequestMapping(value = "/user/monthlyReport", method = RequestMethod.GET)
	public String monthlyReport(Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName();
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO") ) {
			return "monthlyReport";
		}else if (uRoleTpye.contains("ROLE_BO")) {
			return "monthlyReportBo";
		}
		return "monthlyReport";
	}
	
	

	@RequestMapping(value = "/user/ComplainTypeReport", method = RequestMethod.GET)
	public String ComplainTypeReport(Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName();
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return "ComplainTypeReport";
		
	}
	
	
	
	@RequestMapping(value = "/user/InterimIR", method = RequestMethod.GET)
	public String InterimIR(Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName();
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return "InterimIR";
	}
	
	
	@RequestMapping(value = "/user/boReport", method = RequestMethod.GET)
	public String boReport(Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName();
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO") ) {
			return "boDisposalReport";
		}else if (uRoleTpye.contains("ROLE_BO")) {
			return "boDisposalReport";
		}
		return "boDisposalReport";
	}
	
	@RequestMapping(value = "/user/ComplaintDelayReport", method = RequestMethod.GET)
	public String ComplaintDelayReport(Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName();
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return "ComplaintDelayReport";
		
	}

	@RequestMapping(value = "/user/getMonthlyDetails", method = RequestMethod.POST)
	public @ResponseBody List<MonthlyCommonDto> getmonthlyReport(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,@RequestParam("section") String section,Model model, HttpServletRequest request){

		return reportServiceImpl.getMonthlyReoprt(fromDate,toDate,section);
	}
	
	@RequestMapping(value = "/user/getmonthlyReportforCoord", method = RequestMethod.POST)
	public @ResponseBody List<MonthlyCommonDto> getmonthlyReportforCoord(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,Model model, HttpServletRequest request){
		
		return reportServiceImpl.getmonthlyReportforCoord(fromDate,toDate);
	}
	
	@RequestMapping(value = "/user/getComplaintTypeReport", method = RequestMethod.POST)
	public @ResponseBody List<MonthlyCommonDto> getComplaintTypeReport(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,Model model, HttpServletRequest request){
		
		return reportServiceImpl.getComplaintTypeReport(fromDate,toDate);
	}
	@RequestMapping(value = "/user/getInterimIR", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getInterimIRList(@RequestParam("section") String section,Model model, HttpServletRequest request){
		return reportServiceImpl.getInterimIRList(section);
	}
	
	@RequestMapping(value = "/user/getCvoDetail", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getCvoDetail(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,Model model, HttpServletRequest request){
		return reportServiceImpl.getCvoDetail(fromDate,toDate);
	}
	
	@RequestMapping(value = "/user/getCVOActReport", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getCvoActReport(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,Model model, HttpServletRequest request){
		return reportServiceImpl.getCvoActReport(fromDate,toDate);
	}
	
	@RequestMapping(value = "/user/getTotalPendingDetailsbySection", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getTotalPendingDetailsbySection(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,@RequestParam("diaryStatus") String diaryStatus,@RequestParam("section") String section,Model model, HttpServletRequest request){
		return reportServiceImpl.getTotalPendingDetailsbySection(fromDate,toDate,diaryStatus,section);
	}
	
	@RequestMapping(value = "/user/getTotalPendingIRDetailsbySection", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getTotalPendingIRDetailsbySection(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,@RequestParam("index") String index,Model model, HttpServletRequest request){
		return reportServiceImpl.getTotalPendingIRDetailsbySection(fromDate,toDate,index);
	}	
	
	@RequestMapping(value = "/user/getTotalPendingCountIR", method = RequestMethod.POST)
	public @ResponseBody List<MonthlyCommonDto> getTotalPendingCountIR(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,Model model, HttpServletRequest request){
		return reportServiceImpl.getTotalPendingCountIR(fromDate,toDate);
	}
	@RequestMapping(value = "/user/getCvoNaCount", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getCvoNaCount(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,@RequestParam("org") String org,Model model, HttpServletRequest request){
		return reportServiceImpl.getCvoNaCount(fromDate,toDate,org);
	}
	
	@RequestMapping(value = "/user/getCvoNaClosedCount", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getCvoNaClosedCount(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,@RequestParam("org") String org,@RequestParam("decision") String decision,Model model, HttpServletRequest request){
		return reportServiceImpl.getCvoNaClosedCount(fromDate,toDate,org,decision);
	}
	
	@RequestMapping(value = "/user/getCvoLoginCount", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getCvoLoginCount(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,@RequestParam("userId") String userId,Model model, HttpServletRequest request){
		return reportServiceImpl.getCvoLoginCount(fromDate,toDate,userId);
	}
	
	@RequestMapping(value = "/user/getfirstStageReport", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getfirstStage(@RequestParam("advcode") String advcode,@RequestParam("orgCode") String orgCode,Model model, HttpServletRequest request){
		
		return reportServiceImpl.getfirstStage(advcode,orgCode);
	}
	
	@RequestMapping(value = "/user/getsecondStageReport", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getsecondStage(@RequestParam("advcode") String advcode,@RequestParam("orgCode") String orgCode,Model model, HttpServletRequest request){
		
		return reportServiceImpl.getsecondStage(advcode,orgCode);
	}
	
	@RequestMapping(value = "/user/getcomplaintPendingReport", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getcomplaintPending(@RequestParam("orgCode") String orgCode,Model model, HttpServletRequest request){
		
		return reportServiceImpl.getcomplaintPending(orgCode);
	}
	
	@RequestMapping(value = "/user/getfurtherClarificationReport", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getfurtherClarification(@RequestParam("orgCode") String orgCode,Model model, HttpServletRequest request){
		
		return reportServiceImpl.getfurtherClarification(orgCode);
	}
	@RequestMapping(value = "/user/getdepartmentalInquiryReport", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getdepartmentalInquiry(@RequestParam("orgCode") String orgCode,Model model, HttpServletRequest request){
		
		return reportServiceImpl.getdepartmentalInquiry(orgCode);
	}
	
	@RequestMapping(value = "/user/getUserWisecomplaintReport", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getUserWisecomplaintReport(@RequestParam("section") String section,Model model, HttpServletRequest request){
		
		return reportServiceImpl.getUserWisecomplaintReport(section);
	}
	
	@RequestMapping(value = "/user/getTotalPendingAllVig", method = RequestMethod.POST)
	public @ResponseBody List<MonthlyCommonDto> getTotalPendingAllVig(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,Model model, HttpServletRequest request){
		return reportServiceImpl.getTotalPendingAllVig(fromDate,toDate);
	}
	
	@RequestMapping(value = "/user/getForwardSummary", method = RequestMethod.POST)
	public @ResponseBody List<ForwardDto> getForwardSummary(@RequestParam("onDate") String onDate,Model model, HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return  reportServiceImpl.summarySheetForward(loginId,onDate);
	}
	
	@RequestMapping(value = "/user/getReceivedSummary", method = RequestMethod.POST)
	public @ResponseBody List<ForwardDto> getReceivedSummary(@RequestParam("onDate") String onDate,Model model, HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return  reportServiceImpl.summarySheetReceived(loginId, onDate);
	}
	
	@RequestMapping(value = "/user/getClosedSummary", method = RequestMethod.POST)
	public @ResponseBody List<ForwardDto> getClosedSummary(@RequestParam("onDate") String onDate,Model model, HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String name=userLoginAuthenticationDto.getName();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return  reportServiceImpl.summarySheetClosed(name, onDate);
	}
	
	@RequestMapping(value = "/user/getTotalPendingDetailsbyId", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getTotalPendingDetailsbyId(@RequestParam("fromDate") String fromDate,@RequestParam("toDate") String toDate,@RequestParam("index") String index,Model model, HttpServletRequest request){
		return reportServiceImpl.getTotalPendingDetailsbyId(fromDate,toDate,index);
	}
	

	@RequestMapping(value = "/user/EndToEndTracking", method = RequestMethod.GET)
	public String EndToEndTracking(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName();//get logged in username
		//user is valid so create a session
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();

		return "EndToEndTracking";

	}
	
	@RequestMapping(value = "/user/getDetailsEndToEnd", method = RequestMethod.POST)
	public @ResponseBody List<TransferDto> getDetailsByCPACno(@ModelAttribute("complaintnumber")@NotEmpty @Pattern(regexp="^[0-9]{1,45}$") int complaintnumber,
			Model model, HttpServletRequest request) {
	
		return reportServiceImpl.getDetailsEndToEnd(complaintnumber);
	}

}
