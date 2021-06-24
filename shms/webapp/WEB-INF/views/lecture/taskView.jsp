<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 16.      송수미        학생이 제출한 과제 조회 기능 구현
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
        <form id="taskScoreForm" class="table-responsive" action="${cPath }/lecture/taskScore.do" method="post">
          <input type="hidden" value="${taskSubmit.submit_no }" name="submit_no"/>
          <input type="hidden" value="${taskSubmit.task_allot }" name="task_allot"/>
          <input type="hidden" value="${taskSubmit.set_task_no }" name="set_task_no"/>
          <table class="table table-bordered table-md">
            <tr>
              <th>이름</th>
              <td class="text-left">${taskSubmit.name }</td>
            </tr>
            <tr>
              <th>학번</th>
              <td class="text-left">${taskSubmit.writer }</td>
            </tr>
            <tr>
              <th>학과</th>
              <td class="text-left">${taskSubmit.sub_name }</td>
            </tr>
            <tr>
              <th class="align-middle">내용</th>
              <td class="text-left">${taskSubmit.cont }
            </tr>
            <tr>
              <th class="align-middle">첨부파일</th>
              <td class="text-left">
				<c:if test="${not empty taskSubmit.attachList }">
                  <div class="board_downloader" style="border :none;">
			        <ul class="downloader">
				      <c:forEach items="${taskSubmit.attachList }" var="attach">
				      	<c:if test="${not empty attach.atch_file_seq }">
					      <c:url value="/lecture/taskSubmitDownload.do" var="downloadURL">
					      	<c:param name="atch_file_no" value="${attach.atch_file_no }" />
					      	<c:param name="atch_file_seq" value="${attach.atch_file_seq }" />
					      </c:url>
				          <li>
				            <a href="${downloadURL }" class="text-color">
				            	<i class="fas fa-arrow-alt-circle-down"></i>${attach.file_nm }
				            </a>
				          </li>
				      	</c:if>
				      </c:forEach>
			        </ul>
			       </div>
				</c:if>
              </td>
            </tr>
            <tr>
                <th class="align-middle">성적
                </th>
                <td>
                  <input type="number" class="form-control" style="width:20%;" min="0" id="scoreInput"
                  		max="${taskSubmit.task_allot }" name="task_score" value="${taskSubmit.task_score }" ${taskSubmit.process_at eq '진행중' ? 'disabled' : '' } />
                   <div class="invalid-feedback"></div>
                </td>
            </tr>
          </table>
          <div class="text-center">
              <a href="${cPath }/lecture/reportList.do?set_task_no=${taskSubmit.set_task_no}" class="btn btn-secondary">취소</a>
              <c:if test="${taskSubmit.process_at eq '마감'}">
	              <button type="button" class="btn btn-primary" id="submitBtn">저장</button>
              </c:if>
          </div>
        </form>
      </div>
    </div>
    <!-- contents end -->
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
</div>
<c:if test="${not empty message }">
	<script>
		$("#default").find(".modal-body p").empty().text("${message}");
		$("#default").addClass("show").css("display","block");
	    $("#close, .modal").on("click", function(){
			$("#default").removeClass("show").css("display","none");
		})
	</script>
</c:if>
  
<script>
	$(function(){
		let max_score = ${taskSubmit.task_allot};
		let taskScoreForm = $("#taskScoreForm");
		$("#submitBtn").on("click", function(event){
			let task_score = $("input[name='task_score']").val();
			if(task_score > max_score || task_score < 0){
				$("#default").find(".modal-body p").empty().text("점수는 0점 이상 과제 등록시 설정한 최대 점수(" + max_score + ") 이하로 입력해주세요.");
				$("#default").addClass("show").css("display","block");	
			}else{
				$(taskScoreForm).submit();
			}
		})
		
	    $("#close, .modal").on("click", function(){
			$("#default").removeClass("show").css("display","none");
		})
	})
</script>