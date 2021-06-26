<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 26.      박초원        실시간강의 출석체크
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- CSS Libraries -->
<link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/izitoast/css/iziToast.min.css">

 <div class="main-content">
   <section class="section">
     <div class="section-header">
		<h1>${lec_name }</h1>
	 </div>
   </section>

   <!-- contents start -->
   <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
      <li class="breadcrumb-item"><a href="${cPath }/lecture/lectureInfo.do">강의실홈</a></li>
      <li class="breadcrumb-item active" aria-current="page">출석관리</li>
    </ol>
  </nav>
   
   <div class="card attendance">
     <div class="card-body">
       <div class="table-responsive">
         <table class="table table-bordered table-md">
         	<colgroup>
         		<col width=20%>
         		<col width=80%>
         	</colgroup>
           <tr>
             <th>주차</th>
             <td></td>
           </tr>
           <tr>
             <th>주차명</th>
             <td></td>
           </tr>
           <tr>
             <th>학습기간</th>
             <td></td>
           </tr>
           <tr>
             <th>학습내역</th>
             <td></td>
           </tr>
           <tr>
             <th>수강인원</th>
             <td></td>
           </tr>
         </table>
       </div>
     </div>
   </div>

   <div class="card attendance">
     <div class="card-body">
       <form class="table-responsive" id="attendForm">
       	 <p>※ 저장버튼을 눌러야 주차 출결체크가 완료됩니다.</p>
         <table class="table table-bordered table-md attendance">
           <tr>
             <th>이름</th>
             <th>학번</th>
             <th>학과</th>
             <th>일자</th>
             <th>출석시간</th>
             <th>퇴실시간</th>
             <th>출결상태</th>
             <th>출결체크</th>
           </tr>
           <tr>
           	<td>홍길동</td>
           	<td>S19101001</td>
           	<td>경영학과</td>
           	<td>2021-05-06</td>
           	<td>15:00</td>
           	<td>16:00</td>
           	<td>출석</td>
           	<td>
           		<table class="checkBtnBox">
	           		<tr>
	           			<td class="checkBtn" data-stat="CS">출석</td>
	           			<td class="checkBtn" data-stat="JG">지각</td>
	           			<td class="checkBtn" data-stat="JT">조퇴</td>
	           			<td class="checkBtn" data-stat="GS">결석</td>
	           		</tr>
           		</table>
           	</td>
           </tr>
           <tr>
           	<td>홍길동</td>
           	<td>S19101001</td>
           	<td>경영학과</td>
           	<td>2021-05-06</td>
           	<td>15:00</td>
           	<td>16:00</td>
           	<td>출석</td>
           	<td>
           		<table class="checkBtnBox">
	           		<tr>
	           			<td class="checkBtn" data-stat="CS">출석</td>
	           			<td class="checkBtn" data-stat="JG">지각</td>
	           			<td class="checkBtn" data-stat="JT">조퇴</td>
	           			<td class="checkBtn" data-stat="GS">결석</td>
	           		</tr>
           		</table>
           	</td>
           </tr>
           <tr>
           	<td>홍길동</td>
           	<td>S19101001</td>
           	<td>경영학과</td>
           	<td>2021-05-06</td>
           	<td>15:00</td>
           	<td>16:00</td>
           	<td>출석</td>
           	<td>
           		<table class="checkBtnBox">
	           		<tr>
	           			<td class="checkBtn" data-stat="CS">출석</td>
	           			<td class="checkBtn" data-stat="JG">지각</td>
	           			<td class="checkBtn" data-stat="JT">조퇴</td>
	           			<td class="checkBtn" data-stat="GS">결석</td>
	           		</tr>
           		</table>
           	</td>
           </tr>
           <tr>
           	<td>홍길동</td>
           	<td>S19101001</td>
           	<td>경영학과</td>
           	<td>2021-05-06</td>
           	<td>15:00</td>
           	<td>16:00</td>
           	<td>출석</td>
           	<td>
           		<table class="checkBtnBox">
	           		<tr>
	           			<td class="checkBtn" data-stat="CS">출석</td>
	           			<td class="checkBtn" data-stat="JG">지각</td>
	           			<td class="checkBtn" data-stat="JT">조퇴</td>
	           			<td class="checkBtn" data-stat="GS">결석</td>
	           		</tr>
           		</table>
           	</td>
           </tr>
           <tr>
           	<td>홍길동</td>
           	<td>S19101001</td>
           	<td>경영학과</td>
           	<td>2021-05-06</td>
           	<td>15:00</td>
           	<td>16:00</td>
           	<td>출석</td>
           	<td>
           		<table class="checkBtnBox">
	           		<tr>
	           			<td class="checkBtn" data-stat="CS">출석</td>
	           			<td class="checkBtn" data-stat="JG">지각</td>
	           			<td class="checkBtn" data-stat="JT">조퇴</td>
	           			<td class="checkBtn" data-stat="GS">결석</td>
	           		</tr>
           		</table>
           	</td>
           </tr>
           <tr>
           	<td>홍길동</td>
           	<td>S19101001</td>
           	<td>경영학과</td>
           	<td>2021-05-06</td>
           	<td>15:00</td>
           	<td>16:00</td>
           	<td>출석</td>
           	<td>
           		<table class="checkBtnBox">
	           		<tr>
	           			<td class="checkBtn" data-stat="CS">출석</td>
	           			<td class="checkBtn" data-stat="JG">지각</td>
	           			<td class="checkBtn" data-stat="JT">조퇴</td>
	           			<td class="checkBtn" data-stat="GS">결석</td>
	           		</tr>
           		</table>
           	</td>
           </tr>
         </table>
         <div class="text-center">
              <button type="button" class="btn btn-secondary" id="resetBtn">취소</button>
              <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
          </div>
       </form>
     </div>
   </div>
   <!-- contents end -->
 </div>
<!-- JS Libraies -->
<script src="${cPath }/resources/lecture/dist/modules/izitoast/js/iziToast.min.js"></script>
<!-- Page Specific JS File -->
<script src="${cPath }/resources/lecture/dist/js/page/modules-toastr.js"></script>
<script>
	let attendForm = $("#attendForm");
	$(attendForm).on("click", ".checkBtn", function(){
		$(this).parent("tr").children("td").removeClass("che");
		$(this).addClass("che");
	});
</script>