<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 08.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">게시판/일정관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">학과공지</li>
     </ol>
 </nav>

 <!-- contents start -->
 <div class="card inputTable">
     <div class="card-body">
         <form class="table-responsive">
             <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                 <tr>
                     <th class="align-middle text-center">제목</th>
                     <td colspan="3"><input type="text" class="form-control"></td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">내용</th>
                     <td colspan="3">
                         <div id="summernote"></div>
                     </td>
                 </tr>
             </table>
             <h6 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i> 첨부파일</h6>
             <div class="form-group">
                 <div class="fallback">
                     <div class="col-12 col-md-12">
                         <div class="card">
                             <div class="card-content">
                                 <!-- File uploader with validation -->
                                 <input type="file" class="with-validation-filepond" required multiple data-max-file-size="5MB" data-max-files="3">
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="text-center">
                 <a href="${cPath }/lms/subjectNoticeList.do" class="btn btn-light-secondary">취소</a>
                 <button type="button" class="btn btn-primary" >
                     저장
                 </button>
             </div>
         </form>
     </div>
 </div>
 <!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/vendors/summernote/summernote-lite.min.js"></script>
<script>
    $('#summernote').summernote({
        tabsize: 2,
        height: 925,
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