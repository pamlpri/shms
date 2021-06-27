<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="page-content">
   <!-- contents start -->
   <nav aria-label="breadcrumb">
       <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="#">HOME</a></li>
           <li class="breadcrumb-item"><a href="#">학적관리</a></li>
           <li class="breadcrumb-item active" aria-current="page">상담내역</li>
       </ol>
   </nav>

   <!-- contents start -->
   <section class="section">
       <div class="card">
           <div class="card-body">
               <table class="table table-striped" id="table1">
                   <thead>
                       <tr>
                           <th class="text-center">No.</th>
                           <th class="text-center">상담코드</th>
                           <th class="text-center">상담분류</th>
                           <th class="text-center">학번</th>
                           <th class="text-center">이름</th>
                           <th class="text-center">상담일자</th>
                           <th class="text-center">상담시간</th>
                           <th class="text-center">상담상태</th>
                       </tr>
                   </thead>
                   <tbody>
                   	<c:forEach items="${consultingList }" var="consulting" varStatus="state">
                   		<tr class="consultingBox"  idx="${consulting.req_no }">
                   			<td class="text-center inputBox">
								${state.index + 1 }
								<input type="hidden" name="stdnt_no" value="${consulting.stdnt_no }" />
								<input type="hidden" name="name" value="${consulting.name }" />
								<input type="hidden" name ="consult_cl_nm" value="${consulting.consult_cl_nm }" />
								<input type="hidden" name="req_cont" value="${consulting.req_cont }" />
								<input type="hidden" name="hope_date" value="${consulting.hope_date }" />
								<input type="hidden" name="hope_time" value="${consulting.hope_time }" />
								<input type="hidden" name="refuse_resn" value="${consulting.refuse_resn }" />
							</td>
                   			<td class="text-center">${consulting.req_no }</td>
                   			<td class="text-center">${consulting.consult_cl_nm }</td>
                   			<td class="text-center">${consulting.stdnt_no }</td>
                   			<td class="text-center">${consulting.name }</td>
              				<c:choose>
              					<c:when test="${consulting.process_stat_nm eq '반려' or consulting.process_stat_nm eq '대기'}">
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
<%-- 										<c:set var="now" value="<%=new java.util.Date() %>" /> --%>
<%-- 										<c:set value="${consulting.hope_date } ${consulting.hope_time }" var="hopeDate" /> --%>
<%-- 										<fmt:formatDate value="${now }" pattern="yyyy-MM-dd hh:mm" var="nowDate"/> --%>
<%-- 										<c:choose> --%>
<%-- 											<c:when test="${hopeDate > nowDate }"> --%>
<!-- 												<button type="button" class="btn badge bg-primary block failBtn" -->
<!-- 													data-bs-toggle="modal" data-bs-target="#exampleModalCenter2">승인</button>  -->
<%-- 											</c:when> --%>
<%-- 											<c:otherwise> --%>
												<a href="${cPath }/lms/consulting.do?bo_no=${consulting.req_no }" class="badge bg-primary">승인</a>
<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
										
									</c:when>
                   				</c:choose>
                   			</td>
                   		</tr>
                   	</c:forEach>
                   </tbody>
               </table>
           </div>
       </div>
   </section>

   <!-- 반려 모달 -->
   <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
   aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
       <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
           role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title" id="exampleModalCenterTitle">
                       상담반려사유
                   </h5>
                   <button type="button" class="close" data-bs-dismiss="modal"
                       aria-label="Close">
                       <i data-feather="x"></i>
                   </button>
               </div>
               <div class="modal-body">
               		<p class="resn">
	                   <script type="text/javascript">
	                    $("#exampleModalCenter").on('show.bs.modal', function(event) {
		                   	let resn = $("input[name='refuse_resn']").val();
		                   	$(".modal-body .resn").text(resn);
	                    });
	                   </script>
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

   <!-- 상담시간 경고 모달 -->
   <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog"
   aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
       <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
           role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title" id="exampleModalCenterTitle">
                       상담시간 안내
                   </h5>
                   <button type="button" class="close" data-bs-dismiss="modal"
                       aria-label="Close">
                       <i data-feather="x"></i>
                   </button>
               </div>
               <div class="modal-body">
                   <p>
                       예약된 상담시간이 아닙니다.<br/>
                       상담시간에 버튼을 클릭하면 비대면 상담이 시작됩니다.
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
   
   <!--승인, 반려 modal -->
   <div class="modal fade text-left" id="inlineForm" tabindex="-1"
   role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
       <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
           role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h4 class="modal-title" id="myModalLabel33">상담신청내역</h4>
                   <button type="button" class="close" data-bs-dismiss="modal"
                       aria-label="Close">
                       <i data-feather="x"></i>
                   </button>
               </div>
               <form id="consultingForm" action="${cPath }/lms/consultingAdmin.do" method="post">
                   <div class="modal-body">
                   	   <input type="hidden" name="req_no" value="" />
                   	   <input type="hidden" name="approval" value="" />
                       <div class="form-group">
                           <h6>학번</h6>
                           <input class="form-control form-control-default" type="text" name="stdnt_no" value="" disabled>
                       </div>
                       <div class="form-group">
                           <h6>이름</h6>
                           <input class="form-control form-control-default" type="text" name="name" value="" disabled>
                       </div>
                       <div class="form-group">
                           <h6>상담분류</h6>
                           <input class="form-control form-control-default" type="text" name="consult_cl_nm" value="" disabled>
                       </div>
                       <div class="form-group">
                           <h6>상담사유</h6>
                           <textarea class="form-control cont" disabled id="floatingTextarea" name="req_cont"></textarea>
                       </div>
                       <div class="form-group">
                           <h6>상담희망일시</h6>
                           <input class="form-control form-control-default" type="date" name="hope_date" value="" disabled>
                       </div>
                       <div class="form-group">
                           <h6>상담희망시간</h6>
                           <input class="form-control form-control-default" type="time" name="hope_time" value="" disabled>
                       </div>
                       <div class="form-group" >
                           <h6>반려사유</h6>
                           <textarea class="form-control" id="returnResult" name="refuse_resn" placeholder="반려사유를 입력하세요."></textarea>
                           <span id="returnWarning"></span>
                       </div>
                   </div>
                   <div class="modal-footer">
                       <button type="button" id="returnBtn" class="btn btn-light-secondary">
                           <i class="bx bx-x d-block d-sm-none"></i>
                           <span class="d-none d-sm-block">반려</span>
                       </button>
                       <button type="submit" id="approvalBtn" class="btn btn-primary ml-1">
                           <i class="bx bx-check d-block d-sm-none"></i>
                           <span class="d-none d-sm-block">승인</span>
                       </button>
                   </div>
               </form>
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
	$(function() {
		let curCode = "";
		$("#table1").find(".stat_wait").on("click", function() {
			curCode = $(this).parents(".consultingBox").attr("idx");
			$("#boNo").val(curCode);
			$(this).parents(".consultingBox").children(".inputBox").children(":input[name]").each(function(){
    			if($(this).attr("name")== "req_cont"){
	    			$("#inlineForm").find(".cont").text(this.value);
    			}
    			let name = $(this).attr("name");
    			$("#inlineForm").find("input[name="+name+"]").val(this.value);
    			$("#inlineForm").find("input[name='req_no']").val(curCode);
    		});
		});
		
	    $("#returnBtn").on("click", function(){
	        let txt = $("#inlineForm").find("#returnResult").val();
	        if(txt == null || txt == ""){
	            console.log(txt)
	            $("#returnWarning").text("반려사유는 필수입력 항목입니다.");
	            $("#returnResult").focus();
	        }else {
	        	$("#inlineForm").find("input[name='approval']").val("companion");
	            $("#inlineForm").removeClass("show");
	            $(".modal-backdrop").removeClass("show");
	            $("#consultingForm").submit();
	        }
	    });
	    
	    $("#approvalBtn").on("click", function() {
	    	$("#inlineForm").find("input[name='approval']").val("approval");
	    });
	});
</script>