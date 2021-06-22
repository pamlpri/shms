<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 05. 20.      박초원        최초작성
* 2021. 06. 02.      송수미        학과 통합정보시스템 메인 페이지 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>
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
				<!-- 권한 공통 -->
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<a href="${cPath }/lms/inbox.do" class="row">
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
				<!-- 권한 공통 -->
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<a href="${cPath }/lms/inbox.do" class="row">
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
				<!-- 권한 학과관리자 -->
				<div class="col-6 col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body px-3 py-4-5">
							<a href="#" class="row">
								<div class="col-md-5">
									<div class="stats-icon green">
										<i class="iconly-boldDocument"></i>
									</div>
								</div>
								<div class="col-md-7">
									<h6 class="text-muted font-semibold">입시상담</h6>
									<h6 class="font-extrabold mb-0">${EntQnaCnt }건</h6>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!-- 권한 학과관리자 -->
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
									<h6 class="text-muted font-semibold">Q&A</h6>
									<h6 class="font-extrabold mb-0">${hmCnt }건</h6>
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
							<h4>학과공지</h4>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">No.</th>
										<th scope="co1">제목</th>
										<th scope="co1">작성일</th>
										<th scope="co1">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty hgList }">
											<c:forEach items="${hgList }" var="hgBoard">
												<tr>
													<td scope="row">${hgBoard.p_bo_no }</td>
													<td scope="row">
														<a class="text-light-black" href="${cPath }/lms/subjectNoticeView.do?bo_no=${hgBoard.bo_no}">${hgBoard.bo_title }</a>
													</td>
													<td scope="row">${hgBoard.bo_write_de }</td>
													<td scope="row">${hgBoard.bo_hit }</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="4" class="text-center">
													현재 등록되어 있는 학과공지가 없습니다.
												</td>
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
							<h4>학과현황</h4>
						</div>
						<div class="card-body">
							<!-- dashboard.js에서 설정 -->
							<div id="chart-visitors-profile"></div>
						</div>
					</div>
				</div>
				<div class="col-12 col-xl-7">
					<div class="card">
						<div class="card-header">
							<h4>교수연락망</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover table-lg">
									<thead>
										<tr>
											<th>이름</th>
											<th>웹메일</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty profsList }">
												<c:forEach items="${profsList }" var="prof" varStatus="idx">
													<c:if test="${idx.count < 5 }">
														<tr>
															<td class="col-4">${prof.name }</td>
															<td class="col-auto">
																<p class=" mb-0">
																	<a class="text-light-black" href="#">${prof.webmail }</a>
																</p>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="2" class="text-center">
														현재 학과에 등록되어 있는 교수진이 없습니다.
													</td>
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
					<h4>교내식당</h4>
					<p class="dateToday">${diet.diet_date }</p>
				</div>
				<div class="card-body">
					<c:choose>
						<c:when test="${not empty diet }">
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
						</c:when>
						<c:otherwise>
							<p>오늘의 식단 정보가 존재하지 않습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
    $( function() {
    	var male;
    	var female;
    	var message;
    	
    	$.ajax({
    		url : "${cPath}/lms/gen.do"
    		, contentType : "application/json; charset='utf-8'" 
    		, dataType : "json"
    		, success : function(resp){
    			if(resp != null && resp.length > 0){
	    			resp.forEach(function(value){
	    				if(value["GEN"] == 'M'){
	    					male = value["RATE"];
	    				}else{
	    					female = value["RATE"];
	    				}
	    			})
    			
    			let optionsVisitorsProfile  = {
    	        		series: [male, female],
    	        		labels: ['Male', 'Female'],
    	        		colors: ['#435ebe','#55c6e8'],
    	        		chart: {
    	        			type: 'donut',
    	        			width: '100%',
    	        			height:'350px'
    	        		},
    	        		legend: {
    	        			position: 'bottom'
    	        		},
    	        		plotOptions: {
    	        			pie: {
    	        				donut: {
    	        					size: '30%'
    	        				}
    	        			}
    	        		}
    	        	}
    	        
    	        var chartVisitorsProfile = new ApexCharts(document.getElementById('chart-visitors-profile'), optionsVisitorsProfile)
    	        chartVisitorsProfile.render()
    			
    			}else{
    				message = "해당 학과에 학생이 없습니다.";
    				$('#chart-visitors-profile').text(message);
    			}
    			
    			
    		}
    		, error : function(xhr, error, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
    	});
    	
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