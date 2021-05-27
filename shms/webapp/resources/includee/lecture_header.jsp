<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 21.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
	<form class="form-inline mr-auto">
		<ul class="navbar-nav mr-3">
			<li><a href="#" data-toggle="sidebar"
				class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
		</ul>
	</form>
	<ul class="navbar-nav navbar-right">
		<li class="dropdown">
			<a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
				<img alt="image" src="${cPath }/resources/lecture/dist/img/avatar/avatar-1.png" class="rounded-circle mr-1">
				<div class="d-sm-none d-lg-inline-block">${userName }</div>
			</a>
			<div class="dropdown-menu dropdown-menu-right">
			<div class="dropdown-title">인재대학교 강의실</div>
			<a href="${cPath }/resources/lms/student/main.do" class="dropdown-item has-icon">
				<i class="fas fa-graduation-cap"></i> 통합정보시스템
			</a>
			<a href="${cPath }/" class="dropdown-item has-icon">
				<i class="fas fa-school"></i> 인재대학교
			</a>
			<div class="dropdown-divider"></div>
				<a href="${cPath}/lms/logout.do" class="dropdown-item has-icon text-danger">
				<i class="fas fa-sign-out-alt"></i> Logout </a>
			</div>
		</li>
	</ul>
</nav>