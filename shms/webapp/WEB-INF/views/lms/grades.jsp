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
                                  <th class="text-center">등급</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td class="text-center">2012학년도 / 1학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">B0</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2012학년도 / 2학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2013학년도 / 1학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2013학년도 / 2학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2014학년도 / 1학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2014학년도 / 2학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <th class="text-center">누계</th>
                                  <th class="text-center">126</th>
                                  <th class="text-center">126</th>
                                  <th class="text-center">420</th>
                                  <th class="text-center">3.05</th>
                                  <th class="text-center">80.15</th>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      <h4 class="h4Title"><i class="fas fa-minus"></i> 성적조회</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="row">
                  <div class="col-lg-12 row">
                      <div class="col-md-3 mb-4">
                          <h6>학년도</h6>
                          <fieldset class="form-group">
                              <select id="seachYear" class="form-select" name="year">
                              	  <option>--년--</option>
                                  <c:forEach items="${lecYearList }" var="lecYear">
                                  	<option value=${lecYear.year }>${lecYear.year }</option>
                                  </c:forEach>
                              </select>
                          </fieldset>
                      </div>
                      <div class="col-md-3 mb-4">
                          <h6>학기</h6>
                          <fieldset class="form-group">
                              <select id="seachSemstr" class="form-select" name="semstr">
                              	  <option>--학기--</option>
                                  <option value="1">1학기</option>
                                  <option value="2">2학기</option>
                              </select>
                          </fieldset>
                      </div>
                  </div>
              </div>

              <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                  <tr>
                      <th class="align-middle text-center">학년도 / 학기</th>
                      <td id="ysData" class="align-middle text-center">전체 학년 / 전체 학기</td>
                      <th class="align-middle text-center">신청학점 / 취득학점</th>
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
	                          				<td>${lecScore.scre_no }</td>
	                          				<td>${lecScore.lec_name }</td>
	                          				<td>${lecScore.name }</td>
	                          				<td>${lecScore.lec_cl_nm }</td>
	                          				<td>${lecScore.lec_pnt }</td>
	                          				<td>${lecScore.total }</td>
	                          				<td>${lecScore.pnt_rank_nm }</td>
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
  <input type="hidden" name="year" value="" />
  <input type="hidden" name="semstr" value="" />
  <!-- contents end -->
  <script type="text/javascript">
  	$(function() {
  		function ajaxFunction() {
			let search = {
				"year" : $("input[name='year']").val()
				, "semstr" : $("input[name='semstr']").val()
			}
	  		$.ajax({
	  			url:"${cPath}/lms/lesScoreList.do"
	  			, method: "post"
	  			, dataType: "json"
	  			, data : search
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
	  				let ysDate = search.year + "년도 / " + search.semstr + "학기"
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
				url:"${cPath}/lms/totalCredit.do"
	  			, method: "post"
	  			, dataType: "json"
	  			, data : search
	  			, success: function(res) {
	  				$("#totalCredit").html(res + " / " + res);
	  			}
	  			, error: function(xhr, error, msg) {
	  				console.log(xhr);
	  				console.log(error);
	  				console.log(msg);
	  			}
			});
			
			$.ajax({
				url:"${cPath}/lms/average.do"
	  			, method: "post"
	  			, dataType: "json"
	  			, data : search
	  			, success: function(res) {
// 	  				console.log(res.totalPntVal);
// 	  				console.log(res.selectTotalAvg);
	  				$("#totalData").html(res.selectTotalAvg + " / " + res.totalPntVal);
	  			}
	  			, error: function(xhr, error, msg) {
	  				console.log(xhr);
	  				console.log(error);
	  				console.log(msg);
	  			}
			});
  		}
  		$("[name='year']").on("change", function() {
  			let seachYear = $(this).val();
  			$("input[name='year']").val(seachYear);
  			ajaxFunction();
  		});
  		$("[name='semstr']").on("change", function() {
  			let seachSemstr = $(this).val();
  			$("input[name='semstr']").val(seachSemstr);
  			ajaxFunction();
  		});
  	});
  </script>
</div>