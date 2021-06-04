<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 4.      박초원        최초작성
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
           <li class="breadcrumb-item"><a href="#">웹메일</a></li>
           <li class="breadcrumb-item active" aria-current="page">받은메일</li>
       </ol>
   </nav>
   
   <div class="card">
       <div class="card-body">
           <div class="container-fluid">
               <div class="email-right-box">
                   <div class="toolbar" role="toolbar">
                       <div class="btn-group m-b-20">
                           <button type="button" class="btn btn-light"><i class="fas fa-reply" onclick="location.href='compose.html'"></i>
                           </button>
                           <button type="button" class="btn btn-light"><i class="fa fa-trash"></i>
                           </button>
                       </div>
                   </div>
                   <div class="read-content">
                       <div class="media pt-5">
                           <div class="media-body">
                               <h4 class="m-0 text-primary">[긴급]프로젝트 공유의 건</h4><middle class="text-muted">To : 김영민(invernessmckenzie@example.com)</middle>
                               <span class="float-right">07:23 AM</span>
                           </div>
                       </div>
                       <hr>
                       <p>Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.
                           Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero,
                           sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar,
                       </p>
                       <middle class="text-muted">form : 박초원(chdnjs@shms.ac)</middle>
                       <hr>
                       <h6 class="p-t-15"><i class="fa fa-download mb-2"></i> 첨부파일 <span>(3)</span></h6>
                       <div class="row m-b-30">
                           <div class="col-auto"><a href="#" class="text-muted">My-Photo.png</a>
                           </div>
                           <div class="col-auto"><a href="#" class="text-muted">My-File.docx</a>
                           </div>
                           <div class="col-auto"><a href="#" class="text-muted">My-Resume.pdf</a>
                           </div>
                       </div>
                       <hr>
                   </div>
               </div>
           </div>
           <div class="text-center">
               <a href="send.html" class="btn btn-primary">목록으로</a>
           </div>
       </div>
   </div>
   <!-- contents end -->
</div>