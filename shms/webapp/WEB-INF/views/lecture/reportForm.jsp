<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 12.      송수미        과제 등록 기능 구현
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
          <li class="breadcrumb-item"><a href="#">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">과제관리</li>
      </ol>
  </nav>

  <section class="section">
      <h2 class="section-title">과제 등록</h2>
  </section>

  <div class="card attendance">
      <div class="card-body">
        <form id="setTaskForm" class="table-responsive" method="post" enctype="multipart/form-data" >
          <table class="table table-bordered table-md report">
            <tr>
              <th class="align-middle">
              	<span class="red-color">* </span>과제명
              </th>
              <td class="text-left">
              	<input type="text" class="form-control im" name="task_title" value="${setTask.task_title }">
              	<div class="invalid-feedback">
	                      필수항목
                </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle">
              	<span class="red-color">* </span>
              	배점
              </th>
              <td class="text-left">
              	<input type="number" class="form-control col-md-6 im" name="task_allot" value="${setTask.task_allot }"/>
              	<div class="invalid-feedback">
	                      필수항목
                </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle">마감일</th>
              <td>
                  <input type="datetime-local" class="form-control col-md-6" name="submit_endde" value="${setTask.submit_endde }">
              </td>
            </tr>
            <tr>
              <th class="align-middle">내용</th>
              <td class="textArea">
                <textarea class="form-control" rows="5" cols="1000" id="bo_cont" name="task_cont">${setTask.task_cont }</textarea>
              </td>
            </tr>
            <tr>
              <th class="align-middle">첨부파일</th>
              <td class="text-left">
              <div>
                  <div class="it">
                    <div class="text-left">
                      <a class="btn btn-outline-primary btn-new"><i class="far fa-file"></i> Add File</a>
                    </div>
                    <div class="col-sm-offset-1" id="one">
                      <div id="uploader" class="row">
                        <div class="row uploadDoc col-sm-4">
                          <div class="col-sm-10">
                            <div class="fileUpload btn btn-orange">
                              <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon">
                              <span class="upl" id="upload"> 클릭하여 파일업로드</span>
                              <input type="file" class="upload up" id="up" onchange="readURL(this);" />
                            </div><!-- btn-orange -->
                            <div class="docErrs" >업로드할 수 없는 파일입니다.</div><!--error-->
                          </div><!-- col-3 -->
                          <div class="col-sm-2"><a class="btn-check">
                            <i class="fa fa-times"></i></a>
                          </div><!-- col-1 -->
                        </div><!--row-->
                      </div><!--uploader-->
                    </div><!--one-->
                  </div><!-- row -->
                </div><!-- container -->
              </td>
            </tr>
          </table>
          <div class="text-center">
              <a href="${cPath }/lecture/report.do" class="btn btn-secondary">취소</a>
              <button id="saveBtn" type="button" class="btn btn-primary">저장</button>
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
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>
  <!-- contents end -->
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
<c:if test="${not empty message }">
<script>
	$("#default").find(".modal-body p").empty().text("${message}");
	$("#default").addClass("show").css("display","block");
</script>
</c:if>
  
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
                    	$(input).attr("name", "set_task_files");
                    }
                    else if (extension == 'docx'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/281/281760.svg');
                    	$(input).attr("name", "set_task_files");
                    }
                    else if (extension == 'rtf'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136539.svg');
                    	$(input).attr("name", "set_task_files");
                    }
                    else if (extension == 'png'){ $(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136523.svg'); 
                    	$(input).attr("name", "set_task_files");
                    }
                    else if (extension == 'jpg' || extension == 'jpeg'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136524.svg');
                    	$(input).attr("name", "set_task_files");
                    }
                  	else if (extension == 'txt'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136538.svg');
                    	$(input).attr("name", "set_task_files");
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
        
       $(document).on("click", "a.btn-check" , function() {
         if($(".uploadDoc").length>1){
            $(this).closest(".uploadDoc").remove();
          }
       });
    });
    
    $("#close, .modal").on("click", function(){
		$("#default").removeClass("show").css("display","none");
	})
	
	let setTaskForm = $("#setTaskForm");
    var frag = false;
	$("#saveBtn").on("click",function(){
		let inputs = $(setTaskForm).find(":input[name]");
		
		$(inputs).each(function(idx, input){
			console.log($(this).val());
			if($(this).val() == ""){
				if($(this).hasClass("im")){
					$(this).addClass("is-invalid");
				}
				frag = false;
			}else {
				frag = true;
			}
		});
		
		if(frag){
			setTaskForm.submit();
		}
	});
	
	$(setTaskForm).find(":input[name]").on("change", function(){
		$(this).removeClass("is-invalid");
		
	});
    
</script>