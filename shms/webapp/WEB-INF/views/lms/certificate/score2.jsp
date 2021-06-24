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
</head>
<body>
	<div class="card">
		<div class="card-body">
		   <caption>성적증명서</caption>
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
													<c:set></c:set>
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
					
				        <th class="text-center grayTh" colspan="2">신청학점 / 이수학점</th>
				        <td class="text-center align-middle" colspan="2">${crtf.entsch_de }</td>
				       	<th class="text-center grayTh" colspan="2">평점 / 평균</th>
				       	<td class="text-center align-middle" colspan="2">(Math.round((totalAvg/num) * 10) / 10) + " / " + (Math.round((totalPntval/num) * 10) / 10)</td>
			       </tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
</body>
</html>