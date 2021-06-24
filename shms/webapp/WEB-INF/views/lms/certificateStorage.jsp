<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자       수정내용
* ----------  ---------  -----------------
* 2021. 6. 3.  박초원       최초작성
* 2021. 6. 7.  김보미		증명서신청 목록 출력
* 2021. 6. 9.  김보미		데이터 전달
* 2021. 6. 10. 김보미		버튼 제어
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
			                       <tr class="${crtf.req_no }">
			                           <td class="text-center">${crtf.p_bo_no }</td>
			                           <td class="text-center req_no">${crtf.req_no }</td>
			                           <td class="text-center">${crtf.crtf_kind }</td>
			                           <td class="text-center">${crtf.crtf_req_resn }</td>
			                           <td class="text-center no_of_issue">${crtf.no_of_issue }</td>
			                           <td class="text-center updateIssue">${crtf.issued_cnt }</td>
			                           <td class="text-center">${crtf.req_de }</td>
			                           <c:choose>
			                           		<c:when test="${crtf.end_de > 0 }">
					                           <td class="text-center end_de">D-${crtf.end_de }</td>
			                           		</c:when>
			                           		<c:otherwise>
					                           <td class="text-center expired">만료</td>
			                           		</c:otherwise>
			                           </c:choose>
			                           <td class="text-center">
			                           		<c:choose>
			                           			<c:when test="${crtf.no_of_issue eq crtf.issued_cnt}">
			                           				<button type="button" class="btn btn-sm btn-primary" disabled>완료</button>
			                           			</c:when>	
			                           			<c:when test="${crtf.end_de <= 0 }">
			                           				<button type="button" class="btn btn-sm btn-danger" disabled>만료</button>
			                           			</c:when>	
			                           			<c:otherwise>
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
			                           			</c:otherwise>	                           			
			                           			
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
		let req_no = $(this).parents("tr").attr("class");
		let issued_cnt = parseInt($(this).parents("tr").children(".updateIssue").text());
		let no_of_issue = parseInt($(this).parents("tr").children(".no_of_issue").text());
		let end_de = ($(this).parents("tr").children(".end_de").text()).substring(2);
		let href = $(this).attr('href');
		if(no_of_issue - issued_cnt == 0){
			$(this).attr('href', "");
		}
		console.log(req_no);		
		console.log("end_de : " + end_de);		
		$.ajax({
			url : "${cPath}/lms/updateIssue.do"
			, data : { 
				req_no : req_no,
				issued_cnt : issued_cnt,
				no_of_issue : no_of_issue,
				end_de : end_de
				}
			, dataType : "json"
			, method : "post"
			, success : function(resp){
				if(resp.result == "OK"){
					$("#table1").find("."+req_no).children(".updateIssue").text(issued_cnt+1);
						window.open(href, '_blank'); 
					if(no_of_issue == issued_cnt+1){
						$("#table1").find("."+req_no).find("a").remove();
						$("#table1").find("."+req_no).children("td:last").append('<button type="button" class="btn btn-sm btn-primary" disabled>완료</button>');
					}else {
						
					}
				}
			}, error : function(xhr, error, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);				
			}
		});
	});
	
	
	
	
	
</script>