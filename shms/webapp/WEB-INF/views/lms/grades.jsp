<%--
* [[개정이력(Modification Information)]]
* 수정일            수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lms/grades.do">성적관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">성적조회</li>
      </ol>
  </nav>


  <section class="section">
      <h4 class="h4Title"><i class="fas fa-minus"></i> 학적정보</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
                  <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                      <tr>
                          <th class="align-middle text-center">학번</th>
                          <td class="align-middle">${student.stdnt_no }</td>
                          <th class="align-middle text-center">이름</th>
                          <td class="align-middle">${student.name }</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">주민번호</th>
                          <td class="align-middle">${student.regno1 } - ${student.regno2 }</td>
                          <th class="align-middle text-center">학적상태</th>
                          <td class="align-middle">${student.reginfo_stat }</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">학과</th>
                          <td class="align-middle">${subject.sub_name }</td>
                          <th class="align-middle text-center">학년 / 년제</th>
                          <td class="align-middle">${student.grade }학년 / 4년제</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">입학일</th>
                          <td class="align-middle">${student.entsch_de }</td>
                          <th class="align-middle text-center">졸업일</th>
                          <td class="align-middle">${student.grdtn_de }</td>
                      </tr>
                  </table>
              </div>
          </div>
      </div>
      
      <h4 class="h4Title"><i class="fas fa-minus"></i> 성적누계</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
                  <div class="table-responsive">
                      <table class="table table-bordered mb-0" style="border-color: #dfdfdf;">
                          <thead>
                              <tr>
                                  <th class="text-center">학년도 / 학기</th>
                                  <th class="text-center">신청학점</th>
                                  <th class="text-center">취득학점</th>
                                  <th class="text-center">평점계</th> 
                                  <th class="text-center">평점평균</th>
                              </tr>
                          </thead>
                          <tbody>
                          	<c:choose>
                          		<c:when test="${not empty selectStatisticsList }">
                          			<c:set value="${fn:length(selectStatisticsList) }" var="totalCnt" />
                          			<c:forEach items="${selectStatisticsList }" var="statistics" varStatus="status">
                          				<c:set var="totalPntVal" value="${totalPntVal + statistics.totalPntVal}"/>
                          				<c:set var="totalAvg" value="${totalAvg + statistics.totalAvg}"/>
                          				<c:set var="totalCredit" value="${totalCredit + statistics.totalCredit }" />
                          			</c:forEach>
                                    <fmt:formatNumber var="totalPntVal" value="${totalPntVal/totalCnt}" pattern="#.#"/>
                                    <fmt:formatNumber var="totalAvg" value="${totalAvg/totalCnt}" pattern="#.#"/>
		                          	<c:forEach items="${selectStatisticsList }" var="statistic" varStatus="status">
		                          		<tr>
		                                  <td class="text-center">${statistic.year }학년도 / ${statistic.semstr }학기</td>
		                                  <td class="text-center">${statistic.totalCredit }</td>
		                                  <td class="text-center">${statistic.totalCredit }</td>
		                                  <fmt:formatNumber var="pntval" value="${statistic.totalPntVal}" pattern="#.#"/>
                                    	  <fmt:formatNumber var="avg" value="${statistic.totalAvg}" pattern="#.#"/>
		                                  <td class="text-center">${avg }</td>
		                                  <td class="text-center">${pntval }</td>
		                              </tr>
		                          	</c:forEach>
                          		</c:when>
                          		<c:otherwise>
                          			<tr>
                          				<td class="text-center" colspan="6">
                          					데이터가 없습니다.
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
      <h4 class="h4Title"><i class="fas fa-minus"></i> 성적조회</h4>
      <div class="card inputTable">
          <div class="card-body">
              <form class="row" id="searchForm">
                  <div class="col-lg-12 row">
                      <div class="col-md-3 mb-4">
                          <h6>학년도</h6>
                          <fieldset class="form-group">
                              <select id="seachYear" class="form-select" name="year">
                              	  <option value="">전체 년도</option>
                                  <c:forEach items="${lecYearList }" var="lecYear" varStatus="i">
                                  	<option value="${lecYear.year }" selected="${i.end?'selected':'' }">${lecYear.year }</option>
                                  </c:forEach>
                              </select>
                          </fieldset>
                      </div>
                      <div class="col-md-3 mb-4">
                          <h6>학기</h6>
                          <fieldset class="form-group">
                              <select id="searchSemstr" class="form-select" name="semstr">
                              	  <option value="">전체 학기</option>
                              	  <c:forEach items="${selectSemstrList }" var="semstr" varStatus="i">
                              	  	<option class="${semstr.year }" value="${semstr.semstr }" selected="${i.end?'selected':'' }">${semstr.semstr }학기</option>
                              	  </c:forEach>
                              </select>
                          </fieldset>
                      </div>
                  </div>
              </form>

              <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                  <tr>
                      <th class="align-middle text-center">학년도 / 학기</th>
                      <td id="ysData" class="align-middle text-center">전체 학년 / 전체 학기</td>
                      <th class="align-middle text-center">신청학점 / 이수학점</th>
                      <td id="totalCredit" class="align-middle text-center">${totalCredit } / ${totalCredit }</td>
                      <th class="align-middle text-center">평점 / 평균</th>
                      <td id="totalData" class="align-middle text-center">${totalAvg } / ${totalPntVal }</td>
                  </tr>
              </table>

              <div class="table-responsive">
                  <div class="table-responsive">
                      <table class="table table-bordered mb-0" style="border-color: #dfdfdf;">
                          <thead>
                              <tr>
                                  <th class="text-center">강의코드</th>
                                  <th class="text-center">강의명</th>
                                  <th class="text-center">담당교수</th>
                                  <th class="text-center">이수구분</th> 
                                  <th class="text-center">학점</th>
                                  <th class="text-center">점수</th>
                                  <th class="text-center">등급</th>
                              </tr>
                          </thead>
                          <tbody id="lecTbody">
                          	<c:choose>
                          		<c:when test="${not empty lecScoreList }">
                          			<c:forEach items="${lecScoreList }" var="lecScore">
	                          			<tr>
	                          				<td class="text-center">${lecScore.scre_no }</td>
	                          				<td class="text-center">${lecScore.lec_name }</td>
	                          				<td class="text-center">${lecScore.name }</td>
	                          				<td class="text-center">${lecScore.lec_cl_nm }</td>
	                          				<td class="text-center">${lecScore.lec_pnt }</td>
	                          				<td class="text-center">${lecScore.total }</td>
	                          				<td class="text-center">${lecScore.pnt_rank_nm }</td>
	                          			</tr>
                          			</c:forEach>
                          		</c:when>
                          		<c:otherwise>
                          			<tr>
                          				<td class="text-center" colspan="7">등록된 성적이 없습니다.</td>
                          			</tr>
                          		</c:otherwise>
                          	</c:choose>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
  <script type="text/javascript">
  	let year = $("select[name='year']").val();
	let semstr = $("select[name='semstr']").val();
  	$(function() {
  		$.ajax({
  			url:"${cPath}/lms/grades.do"
  	  			, method: "post"
  	  			, dataType: "json"
  	  			, data : {"year" : year, "semstr" : semstr}
  	  			, success: function(res) {
  	  				let tbodyData;
  	  				let totalCredit;
  	  				$.each(res, function(idx, v) {
  	  					tbodyData += "<tr>";
  	  					tbodyData += "<td class='text-center'>" + v.scre_no + "</td>";
  	  					tbodyData += "<td class='text-center'>" + v.lec_name + "</td>";
  	  					tbodyData += "<td class='text-center'>" + v.name + "</td>";
  	  					tbodyData += "<td class='text-center'>" + v.lec_cl_nm + "</td>";
  	  					tbodyData += "<td class='text-center'>" + v.lec_pnt + "</td>";
  	  					tbodyData += "<td class='text-center'>" + v.total + "</td>";
  	  					tbodyData += "<td class='text-center'>" + v.pnt_rank_nm + "</td>";
  		  				tbodyData += "</tr>";
  	  				});
  	  				let ysDate = year + "년도 / " + semstr + "학기"
  	  				$("#ysData").html(ysDate);
  	  				$("#lecTbody").html(tbodyData);
  	  			}
  	  			, error: function(xhr, error, msg) {
  	  				console.log(xhr);
  	  				console.log(error);
  	  				console.log(msg);
  	  			}
  		});
  	})
	let subjectTag = $("[name='semstr']");
	$("[name='year']").on("change", function(){
		let selectedCode = $(this).val();
		subjectTag.val("");
		if(selectedCode){
			subjectTag.find("option").hide();
			subjectTag.find("option."+selectedCode).show();
		} else if(selectedCode == null || selectedCode == '') {
			subjectTag.find("option").hide();
		} else {
			subjectTag.find("option").show();
		}
		subjectTag.find("option:first").show();
	});
	
	let searchForm = $("#searchForm").on("change", ":input[name]", function(){
		let year = $("select[name='year']").val();
		let semstr = $("select[name='semstr']").val();
		ajaxFunction(year, semstr);
	});
	function ajaxFunction(year, semstr) {
  		$.ajax({
  			url:"${cPath}/lms/grades.do"
  			, method: "post"
  			, dataType: "json"
  			, data : {"year" : year, "semstr" : semstr}
  			, success: function(res) {
  				let tbodyData;
  				let totalCredit;
  				$.each(res, function(idx, v) {
  					tbodyData += "<tr>";
  					tbodyData += "<td class='text-center'>" + v.scre_no + "</td>";
  					tbodyData += "<td class='text-center'>" + v.lec_name + "</td>";
  					tbodyData += "<td class='text-center'>" + v.name + "</td>";
  					tbodyData += "<td class='text-center'>" + v.lec_cl_nm + "</td>";
  					tbodyData += "<td class='text-center'>" + v.lec_pnt + "</td>";
  					tbodyData += "<td class='text-center'>" + v.total + "</td>";
  					tbodyData += "<td class='text-center'>" + v.pnt_rank_nm + "</td>";
	  				tbodyData += "</tr>";
  				});
  				let ysDate = year + "년도 / " + semstr + "학기"
  				$("#ysData").html(ysDate);
  				$("#lecTbody").html(tbodyData);
  			}
  			, error: function(xhr, error, msg) {
  				console.log(xhr);
  				console.log(error);
  				console.log(msg);
  			}
  		});
		
		$.ajax({
			url:"${cPath}/lms/statistics.do"
  			, method: "post"
  			, dataType: "json"
  			, data :  {"year" : year, "semstr" : semstr}
  			, success: function(res) {
  				let totalCredit = 0;
  				let totalPntval = 0.0;
  				let totalAvg = 0.0;
  				let num = 0;
  				$.each(res, function(idx, v) {
  					totalCredit += v.totalCredit;
  					totalPntval += v.totalPntVal;
  					totalAvg += v.totalAvg;
  					num = idx + 1;
  				});
  				$("#totalCredit").html(totalCredit + " / " + totalCredit);
  				$("#totalData").html((Math.round((totalAvg/num) * 10) / 10) + " / " + (Math.round((totalPntval/num) * 10) / 10));
  			}
  			, error: function(xhr, error, msg) {
  				console.log(xhr);
  				console.log(error);
  				console.log(msg);
  			}
		});
	}
			
  </script>
</div>