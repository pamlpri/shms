<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 21.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-content">
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">학적관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">학적변동</li>
     </ol>
 </nav>

 <!-- contents start -->
 <section class="section">
     <div class="card">
         <div class="card-body">
             <form id="searchForm"> 
                 <div class="row">
                     <div class="col-12">
                         <div class="row">
                             <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>단과대</h6>
                                 </div>
                                 <div class="col-md-9">
                                     <fieldset class="form-group">
                                         <select class="form-select" name="col_code">
                                             <option value="">전체</option>
                                             <c:forEach items="${collegeList }" var="college">
	                                             <option value="college.col_code">
	                                             	${college.col_name }
	                                             </option>
                                             </c:forEach>
                                         </select>
                                     </fieldset>
                                 </div>
                             </div>
                             <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>학과</h6>
                                 </div>
                                 <div class="col-md-9">
                                     <fieldset class="form-group">
                                         <select class="form-select" name="sub_code">
                                             <option value="">전체</option>
                                             <c:forEach items="${subjectList }" var="subject">
	                                             <option class="${subject_col_code }" value="${subject.sub_code }">
	                                             	${subject.sub_name }
	                                             </option>
                                             </c:forEach>
                                         </select>
                                     </fieldset>
                                 </div>
                             </div>
                             <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>변동</h6>
                                 </div>
                                 <div class="col-md-9">
                                     <fieldset class="form-group">
                                         <select class="form-select" name="req_cl_code">
                                         	<option>전체</option>
                                         	<c:forEach items="${comcodeList }" var="comcode">
                                            	<option value="${comcode.com_code }">${comcode.com_code_nm }</option>
                                         	</c:forEach>
                                         </select>
                                     </fieldset>
                                 </div>
                             </div>
                             <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>검색</h6>
                                 </div>
                                 <div class="col-md-9">
                                     <div class="input-group mb-3">
                                         <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                                         <button class="btn btn-outline-secondary searchInput" type="button">
                                             <i class="bi bi-search"></i>
                                         </button>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <input type="hidden" name="searchWord" value=""/>
             </form>

             <div class="table-responsive">
                 <table class="table table-bordered mb-0">
                     <thead>
                         <tr class="bg-th">
                             <th class="text-center">신청번호</th>
                             <th class="text-center">단과대</th>
                             <th class="text-center">학과</th>
                             <th class="text-center">학번</th>
                             <th class="text-center">이름</th>
                             <th class="text-center">신청일</th>
                             <th class="text-center">처리일</th>
                             <th class="text-center">변동사항</th>
                             <th class="text-center">상태</th>
                         </tr>
                     </thead>
                     <tbody>
                     <c:choose>
                     	<c:when test="${not empty cngList}">
                     		<c:forEach items="${cngList }" var="cngList">
	                        	<tr>
		                             <td class="text-center">${cngList.cng_req_no }</td>
		                             <td class="text-center">${cngList.col_name }</td>
		                             <td class="text-center">${cngList.sub_name }</td>
		                             <td class="text-center">${cngList.stdnt_no }</td>
		                             <td class="text-center">${cngList.stdnt_name }</td>
		                             <td class="text-center">${cngList.req_de }</td>
		                             <td class="text-center">${cngList.proc_date }</td>
		                             <td class="text-center">${cngList.req_cl_code }</td>
		                             <td class="text-center">
		                             	<c:if test="${cngList.process_stat eq '완료' }">
			                                <a href="${cPath }/lms/academicChangeView.do" class="badge bg-success white-color">완료</a>
		                             	</c:if>
		                             	<c:if test="${cngList.process_stat eq '반려' }">
			                             	<button type="button" class="btn badge bg-danger block failBtn" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
		                                     반려
		                                 	</button>
		                             	</c:if>
		                             	<c:if test="${cngList.process_stat eq '승인' }">
		                             		<a href="${cPath }/lms/academicChangeView.do" class="badge bg-primary white-color">승인</a>
		                             	</c:if>
		                             	<c:if test="${cngList.process_stat eq '대기' }">
			                             	<a href="${cPath }/lms/academicChangeView.do" class="badge bg-info white-color">
			                                     대기
			                                </a>
		                             	</c:if>
		                             </td>
	                          	</tr>
                     		</c:forEach>
                     	</c:when>
                     	<c:otherwise>
                     		<tr>
                     			<td colspan="9" class="text-center">신청내역이 존재하지 않습니다.</td>
                     		</tr>
                     	</c:otherwise>
                     </c:choose>
                     </tbody>
                 </table>
                 <br>
                 <div id="pagingArea" class="d-flex justify-content-center">
						${pagingVO.pagingHTMLBS }
				</div>
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
             <p>
                 서류 미제출로 인한 반려
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
 <!-- contents end -->
</div>
</div>
<script type="text/javascript">

	let subjectTag = $("[name='sub_code']");
	$("[name='col_code']").on("change", function(){
		let selectedCode = $(this).val();
		subjectTag.val("");
		if(selectedCode){
			subjectTag.find("option").hide();
			subjectTag.find("option."+selectedCode).show();
		}else{
			subjectTag.find("option").show();
		}
		subjectTag.find("option:first").show();
	});
	
	let listBody = $("#listBody");
	let searchForm = $("#searchForm").on("change", ":input[name]", function(){
		searchForm.submit();
	}).ajaxForm({
		dataType : "json",
		success : function(res){
			listBody.empty();
			
		}, error : function(xhr, resp, error){
			console.log(xhr);
		}
	});
	searchForm.submit();
</script>