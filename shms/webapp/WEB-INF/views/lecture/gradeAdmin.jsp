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
      <!-- 강의명 -->
      <h1>${lec_name }</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">강의실 홈</a></li>
          <li class="breadcrumb-item active" aria-current="page">성적관리</li>
      </ol>
  </nav>

  <section class="section">
      <div class="section-body">
          <h2 class="section-title">성적관리</h2>
          <div class="row">
              <div class="col-12">
                  <div class="card">
                  <div class="card-body table-scroll" id="table-scroll">
                    <div class="text-right excelWrap">
                    	  <c:if test="${not empty gradeList }">
	                    	  <button type="button" class="btn btn-warning" id="gradeBtn">성적부 반영</button>
                    	  </c:if>
        				  <button class="btn btn-icon btn-primary" type="button" onclick="gradeStudentToExcelConverter()"><i class="far fa-file"></i> Excel 다운로드</button>
                    </div>
                    <div class="table-responsive table-wrap">
                      <table class="table table-striped main-table edit-table" id="grade-table">
                          <thead>                                 
                          <tr>
                              <th class="text-center">이름</th>
                              <th class="text-center">학번</th>
                              <th class="text-center">학과</th>
                              <th class="text-center">학점</th>
                              <th class="text-center">중간고사</th>
                              <th class="text-center">기말고사</th>
                              <th class="text-center">과제</th>
                              <th class="text-center">출석</th>
                              <th class="text-center">기타</th>
                              <th class="text-center noExl">비고</th>
                          </tr>
                          </thead>
                          <tbody>        
                          	<c:forEach items="${gradeList }" var="grade" varStatus="i">
                          		<tr class="${grade.scre_no }">
                       	  	  	  <input type="hidden" name="gradeList[${i.index }].lec_code" value="${lec_code}"/>
                       	  	  	  <input type="hidden" name="gradeList[${i.index }].scre_no" value="${grade.scre_no}"/>
	                  		  	  <input type="hidden" name="gradeList[${i.index }].mid_scre" value="${grade.mid_scre}"/>
	                   	  	  	  <input type="hidden" name="gradeList[${i.index }].final_scre" value="${grade.final_scre}"/>
	                   	  	  	  <input type="hidden" name="gradeList[${i.index }].task_scre" value="${grade.task_scre}"/>
	                   	  	  	  <input type="hidden" name="gradeList[${i.index }].attend_scre" value="${grade.attend_scre}"/>
	                   	  	  	  <input type="hidden" name="gradeList[${i.index }].etc_scre" value="${grade.etc_scre}"/>
	                              <td class="text-center align-middle">${grade.name }</td>
	                              <td class="text-center align-middle">${grade.stdnt_no }</td>
	                              <td class="text-center align-middle">${grade.sub_name }</td>
	                              <td class="text-center align-middle">${grade.pnt_rank_nm }</td>
	                              <td class="text-center" data-idx="mid_scre">${grade.mid_scre }</td>
	                              <td class="text-center" data-idx="final_scre">${grade.final_scre}</td>
	                              <td class="text-center" data-idx="task_scre">${grade.task_scre }</td>
	                              <td class="text-center" data-idx="attend_scre">${grade.attend_scre }</td>
	                              <td class="text-center" data-idx="etc_scre">${grade.etc_scre }</td>
	                              <td class="text-center noExl">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
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
  <div class="modal fade" tabindex="-1" role="dialog" id="fire-modal-2" style="display: block; padding-right: 17px;">
		<div class="modal-dialog modal-md modal-dialog-centered"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
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
	$('#grade-table').DataTable({
    	"columnDefs": [ {
	   		"targets": [9],
	   		"orderable": false
   		}]
    	,"order": [[ 1, "asc" ]]
    });
    
    $('[data-toggle="tooltip"]').tooltip();
    var actions = $("table td:last-child").html();
    // Append table with add row form on add new button click
    
    // Add row on add button click
    $(document).on("click", ".add", function(){
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
           	let that = $(this);
           	let scre_no = $(this).parents("tr").attr("class").split(" ")[0];
           	console.log(scre_no);
           	let mid_scre = $(this).parents("tr").find("input[name='mid_scre']").val();
           	let final_scre = $(this).parents("tr").find("input[name='final_scre']").val();
           	let task_scre = $(this).parents("tr").find("input[name='task_scre']").val();
           	let attend_scre = $(this).parents("tr").find("input[name='attend_scre']").val();
           	let etc_scre = $(this).parents("tr").find("input[name='etc_scre']").val();
           	
           	let frag = false;
           	input.each(function(){
           		if($(this).val() > 100){
	            	frag = false;
           		}else {
           			frag = true;
           		}
           	});
           	
           	if(frag){
	           	$.ajax({
	           		url : "${cPath}/lecture/gradeUpdate.do"
	           		,method : "post"
	           		,data : {
	           			mid_scre : mid_scre,
	           			final_scre : final_scre,
	           			task_scre : task_scre,
	           			attend_scre : attend_scre,
	           			etc_scre : etc_scre,
	           			lec_code : "${lec_code}",
	           			scre_no : scre_no
	           		},dataType : "json"
	           		,success : function(resp){
	           			if(resp.result == "OK"){
	           				$(that).parents("tr").find(".add, .edit").toggle();
				            input.each(function(){
				                $(this).parent("td").html($(this).val());
			            	});
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
            	$(".modal-body").html("100점을 초과할 수 없습니다.");
            	$("body").addClass("modal-open").css("padding-right", "17px");
            	$(".modal-backdrop").addClass("show").css("display", "block");
            	$(".modal").addClass("show").css("display", "block");
           	}
           	
        }		
    });
    // Edit row on edit button click
    $(document).on("click", ".edit", function(){		
    	$(this).parents("tr").find("td:not(:last-child)").each(function(idx, td){
        	if(idx != 0 && idx != 1 && idx != 2 && idx != 3){
        		let idxName = $(this).data("idx");
	            $(this).html('<input type="text" class="form-control" name="'+ idxName +'" value="' + $(this).text() + '">');
        	}
        });		
        $(this).parents("tr").find(".add, .edit").toggle();
        $(".add-new").attr("disabled", "disabled");
    });
    
    $("#gradeBtn").on("click", function(){
    	let table = $('<table>').append($("#grade-table").DataTable().$('tr').clone()).attr("class", "allTable").css("display", "none");
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
    		data["scre_no"] = $(".allTable").find("input[name='gradeList["+ i +"].scre_no']").val();
    		data["lec_code"] = $(".allTable").find("input[name='gradeList["+ i +"].lec_code']").val();
    		data["mid_scre"] = $(".allTable").find("input[name='gradeList["+ i +"].mid_scre']").val();
    		data["final_scre"] = $(".allTable").find("input[name='gradeList["+ i +"].final_scre']").val();
    		data["task_scre"] = $(".allTable").find("input[name='gradeList["+ i +"].task_scre']").val();
    		data["attend_scre"] = $(".allTable").find("input[name='gradeList["+ i +"].attend_scre']").val();
    		data["etc_scre"] = $(".allTable").find("input[name='gradeList["+ i +"].etc_scre']").val();
    		dataList.push(data);
    	}
    	toData["gradeList"] = dataList;
    	console.log(toData);
    	
    	$.ajax({
    		method : "post"
    		, url : "${cPath }/lecture/pntGrade.do"
    		, data : JSON.stringify(toData)
    		, dataType : "json"
    		, contentType : "application/json"
    		, success : function(resp){
    			console.log(resp)
    			if(resp.result == "OK"){
    				$(".modal-title").text("성적부반영 성공");
    	 			$(".modal-body").text("성적비율에 따라 학점이 부여되어 성적부에 반영되었습니다.");
    			}else{
          			$(".modal-title").text("성적부반영 실패");
	            	$(".modal-body").html("성적부 반영에 실패했습니다.<br/>잠시후 다시 시도해주세요.");
	            	$("body").addClass("modal-open").css("padding-right", "17px");
	            	$(".modal-backdrop").addClass("show").css("display", "block");
	            	$(".modal").addClass("show").css("display", "block");
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