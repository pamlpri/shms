<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자       수정내용
* ----------  ---------  -----------------
* 2021. 6. 3.  박초원       최초작성
* 2021. 6. 7.  김보미		증명서신청 목록 출력
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-content">
   <!-- contents start -->
   <nav aria-label="breadcrumb">
       <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="#">HOME</a></li>
           <li class="breadcrumb-item"><a href="#">증명서</a></li>
           <li class="breadcrumb-item active" aria-current="page">증명서보관함</li>
       </ol>
   </nav>
   <section class="section">
       <div class="card">
           <div class="card-body">
           <form id="hiddenForm">
           		<input type="hidden" name="page" />
           </form>
               <table class="table table-striped" id="table1">
                   <thead>
                       <tr>
                           <th class="text-center">No.</th>
                           <th class="text-center">신청번호</th>
                           <th class="text-center">신청증명서</th>
                           <th class="text-center">신청사유</th>
                           <th class="text-center">신청 / 출력</th>
                           <th class="text-center">발급일자</th>
                           <th class="text-center">보관만료</th>
                           <th class="text-center">출력</th>
                       </tr>
                   </thead>
                   <tbody>
                   		<c:choose>
                   			<c:when test="${not empty crtfList }">
                   				<c:forEach items="${crtfList }" var="crtf">
			                       <tr>
			                           <td class="text-center">${crtf.p_bo_no }</td>
			                           <td class="text-center">${crtf.req_no }</td>
			                           <td class="text-center">${crtf.crtf_kind }</td>
			                           <td class="text-center">${crtf.crtf_req_resn }</td>
			                           <td class="text-center">${crtf.no_of_issue } / 0</td>
			                           <td class="text-center">${crtf.req_de }</td>
			                           <td class="text-center"></td>
			                           <td class="text-center">
			                               <a href="certificate01.html" target="_blank" class="btn-sm btn-primary">출력</a>
			                           </td>
			                       </tr>
                   				</c:forEach>
                   			</c:when>
                   			<c:otherwise>
                   				<tr>
                   					<td colspan="8" class="text-center">증명서 신청내역이 존재하지 않습니다.</td>
                   				</tr>
                   			</c:otherwise>
                   		</c:choose>
                   </tbody>
               </table>
           </div>
       </div>
   </section>
   <!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script type="text/javascript">
	// Simple Datatable
	let table1 = document.querySelector('#table1');
	let dataTable = new simpleDatatables.DataTable(table1);
</script>