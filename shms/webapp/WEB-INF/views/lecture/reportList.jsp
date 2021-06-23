<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 14.      송수미        과제 상세 조회 페이지 기능 구현
* 2021. 6. 15.      송수미        과제 제출 목록 조회
* 2021. 6. 16.      송수미       제출  과제  채점, 점수 수정 기능 구현
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

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">과제관리</li>
      </ol>
  </nav>

  <div class="card attendance">
      <div class="card-body">
        <div class="table-responsive">
              <div class="text-right excelWrap">
                <a href="${cPath }/lecture/reportUpdate.do?set_task_no=${setTask.set_task_no}" class="btn btn-icon btn-primary"><i class="fas fa-pen"></i> 과제수정</a>
              </div>
              <table class="table table-bordered table-md">
                  <tr>
                  <th>과제명</th>
                  <td class="text-left">${setTask.task_title }</td>
                  </tr>
                  <tr>
                  <th>상태</th>
                  <td class="text-left">${setTask.process_at }</td>
                  </tr>
                  <tr>
                  <th>배점</th>
                  <td class="text-left">${setTask.task_allot }</td>
                  </tr>
                  <tr>
                  <th>채점</th>
                  <td class="text-left">${setTask.grade_cnt } / ${setTask.total_cnt }</td>
                  </tr>
                  <tr>
                  <th>제출</th>
                  <td class="text-left">${setTask.submit_cnt } / ${setTask.total_cnt }</td>
                  </tr>
                  <tr>
                  <th>마감일</th>
                  <td class="text-left">${setTask.submit_endde }</td>
                  </tr>
              </table>
          </div>
      </div>
      <div class="card-body table-scroll" id="table-scroll">
          <div class="text-right excelWrap" style="margin-top: -2%;">
              <button class="btn btn-icon btn-primary" type="button" onclick="ReportToExcelConverter()"><i class="far fa-file"></i> Excel 다운로드</button>
	
          </div>
          <div class="table-responsive table-wrap">
              <table class="table2excel table table-striped main-table edit-table" id="report-table">
                  <thead>              
                  <tr>
                      <th class="text-center">이름</th>
                      <th class="text-center">학번</th>
                      <th class="text-center">학과</th>
                      <th class="text-center">상태</th>
                      <th class="text-center">성적</th>
                      <th class="text-center">비고</th>
                  </tr>
                  </thead>
                  <tbody>                                 
                  	<c:if test="${not empty taskSubmitList }">
                  		<c:forEach items="${taskSubmitList }" var="taskSubmit">
		                  <tr>
		                      <td class="text-center">${taskSubmit.name }</td>
		                      <td class="text-center">${taskSubmit.writer }</td>
		                      <td class="text-center">${taskSubmit.sub_name }</td>
		                      <td class="text-center">
			                      <c:choose>
			                      	<c:when test="${not empty taskSubmit.submit_no }">
				                      	<a href="${cPath}/lecture/reportView.do?submit_no=${taskSubmit.submit_no}" class="btn btn-success">제출완료</a>
			                      	</c:when>
			                      	<c:otherwise>
			                      		<a href="#" class="btn btn-secondary disabled">미제출</a>
			                      	</c:otherwise>
			                      </c:choose>
		                      </td>
		                      <td class="text-center">${taskSubmit.task_score }</td>
		                      <td class="text-center noExl">
		                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
		                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
		 	  					  <input type="hidden" name="set_task_no" value="${setTask.set_task_no }"/>
				                  <input type="hidden" name="submit_no" value="${taskSubmit.submit_no }"/>
				                  <input type="hidden" class="oriScore" value="${taskSubmit.task_score }"/>
		                      </td>
		                  </tr>
                  		</c:forEach>
                  	</c:if>                   
                  </tbody>
              </table>
          </div>
      </div>
  </div>
  <!--Basic Modal -->
  <div class="modal fade text-left" id="default" tabindex="-1"
	  role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel1"></h5>
				<button type="button" class="close rounded-pill"
					data-bs-dismiss="modal" aria-label="Close">
					<i data-feather="x"></i>
				</button>
			</div>
			<div class="modal-body">
				<p>
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" id="close"
						data-bs-dismiss="modal">
					<i class="bx bx-x d-block d-sm-none"></i> <span
						class="d-none d-sm-block">닫기</span>
				</button>
			</div>
		</div>
	</div>
	</div>
  <!-- contents end -->
</div>
<iframe id="txtArea1" style="display:none"></iframe>

<script>
$(document).ready(function(){
	let status = "${setTask.process_at }";
    $('[data-toggle="tooltip"]').tooltip();
    var actions = $("table td:last-child").html();
    // Append table with add row form on add new button click
    
    // Add row on add button click
    $(document).on("click", ".add", function(){
        var empty = false;
        var input = $(this).parents("tr").find('input[type="text"]');
        let score = null;
        let oriScore = $(this).parents("tr").find(".oriScore").val();
        let setTaskNo = "${setTask.set_task_no}";
        let taskAllot = "${setTask.task_allot}";
        let submitNo = $(this).siblings("input[name='submit_no']").val();
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
            	score = $(this).val();
	            $.ajax({
	            	url: "${cPath}/lecture/taskScore.do"
	            	, method : "post"
	            	, data : {
	            		taskAllot : taskAllot
	            		, setTaskNo : setTaskNo
	            		, score : score
	            		, submitNo : submitNo
	            	}, dataType : "text"
	            	, success : function(resp){
			            $(that).parents("tr").find(".add, .edit").toggle();
			            $(".add-new").removeAttr("disabled");
			            if(resp.indexOf("완료") != -1){
		            		$(that).parent("td").html(score);
			            }else{
		            		$(that).parent("td").html(oriScore);
			            }
			            
			            $("#default").find(".modal-body p").empty().text(resp);
			    		$("#default").addClass("show").css("display","block");
	            	}, error : function(xhr, resp, error){
	            		console.log(xhr);
	            	}
	            });
            });
            
            
        }		
    });
    
    $("#close, .modal").on("click", function(){
		$("#default").removeClass("show").css("display","none");
	})
    
    // Edit row on edit button click
    $(document).on("click", ".edit", function(event){
    	let aTag = $(this).parents("tr").find("td").eq(3);
    	if(aTag.text().indexOf("미제출") != -1) return false;
        if(status.indexOf("진행중") != -1) return false;
        $(this).parents("tr").find("td").eq(4).each(function(){
            $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
        });
        $(this).parents("tr").find(".add, .edit").toggle();
        $(".add-new").attr("disabled", "disabled");
    });
    
 	$('#report-table').DataTable({
 		 "order": [[ 1, "asc" ]]
    });
	
});
</script>