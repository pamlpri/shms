<%--
* [[개정이력(Modification Information)]]
* 수정일            수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.      박초원        최초작성
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
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">등록금관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">등록금 영수증</li>
      </ol>
  </nav>
  
  <section class="section">
      <div class="card inputTable">
          <div class="card-body">
              <div class="text-right float-right" style="margin-bottom: 2%">
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
		                          <td class="text-center">${tuAmt}</td>
		                      </tr>
		                      <tr>
		                          <td colspan="4" class="text-center">
		                              <ul class="billList">
		                                  <li>위 금액을 영수하였기에 통지합니다.</li>
		                                  <li>&nbsp;</li>
		                                  <li>${tuition.year }년 ${tuition.month }월 ${tuition.day }일</li>
		                              </ul>
		                              <ul class="billList universtiyName">
		                                  <li>인</li>
		                                  <li>재</li>
		                                  <li>대</li>
		                                  <li>학</li>
		                                  <li>교</li>
		                                  <li>수</li>
		                                  <li>입</li>
		                                  <li>징</li>
		                                  <li>수</li>
		                                  <li>관</li>
		                                  <li><img src="${cPath }/resources/lms/assets/images/signature.png" /></li>
		                              </ul>
		                          </td>
		                      </tr>
		                  </table>
              		</c:when>
              		<c:otherwise>
              			<p>등록금 납부내역이 존재하지 않습니다.</p>
              		</c:otherwise>
              </c:choose>
              </div>
              <p style="margin-top: 20px;">
                  ※ 예치금 납부자는 예치금이 입학금으로 대치됩니다.
                  단, 장학금으로 입학금을 받는 사람은 입학 후 예치금을 환불 해 드립니다.
              </p>
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