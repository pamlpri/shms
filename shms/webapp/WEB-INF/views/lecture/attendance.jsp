<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 18.      박초원       학생 출석현황 페이지 조회 및 출석상태 수정 
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Main Content -->
 <div class="main-content">
   <section class="section">
     <div class="section-header">
		<h1>${lec_name }</h1>
	 </div>
   </section>

   <!-- contents start -->
   <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <c:choose>
      	<c:when test="${'ST' eq user.user[1]}">
			<li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
		</c:when>
		<c:otherwise>
      		<li class="breadcrumb-item"><a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
		</c:otherwise>
      </c:choose>
      <li class="breadcrumb-item"><a href="${cPath }/lecture/lectureInfo.do">강의실홈</a></li>
      <li class="breadcrumb-item active" aria-current="page">출석관리</li>
    </ol>
  </nav>
   
   <div class="card attendance">
     <div class="card-body">
       <div class="table-responsive">
         <table class="table table-bordered table-md">
           <tr>
             <th>강의명</th>
             <td colspan="4">${lec_name }</td>
           </tr>
           <tr>
             <th>강의기간</th>
             <td colspan="4">${attend.lec_term }</td>
           </tr>
           <tr>
             <th>강의시간</th>
             <td colspan="4">${attend.dayotw_nm } (${attend.lec_time }:00 ~ ${attend.end_time }:00)</td>
           </tr>
           <tr>
             <th>학생명</th>
             <td colspan="4">${attend.name }</td>
           </tr>
           <tr>
             <th>출석일</th>
             <th>지각일</th>
             <th>조퇴일</th>
             <th>결석일</th>
             <th>출석률(일수)</th>
           </tr>
           <tr>
           	 <td>${attend.cs_cnt }일</td>
             <td>${attend.jg_cnt }일</td>
             <td>${attend.jt_cnt }일</td>
             <td>${attend.gs_cnt }일</td>
             <td>${attend.attend_per }%</td>
           </tr>
         </table>
       </div>
     </div>
   </div>

   <div class="card attendance">
     <div class="card-body">
       <div class="table-responsive">
       	 <p>※ 출석시간, 퇴실시간은 대면 강의만 조회할 수 있습니다.</p>
         <table class="table table-bordered table-md attendance">
           <tr>
             <th>주차</th>
             <th>일자</th>
             <th>출석시간</th>
             <th>퇴실시간</th>
             <th>출결상태</th>
             <c:if test="${user.user[1] eq 'PR' }">
	             <th>비고</th>
             </c:if>
           </tr>
           <tr>
             <td>1주차</td>
             <td>2020-11-16</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <!-- 교수한테만 -->
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>2주차</td>
             <td>2020-11-15</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>결석</td>
             <!-- 교수한테만 -->
             <td><a href="#" class="btn btn-info">출석인정</a></td>
           </tr>
           <tr>
             <td>3주차</td>
             <td>2020-11-14</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>4주차</td>
             <td>2020-11-13</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>5주차</td>
             <td>2020-11-12</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>6주차</td>
             <td>2020-11-11</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>7주차</td>
             <td>2020-11-10</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>8주차</td>
             <td>2020-11-09</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>9주차</td>
             <td>2020-11-08</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>10주차</td>
             <td>2020-11-07</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>11주차</td>
             <td>2020-11-06</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>12주차</td>
             <td>2020-11-05</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>13주차</td>
             <td>2020-11-04</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>14주차</td>
             <td>2020-11-03</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>15주차</td>
             <td>2020-11-02</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
           <tr>
             <td>16주차</td>
             <td>2020-11-01</td>
             <td>10:00</td>
             <td>11:20</td>
             <td>출석</td>
             <td><a href="#" class="btn btn-secondary">출석취소</a></td>
           </tr>
         </table>
       </div>
     </div>
   </div>
   <!-- contents end -->
 </div>