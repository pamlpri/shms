<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 08.      박초원        최초작성
* 2021. 06. 09.      송수미        학과공지 등록 기능 구현
* 2021. 6. 9.	   박초원        ckeditor 적용
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
     	<c:choose>
			 <c:when test="${not empty student }">
	               <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
	         </c:when>
	         <c:otherwise>
	               <li class="breadcrumb-item"><a href="${cPath }/lms/main.do">HOME</a></li>
	         </c:otherwise>
     	</c:choose>
         <li class="breadcrumb-item"><a href="${cPath }/lms/subjectNoticeList.do">게시판/일정관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">학과공지</li>
     </ol>
 </nav>

 <!-- contents start -->
 <div class="card inputTable">
     <div class="card-body">
         <form id="submitForm" method="post" enctype="multipart/form-data">
             <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                 <tr>
                     <th class="align-middle text-center">제목</th>
                     <td colspan="3">
                     	<input type="text" class="form-control" name="bo_title" value="${board.bo_title }">
                     </td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">내용</th>
                     <td colspan="3">
                         <textarea class="form-control" rows="5" cols="100" name="bo_cont" id="bo_cont">${board.bo_cont}</textarea>
                     </td>
                 </tr>
             </table>
             <h6 class="m-b-20">
				<i class="fa fa-paperclip m-r-5 f-s-18"></i> 첨부파일
			</h6>
			<div class="form-inline fileArea row">
				<p class="fileBox col-lg-6">
					<input class="form-control" type="file" name="mail_files">
					<span class="plusBtn btn btn-secondary">+</span>
				</p>
			</div>
             <div class="text-center">
                 <a href="${cPath }/lms/subjectNoticeList.do" class="btn btn-light-secondary">취소</a>
                 <button id="submitBtn" type="submit" class="btn btn-primary" >저장</button>
             </div>
         </form>
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

<script type="text/javascript" src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>
<script>
    CKEDITOR.replace("bo_cont", {
		filebrowserUploadUrl : '${cPath}/lms/boardFiles.do'
	});
</script>
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
    var source = '<p class="fileBox col-lg-6">'
		+ '<input class="form-control" type="file" name="mail_files">'
		+ '<span class="plusBtn btn btn-secondary">+</span>'
		+ '<span class="delBtn btn btn-danger">-</span>'
	    + '</p>';
	    
	$(".fileArea").on("click", ".plusBtn" ,function(){
		$(this).parents(".fileArea:first").append(source);
	});
	
	$(".fileArea").on("click", ".delBtn", function(){
		$(this).parent("p").remove();
	});
</script>