<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 21.      박초원        최초작성
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
             <li class="breadcrumb-item"><a href="#">장학금지원</a></li>
             <li class="breadcrumb-item active" aria-current="page">자격증 취득 장학금</li>
         </ol>
     </nav>
     
     <section class="section">
         <div class="card">
             <div class="card inputTable">
                 <div class="card-body">
                     <form class="table-responsive">
                         <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                             <tr>
                                 <th rowspan="2" class="align-middle text-center">신청대상</th>
                                 <th class="align-middle text-center">학번</th>
                                 <td>S1401001</td>
                                 <th class="align-middle text-center">이름</th>
                                 <td>강미나</td>
                             </tr>
                             <tr>
                                 <th class="align-middle text-center">전화번호</th>
                                 <td>010-2344-1234</td>
                                 <th class="align-middle text-center">웹메일</th>
                                 <td>asdgasdg@shms.ac</td>
                             </tr>
                             <tr>
                                 <th rowspan="4" class="align-middle text-center">신청상세</th>
                                 <th class="align-middle text-center">신청번호</th>
                                 <td>12345</td>
                                 <th class="align-middle text-center">신청일자</th>
                                 <td>2020.05.01</td>
                             </tr>
                             <tr>
                                 <th class="align-middle text-center">신청종류</th>
                                 <td>기사 장학금</td>
                                 <th class="align-middle text-center">제출서류</th>
                                 <td>
                                     <ul class="attat">
                                         <li><a href="#" class="text-color">기사증명서.pdf</a></li>
                                         <li><a href="#" class="text-color">산업기사증명서.pdf</a></li>
                                     </ul>
                                 </td>
                             </tr>
                             <tr>
                                 <th class="align-middle text-center">처리상태</th>
                                 <td>대기</td>
                                 <th class="align-middle text-center">지급일</th>
                                 <td></td>
                             </tr>
                             <tr>
                                 <th class="align-middle text-center">반려사유</th>
                                 <td colspan="4">
                                     <textarea class="form-control" rows="3" id="returnResult"></textarea>
                                     <span id="returnWarning"></span>
                                 </td>
                             </tr>
                         </table>
                         <div class="text-center">
                             <button type="button" class="btn btn-light-secondary" id="returnBtn">반려</button>
                             <button onclick="location.href='certificateScholarship.html'" type="button" class="btn btn-primary">승인</button>
                         </div>
                     </form>
                 </div>
             </div>
         </div>
     </section>
     <!-- contents end -->
 </div>
<script>
        $("#returnBtn").on("click", function(){
            let txt = $("#returnResult").val();
            if(txt == null || txt == ""){
                console.log(txt)
                $("#returnWarning").text("반려사유는 필수입력 항목입니다.");
                $("#returnResult").focus();
            }else {
                location.href="resumeAdmin.html";
            }
        }); 
    </script>