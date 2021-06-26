<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 14       박초원 		  주/회차 조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code }&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">주/회차 관리</li>
      </ol>
  </nav>

  <div class="text-left" style="margin-bottom:2%;">
      <a href="${cPath }/lecture/weeksForm.do" class="btn btn-icon icon-left btn-primary"><i class="fas fa-plus"></i> 주/회차 등록</a>
  </div>
  
  <c:forEach items="${weeksList }" var ="week"> 
  	<div class="card lectureList">
      <div class="card-header">
          <h4>${week.lec_week}주차 ${week.diary_title}</h4>
          <a href="${cPath }/lecture/weeksUpdate.do?what=${week.diary_no}" class="edit"><i class="fas fa-pen">&#xE254;</i></a>
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
	          <a href="${cPath }/lecture/weekVideo.do?what=${week.diary_no}" onclick="window.open(this.href, '_blanck', 'width=600, height=400'); return false" class="btn btn-icon icon-left btn-primary">
	              <i class="fas fa-video"></i> 강의영상
	          </a>
	      </div>
      	</c:when>
      	<c:when test="${week.week_lec_cl eq 'SG'}">
    		<div class="card-body">
    			<a href="${week.rt_lec_link }" target="_blank" class="btn btn-icon icon-left btn-primary"><i class="far fa-user"></i> 실시간 강의</a>
		        <a href="${cPath }/lecture/weeksAttend.do?week=${week.lec_week}" class="btn btn-warning">출결체크</a>
		    </div>
      	</c:when>
      </c:choose>
  </div>
  </c:forEach>
  <!-- contents end -->
</div>