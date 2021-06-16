<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 16.		최희수	진로교육 게시판
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
	    <ol class="breadcrumb">
	        <li class="breadcrumb-item"><a href="#">HOME</a></li>
	        <li class="breadcrumb-item"><a href="#">취업지원</a></li>
	        <li class="breadcrumb-item active" aria-current="page">진로교육</li>
	    </ol>
	</nav>
	
	<section class="section">
	    <div class="card">
	        <div class="card-body">
	            <table class="table table-striped" id="table1">
	                <thead>
	                    <tr>
	                        <th class="text-center">No.</th>
	                        <th class="text-center">교육명</th>
	                        <th class="text-center">강사(소속)</th>
	                        <th class="text-center">인원</th>
	                        <th class="text-center">대상</th>
	                        <th class="text-center">장소</th>
	                        <th class="text-center">일시</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:choose>
	                		<c:when test="${not empty courseEducList }">
	                			<c:forEach items="${courseEducList }" var="courseEduc" varStatus="i">
	                				<tr>
				                        <td class="text-center">${i.index + 1 }</td>
				                        <td class="text-center"><a href="${cPath}/lms/careerEducationView.do?bo_no=${courseEduc.educ_no }" class="text-color">${courseEduc.educ_title }</a></td>
				                        <td class="text-center">${courseEduc.instrctr_nm }(${courseEduc.instrctr_com })</td>
				                        <td class="text-center">${courseEduc.educ_nmpr }명</td>
				                        <td class="text-center">${courseEduc.educ_target }학년</td>
				                        <td class="text-center">${courseEduc.lecrum_info }</td>
				                        <td class="text-center">${courseEduc.educ_bgnde }</td>
				                    </tr>
	                			</c:forEach>
	                		</c:when>
	                		<c:otherwise>
	                			<tr>
	                				<td class="text-center" colspan="7"></td>
	                			</tr>
	                		</c:otherwise>
	                	</c:choose>
	                </tbody>
	            </table>
	            <!-- 취업장학과 한테만 보이는 버튼 -->
	            <c:if test="${user.user[1] eq 'CJ' }">
		            <div class="breadcrumb breadcrumb-right">
		                <a href="${cPath}/lms/careerEducationForm.do" type="button" class="btn btn-primary" >
		                    <i class="fas fa-edit"></i> 글쓰기
		                </a>
		            </div>
	            </c:if>
	        </div>
	    </div>
	</section>
	<!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>