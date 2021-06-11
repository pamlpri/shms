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
<div class="page-content">
 <!-- contents start -->
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">취업지원</a></li>
         <li class="breadcrumb-item active" aria-current="page">이력서/자기소개서</li>
     </ol>
 </nav>
 
 <div class="card inputTable">
     <div class="card-body">
         <div class="table-responsive">
             <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                 <tr>
                     <th class="align-middle text-center">신청번호</th>
                     <td>12345</td>
                     <th class="align-middle text-center">신청일자</th>
                     <td>2020.05.01</td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">학번</th>
                     <td>S1401001</td>
                     <th class="align-middle text-center">이름</th>
                     <td>강미나</td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">처리상태</th>
                     <td>승인</td>
                     <th class="align-middle text-center">처리일</th>
                     <td></td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">제목</th>
                     <td colspan="3">자기소개서 첨삭 부탁드립니다!</td>
                 </tr>
                 <tr>
                     <th class="text-center align-middle">내용</th>
                     <td colspan="4">
                         이력서, 자기소개서 첨부파일로 보내드립니다.<br/>
                         첨삭 부탁드립니다^^
                     </td>
                 </tr>
                 <tr>
                     <th class="text-center align-middle">요청파일</th>
                     <td colspan="3">
                         <ul class="attat">
                             <li><a href="#" class="text-color">성적증명서.pdf</a></li>
                             <li><a href="#" class="text-color">추천서.pdf</a></li>
                         </ul>
                     </td>
                 </tr>
                 <tr>
                     <th class="text-center align-middle">첨삭파일</th>
                     <td colspan="3">
                         <ul class="attat">
                             <li><a href="#" class="text-color">성적증명서_첨삭완료.pdf</a></li>
                             <li><a href="#" class="text-color">추천서_첨삭완료.pdf</a></li>
                         </ul>
                     </td>
                 </tr>
             </table>
             <div class="text-center">
                 <a href="${cPath }/lms/returning.do" class="btn btn-primary">목록으로</a>
                 <!-- 취업장학과만 보이는 버튼 -->
                 <a href="${cPath }/lms/returningForm.do" class="btn btn-primary">수정</a>
                 <button type="button" class="btn btn-danger block" data-bs-toggle="modal"
                     data-bs-target="#default">
                     삭제
                 </button>
             </div>
         </div>
     </div>
 </div>
 
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
 <!-- contents end -->
</div>