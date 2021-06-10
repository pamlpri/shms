<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 08.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
      	 <c:choose>
			 <c:when test="${user.user[1] eq 'ST' }">
	               <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
	         </c:when>
	         <c:otherwise>
	               <li class="breadcrumb-item"><a href="${cPath }/lms/main.do">HOME</a></li>
	         </c:otherwise>
     	 </c:choose>
         <li class="breadcrumb-item"><a href="#"></a>게시판/일정관리</li>
         <li class="breadcrumb-item active" aria-current="page">대학문의</li>
     </ol>
 </nav>

 <!-- contents start -->
 <div class="card inputTable">
     <div class="card-body">
         <form class="table-responsive" action="${cPath }/lms/subQnaBoardAnsUpdate.do" method="post">
         	 <input type="hidden" value=${board.bo_no } name="bo_no" />
             <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                 <tr>
                     <th class="align-middle text-center">제목</th>
                     <td colspan="5">${board.bo_title }</td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">작성자</th>
                     <td>${board.bo_writer }</td>
                     <th class="align-middle text-center">작성일</th>
                     <td>${board.bo_write_de }</td>
                     <th class="align-middle text-center">문의종류</th>
                     <td>${board.univ_inqry_kind }</td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">내용</th>
                     <td colspan="5">
                         ${board.bo_cont }
                     </td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">답변</th>
                     <td colspan="5">
                         <textarea class="form-control" rows="5" cols="100" name="bo_ans" id="bo_ans">${board.bo_ans}</textarea>
                     </td>
                 </tr>
             </table>
             <div class="text-center">
                 <a href="${cPath }/lms/subjectQnaList.do" class="btn btn-primary">목록으로</a>
                 <button type="submit" class="btn btn-primary">저장</button>
                 <button type="button" class="btn btn-danger block" data-bs-toggle="modal"
                     data-bs-target="#default">
                     삭제
                 </button>
             </div>
         </form>
         
         <!--Basic Modal -->
         <div class="modal fade text-left" id="default" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel1" aria-hidden="true">
             <div class="modal-dialog modal-dialog-scrollable" role="document">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h5 class="modal-title" id="myModalLabel1">게시글 삭제</h5>
                         <button type="button" class="close rounded-pill"
                             data-bs-dismiss="modal" aria-label="Close">
                             <i data-feather="x"></i>
                         </button>
                     </div>
                     <div class="modal-body">
                        <p>
                            삭제한 게시글은 복원이 불가합니다.<br/>
                            삭제하시겠습니까?
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn  btn-secondary" data-bs-dismiss="modal">
                            <i class="bx bx-x d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">닫기</span>
                        </button>
                        <button type="button" id="delBtn" class="btn btn-primary ml-1"
                            data-bs-dismiss="modal">
                            <i class="bx bx-check d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">삭제</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- contents end -->
</div>    
<script type="text/javascript" src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>
<script>
    CKEDITOR.replace("bo_ans", {
		filebrowserUploadUrl : '${cPath}/lms/boardFiles.do'
	});
    
    $("#delBtn").on("click", function() {
    	let boNo = $("input[name='bo_no']").val();
    	$.ajax({
    		url: "${cPath}/lms/subQnaBoardAnsDelete.do"
    		, data: {"bo_no" : boNo}
    		, success : function(resp) {
    			if(resp == "OK") {
    				location.href="${cPath}/lms/subjectQnaList.do";    				
    			}
    		}
    		, error : function(xhr, error, msg) {
    			console.log(xhr);
    			console.log(error);
    			console.log(msg);
    		}
    	});
    });
</script>