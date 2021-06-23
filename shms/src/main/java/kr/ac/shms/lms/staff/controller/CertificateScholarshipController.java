package kr.ac.shms.lms.staff.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.service.CommonService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.service.TuitionService;
import kr.ac.shms.lms.student.vo.ScholarShipVO;

/**
 * @author 박초원
 * @since 2021. 6. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 21.   박초원        최초작성
 * 2021. 6. 22.   김보미		목록조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificateScholarshipController {
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private TuitionService tuitionService;
	
	@Inject
	private CommonAttachService commonAttachService;
	
	@RequestMapping("/lms/certificateScholarship.do")
	public String certificateScholarship(
		Model model	
		) {
		List<ScholarShipVO> schlList = lmsStaffService.selectGisaSchlReqList();
		
		model.addAttribute("schlList", schlList);
		return "lms/certificateScholarship";
	}
	
	@RequestMapping("/lms/certificateScholarshipView.do")
	public String certificateScholarshipView(
		@RequestParam(value="req_no", required=false) int req_no	
		, @RequestParam(value="proc_stat", required=false) String process_stat
		, Model model
		) {
		ScholarShipVO schl = lmsStaffService.selectGisaSchlReq(req_no);
		List<AttachVO> attList = tuitionService.selectAttachList(req_no); 
		
		model.addAttribute("schl", schl);
		model.addAttribute("attList", attList);
		model.addAttribute("process_stat", process_stat);
		return "lms/certificateScholarshipView";
	}
	
	@RequestMapping("/lms/certificateScholarshipDetailView.do")
	public String certificateScholarshipDetailView() {
		return "lms/certificateScholarshipDetailView";
	}
	
	@RequestMapping(value="/lms/updateSchlStatus.do", method=RequestMethod.POST)
	public String updateBR(
		@RequestParam("req_no") int req_no
		, @RequestParam("refuse_resn") String refuse_resn
		, @RequestParam("process_stat") String process_stat
		) {
		ScholarShipVO schl = new ScholarShipVO();
		schl.setReq_no(req_no);
		schl.setRefuse_resn(refuse_resn);
		schl.setProcess_stat(process_stat);
		ServiceResult result = lmsStaffService.updateSchlStatus(schl);
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/certificateScholarship.do";
		}
		
		return view;
	}
	
	@RequestMapping(value="/lms/schlDownload.do")
	public String downloader(
		@ModelAttribute("attach") AttachVO attach
		, Model model
	) {
		AttachVO attvo = commonAttachService.download(attach, null);
		model.addAttribute("attvo", attvo);		
		return "downloadView";
	}
}
