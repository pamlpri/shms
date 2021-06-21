<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 21.      송수미        등록된 강의 문의 조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
     <div class="section-body">
         <h2 class="section-title">강의 Q&A</h2>
         <div class="row">
             <div class="col-12">
                 <div class="card">
                 <div class="card-body">
                     <div class="table-responsive">
                     <table class="table table-striped" id="notice-table">
                         <thead>                                 
                         <tr>
                             <th class="text-center">No.</th>
                             <th class="text-center">제목</th>
                             <th class="text-center">작성일</th>
                             <th class="text-center">작성자</th>
                             <th class="text-center">답변</th>
                         </tr>
                         </thead>
                         <tbody>
                         <c:choose>
                         	<c:when test="${not empty boardList }">
                         		<c:forEach items="${boardList }" var="board" varStatus="idx">
			                         <tr>
			                             <td class="text-center">${fn:length(boardList) - idx.index }</td>
			                             <td class="text-center">
			                             	<c:choose>
			                             		<c:when test="${'PR' eq user.user[1] }">
					                               <a class="text-color" href="${cPath}/lecture/qnaView.do?bo_no=${board.bo_no}">${board.bo_title }</a>
			                             		</c:when>
			                             		<c:otherwise>
						                             <c:choose>
						                             	<c:when test="${'Y' eq board.bo_secret_at }">
							                               <a class="text-color" href="${cPath}/lecture/password.do?bo_no=${board.bo_no}">비밀글<i class="fas fa-key"></i></a>
						                             	</c:when>
						                             	<c:otherwise>
							                               <a class="text-color" href="${cPath}/lecture/qnaView.do?bo_no=${board.bo_no}">${board.bo_title }</a>
						                             	</c:otherwise>
						                             </c:choose>
			                             		</c:otherwise>
			                             	</c:choose>
			                             </td>
			                             <td class="text-center">${board.bo_write_de }</td>
			                             <td class="text-center">${board.bo_writer }</td>
			                             <c:choose>
			                             	<c:when test="${not empty board.bo_ans }">
					                            <td class="text-center">
					                           		<div class="badge badge-success">답변</div>
					                            </td>
			                             	</c:when>
			                             	<c:otherwise>
					                           	<td class="text-center">
					                           		<div class="badge badge-info">대기</div>
					                           	</td>
			                             	</c:otherwise>
			                             </c:choose>
			                         </tr>
                         		</c:forEach>
                         	</c:when>
                         	<c:otherwise>
                         		<tr class="text-center">
                         			<td colspan="4">현재 조회 가능한 문의글이 존재하지 않습니다.</td>
                       			</tr>
                         	</c:otherwise>
                         </c:choose>                           
                         </tbody>
                     </table>
                     <!-- 학생한테만 보여야 하는 버튼 -->
                     <c:if test="${'ST' eq user.user[1] }">
	                     <div class="text-right" style="margin-top: 3%;">
	                       <a href="${cPath }/lecture/qnaInsert.do" class="btn btn-icon icon-left btn-primary">
	                         <i class="far fa-edit"></i> 글쓰기
	                       </a>
	                     </div>
                     </c:if>
                     </div>
                 </div>
                 </div>
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
  					<i class="bx bx-x d-block d-sm-none"></i> 
  					<span class="d-none d-sm-block">닫기</span>
  				</button>
  			</div>
  		</div>
  	</div>
  </div>
 </section>
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
$(document).ready(function() {
    $('#notice-table').DataTable({
    	
    });
} );
</script>