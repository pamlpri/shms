<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-lg-2 col-md-6 single-footer-widget">
			<h4>학과소개</h4>
			<ul>
				<li><a href="aboutSubject.html">학과소개</a></li>
				<li><a href="mapSubject.html">오시는길</a></li>
			</ul>
		</div>
		<div class="col-lg-2 col-md-6 single-footer-widget">
			<h4>학과정보</h4>
			<ul>
				<li><a href="curriculum.html">교육과정</a></li>
				<li><a href="scheduleSubject.html">학과일정</a></li>
			</ul>
		</div>
		<div class="col-lg-2 col-md-6 single-footer-widget">
			<h4>정보마당</h4>
			<ul>
				<li><a href="${cPath }/subject/subjectNoticeList.do">학과공지</a></li>
				<li><a href="${cPath }/subject/subjectQnaList.do">학과문의</a></li>
			</ul>
		</div>
		<div class="col-lg-2 col-md-6 single-footer-widget">
			<h4>교내 사이트</h4>
			<ul>
				<li><a href="${cPath }/">인재대학교</a></li>
				<li><a href="${cPath }/lms/login.do">통합정보시스템</a></li>
				<li><a href="${cPath }/admission/main.do">입학안내</a></li>
			</ul>
		</div>
		<div class="col-lg-4 col-md-6 single-footer-widget">
			<h4>${subject.sub_name }</h4>
			<div class="form-wrap" id="mc_embed_signup">
				<a class="navbar-brand logo_h" href="../main/index.html"><img
					src="${cPath }/resources/subject/img/logo2.png" alt="" /></a>
			</div>
		</div>
	</div>
	<div class="row footer-bottom d-flex justify-content-between">
		<p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			Copyright &copy;
			<script>document.write(new Date().getFullYear());</script>
			All rights reserved SHMS
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		</p>
	</div>
</div>