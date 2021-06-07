package kr.ac.shms.lms.staff.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.staff.vo.PMyPageVO;
import kr.ac.shms.lms.staff.vo.SMyPageVO;
import kr.ac.shms.lms.student.vo.ConsultingVO;
@Repository
public interface LmsStaffDAO {
	/**
	 * 해당 학적과 직원 정보 추출
	 * @param id
	 * @return 데이터가 없을 경우 null로 반환
	 */
	public StaffVO staff(String id);
	/**
	 * 해당 교수에게 신청된 대기 상담 건수 조회
	 * @param id 교수 번호
	 * @return 대기 중인 상담 신청 건수 
	 */
	public int selectConsltCnt(String id);
	
	/**
	 * 학과명 호출
	 * @param staff_no
	 * @return 데이터가 없을 경우 null로 반환
	 */
	public SubjectVO subject(String staff_no);
	
	/**
	 * 교수 마이페이지 출력
	 * @param staff_no
	 * @return 데이터가 없으면 null로 반환
	 */
	public PMyPageVO pmyPage(String staff_no);
	
	/**
	 * 마이페이지에서 웹메일 신청(등록)
	 * @param staff_no
	 * @return cnt > 0 성공
	 */
	public int webMailUpdate(String staff_no);
	
	/**
	 * 마이페이지 정보 수정
	 * @param StaffVO
	 * @return cnt > 0 성공
	 */
	public int mypageUpdate(StaffVO staffVO);
	
	/**
	 * 행정실 교직원 마이페이지 정보 호출
	 * @param user_no
	 * @return 데이터가 없으면 null 반환
	 */
	public SMyPageVO staffMyPage(String user_no);
	
	/**
	 * 학생 상담 내역(교수)
	 * @param staff_no
	 * @return 데이터가 없으면 null 반환
	 */
	public List<ConsultingVO> consultingList(String staff_no); 
	
	/**
	 * 상담 신청이 승인 되었을 경우
	 * @param req_no
	 * @return cnt > 0 성공
	 */
	public int consultingApproval(int req_no);
	
	/**
	 * 상담 신청이 반려 되었을 경우
	 * @param consultingVO
	 * @return cnt > 0 성공
	 */
	public int consultingCompanion(ConsultingVO consultingVO);
	
}
