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
	                  <form class="card-body table-scroll" id="table-scroll">
	                    <div class="table-responsive table-wrap">
	                      <div class="text-right excelWrap">
	                          <button type="button" class="btn btn-warning" id="gradeBtn">성적부 반영</button>
	                          <button class="btn btn-icon btn-primary" type="button" onclick="AttendStudentToExcelConverter()"><i class="far fa-file"></i> Excel 다운로드</button>
	                      </div>
	                      <table class="table table-striped main-table" id="attendance-table">
	                          <thead>                                 
		                          <tr>
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
		                          	  	  <input type="hidden" name="attendList[${i.index }].grade" value="${attend.grade}"/>
		                          	  	  <input type="hidden" name="attendList[${i.index }].semstr" value="${attend.semstr}"/>
		                          	  	  <input type="hidden" name="attendList[${i.index }].year" value="${attend.year}"/>
		                          	  	  <input type="hidden" name="attendList[${i.index }].stdnt_no" value="${attend.stdnt_no}"/>
		                          	  	  <input type="hidden" name="attendList[${i.index }].lec_code" value="${lec_code}"/>
		                          	  	  <input type="hidden" name="attendList[${i.index }].cs_cnt" value="${attend.cs_cnt}"/>
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
				                              	<c:when test="${attend[week] eq 'JG' or attend[week] eq 'JT'}">
				                              		<td class="text-center wee">&#9650;</td>
				                              	</c:when>
				                              	<c:when test="${attend[week] eq 'GS'}">
				                              		<td class="text-center">X</td>
				                              	</c:when>
				                              	<c:otherwise>
				                              		<td class="text-center">　</td>
				                              	</c:otherwise>
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
	                 </form>
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
	   		"targets": [3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21],
	   		"orderable": false
   		}]
    	,"order": [[ 1, "asc" ]]
    });
} );

$("#gradeBtn").on("click", function(){
	let table = $('<table>').append($("#attendance-table").DataTable().$('tr').clone()).attr("class", "allTable").css("display", "none");
	$("body").append(table);
	let len = $(table).find("tr").length;
	
	var toData = new Object();
	var dataList = new Array();
	for(var i = 0; i < len; i++){
		var data = new Object();
		data["grade"] = $(".allTable").find("input[name='attendList["+ i +"].grade']").val();
		data["semstr"] = $(".allTable").find("input[name='attendList["+ i +"].semstr']").val();
		data["year"] = $(".allTable").find("input[name='attendList["+ i +"].year']").val();
		data["stdnt_no"] = $(".allTable").find("input[name='attendList["+ i +"].stdnt_no']").val();
		data["lec_code"] = $(".allTable").find("input[name='attendList["+ i +"].lec_code']").val();
		data["cs_cnt"] = $(".allTable").find("input[name='attendList["+ i +"].cs_cnt']").val();
		dataList.push(data);
	}
	toData["attendList"] = dataList;
	console.log(toData);
	
	$.ajax({
		method : "post"
		, url : "${cPath }/lecture/attendGrade.do"
		, data : JSON.stringify(toData)
		, dataType : "json"
		, contentType : "application/json"
		, success : function(resp){
			console.log(resp)
			if(resp.result == "OK"){
				alert("성공");
			}else {
				alert("실패");
			}
		},error : function(xhr, error, msg){ 
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}
	});
});
</script>