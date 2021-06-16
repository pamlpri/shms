<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 16. 	    박초원        조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
          <li class="breadcrumb-item active" aria-current="page">시험관리</li>
      </ol>
  </nav>

  <div class="text-left" style="margin-bottom:2%;">
    <a href="${cPath }/lecture/examAdminForm.do" class="btn btn-icon icon-left btn-primary"><i class="fas fa-plus"></i> 시험출제</a>
  </div>

  <div class="card">
    <div class="card-body">
      <table class="table text-center">
        <thead>
          <tr>
            <th scope="col">No.</th>
            <th scope="col">시험명</th>
            <th scope="col">상태</th>
            <th scope="col">시험시작</th>
            <th scope="col">시험종료</th>
            <th scope="col">응시</th>
          </tr>
        </thead>
        <tbody>
        	<c:forEach items="${examList }" var="exam" varStatus="i">
	       		<tr>
	                <td>${fn:length(examList) - i.index }</td>
	                <td><a class="text-color" href="${cPath }/lecture/examAdminList.do?what=${exam.exam_no}">${exam.test_nm }</a></td>
	                <td>${exam.test_stat }</td>
	                <td>${exam.exam_begin_dt_char }</td>
	                <td>${exam.exam_end_dt_char }</td>
	                <td>${exam.exam_cnt} / ${exam.stdnt_cnt }</td>
	            </tr>
        	</c:forEach>
        </tbody>
      </table>
  </div>
  <!-- contents end -->
  </div>
</div>