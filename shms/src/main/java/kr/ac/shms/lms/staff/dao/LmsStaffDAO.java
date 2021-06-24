package kr.ac.shms.lms.staff.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.vo.AcademicRegistrationVO;
import kr.ac.shms.lms.staff.vo.PMyPageVO;
import kr.ac.shms.lms.staff.vo.SMyPageVO;
import kr.ac.shms.lms.student.vo.ConsultingVO;
import kr.ac.shms.lms.student.vo.ScholarShipVO;
import kr.ac.shms.main.commuity.vo.ComCodeVO;
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
	
	/**
	 * 교직원 비밀번호 변경을 위해 필요
	 * @return
	 */
    public List<StaffVO> passwordUpdate();    
    public int passUpdate(UserLoginVO userLogin);
    
    /**
     * 학적변동 신청 테이블 리스트 조회
     * @return
     */
    public List<RegInfoCngVO> selectReginfoCngStudentList(PagingVO<RegInfoCngVO> pagingVO);
    
    /**
     * 학적 변동 공통코드 조회
     * @return
     */
    public List<ComCodeVO> selectReqClCode();
    
    /**
     * 학적변동 신청 글 개수 조회
     * @param pagingVO
     * @return
     */
    public int selectReginfoCngCount(PagingVO<RegInfoCngVO> pagingVO);
    
    /**
     * 기사/산업기사 자격증 장학금 신청 목록조회
     * @return
     */
    public List<ScholarShipVO> selectGisaSchlReqList();
    
    /**
     * 기사/산업기사 자격증 장학금 신청 내역 조회
     * @param req_no
     * @return
     */
    public ScholarShipVO selectGisaSchlReq(int req_no);
    
    /**
     * 장학금 상태 업데이트
     * @param schl
     * @return
     */
    public int updateSchlStatus(ScholarShipVO schl);
    
    /**
     * 학적과 학적 조회
     * @param pagingVO
     * @return
     */
    public List<AcademicRegistrationVO> selectAcademicRegistrationList(PagingVO<AcademicRegistrationVO> pagingVO);
    
    /**
     * 학적과 학적조회 글 개수 조회
     * @param pagingVO
     * @return
     */
    public int selectAcademicRegistrationCount(PagingVO<AcademicRegistrationVO> pagingVO);
    
    /**
     * 학적과 학적 전체조회
     * @return
     */
    public List<AcademicRegistrationVO> selectAcademicRegistrationInfo();
}
