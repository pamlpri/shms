<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 21.      송수미        문의 게시글 조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
   .card-body > p {
      margin-bottom : -4px;
   }
</style>
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
          <li class="breadcrumb-item"><a href="${cPath }/lecture/notice.do">강의개요</a></li>
          <li class="breadcrumb-item active" aria-current="page">강의 Q&A</li>
      </ol>
  </nav>

  <section class="section">
      <div class="card">
        <div class="card-header">
          <h4 class="nontice-title">${board.bo_title }<span class="notice-date">${board.bo_write_de }</span></h4>
        </div>
        <div class="card-body">
          <p>
            ${board.bo_cont }
          </p>
          <c:choose>
          	<c:when test="${not empty board.bo_ans }">
	          <hr>
	          <div class="noticeAns">
	              <p class="userAns">${board.ans_writer }<span>${board.ans_de }</span></p>
	              <p class="contAns">
	                ${board.bo_ans }
	              </p>
	          </div>
          	</c:when>
          	<c:otherwise>
				<!-- 교수만 보이게 -->
				<c:if test="${'PR' eq user.user[1] }">
		          <hr>
		        	<div>
		            	<p class="userAns">${user.user[2]}</p>
		            	<div class="textArea">
		            		<form action="${cPath }/lecture/qnaAnsUpdate.do" id="ansForm">
		            			<input type="hidden" name="bo_no" value="${board.bo_no }"/>
		              			<textarea class="form-control" rows="5" cols="800" id="bo_ans" name="bo_ans">${board.bo_ans }</textarea>
		            		</form>
		            	</div>
		          	</div>
				</c:if>
          	</c:otherwise>
          </c:choose>
        </div>
        <div class="card-footer bg-whitesmoke">
          <div id="noticeBtnBox" class="text-right">
            <a id="listBtn" class="btn btn-icon icon-left btn-primary" href="${cPath }/lecture/qna.do">목록으로</a>
            <!--학생한테만 보이는 버튼-->
            <c:if test="${board.bo_writer eq user_id }">
	            <a id="updateBtn" class="btn btn-icon icon-left btn-primary" href="${cPath }/lecture/qnaUpdate.do?bo_no=${board.bo_no}">수정</a>
	            <button id="deleteBtn" class="btn btn-danger" data-confirm-yes="deleteBoard();" data-confirm="게시글 삭제|삭제한 게시글은 복원이 불가합니다.<br/>삭제하시겠습니까?">삭제</button>
            </c:if>
            <c:if test="${'PR' eq user.user[1]}">
	            <a id="saveBtn" class="btn btn-icon icon-left btn-primary" href="#">답변등록</a>
            </c:if>
          </div>
        </div>
      </div>
  </section>
  
  <div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Modal body text goes here.</p>
        </div>
        <div class="modal-footer bg-whitesmoke br">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
  <!-- contents end -->
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
	    CKEDITOR.replace("bo_ans", {
	        filebrowserImageUploadUrl : ''
	 	 });		
	});
	let deleteBoard = function(){
		location.href = "${cPath}/lecture/qnaDelete.do?bo_no=${board.bo_no}"; 
	}
	
	$("#saveBtn").on("click", function(){
		$("#ansForm").submit();
	})
</script>