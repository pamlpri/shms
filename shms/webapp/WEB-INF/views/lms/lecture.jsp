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
				<a id="newLecture" href="" class="btn btn-primary">강의개설</a>
			</c:when>
			</c:choose>
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th>학년</th>
							<th>강의명</th>
							<th>교수</th>
							<th>분류</th>
							<th>강의실</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty lecList}">
								<c:forEach items="${lecList }" var="lecList">
									<tr>
										<td>${lecList.grade }</td>
										<td><a class="text-color" href="${cPath }/lecture/main.do">${lecList.lec_name }</a></td>
										<td>${lecList.pr_name }</td>
										<td>${lecList.lec_cl}</td>
										<td>${lecList.lec_room }</td>
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