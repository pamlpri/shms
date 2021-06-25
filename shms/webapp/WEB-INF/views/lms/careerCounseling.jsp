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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">취업지원</a></li>
			<li class="breadcrumb-item active" aria-current="page">진로상담</li>
		</ol>
	</nav>

	<section class="section">
		<div class="card">
			<div class="card-body">
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th class="text-center">No.</th>
							<th class="text-center">상담코드</th>
							<th class="text-center">상담분류</th>
							<th class="text-center">신청일자</th>
							<th class="text-center">상담일자</th>
							<th class="text-center">상담시간</th>
							<th class="text-center">상담상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty consltReqList }">
								<c:forEach items="${consltReqList }" var="consltReq" varStatus="i">
									<tr class="consultingBox" idx="${consltReq.req_no }">
										<td class="text-center inputBox">
											${i.index + 1 }
											<input type="hidden" name="stdnt_no" value="${consltReq.stdnt_no }" />
											<input type="hidden" name="hope_date" value="${consltReq.hope_date }" />
											<input type="hidden" name="hope_time" value="${consltReq.hope_time }" />
											<input type="hidden" name="req_cont" value="${consltReq.req_cont }" />
											<input type="hidden" name="staff_name" value="${consltReq.staff_name }" />
											<input type="hidden" name="staff_no" value="${consltReq.staff_no }" />
											<input type="hidden" name ="consult_cl" value="${consltReq.consult_cl }" />
										</td>
										<td class="text-center">${consltReq.req_no }</td>
										<td class="text-center">${consltReq.consult_cl_nm }</td>
										<td class="text-center">${consltReq.req_date }</td>
										<c:choose>
											<c:when test="${consltReq.process_stat_nm eq '반려' }">
												<td class="text-center"></td>
												<td class="text-center"></td>
											</c:when>
											<c:otherwise>
												<td class="text-center">${consltReq.hope_date }</td>
												<td class="text-center">${consltReq.hope_time }</td>
											</c:otherwise>
										</c:choose>
										<td class="text-center">
											<c:choose>
												<c:when test="${consltReq.process_stat_nm eq '완료'}">
													<a
														href="${cPath}/lms/careerCounselingView.do?bo_no=${consltReq.req_no }"
														class="badge bg-success white-color">완료</a>
												</c:when>
												<c:when test="${consltReq.process_stat_nm eq '대기'}">
													<button type="button"
														class="btn badge bg-info white-color stat_wait"
														data-bs-toggle="modal" data-bs-target="#inlineForm"
														style="margin-top: -1%;">대기</button>
												</c:when>
												<c:when test="${consltReq.process_stat_nm eq '반려'}">
													<button type="button"
														class="btn badge bg-danger block failBtn"
														data-bs-toggle="modal"
														data-bs-target="#exampleModalCenter">반려</button>
												</c:when>
												<c:when test="${consltReq.process_stat_nm eq '승인'}">
													<span class="badge bg-primary">승인</span>
												</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="text-center" colspan="7">데이터가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="breadcrumb breadcrumb-right mt-5">
					<button id="insertBtn" type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#inlineForm"
						style="margin-top: -1%;">상담신청</button>
				</div>
			</div>
		</div>
	</section>

	<!--신청 modal -->
	<div class="modal fade text-left" id="inlineForm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel33">진로상담</h4>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<form action="${cPath }/lms/consultingSign.do" id="consultingForm" method="post">
					<input type="hidden" name="update" value="" />
					<input type="hidden" name="consultingKind" value="" />
					<input type="hidden" name="staff_no" value="" />
					<input type="hidden" name="req_no" value="" />
<%-- 					<input type="hidden" name="stdnt_no" value="${user.user[0] }" /> --%>
					<div class="modal-body">
						<div class="form-group">
							<h6>학번</h6>
							<input class="form-control form-control-default" type="text" name="stdnt_no"
								value="${user.user[0] }" readonly>
						</div>
						<div class="form-group">
							<h6>이름</h6>
							<input class="form-control form-control-default" type="text"
								value="${userName }" readonly>
						</div>
						<div class="form-group">
							<h6>상담분류</h6>
							<fieldset class="form-group">
								<select class="form-select" id="consult_cl" name="consult_cl">
									<option value="">-- 분류선택 --</option>
									<option value="JG">전과</option>
									<option value="JR">진로</option>
									<option value="HS">학교생활</option>
								</select>
							</fieldset>
						</div>
						<div class="form-group">
							<h6>상담사유</h6>
							<textarea class="form-control cont" placeholder="상담을 신청하는 사유를 적어주세요."
								id="floatingTextarea" name="req_cont"></textarea>
						</div>
						<div class="form-group">
							<h6>상담희망일시</h6>
							<input class="form-control form-control-default" type="date"
								name="hope_date" value="">
						</div>
						<div class="form-group">
							<h6>상담희망시간</h6>
							<input class="form-control form-control-default" type="time"
								name="hope_time" value="">
						</div>
						<p>취업지원팀의 일정에 따라 상담신청이 반려될 수 있습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light-secondary"
							data-bs-dismiss="modal">
							<i class="bx bx-x d-block d-sm-none"></i> <span
								class="d-none d-sm-block">닫기</span>
						</button>
						<!-- update시에만 나오는 버튼 -->
						<button type="button" class="btn btn-danger ml-1"
							data-bs-toggle="modal" data-bs-target="#default" id="deleteBtn">
							<i class="bx bx-check d-block d-sm-none"></i> <span
								class="d-none d-sm-block">삭제</span>
						</button>
						<button id="saveBtn" type="submit" class="btn btn-primary ml-1">
							<i class="bx bx-check d-block d-sm-none"></i> <span
								class="d-none d-sm-block">저장</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Vertically Centered modal Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">상담반려사유</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<p>
						해당 시간에는 일정이 있어 상담 시간을 일주일 후로 미뤄주게나<br /> 일주일 후에 적성검사지를 준비해주게나.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!--Basic Modal -->
	<div class="modal fade text-left" id="default" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
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
						삭제한 게시글은 복원이 불가합니다.<br /> 삭제하시겠습니까?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn  btn-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
					<button id="realDelBtn" type="button" class="btn btn-primary ml-1"
						data-bs-dismiss="modal">
						<i class="bx bx-check d-block d-sm-none"></i> <span
							class="d-none d-sm-block">삭제</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- contents end -->
</div>
<script>
    $(function(){
       	let curCode = "";
       	$("#table1").find(".stat_wait").on("click", function(){
       		curCode = $(this).parents(".consultingBox").attr("idx");
       		
       		$(this).parents(".consultingBox").children(".inputBox").children(":input[name]").each(function(){
       			if($(this).attr("name")== "req_cont"){
   	    			$("#inlineForm").find(".cont").text(this.value);
       			}
       			if($(this).attr("name") == "consult_cl"){
       				console.log(this.value);
       				$("#inlineForm").find("#consult_cl").val(this.value);
       			}
       			let name = $(this).attr("name");
       			$("#inlineForm").find("input[name="+name+"]").val(this.value);
       			$("#inlineForm").find("input[name='update']").val("update");
       			$("#inlineForm").find("input[name='req_no']").val(curCode);
       			$("#inlineForm").find("input[name='consultingKind']").val("career");
       		});
       	});
       	
        $("#deleteBtn").on("click" ,function(){
            $("#inlineForm").removeClass("show");
            $("#default").find("button").on("click", function(){
                $(".modal-backdrop").removeClass("show");
            });
        });
          
        $("#insertBtn").on("click", function() {
        	$("#inlineForm").find("input[name]").val("");
        	$("#inlineForm").find("select").val("");
        	$("#inlineForm").find("textArea").empty();
        	$("#consultingForm").children("input[name='update']").val("insert");
        	$("input[name='consultingKind']").val("career");
      		$("#deleteBtn").css("display", "none");
        });
          
        $("#realDelBtn").on("click", function() {
         	$.ajax({
     			url:"${cPath}/lms"
     			, method: "post"
     			, data: {
    					"req_no":curCode
    					, "_method": "delete"
    				}
     			, dataType: "json"
     			, success: function(res) {
     				if(res == "OK") { 
     					location.href = "${cPath}/lms/careerCounseling.do"; 
     				}    					
     			}
     			, error: function(xhr, error, msg) {
     				console.log(xhr);
     				console.log(error);
     				console.log(msg);
     			}    				
     		});
     	});
    });
</script>