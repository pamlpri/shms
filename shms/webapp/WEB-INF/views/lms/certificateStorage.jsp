<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 3.      박초원        최초작성
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
           <li class="breadcrumb-item"><a href="#">증명서</a></li>
           <li class="breadcrumb-item active" aria-current="page">증명서보관함</li>
       </ol>
   </nav>

   <section class="section">
       <div class="card">
           <div class="card-body">
               <table class="table table-striped" id="table1">
                   <thead>
                       <tr>
                           <th class="text-center">No.</th>
                           <th class="text-center">신청번호</th>
                           <th class="text-center">신청증명서</th>
                           <th class="text-center">신청사유</th>
                           <th class="text-center">신청 / 출력</th>
                           <th class="text-center">발급일자</th>
                           <th class="text-center">보관만료</th>
                           <th class="text-center">출력</th>
                       </tr>
                   </thead>
                   <tbody>
                       <tr>
                           <td class="text-center">1</td>
                           <td class="text-center">2345</td>
                           <td class="text-center">입학증명서</td>
                           <td class="text-center">고육기관용</td>
                           <td class="text-center">1 / 0</td>
                           <td class="text-center">2021.05.21</td>
                           <td class="text-center">29일 남음</td>
                           <td class="text-center">
                               <a href="certificate01.html" target="_blank" class="btn-sm btn-primary">출력</a>
                           </td>
                       </tr>
                   </tbody>
               </table>
           </div>
       </div>
   </section>
   <!-- contents end -->
</div>