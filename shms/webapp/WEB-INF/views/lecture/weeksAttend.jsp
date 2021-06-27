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
             <td>${attendList[0].lec_week }주차</td>
           </tr>
           <tr>
             <th>주차명</th>
             <td>${attendList[0].diary_title }</td>
           </tr>
           <tr>
             <th>학습기간</th>
             <td>${attendList[0].week_bgnde_char } ~ ${attendList[0].week_endde_char }</td>
           </tr>
           <tr>
             <th>수강인원</th>
             <td>${attendList[0].sugang_cnt }</td>
           </tr>
         </table>
       </div>
     </div>
   </div>

   <div class="card attendance">
     <div class="card-body">
       <form class="table-responsive" id="attendForm" action="${cPath }/lecture/liveAttend.do" method="post">
       	 <input type="hidden" name="lec_week" value="${attendList[0].lec_week }" />
       	 <p>※ 저장버튼을 눌러야 주차 출결체크가 완료됩니다.</p>
         <table class="table table-bordered table-md attendance">
           <tr>
             <th>이름</th>
             <th>학번</th>
             <th>학과</th>
             <th>일자</th>
             <th>출결상태</th>
             <th>출결체크</th>
           </tr>
           <c:forEach items="${attendList }" var="attend" varStatus="i">
           	<tr class="bigTr" data-attend="${attend.atndan_no }">
           		<td>${attend.name }</td>
	           	<td>${attend.stdnt_no }</td>
	           	<td>${attend.sub_name }</td>
	           	<td>${attend.attend_date }</td>
           		<c:choose>
	             	<c:when test="${attend.attend_stat eq 'CS'}"><td class="attend_stat">출석</td></c:when>
	             	<c:when test="${attend.attend_stat eq 'JG'}"><td class="attend_stat">지각</td></c:when>
	             	<c:when test="${attend.attend_stat eq 'JT'}"><td class="attend_stat">조퇴</td></c:when>
	             	<c:when test="${attend.attend_stat eq 'GS'}"><td class="attend_stat">결석</td></c:when>
	             	<c:otherwise><td class="attend_stat">　</td></c:otherwise>
             	</c:choose>
	           	<td>
	           		<table class="checkBtnBox">
		           		<tr>
		           			<td class="checkBtn ${attend.attend_stat eq 'CS' ? 'che':'' }" data-stat="CS" >출석</td>
		           			<td class="checkBtn ${attend.attend_stat eq 'JG' ? 'che':'' }" data-stat="JG">지각</td>
		           			<td class="checkBtn ${attend.attend_stat eq 'JT' ? 'che':'' }" data-stat="JT">조퇴</td>
		           			<td class="checkBtn ${attend.attend_stat eq 'GS' ? 'che':'' }" data-stat="GS">결석</td>
		           		</tr>
	           		</table>
	           	</td>
           	</tr>
           </c:forEach>
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
	
	let attendList = [];
	$("#saveBtn").on("click", function(){
		let che = $(attendForm).find(".che");
		$(che).each(function(idx, attnd){
			let stat = $(this).data("stat");
			let atndan_no = $(this).parents(".bigTr").data("attend");
			$(this).parents(".bigTr").append($("<input>").attr("name","attendList["+idx+"].attend_stat").val(stat).attr("type", "hidden"), $("<input>").attr("name","attendList["+idx+"].atndan_no").val(atndan_no).attr("type", "hidden"));
		});
		$(attendForm).submit();
	});
</script>