<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* 2021. 6. 2.      송수미        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<li class="breadcrumb-item"><a href="#">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">웹메일</a></li>
			<li class="breadcrumb-item active" aria-current="page">보낸메일</li>
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
													<button type="button" class="btn btn-icon action-icon"
														data-toggle="tooltip" id="deleteBtn">
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
											<span class="d-none d-sm-block">1-10 of 653</span>
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
											<li class="media mail-read">
												<div class="user-action">
													<div class="checkbox-con me-3">
														<div class="checkbox checkbox-shadow checkbox-sm">
															<input type="checkbox" id="checkboxsmall1"
																class='form-check-input'> <label
																for="checkboxsmall1"></label>
														</div>
													</div>
													<span class="favorite"> <svg class="bi"
															width="1.5em" height="1.5em" fill="currentColor">
                                                                        <use
																xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope-open" />
                                                                    </svg>
													</span>
												</div>
												<div class="emailName">
													<strong>김영민</strong>
												</div> <a href="mailRead.html" class="media-body text-color">
													<div class="user-details">
														<div class="mail-items">
															<span class="list-group-item-text text-truncate">Open
																source project public release 👍</span>
														</div>
														<div class="mail-meta-item">
															<span class="float-right"> <span class="mail-date">4:14
																	AM</span>
															</span>
														</div>
													</div>
													<div class="mail-message">
														<p class="list-group-item-text truncate mb-0">Hey
															John, bah kivu decrete epanorthotic unnotched Argyroneta
															nonius veratrine preimaginary</p>
														<div class="mail-meta-item">
															<span class="float-right"> <span
																class="bullet bullet-success bullet-sm"></span>
															</span>
														</div>
													</div>
											</a>
											</li>
											<li class="media mail-read">
												<div class="user-action">
													<div class="checkbox-con me-3">
														<div class="checkbox checkbox-shadow checkbox-sm">
															<input type="checkbox" id="checkboxsmall1"
																class='form-check-input'> <label
																for="checkboxsmall1"></label>
														</div>
													</div>
													<span class="favorite"> <svg class="bi"
															width="1.5em" height="1.5em" fill="currentColor">
                                                                        <use
																xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope-open" />
                                                                    </svg>
													</span>
												</div>
												<div class="emailName">
													<strong>김영민</strong>
												</div> <a href="mailRead.html" class="media-body text-color">
													<div class="user-details">
														<div class="mail-items">
															<span class="list-group-item-text text-truncate">Open
																source project public release 👍</span>
														</div>
														<div class="mail-meta-item">
															<span class="float-right"> <span class="mail-date">4:14
																	AM</span>
															</span>
														</div>
													</div>
													<div class="mail-message">
														<p class="list-group-item-text truncate mb-0">Hey
															John, bah kivu decrete epanorthotic unnotched Argyroneta
															nonius veratrine preimaginary</p>
														<div class="mail-meta-item">
															<span class="float-right"> <span
																class="bullet bullet-success bullet-sm"></span>
															</span>
														</div>
													</div>
											</a>
											</li>
											<li class="media">
												<div class="user-action">
													<div class="checkbox-con me-3">
														<div class="checkbox checkbox-shadow checkbox-sm">
															<input type="checkbox" id="checkboxsmall11"
																class='form-check-input'> <label
																for="checkboxsmall11"></label>
														</div>
													</div>
													<span class="favorite text-primary"> <svg class="bi"
															width="1.5em" height="1.5em" fill="currentColor">
                                                                        <use
																xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope-fill" />
                                                                    </svg>
													</span>
												</div>
												<div class="emailName">
													<strong>김영민</strong>
												</div> <a href="mailRead.html" class="media-body text-color">
													<div class="user-details">
														<div class="mail-items">
															<span class="list-group-item-text text-truncate">Open
																source project public release 👍</span>
														</div>
														<div class="mail-meta-item">
															<span class="float-right"> <span class="mail-date">4:14
																	AM</span>
															</span>
														</div>
													</div>
													<div class="mail-message">
														<p class="list-group-item-text truncate mb-0">Hey
															John, bah kivu decrete epanorthotic unnotched Argyroneta
															nonius veratrine preimaginary</p>
														<div class="mail-meta-item">
															<span class="float-right"> <span
																class="bullet bullet-success bullet-sm"></span>
															</span>
														</div>
													</div>
											</a>
											</li>
											<li class="media">
												<div class="user-action">
													<div class="checkbox-con me-3">
														<div class="checkbox checkbox-shadow checkbox-sm">
															<input type="checkbox" id="checkboxsmall11"
																class='form-check-input'> <label
																for="checkboxsmall11"></label>
														</div>
													</div>
													<span class="favorite text-primary"> <svg class="bi"
															width="1.5em" height="1.5em" fill="currentColor">
                                                                        <use
																xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope-fill" />
                                                                    </svg>
													</span>
												</div>
												<div class="emailName">
													<strong>김영민</strong>
												</div> <a href="mailRead.html" class="media-body text-color">
													<div class="user-details">
														<div class="mail-items">
															<span class="list-group-item-text text-truncate">Open
																source project public release 👍</span>
														</div>
														<div class="mail-meta-item">
															<span class="float-right"> <span class="mail-date">4:14
																	AM</span>
															</span>
														</div>
													</div>
													<div class="mail-message">
														<p class="list-group-item-text truncate mb-0">Hey
															John, bah kivu decrete epanorthotic unnotched Argyroneta
															nonius veratrine preimaginary</p>
														<div class="mail-meta-item">
															<span class="float-right"> <span
																class="bullet bullet-success bullet-sm"></span>
															</span>
														</div>
													</div>
											</a>
											</li>
											<li class="media mail-read">
												<div class="user-action">
													<div class="checkbox-con me-3">
														<div class="checkbox checkbox-shadow checkbox-sm">
															<input type="checkbox" id="checkboxsmall1"
																class='form-check-input'> <label
																for="checkboxsmall1"></label>
														</div>
													</div>
													<span class="favorite"> <svg class="bi"
															width="1.5em" height="1.5em" fill="currentColor">
                                                                        <use
																xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope-open" />
                                                                    </svg>
													</span>
												</div>
												<div class="emailName">
													<strong>김영민</strong>
												</div> <a href="mailRead.html" class="media-body text-color">
													<div class="user-details">
														<div class="mail-items">
															<span class="list-group-item-text text-truncate">Open
																source project public release 👍</span>
														</div>
														<div class="mail-meta-item">
															<span class="float-right"> <span class="mail-date">4:14
																	AM</span>
															</span>
														</div>
													</div>
													<div class="mail-message">
														<p class="list-group-item-text truncate mb-0">Hey
															John, bah kivu decrete epanorthotic unnotched Argyroneta
															nonius veratrine preimaginary</p>
														<div class="mail-meta-item">
															<span class="float-right"> <span
																class="bullet bullet-success bullet-sm"></span>
															</span>
														</div>
													</div>
											</a>
											</li>
											<li class="media mail-read">
												<div class="user-action">
													<div class="checkbox-con me-3">
														<div class="checkbox checkbox-shadow checkbox-sm">
															<input type="checkbox" id="checkboxsmall1"
																class='form-check-input'> <label
																for="checkboxsmall1"></label>
														</div>
													</div>
													<span class="favorite"> <svg class="bi"
															width="1.5em" height="1.5em" fill="currentColor">
                                                                        <use
																xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope-open" />
                                                                    </svg>
													</span>
												</div>
												<div class="emailName">
													<strong>김영민</strong>
												</div> <a href="mailRead.html" class="media-body text-color">
													<div class="user-details">
														<div class="mail-items">
															<span class="list-group-item-text text-truncate">Open
																source project public release 👍</span>
														</div>
														<div class="mail-meta-item">
															<span class="float-right"> <span class="mail-date">4:14
																	AM</span>
															</span>
														</div>
													</div>
													<div class="mail-message">
														<p class="list-group-item-text truncate mb-0">Hey
															John, bah kivu decrete epanorthotic unnotched Argyroneta
															nonius veratrine preimaginary</p>
														<div class="mail-meta-item">
															<span class="float-right"> <span
																class="bullet bullet-success bullet-sm"></span>
															</span>
														</div>
													</div>
											</a>
											</li>
											<li class="media">
												<div class="user-action">
													<div class="checkbox-con me-3">
														<div class="checkbox checkbox-shadow checkbox-sm">
															<input type="checkbox" id="checkboxsmall11"
																class='form-check-input'> <label
																for="checkboxsmall11"></label>
														</div>
													</div>
													<span class="favorite text-primary"> <svg class="bi"
															width="1.5em" height="1.5em" fill="currentColor">
                                                                        <use
																xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope-fill" />
                                                                    </svg>
													</span>
												</div>
												<div class="emailName">
													<strong>김영민</strong>
												</div> <a href="mailRead.html" class="media-body text-color">
													<div class="user-details">
														<div class="mail-items">
															<span class="list-group-item-text text-truncate">Open
																source project public release 👍</span>
														</div>
														<div class="mail-meta-item">
															<span class="float-right"> <span class="mail-date">4:14
																	AM</span>
															</span>
														</div>
													</div>
													<div class="mail-message">
														<p class="list-group-item-text truncate mb-0">Hey
															John, bah kivu decrete epanorthotic unnotched Argyroneta
															nonius veratrine preimaginary</p>
														<div class="mail-meta-item">
															<span class="float-right"> <span
																class="bullet bullet-success bullet-sm"></span>
															</span>
														</div>
													</div>
											</a>
											</li>
										</ul>
										<!-- email user list end -->
									</div>
								</div>
							</div>
							<!--/ Email list Area -->
							<form id="searchForm" action="${cPath }/lms/inbox.do">
								<input type="hidden" name="searchWord" />
								<input type="hidden" name="page" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
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
            $(".email-user-list").find("input:checked").parents(".media").remove();
        });
        
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
        		if(resp.dataList){
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
								 + '				class="form-check-input">'
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
        		}else{
        			console.log("없음");
        		}
        	}, error : function(xhr, resp, error){
        		console.log(xhr);
        	}
        });
        searchForm.submit();
        
        
    });
</script>