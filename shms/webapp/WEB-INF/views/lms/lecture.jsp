<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.  박초원        최초작성
* 2021. 5. 27.  김보미      강의 개설 버튼 수정 
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="page-content">
	<section class="section">
		<div class="card">
			<div class="card-body">
			<c:choose>
			<c:when test="${not empty staff}">
				<a id="newLecture" href="${cPath }/lms/lectureOpen.do" class="btn btn-primary">강의개설</a>
			</c:when>
			</c:choose>
				<table class="table table-striped" id="table1">
					<c:choose>
							<c:when test="${not empty lecListST}">
								<thead>
									<tr>
										<th class="text-center">학년</th>
										<th class="text-center">강의명</th>
										<th class="text-center">교수</th>
										<th class="text-center">학점</th>
										<th class="text-center">분류</th>
										<th class="text-center">강의실</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${lecListST }" var="lecListST">
									<tr>
										<td class="text-center">${lecListST.grade }</td>
										<td class="text-center"><a class="text-color" href="${cPath }/lecture/index.do?lec_code=${lecListST.lec_code}">${lecListST.lec_name }</a></td>
										<td class="text-center">${lecListST.prof_name }</td>
										<td class="text-center">${lecListST.lec_pnt }</td>
										<td class="text-center">${lecListST.lec_cl}</td>
										<td class="text-center">${lecListST.lecrum }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:when test="${not empty lecListPR }">
								<thead>
									<tr>
										<th class="text-center">대상학년</th>
										<th class="text-center">강의명</th>
										<th class="text-center">학점</th>
										<th class="text-center">분류</th>
										<th class="text-center">강의실</th>
									</tr>
								</thead>
								<c:forEach items="${lecListPR }" var="lecListPR">
									<tr>
										<td class="text-center">${empty lecListPR.lec_atnlc ?  "전체" : lecListPR.lec_atnlc}</td>
										<td class="text-center"><a class="text-color" href="${cPath }/lecture/main.do?lec_code=${lecListPR.lec_code}">${lecListPR.lec_name }</a></td>
										<td class="text-center">${lecListPR.lec_pnt }</td>
										<td class="text-center">${lecListPR.lec_cl}</td>
										<td class="text-center">${lecListPR.lecrum }</td>
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
</script>
