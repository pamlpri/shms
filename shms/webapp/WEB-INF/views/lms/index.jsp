<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
	<section class="row">
		<div class="col-12 col-lg-9">
			<div class="row">
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<a href="#" class="row">
								<div class="col-md-5">
									<div class="stats-icon purple">
										<i class="iconly-boldMessage"></i>
									</div>
								</div>
								<div class="col-md-7">
									<h6 class="text-muted font-semibold">받은메일</h6>
									<h6 class="font-extrabold mb-0">10건</h6>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<a href="#" class="row">
								<div class="col-md-5">
									<div class="stats-icon blue">
										<i class="iconly-boldSend"></i>
									</div>
								</div>
								<div class="col-md-7">
									<h6 class="text-muted font-semibold">읽을메일</h6>
									<h6 class="font-extrabold mb-0">+99건</h6>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<a href="#" class="row">
								<div class="col-md-5">
									<div class="stats-icon green">
										<i class="iconly-boldShow"></i>
									</div>
								</div>
								<div class="col-md-7">
									<h6 class="text-muted font-semibold">도서대출</h6>
									<h6 class="font-extrabold mb-0">2건</h6>
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<a href="#" class="row">
								<div class="col-md-5">
									<div class="stats-icon red">
										<i class="iconly-boldBookmark"></i>
									</div>
								</div>
								<div class="col-md-7">
									<h6 class="text-muted font-semibold">도서연체</h6>
									<h6 class="font-extrabold mb-0">0건</h6>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h4>강의공지</h4>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">No.</th>
										<th scope="co1">제목</th>
										<th scope="co1">작성자</th>
										<th scope="co1">작성일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td scope="row">1</td>
										<td scope="row"><a class="text-light-black" href="#">대학생활의
												이해 강의공지</a></td>
										<td scope="row">하재관</td>
										<td scope="row">2020.05.05</td>
									</tr>
									<tr>
										<td scope="row">2</td>
										<td scope="row"><a class="text-light-black" href="#">긴급
												시험 예정</a></td>
										<td scope="row">최희연</td>
										<td scope="row">2020.05.05</td>
									</tr>
									<tr>
										<td scope="row">3</td>
										<td scope="row"><a class="text-light-black" href="#">이클립스
												설치하는 법 공지</a></td>
										<td scope="row">하재관</td>
										<td scope="row">2020.05.05</td>
									</tr>
									<tr>
										<td scope="row">4</td>
										<td scope="row"><a class="text-light-black" href="#">대학생활의
												이해 강의공지</a></td>
										<td scope="row">하재관</td>
										<td scope="row">2020.05.05</td>
									</tr>
									<tr>
										<td scope="row">5</td>
										<td scope="row"><a class="text-light-black" href="#">대학생활의
												이해 강의공지</a></td>
										<td scope="row">하재관</td>
										<td scope="row">2020.05.05</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-xl-5">
					<div class="card">
						<div class="card-header">
							<h4>강의과제</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover table-lg">
									<thead>
										<tr>
											<th>과제명</th>
											<th>제출</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="col-auto">대학생활의 이해 ppt 제출</td>
											<td class="col-5">
												<p class=" mb-0">
													<a href="#" class="btn btn-primary">제출</a>
												</p>
											</td>
										</tr>
										<tr>
											<td class="col-auto">서블릿 컨테이너란?</td>
											<td class="col-5">
												<p class=" mb-0">
													<a href="#" class="btn disabled btn-primary">제출완료</a>
												</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-xl-7">
					<div class="card">
						<div class="card-header">
							<h4>오늘의 강의시간표</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover table-lg">
									<thead>
										<tr>
											<th>시간</th>
											<th>강의명</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="col-4">14:00 - 16:00</td>
											<td class="col-auto">
												<p class=" mb-0">
													<a class="text-light-black" href="#">대학생활의 이해</a>
												</p>
											</td>
										</tr>
										<tr>
											<td class="col-4">16:00 - 18:00</td>
											<td class="col-auto">
												<p class=" mb-0">
													<a class="text-light-black" href="#">시광학이론</a>
												</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-lg-3">
			<div class="card">
				<div class="card-header">
					<h4>학사일정</h4>
				</div>
				<div class="card-body">
					<div id="datepicker"></div>
					<p class="dateToday">2020년 05월 14일 금요일</p>
					<div id="todaySchedule">
						<p>
							<strong>14:00 - 15:00</strong> 단과대학 소방훈련 실시
						</p>
						<p>
							<strong>15:30 - 16:30</strong> 인재대학교 진로교육
						</p>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<h4>학생식당</h4>
					<p class="dateToday">2020.05.05</p>
				</div>
				<div class="card-body">
					<ul id="todayDiet">
						<li>백미밥</li>
						<li>돈육우거지국</li>
						<li>영양부추너비아니</li>
						<li>해물부추전</li>
						<li>고추장갑자조림</li>
						<li>간장고추지</li>
						<li>바나나</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
    $( function() {
        $( "#datepicker").datepicker({
            showOn:'button',
            dateFormat: 'yy.mm.dd',
            prevText: '이전 달',



            nextText: '다음 달',
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNames: ['일','월','화','수','목','금','토'],
            dayNamesShort: ['일','월','화','수','목','금','토'],



            dayNamesMin: ['일','월','화','수','목','금','토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });
    });
</script>