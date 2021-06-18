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
		<c:choose>
			<c:when test="${'ST' eq user.user[1] }">
				<div class="sidebar-brand">
					<!-- 권한에 따라 주소 달라져야함! -->
					<a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}"><img src="${cPath }/resources/lecture/dist/img/logo_black.png"
						style="width: 45%;"></a>
				</div>
				<div class="sidebar-brand sidebar-brand-sm">
				    <!-- 권한에 따라 주소 달라져야함! -->
					<a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}"><img src="${cPath }/resources/lecture/dist/img/favicon.png"
						style="width: 40%;" /></a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="sidebar-brand">
					<!-- 권한에 따라 주소 달라져야함! -->
					<a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}"><img src="${cPath }/resources/lecture/dist/img/logo_black.png"
						style="width: 45%;"></a>
				</div>
				<div class="sidebar-brand sidebar-brand-sm">
				    <!-- 권한에 따라 주소 달라져야함! -->
					<a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}"><img src="${cPath }/resources/lecture/dist/img/favicon.png"
						style="width: 40%;" /></a>
				</div>
			</c:otherwise>
		</c:choose>
		<ul class="sidebar-menu">
		  <!-- 권한 학생 -->
		  <c:if test="${'ST' eq user.user[1] }">
          <li class="dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-home"></i> <span>강의실 홈</span></a>
            <ul class="dropdown-menu">
              <li><a href="${cPath }/lecture/lectureInfo.do">강의정보</a></li> 
              <li><a href="${cPath }/lecture/attendance.do?what=${user.user[0]}">출석관리</a></li> 
              <li><a href="${cPath }/lecture/grade.do">성적관리</a></li> 
            </ul>
          </li>
          <!-- 권한 학생 -->
          <li class="dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-user-graduate"></i> <span>학습활동</span></a>
            <ul class="dropdown-menu">
              <li><a class="nav-link" href="${cPath }/lecture/lectureWeek.do">전체강의</a></li> 
              <li><a class="nav-link" href="${cPath }/lecture/task.do">과제제출</a></li> 
              <li><a class="nav-link" href="${cPath }/lecture/exam.do">시험응시</a></li> 
            </ul>
          </li>
          </c:if>
          
          <!-- 권한 교수 -->
          <c:if test="${'PR' eq user.user[1] }">
          <li class="dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-home"></i> <span>강의실 홈</span></a>
            <ul class="dropdown-menu">
               <li><a href="${cPath }/lecture/lectureInfo.do">강의정보</a></li>
               <li><a href="${cPath }/lecture/lectureSetting.do">강의설정</a></li>
               <li><a href="${cPath }/lecture/attendanceAdmin.do">출석관리</a></li> 
               <li><a href="${cPath }/lecture/gradeAdmin.do">성적관리</a></li>
            </ul>
          </li>
          
          <!-- 권한 교수 -->
          <li class="dropdown ">
            <a href="#" class="nav-link has-dropdown"><i class="fas fa-user-graduate"></i> <span>학습활동</span></a>
            <ul class="dropdown-menu ">
              <li><a class="nav-link" href="${cPath }/lecture/weeks.do">주/회차 관리</a></li>
              <li><a class="nav-link" href="${cPath }/lecture/report.do">과제관리</a></li>  
              <li><a class="nav-link" href="${cPath }/lecture/examAdmin.do">시험관리</a></li>
            </ul>
          </li>
          </c:if>
          
          <!-- 권한 공통 -->
          <li class="dropdown">
            <a href="#" class="nav-link has-dropdown"><i class="fab fa-readme"></i> <span>강의개요</span></a>
            <ul class="dropdown-menu">
              <li><a class="nav-link" href="${cPath }/lecture/notice.do">공지사항</a></li> 
              <li><a class="nav-link" href="${cPath }/lecture/qna.do">강의 Q&A</a></li> 
              <li><a class="nav-link" href="${cPath }/lecture/reference.do">자료실</a></li> 
            </ul>
          </li>
        </ul>

		<div class="mt-4 mb-4 p-3 hide-sidebar-mini">
			<c:if test="${'ST' eq user.user[1] }">
				<a href="${cPath }/lms/index.do"
					class="btn btn-primary btn-lg btn-block btn-icon-split"> <i
					class="fas fa-graduation-cap"></i> 통합정보시스템
				</a>
			</c:if>
			<c:if test="${'PR' eq user.user[1] }">
				<a href="${cPath }/lms/main.do"
					class="btn btn-primary btn-lg btn-block btn-icon-split"> <i
					class="fas fa-graduation-cap"></i> 통합정보시스템
				</a>
			</c:if>
		</div>
	</aside>
</div>