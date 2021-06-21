<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 21.      송수미        문의글 등록
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>${lec_name }</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/notice.do">강의개요</a></li>
          <li class="breadcrumb-item active" aria-current="page">강좌 Q&A</li>
      </ol>
  </nav>

  <section class="section">
      <h2 class="section-title">강의 Q&A 등록</h2>
  </section>

  <div class="card attendance">
    <div class="card-body">
      <form class="table-responsive" method="post" id="submitForm">
        <table class="table table-bordered table-md report">
          <tr>
            <th class="align-middle">
            	<span class="red-color">* </span>제목
            </th>
            <td class="text-left">
            	<input type="text" class="form-control im" name="bo_title" value="${board.bo_title }"/>
           	    <div class="invalid-feedback">
	                      필수항목
                </div>
            </td>
          </tr>
          <tr>
            <th class="align-middle">세부설정</th>
            <td class="text-left">
              <span class="label-box">비밀글</span>
              <label for="isprivate" style="padding-left: 5px;">
                <input type="checkbox" name="bo_secret_at" value="Y" id="isprivate" style="vertical-align: -1px;" 
                	${board.bo_secret_at eq 'Y' ? 'checked' : '' }/>
                <span>작성자와 교수만 확인 가능하게 설정 합니다.</span>
              </label>
            </td>
          </tr>
          <tr>
            <th class="align-middle">
            	<span class="red-color">* </span>비밀번호
            </th>
            <td class="text-left">
            	<input type="password" class="form-control im" name="bo_password" />
           	    <div class="invalid-feedback">
	                      필수항목
                </div>            	
            </td>
          </tr>
          <tr>
            <th class="align-middle">
            	<span class="red-color">* </span>내용
            </th>
            <td class="textArea">
              <textarea class="form-control" rows="5" cols="1000" id="bo_cont" name="bo_cont">${board.bo_cont }</textarea>
            </td>
          </tr>
        </table>
        <div class="text-center">
            <a href="${cPath }/lecture/qna.do" class="btn btn-secondary">취소</a>
            <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
        </div>
      </form>
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
  					<i class="bx bx-x d-block d-sm-none"></i> 
  					<span class="d-none d-sm-block">닫기</span>
  				</button>
  			</div>
  		</div>
  	</div>
  </div>
  <!-- contents end -->
</div>
<c:if test="${not empty message }">
	<script>
		$("#default").find(".modal-body p").empty().text("${message}");
		$("#default").addClass("show").css("display","block");
	    $("#close, .modal").on("click", function(){
			$("#default").removeClass("show").css("display","none");
		})
	</script>
</c:if>
<script src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>

<script>
  $(function(){
    CKEDITOR.replace("bo_cont", {
          filebrowserImageUploadUrl : ''
    });
    
    CKEDITOR.replace("bo_ans", {
        filebrowserImageUploadUrl : ''
 	 });
  });

  let submitForm = $("#submitForm");
	var frag = false;
	$("#saveBtn").on("click",function(){
		let inputs = $(submitForm).find(":input[name]");
		
		$(inputs).each(function(idx, input){
			console.log($(this).val());
			if($(this).hasClass("im")){
				if($(this).val() == ""){
					$(this).addClass("is-invalid");
					frag = false;
				}else{
					frag = true;
				}
			}
		});
		
		if(frag){
			submitForm.submit();
		}
	});
	
	$(submitForm).find(":input[name]").on("change", function(){
		$(this).removeClass("is-invalid");
		
	});
</script>