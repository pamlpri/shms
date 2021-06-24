<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${cPath }/resources/lms/assets/css/bootstrap.css">
 <link rel="stylesheet" href="${cPath }/resources/lms/assets/css/commons.css" />
 <script type="text/javascript" src="${cPath }/resources/lms/assets/js/jquery-3.6.0.min.js"></script>
 <script type="text/javascript" src="${cPath }/resources/lms/assets/js/html2canvas.js"></script>
 <script type="text/javascript" src="${cPath }/resources/lms/assets/js/jspdf.min.js"></script>
</head>
<body>
<button type="button" class="btn btn-primary" id="savePdf" >PDF 저장</button>
	<div class="card" id="pdfDiv">
		<div class="card-body">
		   <caption align="left">
				<p class=hstyle0>제 ${crtf.year }-${crtf.req_no } 호</p>
			</caption>
			<table class="table table-striped" id="scoreTable" border="1">
			   <colgroup>
			   	<col width="10%"/>
			   	<col width="10%"/>
			   	<col width="10%"/>
			   	<col width="10%"/>
			   	<col width="10%"/>
			   	<col width="10%"/>
			   	<col width="10%"/>
			   	<col width="10%"/>
			   </colgroup>
			   <thead>
			   		<tr>
			   			<th class="text-center grayTh" colspan="8">성적 증명서</th>
			   		</tr>
			       <tr>
			       	<th class="text-center grayTh" colspan="2">학번</th>
			       	<td class="text-center" colspan="2">${user.user[0] }</td>
			       	<th class="text-center grayTh" colspan="2">이름 </th>
			       	<td class="text-center" colspan="2">${crtf.name }</td>
			       </tr>
			       <tr>
			       	<th class="text-center grayTh" colspan="2">대학</th>
			       	<td class="text-center" colspan="2">${crtf.col_name }</td>
			       	<th class="text-center grayTh" colspan="2">전공</th>
			       	<td class="text-center" colspan="2">${crtf.sub_name }</td>
			       </tr>
			       <tr>
			       	<th class="text-center grayTh" colspan="2">학적상태</th>
			       	<td class="text-center" colspan="2">${crtf.reginfo_stat }</td>
			       	<th class="text-center grayTh" colspan="2">생년월일</th>
			       	<td class="text-center" colspan="2">${crtf.regno }</td>
			       </tr>
			       <tr>
			        <th class="text-center grayTh" colspan="2">입학년월일</th>
			        <td class="text-center" colspan="2">${crtf.entsch_de }</td>
			       	<th class="text-center grayTh" colspan="2">졸업년월일</th>
			       	<td class="text-center" colspan="2">${crtf.grdtn_de}</td>
			       </tr>
				</thead>
				<tbody id="scoreTbody">
					<tr>
						<td colspan="8">
							<div class="row">								
								<c:forEach items="${selectSemstrList }" var="year" >
									<ul class="col-lg-6">
										<li>
											<span>${year.year }년도${year.semstr }학기</span>
										</li>
										<li>
											<table>
												<tr>
													<th class="text-center">이수구분</th>
													<th class="text-center">이수과목명</th>
													<th class="text-center">학점</th>
													<th class="text-center">성적</th>
												</tr>
												<c:forEach items="${lecScoreList }" var="score">
													<c:choose>
														<c:when test="${year.year eq score.year and year.semstr eq score.semstr }">
															<tr>
																<td class="text-center">${score.lec_cl_nm }</td>
																<td class="text-center">${score.lec_name }</td>
																<td class="text-center">${score.lec_pnt }</td>
																<td class="text-center">${score.pnt_rank_nm }</td>
															</tr>
														</c:when>
														<c:otherwise>
														
														</c:otherwise>
														</c:choose>
												</c:forEach>
											</table>
										</li>
									</ul>								
								</c:forEach>
							</div>
						</td>	
					</tr>
					<tr>
						<c:forEach items="${selectStatisticsList }" var="statistics" varStatus="i">
							<c:set value="${totalCredit + statistics.totalCredit }" var="totalCredit" />
							<c:set value="${totalPntVal + statistics.totalPntVal }" var="totalPntVal" />
							<c:set value="${totalAvg + statistics.totalAvg }" var="totalAvg" />
							<c:set value="${i.index+1 }" var="num" />
						</c:forEach>
						<fmt:formatNumber var="avg" value="${totalAvg/num }" pattern=".0"/>
						<fmt:formatNumber var="pntval" value="${totalPntVal/num }" pattern=".0"/>
				        <th class="text-center grayTh" colspan="2">이수학점</th>
				        <td class="text-center align-middle" colspan="2">${totalCredit }</td>
				       	<th class="text-center grayTh" colspan="2">평점 / 평균</th>
				       	<td class="text-center align-middle" colspan="2">${avg }/${pntval }</td>
			       </tr>
			       <tr>
						<td colspan="8" width="689" height="212" valign="middle" style='border-left:none;border-right:none;border-top:none;border-bottom:none;padding:1.4pt 5.1pt 1.4pt 5.1pt'>
							<p class="text-center">
								<span style='font-size:15.0pt;line-height:160%;'>인 재 대 학 교 총 장</span>
								<span>
									<img src="${cPath }/resources/lms/assets/images/signature.png" width="180" height="180" vspace="0" hspace="0" border="0">								
								</span>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script>
$(document).ready(function() {
	$('#savePdf').click(function() { // pdf저장 button id
		
	    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id		
		    // 캔버스를 이미지로 변환
		    var imgData = canvas.toDataURL('image/png');			     
		    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
		    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
		    var imgHeight = canvas.height * imgWidth / canvas.width;
		    var heightLeft = imgHeight;
		    var margin = 10; // 출력 페이지 여백설정
		    var doc = new jsPDF('p', 'mm');
		    var position = 30;
		    var image = "https://storage.cloud.google.com/shms/logo/sig.png";
		    
		       
		    // 첫 페이지 출력
		    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
		    heightLeft -= pageHeight;
		         
		    // 한 페이지 이상일 경우 루프 돌면서 출력
		    while (heightLeft >= 20) {
		        position = heightLeft - imgHeight;
		        doc.addPage();
		        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight, image);
		        heightLeft -= pageHeight;
		    }
		 
		    // 파일 저장
		    doc.save("성적증명서.pdf");
		});
	});
})
</script>
</body>
</html>