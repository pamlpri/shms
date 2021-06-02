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
			<li class="breadcrumb-item active" aria-current="page">수강신청</li>
		</ol>
	</nav>

	<section class="section">
		<div class="row registration">
			<div class="col-lg-3">
				<img src="${cPath }/resources/lms/assets/images/lecture.png" style="width: 100%;" />
				<div class="card">
					<div class="card-header">
						<h4>2021-2학기 수강신청</h4>
					</div>
					<div class="card-content pb-4">
						<ul class="classInfo">
							<li>
								<h6 class="mb-0 py-1">학번 : S14010001</h6>
							</li>
							<li>
								<h6 class="mb-0 py-1">이름 : 김보미</h6>
							</li>
							<li>
								<h6 class="mb-0 py-1">학과 : 러시아학과</h6>
							</li>
							<li>
								<h6 class="mb-0 py-1">수강학년 : 2학년</h6>
							</li>
							<li>
								<h6 class="mb-0 py-1">수강가능학점 : 최대 23학점</h6>
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
								<li><strong>이용시간 : </strong>10:00 - 16:00</li>
								<li>접속자가 많은 경우(서버 수용 가능 인원 초과 상황) 로그인 및 수강신청의 모든 요청에 대기 순번을
									발급하고 순차적으로 서비스를 제공합니다.(수강신청의 절차나 방법이 변경된 것은 아님)</li>
								<li>수강신청 늦은 순번의 대기번호가 발급되었다고 해서 '새로고침 (F5)'를 하거나, 메뉴를 반복
									클릭하지 말고 기다려 주십시오.</li>
								<li>수강신청 개시 시점에는 많은 학생들이 동시에 접속하므로 로그인 시 잠시 시스템이 멈출 수 있습니다.
									그래도 로그인 버튼을 다시 누르지 말고 기다리는 것이 효과적입니다. 다시 누를 경우 최후 번호로 재발급되어
									대기시간이 더 늘어나게 됩니다. (수강신청 시작 시간에 임박해서 로그인하지 마시고 최소 몇 분전 로그인을
									권합니다.)</li>
								<li>순번 대기 시 안내 메시지가 화면에 나타나게 되며, 만약 해당 메시지가 뜨지도 않고 컴퓨터가 멈춘
									경우에는 반드시 재접속 하여야 합니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="text-center">
					<a href="${cPath }/lms/classRegistration.do" class="btn btn-primary btn-lg">수강신청</a>
				</div>
				<!-- Button trigger for primary themes modal -->
				<button type="button" class="btn btn-outline-primary"
					data-bs-toggle="modal" data-bs-target="#primary"
					data-bs-backdrop="false">대기순번 있을때 모달창 예시모달</button>

				<!--primary theme Modal -->
				<div class="modal fade text-left" id="primary" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel160" aria-hidden="true">
					<div
						class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
						role="document">
						<div class="modal-content">
							<div class="modal-header bg-primary">
								<h5 class="modal-title white" id="myModalLabel160">서비스 접속대기
									중입니다.</h5>
								<button type="button" class="close" data-bs-dismiss="modal"
									aria-label="Close">
									<i data-feather="x"></i>
								</button>
							</div>
							<div class="modal-body text-center">
								<i class="fas fa-hourglass-start text-primary"
									style="font-size: 2em; margin-bottom: 3%;"></i><br /> 현재 접속자가
								일시적으로 집중되어<br /> 귀하보다 먼저 접속한 <strong class="text-primary">1234명</strong>이
								대기 중에 있습니다. <br /> <br /> 잠시만 기다리시면 서비스로 자동 접속되오니<br />양해하여 주시기
								바랍니다. <br />
								<br />
								<p>
									※ 접속 순서대로 서비스가 제공됨에 따라<br />재접속하면 대기시간이 길어집니다.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- contents end -->
</div>