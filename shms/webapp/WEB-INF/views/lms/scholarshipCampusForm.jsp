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
<div class="page-content">
 <!-- contents start -->
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">장학금관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">교내 장학금 신청</li>
     </ol>
 </nav>

 <section class="section">
     <div class="card">
         <div class="card inputTable">
             <div class="card-body">
                 <p>※ 증명서류 미제출자는 교내 장학금 선발에서 제외됩니다.</p>
                 <form id="schlForm" action="${cPath }/lms/insertSchlForm.do" method="post">
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
                             <td class="align-middle">
                                 <input type="tel" name="tel_no" class="form-control" id="phone_check"/>
                             </td>
                             <th class="align-middle text-center">웹메일</th>
                             <td class="align-middle">${student.webmail }</td>
                         </tr>
                         <tr>
                             <th class="align-middle text-center">장학금 종류</th>
                             <td class="align-middle" colspan="3">
                                 <div class="col-lg-12 row">
                                     <div class="col-md-4">
                                         <select class="form-select float-right" name="schlship_no">
                                             <option value="">-- 장학금종류 --</option>
                                             <option value="5">외국어</option>
                                             <option value="6">기사</option>
                                             <option value="7">산업기사</option>
                                             <option value="8">국가유공자</option>
                                         </select>
                                     </div>
                                 </div>
                             </td>
                         </tr>
                     </table>
                     
                     <h6 class="m-b-20">
						<i class="fa fa-paperclip m-r-5 f-s-18"></i> 증명서류제출
					</h6>
					<div class="form-inline fileArea row">
						<p class="fileBox col-lg-6">
							<input class="form-control" type="file" name="mail_files">
							<span class="plusBtn btn btn-secondary">+</span>
						</p>
					</div>
                     <div class="text-center mt-3">
                         <a href="${cPath }/lms/scholarshipCampus.do" class="btn btn-light-secondary">취소</a>
                         <!-- update시에만 보이는 버튼-->
                         <button class="btn btn-primary" type="button" id="schlSubmit">저장</button>
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
		+ '<input class="form-control" type="file" name="mail_files">'
		+ '<span class="plusBtn btn btn-secondary">+</span>'
		+ '<span class="delBtn btn btn-danger">-</span>'
	    + '</p>';
	    
	$(".fileArea").on("click", ".plusBtn" ,function(){
		$(this).parents(".fileArea:first").append(source);
	});
	
	$(".fileArea").on("click", ".delBtn", function(){
		$(this).parent("p").remove();
	});
	
	$("#schlSubmit").on("click", function(){
		var phonevalue = $('input[name=tel_no]').val();
	
		// 형식
		var reghp = /^\d{3}\d{3,4}\d{4}$/;
		let schlship_no = $("[name='schlship_no']").val();
		console.log(schlship_no);
		console.log(phonevalue);
		
		if (!reghp.test(phonevalue) && schlship_no == null && schlship_no == "") {
			alert("둘다 아니야!");
		} else if(reghp.test(phonevalue) || schlship_no == null || schlship_no == ""){
			alert("선택안함");
		} else if(!reghp.test(phonevalue) && schlship_no != null && schlship_no == ""){
			alert("번호 확인!");
		} else {
			$("#schlForm").submit();
		}
		
	});
</script>



