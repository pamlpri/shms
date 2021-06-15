<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 15.      송수미        학생 과제 제출
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
          <li class="breadcrumb-item"><a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/lectureWeek.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">과제제출</li>
      </ol>
  </nav>

  <section class="section">
      <h2 class="section-title">${setTask.task_title }</h2>
      <p class="text-left"> 
		${setTask.task_cont }
      </p>
      <c:if test="${not empty setTask.attachList }">
	      <div class="board_downloader" style="margin-bottom : 3%;">
	        <ul class="downloader">
		      <c:forEach items="${setTask.attachList }" var="attach">
			      <c:url value="/lecture/setTaskDownload.do" var="downloadURL">
			      	<c:param name="atch_file_no" value="${attach.atch_file_no }" />
			      	<c:param name="atch_file_seq" value="${attach.atch_file_seq }" />
			      </c:url>
		          <li>
		            <a href="${downloadURL }" class="text-color">
		            	<i class="fas fa-arrow-alt-circle-down"></i>${attach.file_nm }
		            </a>
		          </li>
		      </c:forEach>
	        </ul>
	       </div>
      </c:if>
  </section>

  <div class="card attendance">
      <div class="card-body">
        <div class="table-responsive">
          <form id="taskForm" class="table-responsive" method="post" enctype="multipart/form-data" >
	          <input type="hidden" value="${setTask.set_task_no}" name="set_task_no"/>
	          <input type="hidden" value="${taskSubmit.submit_no}" name="submit_no"/>
	          <input type="hidden" value="${taskSubmit.atch_file_no }" name="atch_file_no"/>
	          <table class="table table-bordered table-md report">
	            <tr>
	              <th>제출여부</th>
	              <td class="text-left">${empty submit_no? "제출하지 않음" : "제출 완료" }</td>
	            </tr>
	            <tr>
	              <th>체점상황</th>
	              <td class="text-left">${empty task_score? "채점되지 않음" : task_score }</td>
	            </tr>
	            <tr>
	              <th>종료일시</th>
	              <td class="text-left">${setTask.submit_endde }</td>
	            </tr>
	            <tr>
	              <th class="align-middle"><span class="red-color">* </span>제목</th>
	              <td class="text-left">
	              	<input type="text" class="form-control im" value="${taskSubmit.title }" name="title"/>
   	              	<div class="invalid-feedback">
	                      	필수항목
                	</div>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle"><span class="red-color">* </span>내용</th>
	              <td class="textArea">
	                <textarea class="form-control" rows="5" cols="1000" id="bo_cont" name="cont">${taskSubmit.cont }</textarea>
	              </td>
	            </tr>
	            <tr>
	              <th>첨부파일</th>
	              <td class="text-left">
	              <div>
	                  <div class="it">
	                    <div class="text-left">
	                      <a class="btn btn-outline-primary btn-new"><i class="far fa-file"></i> Add File</a>
	                    </div>
	                    <div class="col-sm-offset-1" id="one">
	                      <div id="uploader" class="row">
	                      	<c:choose>
				             	<c:when test="${not empty taskSubmit.attachList and not(fn:length(taskSubmit.attachList) eq 0)}">
									<c:forEach items="${taskSubmit.attachList }" var="attach">
										<c:if test="${not empty attach.atch_file_seq }">
					                        <div class="row uploadDoc col-sm-4">
					                          <div class="col-sm-10">
					                            <div class="fileUpload btn btn-orange">
					                              <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon">
					                              <span class="upl" id="upload" data-attno="${attach.atch_file_seq }"> ${attach.file_nm }</span>
					                              <input type="file" class="upload up" id="up" onchange="readURL(this);" />
					                            </div><!-- btn-orange -->
					                            <div class="docErrs" >업로드할 수 없는 파일입니다.</div><!-- error -->
					                          </div><!-- col-3 -->
					                          <div class="col-sm-2">
					                          	<a class="btn-check">
					                            	<i class="fa fa-times"></i>
					                            </a>
					                          </div><!-- col-1 -->
					                        </div><!-- row -->
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
			                        <div class="row uploadDoc col-sm-4">
			                          <div class="col-sm-10">
			                            <div class="fileUpload btn btn-orange">
			                              <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon">
			                              <span class="upl" id="upload"> 클릭하여 파일업로드</span>
			                              <input type="file" class="upload up" id="up" onchange="readURL(this);" />
			                            </div><!-- btn-orange -->
			                            <div class="docErrs" >업로드할 수 없는 파일입니다.</div><!-- error -->
			                          </div><!-- col-3 -->
			                          <div class="col-sm-2"><a class="btn-check">
			                            <i class="fa fa-times"></i></a>
			                          </div><!-- col-1 -->
			                        </div><!-- row -->
								</c:otherwise>
	                      	</c:choose>
	                      </div><!-- uploader -->
	                    </div><!-- one -->
	                  </div><!-- row -->
	                </div><!-- container -->
	              </td>
	            </tr>
	          </table>
	          <div class="text-center">
	              <a href="${cPath }/lecture/task.do" class="btn btn-secondary">취소</a>
	              <button type="button" class="btn btn-primary" id="submitBtn">제출</button>
	          </div>
          </form>
        </div>
      </div>
    </div>
  <!-- contents end -->
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
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
<c:if test="${not empty message }">
<script>
	$("#default").find(".modal-body p").empty().text("${message}");
	$("#default").addClass("show").css("display","block");
    $("#close, .modal").on("click", function(){
		$("#default").removeClass("show").css("display","none");
	})
</script>
</c:if>
<!-- ckeditor -->
<script src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>
<script>
$(function(){
    CKEDITOR.replace("bo_cont", {
          filebrowserImageUploadUrl : ''
    });
});
</script>
<script>
    var fileTypes = ['pdf', 'docx', 'rtf', 'jpg', 'jpeg', 'png', 'txt', 'xlsx'];  //acceptable file types
    function readURL(input) {
        if (input.files && input.files[0]) {
            var extension = input.files[0].name.split('.').pop().toLowerCase(),  //file extension from input file
                isSuccess = fileTypes.indexOf(extension) > -1;  //is extension in acceptable types

            if (isSuccess) { //yes
                var reader = new FileReader();
                reader.onload = function (e) {
                    if (extension == 'pdf'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/179/179483.svg');
                    	$(input).attr("name", "task_submit_files");
                    }
                    else if (extension == 'docx'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/281/281760.svg');
                    	$(input).attr("name", "task_submit_files");
                    }
                    else if (extension == 'rtf'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136539.svg');
                    	$(input).attr("name", "task_submit_files");
                    }
                    else if (extension == 'png'){ $(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136523.svg'); 
                    	$(input).attr("name", "task_submit_files");
                    }
                    else if (extension == 'jpg' || extension == 'jpeg'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136524.svg');
                    	$(input).attr("name", "task_submit_files");
                    }
                  	else if (extension == 'txt'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136538.svg');
                    	$(input).attr("name", "task_submit_files");
                    }
                    else {
                    	//console.log('here=>'+$(input).closest('.uploadDoc').length);
                    	$(input).closest('.uploadDoc').find(".docErr").slideUp('slow');
                    }
                }

                reader.readAsDataURL(input.files[0]);
            }
            else {
            		//console.log('here=>'+$(input).closest('.uploadDoc').find(".docErr").length);
                $(input).closest('.uploadDoc').find(".docErrs").fadeIn();
                setTimeout(function() {
  				   	$('.docErrs').fadeOut('slow');
	                $(input).parents(".uploadDoc").fadeOut();
  				}, 3000);
                
            }
        }
    }
    
    $(document).ready(function(){
       $(document).on('change','.up', function(){
       	var id = $(this).attr('id'); /* gets the filepath and filename from the input */
    	   var profilePicValue = $(this).val();
    	   var fileNameStart = profilePicValue.lastIndexOf('\\'); /* finds the end of the filepath */
    	   profilePicValue = profilePicValue.substr(fileNameStart + 1).substring(0,20); /* isolates the filename */
    	   //var profilePicLabelText = $(".upl"); /* finds the label text */
    	   if (profilePicValue != '') {
    	   	//console.log($(this).closest('.fileUpload').find('.upl').length);
    	      $(this).closest('.fileUpload').find('.upl').html(profilePicValue); /* changes the label text */
    	   }
       });

       $(".btn-new").on('click',function(){
            $("#uploader").append('<div class="row uploadDoc col-sm-4"><div class="col-sm-10"><div class="fileUpload btn btn-orange"><img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon"><span class="upl" id="upload"> 클릭하여 파일업로드</span>'
                     + '<input type="file" class="upload up" id="up" onchange="readURL(this);" /></div><!-- btn-orange --> <div class="docErrs" >업로드할 수 없는 파일입니다.</div><!--error--></div><!-- col-3 --><div class="col-sm-2"><a class="btn-check">'
                     + '<i class="fa fa-times"></i></a></div><!-- col-1 --></div><!--row-->');
       });
       
		let taskForm = $("#taskForm");
		$(".btn-check").on("click", function(){
			let fileSpan = $(this).parents(".row").find("span");
			let delAttNo = fileSpan.data("attno");
			console.log(delAttNo);
			let newInput = $("<input>").attr({
							"type" : "text"
							, "name" : "delAttNos"
						}).val(delAttNo);
			
			taskForm.append(newInput);
// 			fileSpan.hide();
		});
        
       $(document).on("click", "a.btn-check" , function() {
            $(this).closest(".uploadDoc").remove();
       });
    });
	
	let taskForm = $("#taskForm");
    var frag = false;
	$("#submitBtn").on("click", function(){
		let inputs = $(taskForm).find(":input[name]");
		console.log(frag);
		$(inputs).each(function(idx, input){
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
			taskForm.submit();
		}
	});
	
	$(taskForm).find(":input[name]").on("change", function(){
		$(this).removeClass("is-invalid");
		
	});
    
</script>