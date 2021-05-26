<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header Start -->
<div class="header-area">
	<div class="main-header ">
		<div class="header-top d-none d-lg-block">
			<!-- Left Social -->
			<div class="header-left-social">
				<ul class="header-social">
					<li><a href="${cPath }/" style="padding-left: 0;"><i
							class="fas fa-school"></i> 인재대학교</a></li>
					<li><a href="${cPath }/admission/main.do"><i
							class="fas fa-graduation-cap"></i> 입학안내</a></li>
				</ul>
			</div>
		</div>
		<div class="header-bottom header-sticky">
			<!-- Logo -->
			<div class="logo d-none d-lg-block">
				<a href="${cPath }/admission/main.do"><img
					src="${cPath }/resources/admission/assets/img/logo/logo.png" alt=""></a>
			</div>
			<div class="container">
				<div class="menu-wrapper">
					<!-- Logo -->
					<div class="logo logo2 d-block d-lg-none">
						<a href="index.html"> <img
							src="${cPath }/resources/admission/assets/img/logo/logo.png"
							alt=""></a>
					</div>
					<!-- Main-menu -->
					<div class="main-menu d-none d-lg-block" style="margin-left: 5%;">
						<nav>
							<ul id="navigation">
								<li><a href="earlyAdmission.html">수시모집</a>
									<ul class="submenu">
										<li><a href="earlySchedule.html">모집일정</a></li>
										<li><a href="earlyGuide.html">모집요강</a></li>
										<li><a href="earlyPersonnel.html">모집인원</a></li>
									</ul></li>
								<li><a href="regularSchedule.html">정시모집</a>
									<ul class="submenu">
										<li><a href="regularSchedule.hyml">모집일정</a></li>
										<li><a href="regularGuide.html">모집요강</a></li>
										<li><a href="regularPersonnel.html">모집인원</a></li>
									</ul></li>
								<li><a href="transferSchedule.html">편입학모집</a>
									<ul class="submenu">
										<li><a href="transferSchedule.html">모집일정</a></li>
										<li><a href="transferGuide.html">모집요강</a></li>
										<li><a href="transferPersonnel.html">모집인원</a></li>
									</ul></li>
								<li><a href="register.html">원서접수</a>
									<ul class="submenu">
										<li><a href="register.html">원서접수</a></li>
										<li><a href="registerCheck.html">접수확인</a></li>
										<li><a href="registerSearch.html">합격자조회</a></li>
										<li><a href="registerPay.html">등록금고지서</a></li>
									</ul></li>
								<li><a href="helperNotice.html">입학도우미</a>
									<ul class="submenu">
										<li><a href="helperNotice.html">입시공지</a></li>
										<li><a href="helperCalendar.html">입시캘린더</a></li>
										<li><a href="helperCounseling.html">입학상담</a></li>
										<li><a href="helperPresentation.html">입학설명회</a></li>
										<li><a href="helperGradeCalculation.html">내신성적산출</a></li>
									</ul></li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- Mobile Menu -->
				<div class="col-12">
					<div class="mobile_menu d-block d-lg-none"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->