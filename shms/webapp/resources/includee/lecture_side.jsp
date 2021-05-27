<%--
* [[개정이력(Modification Information)]]
* 수정일         수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 21.  박초원        최초작성
* 2021. 5. 24.  박초원        메뉴 통합
* 2021. 5. 27.  김보미     권한별 메뉴 출력
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="main-sidebar sidebar-style-2">
	<aside id="sidebar-wrapper">
		<div class="sidebar-brand">
			<!-- 권한에 따라 주소 달라져야함! -->
			<a href="${cPath }/lecture/professor/main.do"><img src="${cPath }/resources/lecture/dist/img/logo_black.png"
				style="width: 45%;"></a>
		</div>
		<div class="sidebar-brand sidebar-brand-sm">
		    <!-- 권한에 따라 주소 달라져야함! -->
			<a href="${cPath }/lecture/professor/main.do"><img src="${cPath }/resources/lecture/dist/img/favicon.png"
				style="width: 40%;" /></a>
		</div>
		<ul class="sidebar-menu">

		  <!-- 권한 학생 -->
		  <c:if test="${'ST' eq user.user[1] }">
          <li class="dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-home"></i> <span>강의실 홈</span></a>
            <ul class="dropdown-menu">
              <li><a href="lectureInfo.html">강의정보</a></li> 
              <li><a href="attendance.html">출석관리</a></li> 
              <li><a href="grade.html">성적관리</a></li> 
            </ul>
          </li>
          <!-- 권한 학생 -->
          <li class="dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-user-graduate"></i> <span>학습활동</span></a>
            <ul class="dropdown-menu">
              <li><a class="nav-link" href="lecture.html">전체강의</a></li> 
              <li><a class="nav-link" href="tesk.html">과제제출</a></li> 
              <li><a class="nav-link" href="exam.html">시험응시</a></li> 
            </ul>
          </li>
          </c:if>
          
          <!-- 권한 교수 -->
          <c:if test="${'PR' eq user.user[1] }">
          <li class="dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-home"></i> <span>강의실 홈</span></a>
            <ul class="dropdown-menu">
              <li><a href="lectureInfo.html">강의정보</a></li>
              <li><a href="attendanceAdmin.html">출석관리</a></li> 
              <li><a href="gradeAdmin.html">성적관리</a></li> 
            </ul>
          </li>
          
          <!-- 권한 교수 -->
          <li class="dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-user-graduate"></i> <span>학습활동</span></a>
            <ul class="dropdown-menu">
              <li><a class="nav-link" href="weeks.html">주/회차 관리</a></li>
              <li><a class="nav-link" href="report.html">과제관리</a></li>  
              <li><a class="nav-link" href="examAdmin.html">시험관리</a></li>
            </ul>
          </li>
          </c:if>
          
          <!-- 권한 공통 -->
          <li class="dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fab fa-readme"></i> <span>강의개요</span></a>
            <ul class="dropdown-menu">
              <li><a class="nav-link" href="noticeLecture.html">공지사항</a></li> 
              <li><a class="nav-link" href="qnaLecture.html">강의 Q&A</a></li> 
              <li><a class="nav-link" href="noticeLecture.html">자료실</a></li> 
            </ul>
          </li>
        </ul>

		<div class="mt-4 mb-4 p-3 hide-sidebar-mini">
			<a href="${cPath }/lms/main.do"
				class="btn btn-primary btn-lg btn-block btn-icon-split"> <i
				class="fas fa-graduation-cap"></i> 통합정보시스템
			</a>
		</div>
	</aside>
</div>