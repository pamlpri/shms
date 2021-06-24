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
             <input type="hidden" name="page" />
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
	                                             <option value="${college.col_code}">
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
	                                             <option class="${subject.col_code }" value="${subject.sub_code }">
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
                                         	<option value="">전체</option>
                                         	<c:forEach items="${reqClList }" var="comcode">
                                            	<option value="${comcode.com_code_nm }">${comcode.com_code_nm }</option>
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
                                         <input type="text" class="form-control" name="searchWord" aria-label="Recipient's username" aria-describedby="button-addon2">
                                         <button class="btn btn-outline-secondary searchInput" type="button">
                                             <i class="bi bi-search"></i>
                                         </button>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
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
                     <tbody id="listBody">
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
            <p id="inputText"></p>
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
		}else {
			subjectTag.find("option").show();
		}
		subjectTag.find("option:first").show();
	});
	
	let pagingArea = $("#pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
	
	let listBody = $("#listBody");
	
	let searchForm = $("#searchForm").on("change", ":input[name]", function(){
		searchForm.submit();
	}).ajaxForm({
		dataType:"json"
		, success:function(resp){
			listBody.empty();
			let trTags = [];
			if(resp.dataList){
				$(resp.dataList).each(function(idx, regList){
					let tdData;
					if(regList.process_stat == '완료'){
						tdData = $("<td>").html('<a href="${cPath }/lms/academicChangeView.do?cng_req_no=${regList.cng_req_no}" class="badge bg-success white-color">완료</a>');
					}else if(regList.process_stat == '반려'){
						tdData = $("<td>").attr("type", "hidden").attr("name", "refuse_resn").val(regList.refuse_resn).html('<button type="button" class="btn badge bg-danger block failBtn" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">반려</button>');
					}else if(regList.process_stat == '승인'){
						tdData = $("<td>").html('<a href="${cPath }/lms/academicChangeView.do" class="badge bg-primary white-color">승인</a>');
					}else if(regList.process_stat == '대기'){
						tdData = $("<td>").html('<a href="${cPath }/lms/academicChangeView.do" class="badge bg-info white-color">대기</a>');
					};
					let tr = $("<tr>").append(
								$("<td>").text(regList.cng_req_no).addClass("text-center")
								, $("<td>").text(regList.col_name).addClass("text-center")
								, $("<td>").text(regList.sub_name).addClass("text-center")
								, $("<td>").text(regList.stdnt_no).addClass("text-center")
								, $("<td>").text(regList.stdnt_name).addClass("text-center")
								, $("<td>").text(regList.req_de).addClass("text-center")
								, $("<td>").text(regList.proc_date).addClass("text-center")
								, $("<td>").text(regList.req_cl_code).addClass("text-center")
								, tdData
						);
					trTags.push(tr);
				});
			}else{
				trTags.push( 
					$("<tr>").html("<td colspan='9'> class='text-center'> 일치하는 정보가 없습니다. <td>")
				);
			}
			listBody.html(trTags);
			$("#pagingArea").html(resp.pagingHTMLBS);;
		}, error:function(xhr, resp, error){
			console.log(xhr);
		}
	});
	
	searchForm.submit();
	
// 	$("#pagingArea").on("click", "a", function(event){
// 		event.preventDefault();
// 		let page = $(this).data("page");
// 		if(page){
// 			searchForm.find("[name='page']").val(page);
// 			searchForm.submit();
// 		}
// 		return false;
// 	});
	
	$("#newBtn").on("click", function(){
		location.href = $.getContextPath() + "/prod/prodInsert.do";
	});

	
	$(".failBtn").on("click", function(){
		let refuse_resn = $(this).parent().find("[name='refuse_resn']").val();
		document.getElementById("inputText").innerText=refuse_resn;
	})
</script>