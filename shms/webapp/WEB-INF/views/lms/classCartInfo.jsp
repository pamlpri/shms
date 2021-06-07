<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">수강신청</a></li>
			<li class="breadcrumb-item active" aria-current="page">장바구니</li>
		</ol>
	</nav>

	<section class="section">
		<div class="row registration">
			<div class="col-lg-3">
				<img src="${cPath }/resources/lms/assets/images/lectureCart.png" style="width: 100%;" />
				<div class="card">
					<div class="card-header">
						<h4>2021-2학기 수강신청</h4>
					</div>
					<div class="card-content pb-4">
						<ul class="classInfo">
							<li>
								<h6 class="mb-0 py-1">학번 : ${sugangReqIndexInfo.stdnt_no }</h6>
							</li>
							<li>
								<h6 class="mb-0 py-1">이름 : ${sugangReqIndexInfo.stdnt_name }</h6>
							</li>
							<li>
								<h6 class="mb-0 py-1">학과 : ${sugangReqIndexInfo.sub_name }</h6>
							</li>
							<li>
								<h6 class="mb-0 py-1">수강학년 : ${sugangReqIndexInfo.stdnt_grade }학년</h6>
							</li>
							<li>
								<h6 class="mb-0 py-1">수강가능학점 : 최대 ${sugangReqIndexInfo.lec_able_pnt }학점</h6>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-12 col-lg-9">
				<div class="card">
					<div class="card-header">
						<h4>안내</h4>
					</div>
					<div class="card-body">
						<div id="registerInfo">
							<ul>
								<li><strong>이용시간 : </strong>2021.05.02 AM 10:00 ~
									2021.05.09 PM 04:00</li>
								<li>장바구니는 기존 수강신청과 동일하며(이수판정, 시간표중복 체크, 제한학점 체크 등), 차이점은
									수강신청시 제한 인원 체크를 하지 않고 실행 됩니다.</li>
								<li>장바구니 수강신청은 전공과목은 본 수강신청 기간이 되면 자동으로 수강신청 완료가 되며, 교양과목은
									본 수강신청 기간에 다시 수강신청을 하여야 합니다.</li>
								<li>장바구니에 저장된 과목은 본 수강신청시 자동 조회되며, 본 수강신청 기간에 신청버튼을 클릭해야
									수강신청이 완료됩니다.</li>
								<li>장바구니 수강신청도 재학생만 가능하며, 학적상태가 휴학인 경우 장바구니 수강신청 전 반드시
									학적변동을 통해 학적상태를 재학으로 유지 하여야 합니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="text-center">
					<a href="${cPath }/lms/classCart.do" class="btn btn-primary btn-lg">수강 장바구니</a>
				</div>
			</div>
		</div>
	</section>
	<!-- contents end -->
</div>
