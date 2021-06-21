package kr.ac.shms.lms.staff.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.dao.OthersDAO;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lecture.controller.AttendanceAdminController;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.main.commuity.vo.ComCodeVO;

/**
 * @author 박초원
 * @since 2021. 6. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 21.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class AcademicChangeController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceAdminController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private OthersDAO othersDAO;
	
	private void addAttribute(Model model) {
		List<Map<String, Object>> collegeList = othersDAO.selectCollegeList();
		List<SubjectVO> subjectList = othersDAO.selectSubjectList(null);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("subjectList", subjectList);
	}
	
	@RequestMapping("/lms/academicChange.do")
	public String academicChange(
		Model model
		) {
		addAttribute(model);
		
		List<ComCodeVO>  comcodeList = lmsStaffService.selectReqClCode();
		List<RegInfoCngVO> cngList = lmsStaffService.selectReginfoCngStudentList();
		
		model.addAttribute("cngList", cngList);
		model.addAttribute("comcodeList", comcodeList);
		return "lms/academicChange";
	}
	
	@RequestMapping("/lms/academicChangeView.do")
	public String academicChangeView() {
		return "lms/academicChangeView";
	}
}
