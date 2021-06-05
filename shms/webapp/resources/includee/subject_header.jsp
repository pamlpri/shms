<%--
* [[개정이력(Modification Information)]]
* 수정일         수정자     수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.   박초원    최초작성
* 2021. 6.  4.   김보미    연결링크수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form>
	<input type="hidden" value="${sub_code }">
</form>
<div class="main_menu">
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<a class="navbar-brand logo_h" href="${cPath }/"">
			<img src="${cPath }/resources/subject/img/logo.png" alt="" /></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse offset"
				id="navbarSupportedContent">
				<ul class="nav navbar-nav menu_nav ml-auto">
					<li class="nav-item submenu dropdown"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">학과소개</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link"
								href="aboutSubject.html">학과소개</a></li>
							<li class="nav-item"><a class="nav-link"
								href="mapSubject.html">오시는길</a></li>
						</ul>
					</li>
					<li class="nav-item submenu dropdown">
						<a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">교수소개</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link"
								href="professor.html">교수진</a></li>
						</ul>
					</li>
					<li class="nav-item submenu dropdown">
						<a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">학과정보</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link"
								href="curriculum.html">교육과정</a></li>
							<li class="nav-item"><a class="nav-link"
								href="scheduleSubject.html">학과일정</a></li>
						</ul>
					</li>
					<li class="nav-item submenu dropdown">
						<a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">정보마당</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link"
								href="${cPath }/subject/subjectNoticeList.do">학과공지</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${cPath }/subject/subjectQnaList.do">학과문의</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</div>