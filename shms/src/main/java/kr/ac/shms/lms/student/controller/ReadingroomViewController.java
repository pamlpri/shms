package kr.ac.shms.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.common.vo.FacilityRsvVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.dao.StudentDAO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;

/**
 * @author 박초원
 * @since 2021. 6. 11.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11.      박초원      	       최초작성
 * 2021. 6. 18.		 최희수	   열람실 예약
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class ReadingroomViewController {
	private static final Logger logger = LoggerFactory.getLogger(ReadingroomViewController.class);
	@Inject
	private StudentService studentService;

	
	@RequestMapping("/readingroom.do")
	public String readingroom(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		StudentVO student = studentService.student(user.getUser_id());
		model.addAttribute("student", student);
		List<FacilityRsvVO> facilityList = studentService.selectFacilityList();
		model.addAttribute("facilityList", facilityList);
		List<FacilityRsvVO> facilityRcvList = studentService.selectFacilityRsvList(user.getUser_id());
		model.addAttribute("facilityRcvList", facilityRcvList);
		
		FacilityRsvVO facilityRsv = studentService.selectFacilityRsv(user.getUser_id());
		if(facilityRsv != null) {
			model.addAttribute("exist", "notNull");	
		} else {
			model.addAttribute("exist", "null");
		}
		
		return "lms/readingroom";
	}	
	
	@RequestMapping(value="/readingroomInsert.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult insertReadingroom(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @ModelAttribute("facilityRsvVO") FacilityRsvVO facilityRsv
		) {
		FacilityRsvVO facility = studentService.selectFacilityRsv(user.getUser_id());
		ServiceResult result = ServiceResult.FAIL;
		if(facility == null) {
			facilityRsv.setStdnt_no(user.getUser_id());
			logger.info("facilityRsv : {}", facilityRsv);
			result = studentService.insertFacilityRsv(facilityRsv);
		}
		if(ServiceResult.OK.equals(result)) {
			result = studentService.updateFacility(facilityRsv.getFacility_no());
			if(ServiceResult.OK.equals(result)) {
				result = ServiceResult.OK;				
			}
		}
		return result;
	}
	
	@RequestMapping(value="/readingRoomAttendance.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult updateReadingroom(
		@ModelAttribute("facilityRsvVO") FacilityRsvVO facilityRsv
	) {
		ServiceResult result = ServiceResult.FAIL;
		FacilityRsvVO facility = studentService.selectFacilityRsv(facilityRsv.getStdnt_no());
		String realBgDt = facility.getReal_bg_dt();
		if(facility != null) {
			if(realBgDt == null || realBgDt.isEmpty()) {
				result = studentService.updateBgdt(facilityRsv.getStdnt_no());
			} else {
				result = studentService.updateEnddt(facilityRsv.getStdnt_no());
			}
		}
		return result;
	}
}
