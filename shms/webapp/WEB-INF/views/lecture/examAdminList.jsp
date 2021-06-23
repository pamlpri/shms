<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 16. 	    박초원        조회
2021. 6. 22. 	  박초원			 서술형, 단답형 채점, 성적 수정
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
      <!-- 강의명 -->
      <h1>${lec_name }</h1>
    </div>
  </section>
  
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code }&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">시험관리</li>
      </ol>
  </nav>

  <div class="card attendance">
      <div class="card-body">
        <div class="table-responsive">
          <div class="text-right excelWrap">
          	<c:choose>
          		<c:when test="${exam.test_stat ne '마감' }">
		            <a href="${cPath }/lecture/examUpdate.do?what=${exam.exam_no}" class="btn btn-icon btn-primary"><i class="fas fa-pen"></i> 시험수정</a>
          		</c:when>
          	</c:choose>
          </div>
          <table class="table table-bordered table-md">
          	<colgroup>
          		<col width="20%" />
          		<col width="80%" />
          	</colgroup>
            <tr>
              <th>시험분류</th>
              <td class="text-left">${exam.test_nm }</td>
            </tr>
            <tr>
              <th>시험형식</th>
              <td class="text-left">
              	<c:choose>
              		<c:when test="${exam.online_at eq 'Y'}">온라인</c:when>
              		<c:when test="${exam.online_at eq 'N'}">오프라인</c:when>
              	</c:choose>
              </td>
            </tr>
            <tr>
              <th>시험유형</th>
              <td class="text-left">
              	<c:choose>
              		<c:when test="${exam.exam_type eq 'TH'}">혼합식</c:when>
              		<c:when test="${exam.exam_type eq 'GG'}">객관식</c:when>
              		<c:when test="${exam.exam_type eq 'DD'}">주관식 단답형</c:when>
              		<c:when test="${exam.exam_type eq 'SS'}">주관식 서술형</c:when>
              	</c:choose>
              </td>
            </tr>
           	<c:if test="${not empty exam.gg_sum}">
	            <tr>
	              <th>객관식</th>
	              <td class="text-left">${exam.gg_sum }점</td>
	            </tr>
           	</c:if>
           	<c:if test="${not empty exam.dd_sum }">
	            <tr>
	              <th>단답형</th>
	              <td class="text-left">${exam.dd_sum }점</td>
	            </tr>
           	</c:if>
           	<c:if test="${not empty exam.ss_sum }">
	            <tr>
	              <th>서술형</th>
	              <td class="text-left">${exam.ss_sum }점</td>
	            </tr>
           	</c:if>
            <tr>
              <th>총점</th>
              <td class="text-left">${exam.ques_sum }점</td>
            </tr>
            <tr>
              <th>시험시작</th>
              <td class="text-left">${exam.exam_begin_dt_char }</td>
            </tr>
            <tr>
              <th>시험종료</th>
              <td class="text-left">${exam.exam_end_dt_char }</td>
            </tr>
            <tr>
              <th>시험시간</th>
              <td class="text-left">${exam.exam_time }분</td>
            </tr>
            <tr>
              <th>응시</th>
              <td class="text-left">${exam.exam_cnt } / ${exam.stdnt_cnt }</td>
            </tr>
          </table>
        </div>
      </div>

      <div class="card-body table-scroll" id="table-scroll">
          <div class="text-right excelWrap" style="margin-top: -2%;">
          	  <button type="button" class="btn btn-warning" id="gradeBtn">성적부 반영</button>
              <button class="btn btn-icon btn-primary" type="button" onclick="ExamStudentToExcelConverter()"><i class="far fa-file"></i> Excel 다운로드</button>
          </div>
          <form id="examForm">
	          <div class="table-responsive table-wrap">
	              <table class="table table-striped main-table edit-table" id="report-table">
	                  <thead>                                 
	                  <tr>
	                      <th class="text-center">이름</th>
	                      <th class="text-center">학번</th>
	                      <th class="text-center">학과</th>
	                      <th class="text-center">상태</th>
	                      <c:if test="${not empty exam.gg_sum}">
		                      <th class="text-center">객관식</th>
	                      </c:if>
	                      <c:if test="${not empty exam.dd_sum }">
		                      <th class="text-center">주관식</th>
	                      </c:if>
	                      <c:if test="${not empty exam.ss_sum }">
		                      <th class="text-center">서술형</th>
	                      </c:if>
	                      <th class="text-center">총점</th>
	                      <th class="text-center">비고</th>
	                  </tr>
	                  </thead>
	                  <tbody>
	                  	<c:forEach items="${studentList }" var="student" varStatus="i">
	                  		 <tr class="${student.applcn_no }">
	                  		  <input type="hidden" name="examList[${i.index }].grade" value="${student.grade}"/>
                       	  	  <input type="hidden" name="examList[${i.index }].semstr" value="${student.semstr}"/>
                       	  	  <input type="hidden" name="examList[${i.index }].year" value="${student.year}"/>
                       	  	  <input type="hidden" name="examList[${i.index }].stdnt_no" value="${student.stdnt_no}"/>
                       	  	  <input type="hidden" name="examList[${i.index }].lec_code" value="${lec_code}"/>
	                  		  <input type="hidden" name="examList[${i.index }].test_cl" value="${student.test_cl}"/>
	                   	  	  <input type="hidden" name="examList[${i.index }].res_score" value="${student.res_score}" class="res_score"/>
		                	  <c:choose>
		                	  	<c:when test="${empty exam.dd_sum and empty exam.ss_sum}">
		                	  		<td class="text-center">${student.name }</td>
		                	  		<td class="text-center">${student.stdnt_no }</td>
		                	  	</c:when>
		                	  	<c:when test="${student.applcn_at eq '미응시'  }">
		                	  		<td class="text-center">${student.name }</td>
		                	  		<td class="text-center">${student.stdnt_no }</td>
		                	  	</c:when>
		                	  	<c:otherwise>
		                  		 <c:url value="/lecture/examOMR.do" var="omrUrl">
			                		<c:param name="exam_no" value="${student.exam_no}"/>
			                		<c:param name="stdnt_no" value="${student.stdnt_no}"/>
			                	 </c:url>
			                      <td class="text-center">
			                      	<a href="${omrUrl}" class="text-color">${student.name }</a>
			                      </td>
			                      <td class="text-center">
			                      	<a href="${omrUrl}" class="text-color">${student.stdnt_no }</a>
			                      </td>
		                	  	</c:otherwise>
		                	  </c:choose>
		                      <td class="text-center">${student.sub_name }</td>
		                      <td class="text-center">${student.applcn_at }</td>
		                      <c:if test="${not empty exam.gg_sum}">
			                      <td class="text-center">${empty student.gg_sum ? '' : student.gg_sum }</td>
		                      </c:if>
		                      <c:if test="${not empty exam.dd_sum }">
			                      <td class="text-center">${empty student.dd_sum ? '' : student.dd_sum }</td>
		                      </c:if>
		                      <c:if test="${not empty exam.ss_sum }">
			                      <td class="text-center">${empty student.ss_sum ? '' : student.ss_sum }</td>
		                      </c:if>
		                      <td class="text-center res_score">${empty student.res_score ? 0 : student.res_score } / 100</td>
		                      <td class="text-center noExl">
			                      <c:if test="${not empty student.res_score }">
			                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
			                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
			                      </c:if>
		                      </td>
		                  </tr>
	                  	</c:forEach>  
	                  </tbody>
	              </table>
	          </div>
          </form>
      </div>
    </div>
    
    <div class="modal fade" tabindex="-1" role="dialog" id="fire-modal-2" style="display: block; padding-right: 17px;">
		<div class="modal-dialog modal-md modal-dialog-centered"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body" style="padding:35px 25px;"></div>
			</div>
		</div>
	</div>
	<div class="modal-backdrop fade"></div>
	
  <!-- contents end -->
</div>
<script>
$("body").removeClass("modal-open").css("padding-right","0px");
$(".modal-backdrop").removeClass("show").css("display", "none");
$(".modal").removeClass("show").css("display", "none");

$(document).ready(function(){
	$('#report-table').DataTable({
    	"columnDefs": [ {
	   		"targets": [6],
	   		"orderable": false
   		}]
    	,"order": [[ 1, "asc" ]]
    });
	
    $('[data-toggle="tooltip"]').tooltip();
    var actions = $("table td:last-child").html();
    // Append table with add row form on add new button click
    
    // Add row on add button click
    $(document).on("click", ".add", function(){
    	let applcn_no = parseInt($(this).parents("tr").attr("class"));
    	console.log(applcn_no);
    	let res_score = 0;
    	
        var empty = false;
        var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function(){
            if(!$(this).val()){
                $(this).addClass("error");
                empty = true;
            } else{
                $(this).removeClass("error");
            }
        });
        $(this).parents("tr").find(".error").first().focus();
        if(!empty){
        	input.each(function(){
        		let that = $(this);
        		res_score = $("input[name='res_score']").val().split("/")[0].trim();
        		if(res_score <= 100){
	              $.ajax({
	              	url : "${cPath}/lecture/examResScore.do"
	              	,method: "post"
	              	,data : {
	              		applcn_no : applcn_no,
	              		res_score : res_score
	              	},dataType : "json"
	              	,success: function(resp){
	              		if(resp.result == "OK"){
			                $(that).parents("tr").find(".add, .edit").toggle();
			                $(that).parents("tr").children("input.res_score").val(res_score);
			                $(that).parent("td").text(res_score + " / 100");
			                $(".add-new").removeAttr("disabled");
			                $(".modal-title").text("수정완료");
			            	$(".modal-body").html("수정이 완료되었습니다.");
			            	$("body").addClass("modal-open").css("padding-right", "17px");
			            	$(".modal-backdrop").addClass("show").css("display", "block");
			            	$(".modal").addClass("show").css("display", "block");
	              		}else{
	              			$(".modal-title").text("수정실패");
			            	$(".modal-body").html("수정에 실패했습니다.<br/>잠시후 다시 시도해주세요.");
			            	$("body").addClass("modal-open").css("padding-right", "17px");
			            	$(".modal-backdrop").addClass("show").css("display", "block");
			            	$(".modal").addClass("show").css("display", "block");
	              		}
	              	}, error : function(xhr, resp, error){
	           			console.log(xhr);
	           		}
             	 });
        		}else {
        			$(".modal-title").text("수정실패");
	            	$(".modal-body").html("출제한 시험의 총 점수를 초과할 수 없습니다.");
	            	$("body").addClass("modal-open").css("padding-right", "17px");
	            	$(".modal-backdrop").addClass("show").css("display", "block");
	            	$(".modal").addClass("show").css("display", "block");
        		}
        	});
        }		
    });
    // Edit row on edit button click
    $(document).on("click", ".edit", function(){
    	let len = $(this).parents("tr").find("td").length;
        $(this).parents("tr").find("td").eq(len-2).each(function(){
        	let idx = $(this).data("idx");
            $(this).html('<input type="text" class="form-control" name="res_score" value="' + $(this).text() + '">');
        });		
        $(this).parents("tr").find(".add, .edit").toggle();
        $(".add-new").attr("disabled", "disabled");
    });
   
    
    $("#gradeBtn").on("click", function(){
    	let table = $('<table>').append($("#report-table").DataTable().$('tr').clone()).attr("class", "allTable").css("display", "none");
    	$("body").append(table);
    	let len = $(table).find("tr").length;
    	
    	let loadingImg = " <img src='${cPath}/resources/lecture/dist/img/loading.gif' style='display: block; margin: 0px auto;'/>";
    	
    	$(".modal-title").text("성적부반영중..");
    	$(".modal-body").html(loadingImg);
    	$("body").addClass("modal-open").css("padding-right", "17px");
    	$(".modal-backdrop").addClass("show").css("display", "block");
    	$(".modal").addClass("show").css("display", "block");
    	
    	var toData = new Object();
    	var dataList = new Array();
    	for(var i = 0; i < len; i++){
    		var data = new Object();
    		data["grade"] = $(".allTable").find("input[name='examList["+ i +"].grade']").val();
    		data["semstr"] = $(".allTable").find("input[name='examList["+ i +"].semstr']").val();
    		data["year"] = $(".allTable").find("input[name='examList["+ i +"].year']").val();
    		data["stdnt_no"] = $(".allTable").find("input[name='examList["+ i +"].stdnt_no']").val();
    		data["lec_code"] = $(".allTable").find("input[name='examList["+ i +"].lec_code']").val();
    		data["res_score"] = $(".allTable").find("input[name='examList["+ i +"].res_score']").val();
    		data["test_cl"] = $(".allTable").find("input[name='examList["+ i +"].test_cl']").val();
    		dataList.push(data);
    	}
    	toData["examList"] = dataList;
    	console.log(toData);
    	
    	$.ajax({
    		method : "post"
    		, url : "${cPath }/lecture/examGrade.do"
    		, data : JSON.stringify(toData)
    		, dataType : "json"
    		, contentType : "application/json"
    		, success : function(resp){
    			console.log(resp)
    			if(resp.result == "OK"){
    				$(".modal-title").text("성적부반영 성공");
    	 			$(".modal-body").text("시험점수가 성적부에 반영되었습니다.");
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
    
   	$(".modal .close, .modal").on("click", function(){
   	  $("body").removeClass("modal-open").css("padding-right","0px");
      $(".modal-backdrop").removeClass("show").css("display", "none");
   	  $(".modal").removeClass("show").css("display", "none");
    });
});
</script>