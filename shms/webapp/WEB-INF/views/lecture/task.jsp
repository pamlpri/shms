<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 15.      송수미        학생 과제 조회
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
          <li class="breadcrumb-item"><a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/lectureWeek.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">과제제출</li>
      </ol>
  </nav>

  <div class="card">
      <div class="card-body">
        <table class="table text-center">
          <thead>
            <tr>
              <th scope="col">No.</th>
              <th scope="col">과제명</th>
              <th scope="col">상태</th>
              <th scope="col">점수</th>
              <th scope="col">배점</th>
              <th scope="col">마감일</th>
              <th scope="col">제출</th>
            </tr>
          </thead>
          <tbody>
          	<c:choose>
          		<c:when test="${not empty taskList }">
          			<c:forEach items="${taskList }" var="task" varStatus="idx">
		              <tr>
		                  <td>${fn:length(taskList) - idx.index }</td>
		                  <td>${task.task_title }</td>
		                  <td>${task.process_at }</td>
		                  <td>${task.submitList[0].task_score }</td>
		                  <td>${task.task_allot }</td>
		                  <td>${task.submit_endde }</td>
		                  <c:set var="disabled" value="${task.process_at eq '마감'? 'disabled' : '' }"/>
		                  <td>
		                  	<c:choose>
		                  		<c:when test="${empty task.submitList[0].submit_no }">
				                  	<a href="${cPath}/lecture/taskInsert.do?set_task_no=${task.set_task_no}" class="btn btn-outline-primary ${disabled }">
				                      	제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출
				                  	</a>
		                  		</c:when>
		                  		<c:otherwise>
				                	<a href="${cPath}/lecture/taskUpdate.do?set_task_no=${task.set_task_no}&submit_no=${task.submitList[0].submit_no}" class="btn btn-primary ${disabled }">제출완료</a>
		                  		</c:otherwise>
		                  	</c:choose>
		                  </td>
		              </tr>
          			</c:forEach>
          		</c:when>
          		<c:otherwise>
          			<tr>
          				<td colspan="7"> 제출해야 하는 과제가 없습니다.</td>
          			</tr>
          		</c:otherwise>
          	</c:choose>
          </tbody>
        </table>
    </div>
  <!-- contents end -->
</div>
</div>