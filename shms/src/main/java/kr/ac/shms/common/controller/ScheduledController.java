package kr.ac.shms.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.ac.shms.lms.student.dao.StudentDAO;

/**
 * @author 박초원
 * @since 2021. 6. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일           수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 8.      박초원        장바구니 자동 수강신청
 * 2021. 6. 20.     최희수		  도서관 열람실 예약 리셋
 * 2021. 6. 24.     박초원		  qr 출석 자동 결석처리	
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Component
public class ScheduledController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduledController.class);

	@Inject
	private StudentDAO studentDAO;
	
//	@Scheduled(cron = "0 */5 * * * *")
//	public void realSugang() {
//		Map<String, Object> pMap = new HashMap<>();
//		studentDAO.updateSugang(pMap);
//		Integer updatecount = (Integer) pMap.get("updatecount");
//		logger.info("스케쥴러가 동작했고, {} 건이 수강신청 되었음.", updatecount);
//	}
//	
//	@Scheduled(cron = "0 * * * * *")
//	public void realUpdate() {
//		Map<String, Object> pMap = new HashMap<>();
//		studentDAO.updateRsvPosblAt(pMap);
//		Integer updatecount = (Integer) pMap.get("updatecount");
//		logger.info("스케쥴러가 동작했고, {} 건이  열람실 리셋 되었음.", updatecount);
//	}
}
