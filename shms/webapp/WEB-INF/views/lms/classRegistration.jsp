<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* 2021. 6. 3.      송수미        수강신청 조회 기능 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${cPath }/resources/lms/assets/css/pages/email.css">
<link rel="stylesheet" href="${cPath }/resources/lms/assets/vendors/toastify/toastify.css">
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
			<li class="breadcrumb-item"><a href="${cPath }/lms/classResiInfo.do">수강신청</a></li>
			<li class="breadcrumb-item active" aria-current="page">수강신청</li>
		</ol>
	</nav>

	<form id="searchForm">
		<div class="row">
			<div class="radioBox col-md-4 mb-4">
				<div class="form-check float-left">
					<input class="form-check-input" type="radio" name="lec_cl_grp" id="cartBtn" value="cart">
					<label class="form-check-label" for="flexRadioDefault1"> 장바구니 </label>
				</div>	
				<div class="form-check float-left">
					<input class="form-check-input" type="radio" name="lec_cl_grp" id="flexRadioDefault1" value="G06_1">
					<label class="form-check-label" for="flexRadioDefault1"> 전공 </label>
				</div>
				<div class="form-check float-left">
					<input class="form-check-input" type="radio" name="lec_cl_grp" id="flexRadioDefault1" value="G06_2">
					<label class="form-check-label" for="flexRadioDefault1"> 교양 </label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-md-3 mb-2">
						<h6>단과대선택</h6>
						<fieldset class="form-group">
							<select class="form-select" name="col_code">
								<option value="">전체</option>
								<c:forEach items="${collegeList }" var="college">
									<option value="${college.col_code}" ${selected }>
										${college.col_name }
									</option>
								</c:forEach>
							</select>
						</fieldset>
					</div>
					<div class="col-md-3 mb-2">
						<h6>학과선택</h6>
						<fieldset class="form-group">
							<select class="form-select" name="sub_code">
								<option value="">전체</option>
								<c:forEach items="${subjectList }" var="subject">
									<option class="${subject.col_code }" value="${subject.sub_code }" ${selected }>
										${subject.sub_name }
									</option>
								</c:forEach>
							</select>
						</fieldset>
					</div>
					<div class="col-md-3 mb-2">
						<h6>학년</h6>
						<fieldset class="form-group">
							<select class="form-select" name="lec_atnlc">
								<c:forEach var="i" begin="0" end="${student.grade }">
									<c:set var="selected" value="${student.grade eq i  ? 'selected' : ''}"></c:set>
									<c:choose>
										<c:when test="${i eq 0}">
											<option value="${i }">전학년</option>
										</c:when>
										<c:otherwise>
											<option value="${i }" ${selected}>${i }학년</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</fieldset>
					</div>
					<div class="col-md-3 mb-2">
						<h6>강의검색</h6>
						<fieldset class="form-group">
							<select class="form-select" name="searchType">
								<option value="">전체</option>
								<option value="lec_name">강의명</option>
								<option value="lec_code">강의코드</option>
								<option value="name">강의교수</option>
							</select>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
		<div class="email-action">
			<!-- action right start here -->
			<div
				class="action-right d-flex flex-grow-1 align-items-center justify-content-around">
				<!-- search bar  -->
				<div class="email-fixed-search flex-grow-1">
					<div class="sidebar-toggle d-block d-lg-none">
						<i class="bx bx-menu"></i>
					</div>
					<div class="form-group position-relative mb-3">
						<input type="text" class="form-control" placeholder="검색단어를 입력하세요." name="searchWord" value="">
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="page-heading email-application lectureHeader">
		<h5>
			<i class="fas fa-bookmark"></i> 수강신청 과목
		</h5>
		<section class="section content-area-wrapper">
			<div class="content-right">
				<div class="content-wrapper">
					<div class="content-body">
						<!-- email app overlay -->
						<div class="email-app-area">
							<!-- Email list Area -->
							<div class="email-app-list-wrapper">
								<div class="email-app-list">
									<!-- / action right -->
									<form class="email-user-list list-group lectureList"
										id="lectureForm">
										<table class="table table-bordered mb-0">
											<thead>
												<tr>
													<th class="text-center">강의코드</th>
													<th class="text-center">이수구분</th>
													<th class="text-center">교과목명</th>
													<th class="text-center">담당교수</th>
													<th class="text-center">학년</th>
													<th class="text-center">학점</th>
													<th class="text-center">강의시간</th>
													<th class="text-center">수강인원</th>
													<th class="text-center">제한인원</th>
													<th class="text-center">신청</th>
												</tr>
											</thead>
											<tbody id="listBody">
												
											</tbody>
										</table>
										<!-- lecture list end -->
									</form>
								</div>
							</div>
							<!--/ lecture list Area -->
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<div class="page-heading email-application lectureHeader">
		<h5>
			<i class="fas fa-bookmark"></i> 나의 수강신청 현황
		</h5>
		<section class="section content-area-wrapper">
			<div class="content-right">
				<div class="content-wrapper">
					<div class="content-body">
						<!-- email app overlay -->
						<div class="email-app-area">
							<!-- Email list Area -->
							<div class="email-app-list-wrapper">
								<form class="email-user-list list-group lectureList"
									id="completionForm">
									<table class="table table-bordered mb-0">
										<thead>
											<tr>
												<th class="text-center">강의코드</th>
												<th class="text-center">이수구분</th>
												<th class="text-center">교과목명</th>
												<th class="text-center">담당교수</th>
												<th class="text-center">학년</th>
												<th class="text-center">학점</th>
												<th class="text-center">강의시간</th>
												<th class="text-center">수강인원</th>
												<th class="text-center">제한인원</th>
												<th class="text-center">신청</th>
											</tr>
										</thead>
										<tbody id="sugangList">
											<c:forEach var="sugang" items="${sugangList }">
												<tr class="${sugang.lec_code }">
													<td class="text-center">${sugang.lec_code }</td>
													<td class="text-center">${sugang.lec_cl_nm }</td>
													<td class="text-center">${sugang.lec_name }</td>
													<td class="text-center">${sugang.name }</td>
													<td class="text-center">${sugang.lec_atnlc eq 0 ? "전학년" : sugang.lec_atnlc}</td>
													<td class="text-center">${sugang.lec_pnt }</td>
													<td class="text-center times">${sugang.dayotw_nm } ${sugang.lec_time - 8} ${sugang.lec_end - 8 }</td>
													<td class="text-center sugangNum">${sugang.lec_sugang }</td>
													<td class="text-center cpacityNum">${sugang.lec_cpacity }</td>
													<td class="text-center">
														<button type="button" class="btn btn-danger btn-sm deleteBtn">삭제</button>
													</td>
													<input type="hidden"  name="estbl_year"  value="${sugang.estbl_year}" />
													<input type="hidden"  name="estbl_semstr"  value="${sugang.estbl_semstr}" />
													<input type="hidden"  name="lec_pnt"  value="${sugang.lec_pnt}" />
													<input type="hidden"  name="dayotw_nm"  value="${sugang.dayotw_nm}" />
													<input type="hidden"  name="lec_time"  value="${sugang.lec_time}" />
													<input type="hidden"  name="lec_end"  value="${sugang.lec_end}" />
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- lecture list end -->
								</form>
							</div>
						</div>
						<!--/ lecture list Area -->
					</div>
				</div>
			</div>
		</section>
	</div>

	<div class="page-heading email-application">
		<section class="section content-area-wrapper">
			<div class="content-right">
				<div class="content-wrapper">
					<div class="content-body">
						<!-- email app overlay -->
						<div class="email-app-area">
							<!-- Email list Area -->
							<div class="email-app-list-wrapper">
								<div class="email-user-list list-group lectureList">
									<table class="table table-bordered mb-0">
										<tr id="sugangReqList">
											 <th class="text-center align-middle">신청교과목수</th>
			                                 <td class="text-center align-middle sugang_cnt" data-cnt="${sugangReqIndexInfo.sugang_lec_cnt }">
			                                 	${not empty sugangReqIndexInfo ? sugangReqIndexInfo.sugang_lec_cnt : "0"}과목
			                                 </td>
			                                 <th class="text-center align-middle">신청학점</th>
			                                 <td class="text-center align-middle sugang_at_pnt" data-cnt="${sugangReqIndexInfo.sugang_at_pnt}">
			                                 	${not empty sugangReqIndexInfo ? sugangReqIndexInfo.sugang_at_pnt : "0"}학점
			                                 </td>
			                                 <th class="text-center align-middle">수강 가능 학점</th>
			                                 <td class="text-center align-middle sugang_able_pnt" data-cnt="${sugangReqIndexInfo.lec_able_pnt }">
			                                 	${sugangReqIndexInfo.lec_able_pnt }학점
			                                 </td>
										</tr>
									</table>
									<!-- lecture list end -->
								</div>
							</div>
						</div>
						<!--/ lecture list Area -->
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
<script type="text/javascript">
	let time = [];
	for(var i = 0; i <= 20; i++){
		if(i < 9){
			time.push(0);
		}else{
			time.push(i-8);
		}
	}
	let subjectTag = $("[name='sub_code']");
	$("[name='col_code']").on("change", function(){
		let selectedCode = $(this).val();
		if(selectedCode){
			subjectTag.find("option").hide();
			subjectTag.find("option."+selectedCode).show();
		}else {
			subjectTag.find("option").show();
		}
		subjectTag.find("option:first").show();
	});
	
	let listBody = $("#listBody");
	let searchForm = $("#searchForm").on("change", ":input[name]", function(){
		searchForm.submit();
	}).ajaxForm({
		dataType : "json",
		success : function(resp){
			listBody.empty();
			let trTags = [];
			if(resp.dataList){
				$(resp.dataList).each(function(idx, sugang){
					let lec_atnlc = "";
					if(sugang.lec_atnlc == 0){
						lec_atnlc = "전학년";
					}else {
						lec_atnlc = sugang.lec_atnlc;
					}
					let tr = $("<tr>").append(
								$("<td>").text(sugang.lec_code).addClass("text-center")
								,$("<td>").text(sugang.lec_cl_nm).data("lec_cl", sugang.lec_cl).addClass("text-center")
								,$("<td>").text(sugang.lec_name).addClass("text-center")
								,$("<td>").text(sugang.name).data("staff_no", sugang.staff_no).addClass("text-center")
								,$("<td>").text(lec_atnlc).addClass("text-center")
								,$("<td>").text(sugang.lec_pnt).addClass("text-center")
								,$("<td>").text(sugang.dayotw_nm + " " + time[sugang.lec_time] + " " + time[sugang.lec_end]).addClass("text-center times")
								,$("<td>").text(sugang.lec_sugang).addClass("text-center sugangNum")
								,$("<td>").text(sugang.lec_cpacity).addClass("text-center cpacityNum")
								,$("<td>").html('<button type="button" class="btn btn-primary btn-sm saveBtn">신청</button>').addClass("text-center")
								,$("<input>").attr("type", "hidden").attr("name", "estbl_year").val(sugang.estbl_year)
								,$("<input>").attr("type", "hidden").attr("name", "estbl_semstr").val(sugang.estbl_semstr)
								,$("<input>").attr("type", "hidden").attr("name", "lec_pnt").val(sugang.lec_pnt)
								,$("<input>").attr("type", "hidden").attr("name", "dayotw_nm").val(sugang.dayotw_nm)
								,$("<input>").attr("type", "hidden").attr("name", "lec_time").val(sugang.lec_time)
								,$("<input>").attr("type", "hidden").attr("name", "lec_end").val(sugang.lec_end)
							).attr("class", sugang.lec_code);
					trTags.push(tr);
				});
			}else {
				trTags.push(
					$("<tr>").html("<td colspan='10' class='text-center'>일치하는 강의가 없습니다.</td>")
				);
			}
			listBody.html(trTags);
		}, error : function(xhr, resp, error){
			console.log(xhr);
		}
	});
	
	searchForm.submit();
	
	let sugangList = $("#sugangList");
	let sugangReqList = $("#sugangReqList");
	$(listBody).on("click", ".saveBtn", function(){
		let lec_code = $(this).parents("tr").attr("class");
		let sugangNum = $(this).parents("tr").find(".sugangNum").text();
		let cpacityNum = $(this).parents("tr").find(".cpacityNum").text();
		let stdnt_no = "${student.stdnt_no}";
		let req_year = $(this).parents("tr").find("input[name='estbl_year']").val();
		let req_semstr = $(this).parents("tr").find("input[name='estbl_semstr']").val();
		let lec_pnt = $(this).parents("tr").find("input[name='lec_pnt']").val();
		let sugang_cnt = $(sugangReqList).find(".sugang_cnt").data("cnt");
		let sugang_at_pnt = $(sugangReqList).find(".sugang_at_pnt").data("cnt");
		let sugang_able_pnt = $(sugangReqList).find(".sugang_able_pnt").data("cnt");
		let times = $(this).parents("tr").children(".times").text();
		let dayotw_nm = $(this).parents("tr").find("input[name='dayotw_nm']").val();
		let lec_time = parseInt($(this).parents("tr").find("input[name='lec_time']").val());
		let lec_end = parseInt($(this).parents("tr").find("input[name='lec_end']").val());
		
		if(sugangNum == cpacityNum){
			Toastify({
	            text: "수강 인원을 초과하여 신청이 불가합니다.",
	            duration: 3000,
	            close:true,
	            gravity:"bottom",
	            position: "center",
	            backgroundColor: "#454546",
	        }).showToast();
			return preventDefaultAction(false);
		}
		
		if($(sugangList).find("tr").length > 0){
			let trs = $(sugangList).children("tr");
			$(trs).each(function(idx, tr){
				if($(this).attr("class") == lec_code){
					Toastify({
			            text: "이미 수강신청 완료된 강의입니다.",
			            duration: 3000,
			            close:true,
			            gravity:"bottom",
			            position: "center",
			            backgroundColor: "#435ebe",
			        }).showToast();
					return preventDefaultAction(false);
				}
			});
		}
		
		if(parseInt(sugang_at_pnt) + parseInt(lec_pnt) > sugang_able_pnt){
			Toastify({
	            text: "수강가능학점이 초과되었습니다.",
	            duration: 3000,
	            close:true,
	            gravity:"bottom",
	            position: "center",
	            backgroundColor: "#eaca4a",
	        }).showToast();
			return false;
		}
		
		if($(sugangList).find("tr").length > 0){
			let trs = $(sugangList).children("tr");
			$(trs).each(function(idx, tr){
				let trDayo = $(this).find("input[name='dayotw_nm']").val();
				let trTime = parseInt($(this).find("input[name='lec_time']").val());
				let trEnd = parseInt($(this).find("input[name='lec_end']").val());
				console.log(trDayo + " " + trTime+ " " +trEnd);
				if(trDayo == dayotw_nm){
					if(trTime <= lec_time && lec_time <= trEnd){
						Toastify({
				            text: "해당 강의시간의 강의가 존재합니다.",
				            duration: 3000,
				            close:true,
				            gravity:"bottom",
				            position: "center",
				            backgroundColor: "#56b6f7",
				        }).showToast();
						return preventDefaultAction(false);
					}else if(lec_time <= trTime && trTime <= lec_end){
						Toastify({
				            text: "해당 강의시간의 강의가 존재합니다.",
				            duration: 3000,
				            close:true,
				            gravity:"bottom",
				            position: "center",
				            backgroundColor: "#56b6f7",
				        }).showToast();
						return preventDefaultAction(false);
					}
				}
			});
		}
		
		$.ajax({
			url : "${cPath}/lms/classRegistrationInsert.do"
			,data :{
				lec_code : lec_code,
				stdnt_no : stdnt_no,
				req_year : req_year,
				req_semstr : req_semstr
			}
			,method : "post"
			,dataType : "json"
			,success : function(resp){
				if(resp.result == "OK"){
					let lec_atnlc = "";
					if(resp.sugang.lec_atnlc == 0){
						lec_atnlc = "전학년";
					}else {
						lec_atnlc = resp.sugang.lec_atnlc;
					}
					
					$(listBody).children("." + lec_code).children(".sugangNum").text(parseInt(sugangNum) + 1);
					$(sugangReqList).find(".sugang_cnt").data("cnt", sugang_cnt + 1).text(sugang_cnt + 1 + "과목");
					$(sugangReqList).find(".sugang_at_pnt").data("cnt", sugang_at_pnt + resp.sugang.lec_pnt).text(sugang_at_pnt + resp.sugang.lec_pnt + "학점");
					
					$(sugangList).append(
							$("<tr>").attr("class", resp.sugang.lec_code).append(
									$("<td>").text(resp.sugang.lec_code).addClass("text-center")
									,$("<td>").text(resp.sugang.lec_cl_nm).data("lec_cl", resp.sugang.lec_cl).addClass("text-center")
									,$("<td>").text(resp.sugang.lec_name).addClass("text-center")
									,$("<td>").text(resp.sugang.name).data("staff_no", resp.sugang.staff_no).addClass("text-center")
									,$("<td>").text(lec_atnlc).addClass("text-center")
									,$("<td>").text(resp.sugang.lec_pnt).addClass("text-center")
									,$("<td>").text(resp.sugang.dayotw_nm + " " + time[resp.sugang.lec_time] + " " + time[resp.sugang.lec_end]).addClass("text-center times")
									,$("<td>").text(resp.sugang.lec_sugang).addClass("text-center sugangNum")
									,$("<td>").text(resp.sugang.lec_cpacity).addClass("text-center")
									,$("<td>").html('<button type="button" class="btn btn-danger btn-sm deleteBtn">삭제</button>').addClass("text-center")
									,$("<input>").attr("type", "hidden").attr("name", "estbl_year").val(resp.sugang.estbl_year)
									,$("<input>").attr("type", "hidden").attr("name", "estbl_semstr").val(resp.sugang.estbl_semstr)
									,$("<input>").attr("type", "hidden").attr("name", "lec_pnt").val(resp.sugang.lec_pnt)
									,$("<input>").attr("type", "hidden").attr("name", "dayotw_nm").val(resp.sugang.dayotw_nm)
									,$("<input>").attr("type", "hidden").attr("name", "lec_time").val(resp.sugang.lec_time)
									,$("<input>").attr("type", "hidden").attr("name", "lec_end").val(resp.sugang.lec_end)
							)
					);
					Toastify({
			            text: "선택하신 강의의 수강신청이 완료되었습니다.",
			            duration: 3000,
			            close:true,
			            gravity:"bottom",
			            position: "center",
			            backgroundColor: "#4fbe87",
			        }).showToast();
				}else if(resp.result == "PKDUPLICATED"){
					
				}
			},error : function(xhr, error, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
		});
	});
	
	
	$("#sugangList").on("click", ".deleteBtn", function(){
		let lec_code = $(this).parents("tr").attr("class"); 
		let sugangNum = $(this).parents("tr").find(".sugangNum").text();
		let stdnt_no = "${student.stdnt_no}";
		let lec_pnt = $(this).parents("tr").find("input[name='lec_pnt']").val();
		let sugang_cnt = $(sugangReqList).find(".sugang_cnt").data("cnt");
		let sugang_at_pnt = $(sugangReqList).find(".sugang_at_pnt").data("cnt");
		
		$.ajax({
			url : "${cPath}/lms/classCartDelete.do"
			,data :{
				lec_code : lec_code,
				stdnt_no : stdnt_no
			}
			,method : "post"
			,dataType : "json"
			,success : function(resp){
				if(resp.result == "OK"){
					$(listBody).children("." + lec_code).children(".sugangNum").text(parseInt(sugangNum) - 1);
					$(sugangReqList).find(".sugang_cnt").data("cnt", sugang_cnt - 1).text(sugang_cnt - 1 + "과목");
					$(sugangReqList).find(".sugang_at_pnt").data("cnt", sugang_at_pnt - lec_pnt).text(sugang_at_pnt - lec_pnt + "학점");
					
					Toastify({
			            text: "선택하신 강의의 수강신청이 취소되었습니다.",
			            duration: 3000,
			            close:true,
			            gravity:"bottom",
			            position: "center",
			            backgroundColor: "#f3616d",
			        }).showToast();
					
					let tr = $("#sugangList").children("tr");
					$(tr).each(function(){
						if($(this).attr("class") == lec_code){
							$(this).remove();
						}
					});
				}
			},error : function(xhr, error, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
		});
	});
</script>
<script src="${cPath }/resources/lms/assets/vendors/toastify/toastify.js"></script>