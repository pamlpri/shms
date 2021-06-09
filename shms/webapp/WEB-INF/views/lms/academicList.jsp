<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 08.      박초원        최초작성
* 2021. 06. 09.		최희수	학생 조회
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">학적관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">학적조회</li>
      </ol>
  </nav>

  <!-- contents start -->
  <section class="section">
      <div class="card">
          <div class="card-body">
              <table class="table table-striped" id="table1">
                  <thead>
                      <tr>
                          <th class="text-center">No.</th>
                          <th class="text-center">학과</th>
                          <th class="text-center">학번</th>
                          <th class="text-center">이름</th>
                          <th class="text-center">생년월일</th>
                          <th class="text-center">성별</th>
                          <th class="text-center">학년 / 학기</th>
                          <th class="text-center">학적상태</th>
                          <th class="text-center">입학유형</th>
                      </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${studentList }" var="student" varStatus="status">
                  		<tr>
                          <td class="text-center">${status.index + 1 }</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">${student.stdnt_no }</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do?stdnt_no=${student.stdnt_no }" class="text-color">${student.name }</a>
                          </td>
                          <td class="text-center">${student.regno1 }</td>
                          <c:choose>
                          	<c:when test="${student.gen eq 'F' }">
	                          <td class="text-center">여자</td>                          	
                          	</c:when>
                          	<c:otherwise>
                          	  <td class="text-center">남자</td>
                          	</c:otherwise>
                          </c:choose>
                          <td class="text-center">${student.grade }학년 ${student.semstr }학기</td>
                          <td class="text-center">${student.reginfo_stat }</td>
                          <td class="text-center">신입학</td>
                      </tr>
                  	</c:forEach>
                  </tbody>
              </table>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>