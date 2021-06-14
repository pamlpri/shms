<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 14.      송수미        교수 과제 목록 조회 기능 구현
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
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">과제관리</li>
      </ol>
  </nav>

  <div class="text-left" style="margin-bottom:2%;">
    <a href="${cPath }/lecture/reportInsert.do" class="btn btn-icon icon-left btn-primary"><i class="fas fa-plus"></i> 과제출제</a>
  </div>
  <div class="card">
    <div class="card-body">
      <table class="table text-center">
        <thead>
          <tr>
            <th scope="col">No.</th>
            <th scope="col">과제명</th>
            <th scope="col">상태</th>
            <th scope="col">채점</th>
            <th scope="col">제출</th>
            <th scope="col">마감일</th>
          </tr>
        </thead>
        <tbody>
        	<c:choose>
				<c:when test="${not empty setTaskList }">
					<c:forEach items="${setTaskList }" var="setTask" varStatus="idx">
			            <tr>
			                <td>${fn:length(setTaskList) - idx.index }</td>
			                <td>
			                	<a class="text-color" href="${cPath}/lecture/reportList.do?set_task_no=${setTask.set_task_no}">
			                		${setTask.task_title }
			                	</a>
			                </td>
			                <td>${setTask.process_at }</td>
			                <td>${setTask.grade_cnt } / ${setTask.total_cnt }</td>
			                <td>${setTask.submit_cnt} / ${setTask.total_cnt }</td>
			                <td>${setTask.submit_endde }</td>
			            </tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">표시할 과제가 없습니다.</td>
					</tr>
				</c:otherwise>        	
        	</c:choose>
        </tbody>
      </table>
  </div>
  <!-- contents end -->
  </div>
</div>