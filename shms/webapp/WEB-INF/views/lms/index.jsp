<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* 2021. 5. 31.      송수미        학생 통합정보시스템 메인 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@page import="java.util.Map"%>
<%@page import="java.awt.print.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
									<c:choose>
										<c:when test="${webmailCntMap.RECVCNT gt 99}">
											<h6 class="font-extrabold mb-0">+99건</h6>
										</c:when>
										<c:otherwise>
											<h6 class="font-extrabold mb-0">${webmailCntMap.RECVCNT }건</h6>
										</c:otherwise>
									</c:choose>
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
									<c:choose>
										<c:when test="${webmailCntMap.TODAYRECVCNT gt 99}">
											<h6 class="font-extrabold mb-0">+99건</h6>
										</c:when>
										<c:otherwise>
											<h6 class="font-extrabold mb-0">${webmailCntMap.TODAYRECVCNT }건</h6>
										</c:otherwise>
									</c:choose>
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
									<h6 class="font-extrabold mb-0">${bookLoanCnt["BOOKLOANCNT"]}건</h6>
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
									<h6 class="font-extrabold mb-0">${bookLoanCnt.EXPIREDCNT}건</h6>
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
									<c:choose>
										<c:when test="${not empty ggList }">
											<c:forEach items="${ggList }" var="ggBoard">
												<tr>
													<td scope="row">${ggBoard.p_bo_no }</td>
													<td scope="row"><a class="text-light-black" href="${cPath }/lecture/noticeLecture.do?bo_no=${ggBoard.bo_no}">${ggBoard.bo_title }</a></td>
													<td scope="row">${ggBoard.bo_writer }</td>
													<td scope="row">${ggBoard.bo_write_de }</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="4" class="text-center"> 현재 수강 중인 강의의 공지사항이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
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
										<c:choose>
											<c:when test="${not empty taskList }">
												<c:forEach items="${taskList }" var="task">
													<tr>
														<td scope="row"><a class="text-light-black" href="${cPath }/lecture/task.do?bo_no=${task.set_task_no}">${task.task_title }</a></td>
														<td class="col-5">
															<p class=" mb-0">
																<c:choose>
																	<c:when test="${task.submit_at eq 'N' }">
																		<a href="#" class="btn btn-primary">제출</a>
																	</c:when>
																	<c:otherwise>
																		<a href="#" class="btn disabled btn-primary">제출완료</a>
																	</c:otherwise>
																</c:choose>
															</p>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="4" class="text-center"> 현재 제출해야 하는 과제가 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
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
										<c:choose>
											<c:when test="${not empty todayLecList }">
												<c:forEach items="${todayLecList }" var="lecture">
													<tr>
														<td class="col-4">${lecture.lec_time }</td>
														<td class="col-auto">
															<p class=" mb-0">
																<a class="text-light-black" href="#">${lecture.lec_name }</a>
															</p>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="2" class="text-center"> 오늘은 수강할 강의가 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
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
<!-- 					<form> -->
<!--                     	<input type="text" value="" id="date"/> -->
<!--                     </form> -->
					<jsp:useBean id="today" class="java.util.Date" />
						<fmt:formatDate var="now" value="${today}" pattern="yyyy년 MM월 dd일" />
					<p class="dateToday">
						${now }
					</p>
					<div id="todaySchedule">
						<c:if test="${not empty todaySchdulList}">
							<c:forEach items="${todaySchdulList}" var="todaySchdul">
								<p>
									<strong>${todaySchdul.begin_dt} - ${todaySchdul.end_dt}</strong> ${todaySchdul.title }
								</p>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<h4>학생식당</h4>
					<p class="dateToday">${diet.diet_date }</p>
				</div>
				<div class="card-body">
					<ul id="todayDiet">
						<li>${diet.diet_menu1 }</li>
						<li>${diet.diet_menu2 }</li>
						<li>${diet.diet_menu3 }</li>
						<li>${diet.diet_menu4 }</li>
						<c:if test="${not empty diet.diet_menu5 }">
							<li>${diet.diet_menu5 }</li>
						</c:if>
						<c:if test="${not empty diet.diet_menu6 }">
							<li>${diet.diet_menu6 }</li>
						</c:if>
						<c:if test="${not empty diet.diet_menu7 }">
							<li>${diet.diet_menu7 }</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
    $(function() {
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
        
        $("#datepicker").on("change", function(){
            var year = $(".ui-state-active").parent("td").data("year");
            var month = $(".ui-state-active").parent("td").data("month");
            var day = $(".ui-state-active").text();
            $("#date").val(year + "-" + month + "-" + day);
        });
    });
</script>