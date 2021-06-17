<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자       수정내용
* ----------  ---------  -----------------
* 2021. 6. 3.   박초원        최초작성
* 2021. 6. 5.   김보미        증명서 신청 insert
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="page-content">
   <!-- contents start -->
   <nav aria-label="breadcrumb">
       <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="#">HOME</a></li>
           <li class="breadcrumb-item"><a href="#">증명서</a></li>
           <li class="breadcrumb-item active" aria-current="page">증명서신청</li>
       </ol>
   </nav>

   <section class="section">
       <div class="card inputTable">
           <div class="card-body">
               <h5>증명서선택</h5>
               <form action="${cPath }/lms/certificatePay.do" class="table-responsive" method="post" id="crtfForm">
                   <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                       <tr>
                           <th class="align-middle text-center">학과</th>
                           <td class="align-middle">${student.sub_name }</td>
                       </tr>
                       <tr>
                           <th class="align-middle text-center">학번</th>
                           <td class="align-middle">${student.stdnt_no }</td>
                       </tr>
                       <tr>
                           <th class="align-middle text-center">이름</th>
                           <td class="align-middle">${student.name }</td>
                       </tr>
                       <tr>
                           <th class="align-middle text-center">학적상태</th>
                           <td class="align-middle">${student.reginfo_stat }</td>
                       </tr>
                       <tr>
                           <th class="align-middle text-center">증명서선택</th>
                           <td class="align-middle">
                               <div class="col-lg-12 row">
                                   <div class="col-md-8">
                                       <select class="form-select float-right" name="crtf_kind">
                                           <option value="">-- 증명서 선택 --</option>
                                           <c:forEach var="cetfList" items="${cetfList }">
	                                           <option value="${cetfList.com_code }">${cetfList.com_code_nm }</option>
                                           </c:forEach>
                                           
                                       </select>
                                   </div>
                                   <div class="col-md-4">
                                       <input type="number" min="0" class="form-control" placeholder="통수" name="no_of_issue"/>
                                   </div>
                               </div>
                           </td>
                       </tr>
                       <tr>
                           <th class="align-middle text-center">신청사유</th>
                           <td class="align-middle">
                               <select class="form-select float-right" name="crtf_req_resn">
                                   <option value="">-- 사유선택 --</option>
                                   <c:forEach var="cetfResnList" items="${cetfResnList }">
                                   <option value="${cetfResnList.com_code_nm }">${cetfResnList.com_code_nm }</option>
                                   </c:forEach>
                               </select>
                           </td>
                       </tr>
                   </table>
                   <div class="text-center">
                       <input type="submit" class="btn btn-primary" style="margin-top: 1.2em;" id="subBtn" value="신청">
                   </div>
               </form>
           </div>
       </div>
       <div class="card">
           <div class="card-body">
               <ul class="certificateInfo">
                   <li>
                       졸업예정증명서/성적증명서와 같이 학기가 변경된 직후에 최신 내용이
                       업데이트 되는 증명서는 학교에서 전산 입력을 완료하였는지 발급 전
                       필히 확인하신 후 신청하시기 바랍니다.
                   </li>
                   <li>
                       목록에 없는 증명서는 학교 및 학적 상태에 따라 인터넷 발급이
                       불가한 증명서입니다. 발급 가능 여부를 학교에 문의하시기 바랍니다.
                   </li>
                   <li>
                       신청(결제)한 매수만큼만 출력 가능합니다. 신청(결제)일 기준, 30일이 지나면 자동 소멸됩니다.
                   </li>
                   <li>
                       본 서비스를 통해 출력한 증명서는 원본증명서 입니다.
                   </li>
                   <li>
                       졸업증명서, 학위증명서, 학위수여증명서는 동일한 증명서이며, 학교마다 명칭이 다른 것입니다.
                   </li>
               </ul>
           </div>
       </div>
       
		<!--Basic Modal -->
		<div class="modal fade text-left" id="default" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel1"></h5>
						<button type="button" class="close rounded-pill"
							data-bs-dismiss="modal" aria-label="Close">
							<i data-feather="x"></i>
						</button>
					</div>
					<div class="modal-body">
						<p>
							
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" id="close"
 							data-bs-dismiss="modal">
							<i class="bx bx-x d-block d-sm-none"></i> <span
								class="d-none d-sm-block">닫기</span>
						</button>
					</div>
				</div>
			</div>
		</div>
   </section>
   <!-- contents end -->
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$("#subBtn").on("click", function(){
		let crtf_kind = $("[name='crtf_kind']").val();
		let crtf_req_resn = $("[name='crtf_req_resn']").val();
		let no_of_issue = $("input[type=number]").val();
		if(crtf_kind == "" || crtf_req_resn == "" || no_of_issue == ""){
			$("#default").find(".modal-title").empty().text("필수사항 누락");
			$("#default").find(".modal-body p").empty().text("모두 선택해야 다음 단계로 진행됩니다.");
			$("#default").addClass("show").css("display","block");
			$("#subBtn").prop("disabled", true);
		}
	})
		$("#crtfForm").find(":input[name]").on("change", function(){
			$("#subBtn").prop("disabled", false);
		})
		
		$("#close, .modal").on("click", function(){
			$("#default").removeClass("show").css("display","none");
		})
	
	
	$("[name='crtf_kind']").on("change", function(){
		let selectedKind = $(this).val();
		$.ajax({
			url : "${cPath}/lms/chcekReginfo.do"
			, data : {"crtf_kind" : selectedKind}
			, method : "post"
			, dataType : "json"
			, success : function(resp){
				if(resp.result == "OK"){
				}else{
					$("#default").find(".modal-title").empty().text("신청불가");
					$("#default").find(".modal-body p").empty().text("신청할 수 없는 증명서입니다.");
					$("#default").addClass("show").css("display","block");
					$("[name='crtf_kind'] option:eq(0)").prop("selected", true);
				}
			}, error : function(xhr, error, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);				
			}
		});
	});
</script>