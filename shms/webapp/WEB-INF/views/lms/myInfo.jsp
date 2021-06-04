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
           <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
           <li class="breadcrumb-item active" aria-current="page">내정보보기</li>
       </ol>
   </nav>

   <!-- contents start -->
   <section class="section">
       <div class="card">
           <div class="card-body">
               <div class="row">
                   <div class="col-lg-3 profileImg">
                       <img src="assets/images/faces/1.jpg" />
                   </div>
                   <div class="col-12 col-lg-9">
                       <div class="card-content">
                           <!-- table striped -->
                           <form class="table-responsive">
                               <table class="table .thead-light mb-0" style="border-top:2px solid #95a3d6;">
                                   <tbody">
                                       <tr>
                                           <th class="text-bold-500 text-center align-middle">사번</th>
                                           <td><input class="form-control" disabled type="text" value="P1401001"></td>
                                           <th class="text-bold-500 text-center align-middle">이름</th>
                                           <td><input class="form-control" disabled type="text" value="강미나"></td>
                                       </tr>
                                       <tr>
                                           <th class="text-bold-500 text-center align-middle">주민번호</th>
                                           <td><input class="form-control" disabled type="text" value="010312 - 1234561"></td>
                                           <th class="text-bold-500 text-center align-middle">성별</th>
                                           <td><input class="form-control" disabled type="text" value="남자"></td>
                                       </tr>
                                       <tr>
                                           <th class="text-bold-500 text-center align-middle">학과</th>
                                           <td><input class="form-control" disabled type="text" value="항공학과"></td>
                                           <th class="text-bold-500 text-center align-middle">직급</th>
                                           <td><input class="form-control" disabled type="text" value="학과장"></td>
                                       </tr>
                                       <tr>
                                           <th class="text-bold-500 text-center align-middle">입사일</th>
                                           <td><input class="form-control" disabled type="text" value="2014-03-03"></td>
                                           <th class="text-bold-500 text-center align-middle">퇴사일</th>
                                           <td><input class="form-control" disabled type="date" value=""></td>
                                       </tr>
                                   </tbody>
                               </table>
                               <table class="table .thead-light mb-0" style="border-top:2px solid #95a3d6; border-bottom : 2px solid #95a3d6;">
                                   <tbody>
                                       <tr>
                                           <th class="text-bold-500 text-center align-middle">계좌은행</th>
                                           <td><input class="form-control" type="text" value="농협"></td>
                                           <th class="text-bold-500 text-center align-middle">계좌변호</th>
                                           <td><input class="form-control" type="text" value="453017-56-105902"></td>
                                       </tr>
                                   </tbody>
                               </table>
                               <table class="table .thead-light mb-0">
                                   <tbody>
                                       <tr>
                                           <th class="text-bold-500 text-center align-middle">&nbsp;&nbsp;&nbsp;&nbsp;웹메일&nbsp;&nbsp;&nbsp;</th>
                                           <td id="webMailBox"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#primary">웹메일 발급</button></td>
                                       </tr>
                                       <tr>
                                           <th class="text-bold-500 text-center align-middle">전화번호</th>
                                           <td><input class="form-control" type="text" value="010-1234-4567"></td>
                                           <th class="text-bold-500 text-center align-middle">&nbsp;&nbsp;Email&nbsp;&nbsp;&nbsp;</th>
                                           <td><input class="form-control" type="text" value="shms@co.kr"></td>
                                       </tr>
                                       <tr>
                                           <th class="text-bold-500 text-center align-middle">우편번호</th>
                                           <td>
                                               <div class="input-group">
                                                   <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                                                   <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" id="sample6_postcode" value="34567">
                                                   <button onclick="sample6_execDaumPostcode()" class="btn btn-outline-secondary" type="button" id="button-addon2" style="border:1px solid #dfdfdf;">검색</button>
                                               </div>
                                           </td>
                                       </tr>
                                       <tr style="border-bottom:2px solid #95a3d6;">
                                           <th class="text-bold-500 text-center align-middle">기본주소</th>
                                           <td><input class="form-control" type="text" value="대전광역시 중구 대흥동" id="sample6_address"></td>
                                           <th class="text-bold-500 text-center align-middle">상세주소</th>
                                           <td><input class="form-control" type="text" value="영민빌딩 301호" id="sample6_detailAddress"></td>
                                       </tr>
                                   </tbody>
                               </table>
                               <div class="float-right" style="margin-top: 2%;">
                                   <a href="myInfo.html" class="btn btn-primary">저장</a>
                               </div>
                           </form>
                       </div>
                   </div>
               </div>

               <!--primary theme Modal -->
               <div class="modal fade text-left" id="primary" tabindex="-1"
                   role="dialog" aria-labelledby="myModalLabel160"
                   aria-hidden="true">
                   <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                       role="document">
                       <div class="modal-content">
                           <div class="modal-header bg-primary">
                               <h5 class="modal-title white" id="myModalLabel160">
                                   인재대학교 웹메일
                               </h5>
                               <button id="" type="button" class="close"
                                   data-bs-dismiss="modal" aria-label="Close">
                                   <i data-feather="x"></i>
                               </button>
                           </div>
                           <div class="modal-body">
                               <br/>
                               학교 웹메일 발급이 완료되었습니다.<br/>
                               웹메일은 통합정보시스템 웹메일 메뉴에서 사용할 수 있습니다.
                               <br/>
                               <br/>
                           </div>
                           <div class="modal-footer">
                               <button id="webMail" type="button"
                                   class="btn btn btn-primary"
                                   data-bs-dismiss="modal">
                                   <i class="bx bx-x d-block d-sm-none"></i>
                                   <span class="d-none d-sm-block">닫기</span>
                               </button>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </section>    
   <!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/js/postcode.v2.js"></script>