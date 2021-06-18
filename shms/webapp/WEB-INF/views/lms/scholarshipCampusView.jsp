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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-content">
 <!-- contents start -->
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">장학금관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">교내 장학금 신청</li>
     </ol>
 </nav>
 
 <div class="card inputTable">
     <div class="card-body">
         <div class="table-responsive">
             <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                 <tr>
                     <th rowspan="2" class="align-middle text-center">신청대상</th>
                     <th class="align-middle text-center">학번</th>
                     <td>${student.stdnt_no }</td>
                     <th class="align-middle text-center">이름</th>
                     <td>${student.name }</td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">전화번호</th>
                     <td>${student.tel_no }</td>
                     <th class="align-middle text-center">웹메일</th>
                     <td>${student.webmail }</td>
                 </tr>
                 <tr>
                     <th rowspan="3" class="align-middle text-center">신청상세</th>
                     <th class="align-middle text-center">신청번호</th>
                     <td>${schl.req_no }</td>
                     <th class="align-middle text-center">신청일자</th>
                     <td>${schl.req_de }</td>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">신청종류</th>
                     <td>${schl.schlship_nm }</td>
                     <th class="align-middle text-center">제출서류</th>
                     <c:forEach var="attList" items="attList">
	                     <td>${file_nm }</td>
                     </c:forEach>
                 </tr>
                 <tr>
                     <th class="align-middle text-center">처리상태</th>
                     <td>${schl.process_stat }</td>
                     <th class="align-middle text-center">지급일</th>
                     <td>${schl.reciv_date }</td>
                 </tr>
             </table>
             <div class="text-center">
                 <a href="${cPath }/lms/scholarshipCampus.do".html" class="btn btn-primary">목록으로</a>
             </div>
         </div>
     </div>
   </div>
 <!-- contents end -->
</div>