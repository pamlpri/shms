<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.   박초원      최초작성
* 2021. 6. 12.  김보미		등록금 고지서 조회	
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${cPath }/resources/lms/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/lms/assets/js/html2canvas.js"></script>
<script type="text/javascript" src="${cPath }/resources/lms/assets/js/jspdf.min.js"></script>
<div class="page-content">
   <!-- contents start -->
   <nav aria-label="breadcrumb">
       <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
           <li class="breadcrumb-item"><a href="${cPath }/lms/tuitionList.do">등록금관리</a></li>
           <li class="breadcrumb-item active" aria-current="page">등록금 고지서</li>
       </ol>
   </nav>
   
   <section class="section">
       <div class="card inputTable">
           <div class="card-body">
               <div class="text-right float-right" style="margin-bottom: 2%">
               	   <button class="btn btn-success">등록금납부</button>
                   <a href="#" class="btn btn-icon btn-primary savePdf"><i class="far fa-file"></i> PDF 다운로드</a>
               </div>
               <div style="clear: both;"></div>
               <div class="table-responsive" id="pdfDiv">
               <c:choose>
               		<c:when test="${not empty tuition }">
	               		<table class="table table-bordered table-md bill" style="border-color: #dfdfdf; overflow: hidden;">
	                       <tr>
	                           <th class="text-center" colspan="4">납입고지서[은행용]</th>
	                       </tr>
	                       <tr>
	                           <th class="text-center" colspan="4">${tuition.year }학년도 납입금</th>
	                       </tr>
	                       <tr>
	                           <th class="text-center">대학</th>
	                           <td class="text-center" colspan="3">인재대학교</td>
	                       </tr>
	                       <tr>
	                           <th class="text-center">학과(부)</th>
	                           <td class="text-center" colspan="3">${tuition.sub_name }</td>
	                       </tr>
	                       <tr>
	                           <th class="text-center">학년</th>
	                           <td class="text-center">${tuition.grade }학년</td>
	                           <th class="text-center">학번</th>
	                           <td class="text-center">${tuition.stdnt_no }</td>
	                       </tr>
	                       <tr>
	                           <th class="text-center">이름</th>
	                           <td class="text-center" colspan="3">${tuition.name }</td>
	                       </tr>
	                       <tr>
	                           <th class="text-center">구분</th>
	                           <th class="text-center">등록금내역 ①</th>
	                           <th class="text-center">장학금내역 ②</th>
	                           <th class="text-center">납입금액 ① - ②</th>
	                       </tr>
	                       <tr>
	                           <th class="text-center">수업료</th>
	                           <td class="text-center">${tuition.reg_amt }</td>
	                           <td class="text-center">${recivAmt }</td>
	                           <td class="text-center">${tuAmt }</td>
	                       </tr>
	                       <tr>
	                           <td colspan="4" class="text-center">
	                               <ul class="billList">
	                                   <li>납부기간 : ${tuitionPay.year }년 ${tuitionPay.start_month }월 ${tuitionPay.start_day }일 ~ ${tuitionPay.year }년 ${tuitionPay.start_month }월 ${tuitionPay.end_day}일</li>
	                                   <li>납부장소 : 농협 전국 각 지점, 인터넷 뱅킹</li>
	                                   <li>&nbsp;</li>
	                                   <li>※ 등록금 이체용 개인별 가상계좌번호</li>
	                                   <li><strong>농협중앙회 79003196729478 박초원</strong></li>
	                                   <li>&nbsp;</li>
	                                   <li>${tuitionPay.year }년 ${tuitionPay.start_month }월</li>
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
               		</c:when>
               		<c:otherwise>
               			<p>해당 학기의 등록금 고지서가 존재하지 않습니다.</p>
               		</c:otherwise>
               </c:choose>
                   <p style="margin-top: 20px;">※ 가상계좌 입금시 납입할 금액을 합산하여 개인별 가상계좌(농협)로 송금</p>
               </div>
           </div>
       </div>
   </section>
   <!-- contents end -->
</div>
<script>
$(document).ready(function() {
	$('.savePdf').click(function() { // pdf저장 button id
		
	    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id		
		    // 캔버스를 이미지로 변환
		    var imgData = canvas.toDataURL('image/png');			     
		    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
		    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
		    var imgHeight = canvas.height * imgWidth / canvas.width;
		    var heightLeft = imgHeight;
		    var margin = 10; // 출력 페이지 여백설정
		    var doc = new jsPDF('p', 'mm');
		    var position = 0;
		       
		    // 첫 페이지 출력
		    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
		    heightLeft -= pageHeight;
		         
		    // 한 페이지 이상일 경우 루프 돌면서 출력
		    while (heightLeft >= 20) {
		        position = heightLeft - imgHeight;
		        doc.addPage();
		        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
		        heightLeft -= pageHeight;
		    }
		 
		    // 파일 저장
		    doc.save("test.pdf");
// 		    doc.output("D:/Test.pdf");
		    // 파일 출력
// 		    window.open(doc.output('bloburl'), '_blank')
		});
	});
})
</script>