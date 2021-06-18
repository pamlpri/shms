<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
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
		<h1>${lec_name}</h1>
	 </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/lectureInfo.do">강의실 홈</a></li>
          <li class="breadcrumb-item active" aria-current="page">출석관리</li>
      </ol>
  </nav>

  <section class="section">
      <div class="section-body">
          <h2 class="section-title">출석관리</h2>
          <div class="row">
              <div class="col-12">
                  <div class="card">
                  <div class="card-body table-scroll" id="table-scroll">
                    <div class="table-responsive table-wrap">
                      <div class="text-right excelWrap">
                          <a href="#" class="btn btn-warning">성적부 반영</a>
                          <button class="btn btn-icon btn-primary" type="button" onclick="AttendStudentToExcelConverter()"><i class="far fa-file"></i> Excel 다운로드</button>
                      </div>
                      <table class="table table-striped main-table" id="attendance-table">
                          <thead>                                 
	                          <tr>
	                              <th class="text-center">No.</th>
	                              <th class="text-center">이름</th>
	                              <th class="text-center">학번</th>
	                              <th class="text-center">학과</th>
	                              <th class="text-center">1주</th>
	                              <th class="text-center">2주</th>
	                              <th class="text-center">3주</th>
	                              <th class="text-center">4주</th>
	                              <th class="text-center">5주</th>
	                              <th class="text-center">6주</th>
	                              <th class="text-center">7주</th>
	                              <th class="text-center">8주</th>
	                              <th class="text-center">9주</th>
	                              <th class="text-center">10주</th>
	                              <th class="text-center">11주</th>
	                              <th class="text-center">12주</th>
	                              <th class="text-center">13주</th>
	                              <th class="text-center">14주</th>
	                              <th class="text-center">15주</th>
	                              <th class="text-center">출석</th>
	                              <th class="text-center">지각</th>
	                              <th class="text-center">조퇴</th>
	                              <th class="text-center">결석</th>
	                          </tr>
                          </thead>
                          <tbody>
                          	  <c:forEach items="${attendList }" var="attend" varStatus="i">
		                          <tr>
		                              <td class="text-center">${i.count }</td>
		                              <td class="text-center">
		                                  <a class="text-color" href="${cPath}/lecture/attendance.do?what=${attend.stdnt_no}">${attend.name }</a>
		                              </td>
		                              <td class="text-center">
		                              	 <a class="text-color" href="${cPath}/lecture/attendance.do?what=${attend.stdnt_no}">${attend.stdnt_no }</a>
		                              </td>
		                              <td class="text-center">${attend.sub_name }</td>
		                              <c:forEach varStatus="idx" begin="1" end="15">
			                              <c:set var="week" value="week${idx.count}" />
			                              <c:choose>
			                              	<c:when test="${attend[week] eq 'CS'}">
			                              		<td class="text-center">O </td>
			                              	</c:when>
			                              	<c:when test="${attend[week] eq 'JG' and 'JT'}">
			                              		<td class="text-center">▲</td>
			                              	</c:when>
			                              	<c:when test="${attend[week] eq 'GS'}">
			                              		<td class="text-center">X</td>
			                              	</c:when>
			                              	<c:when test="${empty attend[week]}">
			                              		<td class="text-center"> </td>
			                              	</c:when>
			                              </c:choose>
		                              </c:forEach>
		                              <td class="text-center">${attend.cs_cnt }</td>
		                              <td class="text-center">${attend.jg_cnt }</td>
		                              <td class="text-center">${attend.jt_cnt }</td>
		                              <td class="text-center">${attend.gs_cnt }</td>
		                          </tr>
                          	  </c:forEach>                        
                          </tbody>
                      </table>
                      </div>
                  </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>
<script>
$(document).ready(function() {
    $('#attendance-table').DataTable({
    	"columnDefs": [ {
	   		"targets": [4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22],
	   		"orderable": false
   		}]
    });
} );
</script>