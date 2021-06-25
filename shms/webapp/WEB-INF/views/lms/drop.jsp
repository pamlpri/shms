<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
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
         <li class="breadcrumb-item"><a href="#">변동사항</a></li>
         <li class="breadcrumb-item active" aria-current="page">자퇴신청</li>
     </ol>
 </nav>
 
 <section class="section">
     <div class="card">
         <div class="card-body">
             <table class="table table-striped" id="table1">
               <c:choose>
               	<c:when test="${not empty dropList }">
                 <thead>
                     <tr>
                         <th class="text-center">No.</th>
                         <th class="text-center">신청번호</th>
                         <th class="text-center">신청종류</th>
                         <th class="text-center">신청일</th>
                         <th class="text-center">서류제출</th>
                         <th class="text-center">처리상태</th>
                     </tr>
                 </thead>
                 <tbody>
                 		<c:forEach items="${dropList }" var="dropList">
		                     <tr>
		                         <td class="text-center">${dropList.rn }</td>
		                         <td class="text-center">${dropList.cng_req_no }</td>
		                         <td class="text-center">자퇴</td>
		                         <td class="text-center">${dropList.req_de }</td>
		                         <td class="text-center">${dropList.papers_submit_at }</td>
		                         	<c:if test="${dropList.process_stat eq '대기' }">
				                         <td class="text-center"><a href="${cPath}/lms/dropForm.do?cng_req_no=${dropList.cng_req_no}" class="badge bg-info white-color">대기</a></td>
		                         	</c:if>
		                         	<c:if test="${dropList.process_stat eq '완료' }">
				                         <td class="text-center"><a href="${cPath}/lms/dropView.do?cng_req_no=${dropList.cng_req_no}" class="badge bg-success white-color">완료</a></td>
		                         	</c:if>
		                         	<c:if test="${dropList.process_stat eq '승인' }">
				                         <td class="text-center"><a href="${cPath}/lms/dropView.do?cng_req_no=${dropList.cng_req_no}" class="badge bg-primary white-color">승인</a></td>
		                         	</c:if>
		                         	<c:if test="${dropList.process_stat eq '반려' }">
				                          <th class="text-center">
				                          <input type="hidden" value="${dropList.refuse_resn }" name="refuse_resn">
				                             <button type="button" class="btn badge bg-danger block failBtn"
				                                 data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
				                                 반려
				                             </button>
				                         </th>
		                         	</c:if>
		                     </tr>
                 		</c:forEach>
                 	</c:when>
                 	<c:otherwise>
                 		<tr>
                 			<td class="text-center">자퇴 신청 내역이 존재하지 않습니다.</td>
                 		</tr>
                 	</c:otherwise>
                 </c:choose>
                 </tbody>
             </table>
             <div class="breadcrumb breadcrumb-right">
                 <a href="${cPath}/lms/dropForm.do" class="btn btn-primary" >
                     자퇴신청
                 </a>
             </div>
         </div>
     </div>
 </section>

 <!-- Vertically Centered modal Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
	    aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalCenterTitle">
	                    반려사유
	                </h5>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close">
	                    <i data-feather="x"></i>
	                </button>
	            </div>
	            <div class="modal-body">
    			  <p id="inputText">
                  </p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-light-secondary"
	                    data-bs-dismiss="modal">
	                    <i class="bx bx-x d-block d-sm-none"></i>
	                    <span class="d-none d-sm-block">닫기</span>
	                </button>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- contents end -->
</div>	
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
    
	$(".failBtn").on("click", function(){
		let refuse_resn = $(this).parent().find("[name='refuse_resn']").val();
		document.getElementById("inputText").innerText=refuse_resn;
	})
</script>