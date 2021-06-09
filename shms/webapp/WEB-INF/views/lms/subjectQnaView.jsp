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
			 <c:when test="${not empty student }">
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
         <form class="table-responsive">
             <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                 <tr>
                     <th class="align-middle text-center">제목</th>
                     <td colspan="5">대학문의 제목!!</td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">작성자</th>
                     <td>김혜나</td>
                     <th class="align-middle text-center">작성일</th>
                     <td>2021.05.20</td>
                     <th class="align-middle text-center">문의종류</th>
                     <td>편의시설문의</td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">내용</th>
                     <td colspan="5">
                         Lorem Ipsum is simply dummy text of the printing and 
                         typesetting industry. Lorem Ipsum has been the industry's
                         standard dummy text ever since the 1500s, when an unknown 
                         printer took a galley of type and scrambled it to make 
                         a type specimen book. It has survived not only five centuries,
                         but also the leap into electronic typesetting, 
                         remaining essentially unchanged. It was popularised 
                         in the 1960s with the release of Letraset sheets 
                         containing Lorem Ipsum passages, and more recently with 
                         desktop publishing software like Aldus PageMaker including 
                         versions of Lorem Ipsum.
                     </td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">답변</th>
                     <td colspan="5">
                         <div id="summernote"></div>
                     </td>
                 </tr>
             </table>
             <div class="text-center">
                 <a href="${cPath }/lms/subjectQnaList.do" class="btn btn-primary">목록으로</a>
                 <a href="#" class="btn btn-primary">저장</a>
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
                        <button type="button" class="btn btn-primary ml-1"
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
<script src="${cPath }/resources/lms/assets/vendors/summernote/summernote-lite.min.js"></script>
<script>
    $('#summernote').summernote({
    	tabsize: 2,
        height: 250,
    })
    $("#hint").summernote({
        height: 100,
        toolbar: false,
        placeholder: 'type with apple, orange, watermelon and lemon',
        hint: {
            words: ['apple', 'orange', 'watermelon', 'lemon'],
            match: /\b(\w{1,})$/,
            search: function (keyword, callback) {
                callback($.grep(this.words, function (item) {
                    return item.indexOf(keyword) === 0;
                }));
            }
        }
    });

</script>