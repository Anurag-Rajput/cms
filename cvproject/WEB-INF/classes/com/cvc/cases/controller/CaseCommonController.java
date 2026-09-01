package com.cvc.cases.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CaseCommonController {

	private static final Logger logger = LoggerFactory.getLogger(CaseCommonController.class);
	
	@RequestMapping(value = "/cdiIndex", method = RequestMethod.GET)
	public String cdiGetIndex(Model model) {
		logger.info("cdiIndex page is called");
		return "cdiIndex";
	}

}
