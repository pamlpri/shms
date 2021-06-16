<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 16.      송수미        학생 시험 조회 페이지 구현
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">강의실홈</a></li>
          <li class="breadcrumb-item active" aria-current="page">시험응시</li>
      </ol>
  </nav>

  <div class="card">
      <div class="card-body">
        <table class="table table-hover text-center">
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
          	<c:choose>
          		<c:when test="${not empty examList }">	
          			<c:forEach items="${examList }" var="exam" varStatus="idx">
          				<tr>
		                  <td>${fn:length(examList) - idx.index }</td>
		                  <td>${exam.test_nm }</td>
		                  <td>${exam.test_stat }</td>
		                  <td>${exam.exam_begin_dt_char }</td>
		                  <td>${exam.exam_end_dt_char }</td>
		                  <td>
		                  	<c:choose>
		                  		<c:when test="${exam.test_stat eq '마감' }">
				                  	<a href="#" class="btn btn-primary disabled">응시불가</a>
		                  		</c:when>
		                  		<c:when test="${empty exam.applcn_no }">
			                      <a href="${cPath }/lecture/examInfo.do" class="btn btn-outline-primary">
			                      	응&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시
			                      </a>
		                  		</c:when>
		                  		<c:otherwise>
				                  	<a href="#" class="btn btn-primary disabled">응시불가</a>
		                  		</c:otherwise>
		                  	</c:choose>
		                  </td>
          				</tr>
          			</c:forEach>
          		</c:when>
          		<c:otherwise>
          			<tr>
          				<td colspan="6">표시할 시험 정보가 존재하지 않습니다.</td>
          			</tr>
          		</c:otherwise>
          	</c:choose>
          </tbody>
        </table>
    </div>
  <!-- contents end -->
  </div>
</div>