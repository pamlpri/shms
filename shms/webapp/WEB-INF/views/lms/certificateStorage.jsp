<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자       수정내용
* ----------  ---------  -----------------
* 2021. 6. 3.  박초원       최초작성
* 2021. 6. 7.  김보미		증명서신청 목록 출력
* 2021. 6. 9.  김보미		데이터 전달
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
               <table class="table table-striped" id="table1">
                   <thead>
                       <tr>
                           <th class="text-center">No.</th>
                           <th class="text-center">신청번호</th>
                           <th class="text-center">신청증명서</th>
                           <th class="text-center">신청사유</th>
                           <th class="text-center">신청</th>
                           <th class="text-center">출력</th>
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
			                           <td class="text-center req_no">${crtf.req_no }</td>
			                           <td class="text-center">${crtf.crtf_kind }</td>
			                           <td class="text-center">${crtf.crtf_req_resn }</td>
			                           <td class="text-center">${crtf.no_of_issue }</td>
			                           <td class="text-center" id="updateIssue">${crtf.issued_cnt }</td>
			                           <td class="text-center">${crtf.req_de }</td>
			                           <c:choose>
			                           		<c:when test="${crtf.end_de > 0 }">
					                           <td class="text-center">D-${crtf.end_de }</td>
			                           		</c:when>
			                           		<c:otherwise>
					                           <td class="text-center expired">만료</td>
			                           		</c:otherwise>
			                           </c:choose>
			                           <td class="text-center">
			                           		<c:choose>
			                           			<c:when test="${crtf.crtf_kind eq '재학증명서' }">
					                               <a href="${cPath }/lms/registrationCertificate.do?req_no=${crtf.req_no}" target="_blank" class="btn-sm btn-primary printBtn">출력</a>
			                           			</c:when>
			                           			<c:when test="${crtf.crtf_kind eq '휴학증명서' }">
					                               <a href="${cPath }/lms/leaveOfAbsenceCertificate.do?req_no=${crtf.req_no}" target="_blank" class="btn-sm btn-primary printBtn">출력</a>
			                           			</c:when>
			                           			<c:when test="${crtf.crtf_kind eq '성적증명서' }">
					                               <a href="${cPath }/lms/scoreCertificate.do?req_no=${crtf.req_no}" target="_blank" class="btn-sm btn-primary printBtn">출력</a>
			                           			</c:when>
			                           			<c:when test="${crtf.crtf_kind eq '졸업증명서' }">
					                               <a href="${cPath }/lms/graduationCertificate.do?req_no=${crtf.req_no}" target="_blank" class="btn-sm btn-primary printBtn">출력</a>
			                           			</c:when>
			                           		</c:choose>
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
	
	
	$(".printBtn").on("click", function(){
		event.preventDefault();
		let req_no = $(this).parents("tr").find(".req_no").text();
		console.log(req_no);		
		$.ajax({
			url : "${cPath}/lms/updateIssue.do"
			, data : { "req_no" : req_no }
			, dataType : "json"
			, success : function(resp){
				if(resp.result == "OK"){
					
				}else{
					event.preventDefault();
					
				}
			}, error : function(xhr, error, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);				
			}
		});
	});
	
	
	
	
	
</script>