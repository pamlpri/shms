<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* 2021. 5. 24.      박초원        메뉴통합
* 2021. 5. 26.		최희수	메뉴 권한에 따라 보여주기
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="sidebar" class="active">
  <div class="sidebar-wrapper active">
      <div class="sidebar-header">
          <div class="d-flex justify-content-between">
              <div class="logo">
              	  <!-- 로그인한 사람에 따라 주소가 달라져야함!! -->
                  <a href="admin.html"><img src="${cPath }/resources/lms/vendors/images/logo_black.png" alt="Logo" srcset=""></a>
              </div>
              <div class="toggler">
                  <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
              </div>
          </div>
      </div>
      <div class="sidebar-menu">
          <ul class="menu">
              <li class="sidebar-title">Menu</li>
              <!-- 권한 : 학생, 교수, 모든 관리자 -->
	            <li class="sidebar-item  has-sub">
	                <a href="#" class="sidebar-link">
	                    <i class="bi bi-envelope-fill"></i>
	                    <span>웹메일</span>
	                </a>
	                <ul class="submenu">
	                    <li class="submenu-item ">
	                        <a href="${cPath }/lms/composeForm.do">메일보내기</a>
	                    </li>
	                    <li class="submenu-item ">
	                        <a href="${cPath }/lms/inbox.do">받은메일</a>
	                    </li>
	                    <li class="submenu-item ">
	                        <a href="${cPath }/lms/send.do">보낸메일</a>
	                    </li>
	                </ul>
	            </li>
              <!-- 권한 : 학생 -->
              <c:if test="${'ST' eq user.user[1] }">
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-person-badge-fill"></i>
	                      <span>마이페이지</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="${cPath }/lms/myPage.do">내정보보기</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="${cPath }/lms/consultingList.do">담당교수상담</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-book-fill"></i>
	                      <span>강의관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="${cPath }/lms/lectureList.do">수강중인 강의</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="${cPath }/lms/completeLecList.do">수강완료</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-alarm-fill"></i>
	                      <span>수강신청</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="${cPath }/lms/classRegistrationInfo.do">수강신청</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="${cPath }/lms/classCartInfo.do">장바구니</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">내시간표</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-file-earmark-check-fill"></i>
	                      <span>성적관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">성적조회</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">강의평가</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-wallet-fill"></i>
	                      <span>등록금관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">등록금 조회</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">등록금 고지서</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">등록금 영수증</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">등록금 환불</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-award-fill"></i>
	                      <span>장학금관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">장학금 조회</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">교내 장학금 신청</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-pen-fill"></i>
	                      <span>변동사항</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">휴·복학 신청</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">학사학위취득유예 신청</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">조기졸업 신청</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">자퇴 신청</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">전과이력</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-bar-chart-line-fill"></i>
	                      <span>취업지원</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">진로교육</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">진로상담예약</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">일자리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">이력서/자기소개서</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-bookmarks-fill"></i>
	                      <span>편의시설</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">도서관</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">도서관 열람실 예약</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">도서관 스터디룸 예약</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub active">
                       <a href="#" class="sidebar-link">
                           <i class="bi bi-printer-fill"></i>
                           <span>증명서</span>
                       </a>
                       <ul class="submenu active">
                           <li class="submenu-item active">
                               <a href="${cPath }/lms/certificateChoice.do">증명서신청</a>
                           </li>                                                                                                                                                                                                
                            <li class="submenu-item ">
                               <a href="${cPath }/lms/certificateStorage.do">증명서보관함</a>
                           </li>
                       </ul>
                   </li>
			  </c:if>
			  
              <!-- 권한 : 교수 -->
              <c:if test="${'PR' eq user.user[1] }">
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-person-badge-fill"></i>
	                      <span>마이페이지</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">내정보보기</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">진행중인 강의</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">일정관리</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item">
	                  <a href="${cPath }/lms/lectureList.do" class="sidebar-link">
	                      <i class="bi bi-book-fill"></i>
	                      <span>강의관리</span>
	                  </a>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-credit-card-2-front-fill"></i>
	                      <span>학적관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">학적조회</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">상담내역</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">장학금추천</a>
	                      </li>
	                  </ul>
	              </li>
              </c:if>
              <!-- 권한 : 입학과 -->
              <c:if test="${'IH' eq user.user[1] }">
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-person-badge-fill"></i>
	                      <span>신편입생 지원자</span>
	                  </a>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-bookmark-check-fill"></i>
	                      <span>수시모집</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">지난 수시 모집</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">선발기준관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">모집일정관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">원서접수관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">합격자관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">합격자충원</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-bookmark-check-fill"></i>
	                      <span>정시모집</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">지난 정시 모집</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">선발기준관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">모집일정관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">원서접수관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">합격자관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">합격자충원</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-bookmark-check-fill"></i>
	                      <span>편입학모집</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">지난 편입학 모집</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">선발기준관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">모집일정관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">원서접수관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">합격자관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">합격자충원</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-file-text-fill"></i>
	                      <span>입시상담</span>
	                  </a>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-calendar-check-fill"></i>
	                      <span>입시설명회</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">입시설명회 일정관리</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">입시설명회 신청관리</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-megaphone-fill"></i>
	                      <span>입시공지</span>
	                  </a>
	              </li>
			  </c:if>
			  
              <!-- 권한 : 학적과 -->
              <c:if test="${'HJ' eq user.user[1] }">
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-person-badge-fill"></i>
	                      <span>학적관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">학생등록</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">학적조회</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">학적변동</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">등록금납부</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">등록금환불</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-book-fill"></i>
	                      <span>강의관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">전공강의</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">교양강의</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">수강신청</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">폐강관리</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-pencil-fill"></i>
	                      <span>시험관리</span>
	                  </a>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-file-earmark-bar-graph-fill"></i>
	                      <span>성적관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">성적입력일정</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">강의평가일정</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">성적조회일정</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-printer-fill"></i>
	                      <span>증명서관리</span>
	                  </a>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-envelope-fill"></i>
	                      <span>웹메일관리</span>
	                  </a>
	              </li>
			  </c:if>
              <!-- 권한 : 학생지원과, 취업장학과 -->
              <c:if test="${'HS' eq user.user[1] or 'CJ' eq user.user[1] }">
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-person-badge-fill"></i>
	                      <span>학적조회</span>
	                  </a>
	              </li>
			  </c:if>
              <!-- 권한 : 학생지원과 -->
              <c:if test="${'HS' eq user.user[1]}">
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-bookmarks-fill"></i>
	                      <span>편의시설관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">도서관 열람실</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">도서관 스터디룸</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">구내식당</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">통학버스</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">학교대관</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-file-text-fill"></i>
	                      <span>게시판/일정관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">학사일정</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">학사공지</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">대학문의</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">자료실</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-diagram-3-fill"></i>
	                      <span>학생자치기구</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">총학생회</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">총동아리협회</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">동아리</a>
	                      </li>
	                  </ul>
	              </li>
			  </c:if>
              <!-- 권한 : 취업장학과 -->
              <c:if test="${'CJ' eq user.user[1] }">
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-chat-right-quote-fill"></i>
	                      <span>진로상담</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">진로상담</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">면접클리닉</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-person-fill"></i>
	                      <span>진로교육</span>
	                  </a>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-briefcase-fill"></i>
	                      <span>취업현황</span>
	                  </a>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-megaphone-fill"></i>
	                      <span>장학공지</span>
	                  </a>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-person-fill"></i>
	                      <span>장학금 지원</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">성적장학금</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">자격증 취득 장학금</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">어학 장학금</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">교수 추천 장학금</a>
	                      </li>
	                  </ul>
	              </li>
              </c:if>
              <!-- 권한 : 학과관리자 -->
              <c:if test="${'HG' eq user.user[1] }">
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-person-badge-fill"></i>
	                      <span>학적조회</span>
	                  </a>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-bookmark-check-fill"></i>
	                      <span>입학관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">모집요강</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">원서접수</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">신편입학 면접</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">신편입학 합격</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">입시상담</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-bookmark-star-fill"></i>
	                      <span>학과관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">학과 강의실</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">학과 실습실</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">학과 학생회</a>
	                      </li>
	                  </ul>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-person-fill"></i>
	                      <span>교수관리</span>
	                  </a>
	              </li>
	              <li class="sidebar-item">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-book-fill"></i>
	                      <span>강의관리</span>
	                  </a>
	              </li>
	              <li class="sidebar-item  has-sub">
	                  <a href="#" class="sidebar-link">
	                      <i class="bi bi-file-earmark-bar-graph-fill"></i>
	                      <span>성적관리</span>
	                  </a>
	                  <ul class="submenu ">
	                      <li class="submenu-item ">
	                          <a href="#">성적입력</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">강의평가</a>
	                      </li>
	                      <li class="submenu-item ">
	                          <a href="#">성적조회</a>
	                      </li>
	                  </ul>
	              </li>
	                <li class="sidebar-item  has-sub">
	                    <a href="#" class="sidebar-link">
	                        <i class="bi bi-file-text-fill"></i>
	                        <span>게시판/일정관리</span>
	                    </a>
	                    <ul class="submenu ">
	                        <li class="submenu-item ">
	                            <a href="#">공지사항</a>
	                        </li>
	                        <li class="submenu-item ">
	                            <a href="#">학과문의</a>
	                        </li>
	                        <li class="submenu-item ">
	                            <a href="#">학과일정</a>
	                        </li>
	                    </ul>
	                </li>
                </c:if>
                
            </ul>
        </div>
        <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
    </div>
</div>