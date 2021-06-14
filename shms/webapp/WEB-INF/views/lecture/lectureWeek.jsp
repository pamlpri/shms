<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 14. 	 박초원				전체 강의 주/회차별 조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>${lec_name }</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/lectureWeek.do">학습활동 </a></li>
          <li class="breadcrumb-item active" aria-current="page">전체강의</li>
      </ol>
  </nav>
  
  <c:forEach items="${weeksList }" var="week">
  	<div class="card lectureList">
      <div class="card-header">
          <h4>${week.lec_week }주차 ${week.diary_title }</h4>
      </div>
      <div class="card-body">
          <p><strong>학습기간 : </strong>${week.week_bgnde } ~ ${week.week_endde }</p>
          <p><strong>학습내역 : </strong>${week.diary_cont}</p>
      </div>
      <c:choose>
      	<c:when test="${week.week_lec_cl eq 'DM'}">
      		<div class="card-body">
	          <a class="btn btn-icon icon-left disabled btn-secondary"><i class="far fa-user"></i> 대면강의</a>
	        </div>
      	</c:when>
      	<c:when test="${week.week_lec_cl eq 'BG'}">
	      <div class="card-body">
	          <div class="row">
		          <div class="col-12 col-md-9">
		              <div class="card-body">
		                  <div class="progress mb-3">
		                      <div class="progress-bar" role="progressbar" data-width="${week.sugang_req }%" aria-valuenow="${week.sugang_req }" aria-valuemin="0" aria-valuemax="100">${week.sugang_req }%</div>
		                  </div>
		                  <p><span>${week.sugang_req }분</span> / 50분</p>
		              </div>
		          </div>
		          <div class="col-12 col-md-3">
		              <div class="card-body">
		                  <a href="${cPath }/lecture/lectureVideo.do?what=${week.diary_no}" onclick="window.open(this.href, '_blanck', 'width=600, height=400'); return false" class="btn btn-icon icon-left btn-primary video">
		                      <i class="far fa-edit"></i> 학습하기
		                  </a>
		              </div>
		          </div>
		      </div>
	      </div>
      	</c:when>
      	<c:when test="${week.week_lec_cl eq 'SG'}">
    		<div class="card-body">
	          <a href="${week.rt_lec_link }" target="_blank" class="btn btn-icon icon-left btn-primary"><i class="far fa-user"></i> 실시간 강의 참여</a>
	        </div>
      	</c:when>
      </c:choose>
  	</div>
  </c:forEach>
  
  <!-- contents end -->
</div>