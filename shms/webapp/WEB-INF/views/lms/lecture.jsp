<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.  박초원        최초작성
* 2021. 5. 27.  김보미      강의 개설 버튼 수정 
* 2021. 6. 20.  송수미      강의 개설 버튼 수정 
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <!-- contents start -->
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">강의관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">수강중인 강의</li>
     </ol>
 </nav>
<div class="page-content">
	<section class="section">
		<div class="card">
			<div class="card-body">
			<c:choose>
			<c:when test="${not empty key}">
				<a id="newLecture" href="${cPath }/lms/lectureOpen.do" class="btn btn-primary">강의개설</a>
			</c:when>
			</c:choose>
				<table class="table table-striped" id="table1" class="minH">
					<c:choose>
							<c:when test="${not empty lecListST}">
								<thead>
									<tr>
										<th class="text-center">연도</th>
										<th class="text-center">학기</th>
										<th class="text-center">강의명</th>
										<th class="text-center">교수</th>
										<th class="text-center">학년</th>
										<th class="text-center">학점</th>
										<th class="text-center">분류</th>
										<th class="text-center">강의실</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${lecListST }" var="lecListST">
									<tr>
										<td class="text-center">${lecListST.estbl_year }</td>
										<td class="text-center">${lecListST.estbl_semstr }</td>
										<td class="text-center"><a class="text-color" href="${cPath }/lecture/index.do?lec_code=${lecListST.lec_code}&lec_name=${lecListST.lec_name}">${lecListST.lec_name }</a></td>
										<td class="text-center">${lecListST.prof_name }</td>
										<td class="text-center">${lecListST.grade }</td>
										<td class="text-center">${lecListST.lec_pnt }</td>
										<td class="text-center">${lecListST.lec_cl}</td>
										<td class="text-center">${lecListST.lecrum }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:when test="${not empty lecListPR }">
								<thead>
									<tr>
										<c:if test="${not empty key }">
											<th class="text-center">강의코드</th>
										</c:if>
										<th class="text-center">대상학년</th>
										<th class="text-center">강의명</th>
										<th class="text-center">학점</th>
										<th class="text-center">분류</th>
										<th class="text-center">강의실</th>
									</tr>
								</thead>
								<c:forEach items="${lecListPR }" var="lecturePR">
									<tr>
										<c:if test="${not empty key }">
											<th class="text-center">${lecturePR.lec_code }</th>
										</c:if>
										<td class="text-center">${empty lecturePR.lec_atnlc ?  "전체" : lecturePR.lec_atnlc}</td>
										<td class="text-center">
											<c:if test="${empty key }">
												<c:url var="lecURL" value="/lecture/main.do">
													<c:param name="lec_code" value="${lecturePR.lec_code }"/>
													<c:param name="lec_name" value="${lecturePR.lec_name }"/>
												</c:url>
											</c:if>
											<a class="text-color goLec" href="${lecURL}">${lecturePR.lec_name }</a>
										</td>
										<td class="text-center">${lecturePR.lec_pnt }</td>
										<td class="text-center">${lecturePR.lec_cl}</td>
										<td class="text-center">${lecturePR.lecrum }</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
						
					</tbody>
				</table>
			</div>
		</div>
	</section>
</div>

<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);

window.onload = function(){
	let key = "${key}";
	if(key != null && key == "key"){
		$(".goLec").removeAttr("href");
	}
}
</script>
