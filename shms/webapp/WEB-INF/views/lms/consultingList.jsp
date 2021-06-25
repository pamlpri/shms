<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* 2021. 6. 3.		최희수	지도교수 상담 리스트 출력
* Copyright (c) ${year} by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
			<li class="breadcrumb-item active" aria-current="page">담당교수상담</li>
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
							<th class="text-center">지도교수</th>
							<th class="text-center">상담일자</th>
							<th class="text-center">상담시간</th>
							<th class="text-center">상담상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty consultingList }">
							<c:forEach items="${consultingList }" var="consulting" varStatus="state">
								<tr class="consultingBox" idx="${consulting.req_no }">
									<td class="text-center inputBox">
										${state.index+1 }
										<input type="hidden" name="hope_date" value="${consulting.hope_date }" />
										<input type="hidden" name="hope_time" value="${consulting.hope_time }" />
										<input type="hidden" name="req_cont" value="${consulting.req_cont }" />
										<input type="hidden" name ="consult_cl" value="${consulting.consult_cl }" />
									</td>
									<td class="text-center">${consulting.req_no }</td>
									<td class="text-center">${consulting.consult_cl_nm }</td>
									<td class="text-center">${consulting.staff_name }</td>
									<c:choose>
										<c:when test="${consulting.process_stat_nm eq '반려' }">
											<td class="text-center"></td>
											<td class="text-center"></td>
										</c:when>
										<c:otherwise>
											<td class="text-center">${consulting.hope_date }</td>
											<td class="text-center">${consulting.hope_time }</td>
										</c:otherwise>
									</c:choose>									
									<td class="text-center">
										<c:choose>
											<c:when test="${consulting.process_stat_nm eq '완료'}">
												<a href="${cPath }/lms/consultingView.do?bo_no=${consulting.req_no }"
													class="badge bg-success white-color">완료</a>
											</c:when>
											<c:when test="${consulting.process_stat_nm eq '대기'}">
												<button type="button" class="btn badge bg-info white-color stat_wait"
													data-bs-toggle="modal" data-bs-target="#inlineForm"
				 									style="margin-top: -1%;">대기</button>
											</c:when>
											<c:when test="${consulting.process_stat_nm eq '반려'}">
												<button type="button" class="btn badge bg-danger block failBtn"
													data-bs-toggle="modal" data-bs-target="#exampleModalCenter">반려</button>
											</c:when>
											<c:when test="${consulting.process_stat_nm eq '승인'}">
												<c:set var="now" value="<%=new java.util.Date() %>" />
												<c:set value="${consulting.hope_date } ${consulting.hope_time }" var="hopeDate" />
												<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm" var="nowDate"/>
												<c:choose>
													<c:when test="${hopeDate > nowDate }">
														<button type="button" class="btn btn-icon badge bg-primary block failBtn" data-bs-toggle="modal" data-bs-target="#exampleModalCenter2">승인</button> 
													</c:when>
													<c:otherwise>
														<a href="${cPath }/lms/consulting.do?bo_no=${consulting.req_no }" class="badge bg-primary"><i class="fas fa-video"></i>&nbsp;&nbsp;&nbsp;상담</a>
													</c:otherwise>
												</c:choose>
												
											</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>						
						</c:if>
					</tbody>
				</table>
				<!-- 학생한테만 보이는 버튼 -->
				<c:if test="${'ST' eq userSection }">
					<div class="breadcrumb breadcrumb-right">
						<button id="insertBtn" type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#inlineForm"
							style="margin-top: -1%;">상담신청</button>
					</div>			
				</c:if>
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
					<h4 class="modal-title" id="myModalLabel33">지도교수상담</h4>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<form action="${cPath }/lms/consultingSign.do" id="consultingForm" method="post">
					<input type="hidden" name="update" value="" />
					<input type="hidden" name="consultingKind" value="" />
					<input type="hidden" name="staff_no" value="${staffId }"/>
					<div class="modal-body">
						<div class="form-group">
							<h6>학번</h6>
							<input class="form-control form-control-default" name="stdnt_no" type="text" value="${user.user[0] }" readonly>
						</div>
						<div class="form-group">
							<h6>이름</h6>
							<input class="form-control form-control-default" type="text" value="${userName }" readonly>
						</div>
						<div class="form-group">
							<h6>지도교수</h6>
							<input class="form-control form-control-default" type="text" value="${staffName.name }" readonly>
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
								id="floatingTextarea" name="req_cont" value="${consulting.req_cont }"></textarea>
						</div>
						<div class="form-group">
							<h6>상담희망일시</h6>
							<input class="form-control form-control-default" type="date"
								name="hope_date" value="${consulting.hope_date }">
						</div>
						<div class="form-group">
							<h6>상담희망시간</h6>
							<input class="form-control form-control-default" type="time"
								name="hope_time" value="${consulting.hope_time }">
						</div>
						<p>지도교수의 일정에 따라 상담신청이 반려될 수 있습니다.</p>
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

	<!-- 반려 모달 -->
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

	<!-- 상담시간 경고 모달 -->
	<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">상담시간 안내</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<p>
						예약된 상담시간이 아닙니다.<br /> 상담시간에 버튼을 클릭하면 비대면 상담이 시작됩니다.
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

	<!-- 삭제확인 -->
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
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>
<script>
    $(function(){
    	let curCode = "";
    	$("#table1").find(".stat_wait").on("click", function(){
    		curCode = $(this).parents(".consultingBox").attr("idx");
    		
    		$(this).parents(".consultingBox").children(".inputBox").children(":input[name]").each(function(){
    			if($(this).attr("name") == "req_cont"){
	    			$("#inlineForm").find(".cont").html(this.value);
    			}
    			if($(this).attr("name") == "consult_cl"){
    				console.log(this.value);
    				$("#inlineForm").find("#consult_cl").val(this.value);
    			}
    			let name = $(this).attr("name");
    			$("#inlineForm").find("input[name="+name+"]").val(this.value);
    			$("#inlineForm").find("input[name='update']").val("update");
    			$("#inlineForm").find("input[name='req_no']").val(curCode);
    		});
    	});
    	
        $("#deleteBtn").on("click" ,function(){
            $("#inlineForm").removeClass("show");
            $("#default").find("button").on("click", function(){
                $(".modal-backdrop").removeClass("show");
            });
        });
        
        $("#insertBtn").on("click", function() {
        	$("#inlineForm").find("not:input[name]:readonly").val("");
        	$("#inlineForm").find("select").val("");
        	$("#inlineForm").find("textArea").empty();
        	$("#consultingForm").children("input[name='update']").val("insert");
        	$("#consultingForm").children("input[name='consultingKind']").val("professor");
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
    				console.log(res);
    				if(res == "OK") { 
    					location.href = "${cPath}/lms/consultingList.do"; 
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