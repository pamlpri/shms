<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 16. 	    박초원        조회
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
            <a href="${cPath }/lecture/examUpdate.do?what=${exam.exam_no}" class="btn btn-icon btn-primary"><i class="fas fa-pen"></i> 시험수정</a>
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
            <c:choose>
            	<c:when test="${not empty exam.gg_sum}">
		            <tr>
		              <th>객관식</th>
		              <td class="text-left">${exam.gg_sum }점</td>
		            </tr>
            	</c:when>
            	<c:when test="${not empty exam.dd_sum }">
		            <tr>
		              <th>단답형</th>
		              <td class="text-left">${exam.dd_sum }점</td>
		            </tr>
            	</c:when>
            	<c:when test="${not empty exam.ss_sum }">
		            <tr>
		              <th>서술형</th>
		              <td class="text-left">${exam.ss_sum }점</td>
		            </tr>
            	</c:when>
            </c:choose>
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
              <a href="#" class="btn btn-icon btn-primary"><i class="far fa-file"></i> Excel 다운로드</a>
          </div>
          <div class="table-responsive table-wrap">
              <table class="table table-striped main-table edit-table" id="report-table">
                  <thead>                                 
                  <tr>
                      <th class="text-center">이름</th>
                      <th class="text-center">학번</th>
                      <th class="text-center">학과</th>
                      <th class="text-center">상태</th>
                      <th class="text-center">객관식</th>
                      <th class="text-center">주관식</th>
                      <th class="text-center">서술형</th>
                      <th class="text-center">총점</th>
                      <th class="text-center">비고</th>
                  </tr>
                  </thead>
                  <tbody>                                 
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center">20</td>
                      <td class="text-center">98 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  </tbody>
              </table>
          </div>
      </div>
    </div>
  <!-- contents end -->
</div>
<script>
    $(document).ready(function(){
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
                input.each(function(){
                    $(this).parent("td").html($(this).val());
                });			
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").removeAttr("disabled");
            }		
        });
        // Edit row on edit button click
        $(document).on("click", ".edit", function(){		
            $(this).parents("tr").find("td:not(:last-child)").each(function(){
            	if($(this).index() != 0 && $(this).index() != 1 && $(this).index() != 2 && $(this).index() != 3 && $(this).index() != 7){
	                $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
            	}
            });		
            $(this).parents("tr").find(".add, .edit").toggle();
            $(".add-new").attr("disabled", "disabled");
        });
        
        
        $('#report-table').DataTable({
        	
        });
    });
    </script>