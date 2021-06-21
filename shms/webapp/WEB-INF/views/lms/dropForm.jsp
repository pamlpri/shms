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
         <div class="card inputTable">
             <div class="card-body">
                 <p>※ 지도교수의 자퇴확인서를 제출해주시기 바랍니다.</p>
                 <form id="dropForm" enctype="multipart/form-data" method="post">
                     <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                         <tr>
                             <th class="align-middle text-center">학번</th>
                             <td class="align-middle">${student.stdnt_no }</td>
                             <th class="align-middle text-center">이름</th>
                             <td class="align-middle">${student.name }</td>
                         </tr>
                         <tr>
                             <th class="align-middle text-center">학과</th>
                             <td class="align-middle">${student.sub_name }</td>
                             <th class="align-middle text-center">학년</th>
                             <td class="align-middle">${student.grade }학년</td>
                         </tr>
                         <tr>
                             <th class="align-middle text-center">전화번호</th>
                             <td class="align-middle">${student.tel_no }</td>
                             <th class="align-middle text-center">웹메일</th>
                             <td class="align-middle">${student.webmail }</td>
                         </tr>
                         <tr>
                             <th class="align-middle text-center">자퇴사유</th>
                             <td class="align-middle" colspan="3">
                                 <div class="col-lg-12 row">
                                     <div class="col-md-4">
                                         <select class="form-select float-right" name="req_resn_code">
                                             <option value="">-- 사유선택 --</option>
                                             <option value="GG" ${cng.req_resn_code eq 'GG'?'selected':''}>건강사정</option>
                                             <option value="GJ" ${cng.req_resn_code eq 'GJ'?'selected':''}>가정사정</option>
                                             <option value="TH" ${cng.req_resn_code eq 'TH'?'selected':''}>타대학 진학</option>
                                             <option value="CU" ${cng.req_resn_code eq 'CU'?'selected':''}>취업</option>
                                             <option value="UH" ${cng.req_resn_code eq 'UH'?'selected':''}>어학연수</option>
                                             <option value="JS" ${cng.req_resn_code eq 'JS'?'selected':''}>적성불일치</option>
                                             <option value="GT" ${cng.req_resn_code eq 'GT'?'selected':''}>기타</option>
                                         </select>
                                     </div>
                                 </div>
                             </td>
                         </tr>
                          <c:choose>
                         	<c:when test="${not empty cng.cng_req_no }">
		                         <tr>
										<th class="text-center align-middle">제출 서류<br />원본파일
										</th>
										<td colspan="3" class="text-left"><c:forEach
												items="${cng.attachList }" var="attach">
												<div class="ml-2 fileArea">
													<c:url value="/lms/resumeDownload.do" var="downloadURL">
														<c:param name="atch_file_no" value="${attach.atch_file_no }" />
														<c:param name="atch_file_seq"
															value="${attach.atch_file_seq }" />
													</c:url>
													<p class="fileBox col-lg-6">
														<a href="${downloadURL }" class="text-color 
															data-attno="${attach.atch_file_seq }">${attach.file_nm}</a>
														<span class="delBtn btn btn-danger">-</span>
													</p>
												</div>
											</c:forEach></td>
									</tr>
                         	</c:when>
                         </c:choose>
                     </table>
                     <h6 class="m-b-20">
						<i class="fa fa-paperclip m-r-5 f-s-18"></i> 증명서류제출
					  </h6>
					  <div class="form-inline fileArea row">
						<p class="fileBox col-lg-6">
							<input class="form-control" type="file" name="common_files">
							<span class="plusBtn btn btn-secondary">+</span>
						</p>
					  </div>
                     <div class="text-center mt-3">
                         <a href="${cPath }/lms/drop.do" class="btn btn-light-secondary">취소</a>
                         <!-- update시에만 보이는 버튼 -->
<%--                          <c:if test="${not empty }"></c:if> --%>
                         <button id="saveBtn" class="btn btn-primary" type="button">저장</button>
                         <input type="hidden" name="state" value="update" />
                         <button type="button" class="btn btn-danger block" data-bs-toggle="modal"
                             data-bs-target="#default">
                             삭제
                         </button>
                     </div>
                 </form>
             </div>
         </div>
     </div>
 </section>

 <!--Basic Modal -->
 <div class="modal fade text-left" id="default" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel1" aria-hidden="true">
     <div class="modal-dialog modal-dialog-scrollable" role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title" id="myModalLabel1">게시글 삭제</h5>
                 <button type="button" class="close rounded-pill"
                     data-bs-dismiss="modal" aria-label="Close">
                     <i data-feather="x"></i>
                 </button>
             </div>
             <div class="modal-body">
                 <p>
                     삭제한 게시글은 복원이 불가합니다.<br/>
                     삭제하시겠습니까?
                 </p>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn  btn-secondary" data-bs-dismiss="modal">
                     <i class="bx bx-x d-block d-sm-none"></i>
                     <span class="d-none d-sm-block">닫기</span>
                 </button>
                 <button type="button" class="btn btn-primary ml-1"
                     data-bs-dismiss="modal">
                     <i class="bx bx-check d-block d-sm-none"></i>
                     <span class="d-none d-sm-block">삭제</span>
                 </button>
             </div>
         </div>
     </div>
 </div>
 <!-- contents end -->
</div>
<script>
	var source = '<p class="fileBox col-lg-6">'
		+ '<input class="form-control" type="file" name="common_files">'
		+ '<span class="plusBtn btn btn-secondary">+</span>'
		+ '<span class="delBtn btn btn-danger">-</span>'
	    + '</p>';
	    
	$(".fileArea").on("click", ".plusBtn" ,function(){
		$(this).parents(".fileArea:first").append(source);
	});
	
	$(".fileArea").on("click", ".delBtn", function(){
		$(this).parent("p").remove();
	});
	
	$("#saveBtn").on("click", function(){
		let dropForm = $("#dropForm");
		let state = $("[name='state']").val();
		let files = $("[name='common_files']").val();
		console.log(files);
		// 형식
		let req_resn_code = $("[name='req_resn_code']").val();
		console.log(req_resn_code);
		
		if (req_resn_code == "" && files.length == 0) {
			alert("둘다 아니야!");
		} else if(req_resn_code == "" && files.length != 0){
			alert("선택안함");
		} else if(req_resn_code != "" && files.length == 0){
			alert("첨부파일 확인!");
		} else {
				let action = "${cPath}/lms/insertDrop.do";
				dropForm.attr("action", action);
				dropForm.attr("method", "post");
				dropForm.submit();
				
// 			if(state == 'update'){
// 				let action = "${cPath}/lms/updateSchl.do";
// 				dropForm.attr("action", action);
// 				dropForm.attr("method", "post");	
// 				dropForm.submit();
// 			}else{
// 				let action = "${cPath}/lms/insertDrop.do";
// 				dropForm.attr("action", action);
// 				dropForm.attr("method", "post");
// 				dropForm.submit();
// 			}
		}
	});
</script>