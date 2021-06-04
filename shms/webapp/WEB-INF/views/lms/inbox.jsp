<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* 2021. 6. 2.      송수미		받은 메일 리스트 기능 구현        
* 2021. 6. 3.      송수미        받은 메일 리스트 기능 구현
* 2021. 6. 4.      송수미        받은 메일 삭제 기능 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${cPath }/resources/lms/assets/css/pages/email.css"/>
<style>
    body {
        overflow-x: hidden;
    }
    .content-right{width:100%!important;}
</style>

<div class="page-content">
	<!-- contents start -->

	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">웹메일</a></li>
			<li class="breadcrumb-item active" aria-current="page">받은메일</li>
		</ol>
	</nav>

	<div class="page-heading email-application">
		<section class="section content-area-wrapper">
			<div class="content-right">
				<div class="content-wrapper">
					<div class="content-header row"></div>
					<div class="content-body">
						<!-- email app overlay -->
						<div class="app-content-overlay"></div>
						<div class="email-app-area">
							<!-- Email list Area -->
							<div class="email-app-list-wrapper">
								<div class="email-app-list">
									<div class="email-action">
										<!-- action left start here -->
										<div class="action-left d-flex align-items-center">
											<!-- select All checkbox -->
											<div
												class="checkbox checkbox-shadow checkbox-sm selectAll me-3">
												<input type="checkbox" id="checkboxsmall"
													class='form-check-input'> <label
													for="checkboxsmall"></label>
											</div>
											<!-- delete unread dropdown -->
											<ul class="list-inline m-0 d-flex" style="overflow-y: auto;">
												<li class="list-inline-item mail-delete">
													<button type="button" class="btn btn-icon action-icon" id="deleteBtn">
														<span class="fonticon-wrap"> <i class="far fa-trash-alt"></i>
														</span>
													</button>
												</li>
											</ul>
										</div>
										<!-- action left end here -->

										<!-- action right start here -->
										<div
											class="action-right d-flex flex-grow-1 align-items-center justify-content-around">
											<!-- search bar  -->
											<div class="email-fixed-search flex-grow-1">
												<div class="sidebar-toggle d-block d-lg-none">
													<i class="bx bx-menu"></i>
												</div>

												<div class="form-group position-relative  mb-0 has-icon-left">
													<input type="text" class="form-control" id="searchWord" name="searchWord"
														placeholder="Search email..">
													<div class="form-control-icon">
														<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        	<use xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#search" />
                                                        </svg>
													</div>
												</div>
											</div>
											<!-- pagination and page count -->
											<span id="pageInfo" class="d-none d-sm-block"></span>
											<button
												class="btn btn-icon email-pagination-prev d-none d-sm-block">
												<i class="fas fa-chevron-left"></i>
											</button>
											<button
												class="btn btn-icon email-pagination-next d-none d-sm-block">
												<i class="fas fa-chevron-right"></i>
											</button>
										</div>
									</div>
									<!-- / action right -->

									<!-- email user list start -->
									<div class="email-user-list list-group">
										<ul class="users-list-wrapper media-list" id="listBody">
										</ul>
										<!-- email user list end -->
									</div>
								</div>
							</div>
							<!--/ Email list Area -->
							<form id="searchForm" action="${cPath }/lms/inbox.do">
								<input type="hidden" name="searchWord" />
								<input type="hidden" name="page" />
								<input type="hidden" id="totalPage" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!--Basic Modal -->
	<div class="modal fade text-left" id="default" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel1">메일 삭제</h5>
					<button type="button" class="close rounded-pill"
						data-bs-dismiss="modal" aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="close">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>

<script>
	$(function(){
	    $(".selectAll").on("click", "#checkboxsmall", function(){
	        if($(this).prop("checked")){
	            $(".email-user-list").find(".form-check-input").prop("checked", true);
	        }else {
	            $(".email-user-list").find(".form-check-input").prop("checked", false);
	        }
	    });
		
	    
	    $("#deleteBtn").on("click", function(){
	        let deletenos = new Array();
	    	let checkeds = $(".email-user-list").find("input:checked");
	    	let message = "";
	    	$(checkeds).each(function(idx, checked){
	    		deleteno = $(checked).data("mailno");
				deletenos.push(deleteno);
	    	})
	    	
	    	$.ajax({
	    		url : "${cPath}/lms/webmailDelete.do"
	    		, method : "post"
	    		, data : {
	    			deletenos : deletenos,
	    			selectMenu : "inbox"
	    		}, dataType : "json"
	    		, success : function(resp){
	    			$(".modal-body").empty();
	    			if(resp == "OK"){
	    				message = "삭제가 완료되었습니다."	;
	    			}else{
	    				message = "삭제에 실패하였습니다. 잠시 후 다시 시도해주세요.";
	    			}
	    			$(".modal-body").text(message);
	    			$("#default").addClass("show").css("display", "block");
			    	searchForm.submit();
	    		}, error : function(xhr, error, msg){
					console.log(xhr);
					console.log(error);
					console.log(msg);
				}
	    			
	    	});
	    	
	    	$("#default").find("#close").on("click", function(){
	    		$("#default").removeClass("show").css("display", "none");
	    	});
	    	
	    });
	    
	    let page = 1;
	    let prevBtn = $(".email-action").find(".email-pagination-prev");
	    let nextBtn = $(".email-action").find(".email-pagination-next");
	    let pageInfo = "";
	    let totalPage = $("#totalPage").val();
	    
	    $("#searchWord").on("keyup", function(){
	    	searchWord = $("#searchWord").val();
			$(searchForm).find("input[name='searchWord']").val(searchWord);     	
			$(searchForm).find("input[name='page']").val("");
			searchForm.submit();
	    });
	    
	    let searchWord = $("#searchWord").val();
	    let listBody = $("#listBody");
	    let searchForm = $("#searchForm").ajaxForm({
	    	dataType : "json"
	    	, beforeSubmit: function(){
	    		searchForm.find("[name='page']").val("")
	    	}, success : function(resp){
	    		listBody.empty();
	    		if(resp.dataList.length > 0){
					$(resp.dataList).each(function (idx, webmail) {
						let liClass = "";
						if(webmail.read_at == 'Y'){
							liClass = "mail-read"; 
						}
						
						let li = '<li class="media '+ liClass + '">'
								 + ' <div class="user-action">'
								 + '	<div class="checkbox-con me-3">'
								 + '		<div class="checkbox checkbox-shadow checkbox-sm">'
								 + '			<input type="checkbox" id="checkboxsmall1"'
								 + '				class="form-check-input" data-mailno="' + webmail.send_no +'">'
								 + '				<label for="checkboxsmall1"></label>'
								 + '		</div>'
								 + '	</div>'
								 + '    <span class="favorite">';
								 if(webmail.read_at == 'Y'){
									 li += '<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">'
									      + '	<use xlink:href="${cPath }/resources/lms/assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope-open" />'
									      + '</svg>';
								 }else{
									 li += '<svg class="bi text-primary" width="1.5em" height="1.5em" fill="currentColor">'
									      + '	<use xlink:href="${cPath }/resources/lms/assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope-fill" />'
									      + '</svg>';
								 }
						 li += '		</span>'
						     + '	</div>'
						     + '	<div class="emailName">'
			  				 + '		<strong>' + webmail.name + '</strong>'
							 + '	</div>'
			  				 + '	<a href="mailRead.html" class="media-body text-color">'
							 + '	<div class="user-details">'
							 + '		<div class="mail-items">'
							 + '			<span class="list-group-item-text text-truncate">' + webmail.title  +'</span>'
							 + '		</div>'
							 + '	    <div class="mail-meta-item">'
							 + '			<span class="float-right"> <span class="mail-date">'+ webmail.send_date +'</span>'
							 + '			</span>'
							 + '		</div>'
							 + '	</div>' 
							 + '	<div class="mail-message">'
							 + '		<p class="list-group-item-text truncate mb-0">' + webmail.cont + '</p>'
							 + '		<div class="mail-meta-item">'
							 + '			<span class="float-right">'
						     + '				<span class="bullet bullet-success bullet-sm"></span>'
						     + '			</span>'
							 + '		</div>'
				             + '	</div>'
						     + '	</a>'
							 + '</li>';
							 
						listBody.append(li);
					});
					let totalRecord = resp.totalRecord;
					let startRow = resp.startRow == 1 ? 1 : resp.startRow;
					let endRow = resp.endRow < totalRecord ? resp.endRow : totalRecord;
					totalPage = resp.totalPage;
					pageInfo = startRow + " - " + endRow + " of " + totalRecord;
					$("#pageInfo").text("");
					$("#pageInfo").text(pageInfo);
					$("#totalPage").val(totalPage);
	    		}else{
					$("#pageInfo").text("0 - 0 of 0");
	    		}
	    	}, error : function(xhr, resp, error){
	    		console.log(xhr);
	    	}
	    });
	    searchForm.submit();
	    
			if(page == 1){
				prevBtn.prop("disabled", true);
			}
	    
			if(page == totalPage){
				nextBtn.prop("disabled", true);
			}
			
	    $(prevBtn).on("click", function(){
	    	if(page > 1){
	    		page = page - 1;
				if(page == 1){
					prevBtn.prop("disabled", true);
				}
	    		searchForm.find("[name='page']").val(page);
	    		searchForm.submit();
	    		nextBtn.prop("disabled", false);
	    	}
	    });
	    
	    $(nextBtn).on("click", function(){
	    	if(page < totalPage){
	       		page = page + 1;
				if(page == totalPage){
					nextBtn.prop("disabled", true);
				}
				$(searchForm).find("input[name='page']").val(page);
	       		searchForm.submit();
	       		$(prevBtn).prop("disabled", false);
	    	}
	    });
	});

    </script>