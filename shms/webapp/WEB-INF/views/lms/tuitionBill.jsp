<%--
* [[개정이력(Modification Information)]]
* 수정일            수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
   <!-- contents start -->
   <nav aria-label="breadcrumb">
       <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
           <li class="breadcrumb-item"><a href="${cPath }/lms/tuitionList.do">등록금관리</a></li>
           <li class="breadcrumb-item active" aria-current="page">등록금 영수증</li>
       </ol>
   </nav>
   
   <section class="section">
       <div class="card inputTable">
           <div class="card-body">
               <div class="text-right float-right" style="margin-bottom: 2%">
                   <a href="#" class="btn btn-icon btn-primary"><i class="far fa-file"></i> PDF 다운로드</a>
               </div>
               <div style="clear: both;"></div>
               <div class="table-responsive">
                   <table class="table table-bordered table-md bill" style="border-color: #dfdfdf; overflow: hidden;">
                       <tr>
                           <th class="text-center" colspan="4">납입고지서[은행용]</th>
                       </tr>
                       <tr>
                           <th class="text-center" colspan="4">2011학년도 납입금</th>
                       </tr>
                       <tr>
                           <th class="text-center">대학</th>
                           <td class="text-center" colspan="3">인재대학교</td>
                       </tr>
                       <tr>
                           <th class="text-center">학과(부)</th>
                           <td class="text-center" colspan="3">안경광학과</td>
                       </tr>
                       <tr>
                           <th class="text-center">학년</th>
                           <td class="text-center">1학년</td>
                           <th class="text-center">학번</th>
                           <td class="text-center">S10500010</td>
                       </tr>
                       <tr>
                           <th class="text-center">이름</th>
                           <td class="text-center" colspan="3">박초원</td>
                       </tr>
                       <tr>
                           <th class="text-center">구분</th>
                           <th class="text-center">등록금내역 ①</th>
                           <th class="text-center">장학금내역 ②</th>
                           <th class="text-center">납입금액 ① - ②</th>
                       </tr>
                       <tr>
                           <th class="text-center">수업료</th>
                           <td class="text-center">2,122,500</td>
                           <td class="text-center">122,500</td>
                           <td class="text-center">2,000,000</td>
                       </tr>
                       <tr>
                           <td colspan="4" class="text-center">
                               <ul class="billList">
                                   <li>납부기간 : 2011년 02월 07일 ~ 2011년 02월 09일</li>
                                   <li>납부장소 : 농협 전국 각 지점, 인터넷 뱅킹</li>
                                   <li>&nbsp;</li>
                                   <li>※ 등록금 이체용 개인별 가상계좌번호</li>
                                   <li><strong>농협중앙회 79003196729478 박초원</strong></li>
                                   <li>&nbsp;</li>
                                   <li>2011년 2월</li>
                               </ul>
                               <ul class="billList universtiyName">
                                   <li>인</li>
                                   <li>재</li>
                                   <li>대</li>
                                   <li>학</li>
                                   <li>교</li>
                                   <li>총</li>
                                   <li>장</li>
                                   <li><img src="${cPath }/resources/lms/assets/images/signature.png" /></li>
                               </ul>
                           </td>
                       </tr>
                   </table>
                   <p style="margin-top: 20px;">※ 가상계좌 입금시 납입할 금액을 합산하여 개인별 가상계좌(농협)로 송금</p>
               </div>
           </div>
       </div>
   </section>
   <!-- contents end -->
</div>