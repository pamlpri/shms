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
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>대학생활의 이해</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">강의실홈</a></li>
          <li class="breadcrumb-item active" aria-current="page">과제제출</li>
      </ol>
  </nav>

  <section class="section">
      <h2 class="section-title">[과제] 학습분석 사례 조사</h2>
      <p class="text-left"> 
        학습분석을 적용한 서비스 및 연구 사례를 조사(A4 2장 분량)<br/>
        마지막 과제입니다. 아래 첨부한 양식을 확인하세요.
      </p>
      <div class="board_downloader" style="margin-bottom : 3%;">
        <ul class="downloader">
          <li>
            <a href="#" class="text-color"><i class="fas fa-arrow-alt-circle-down"></i>학습분석 사례 조사 과제 양식.pdf</a>
          </li>
          <li>
            <a href="#" class="text-color"><i class="fas fa-arrow-alt-circle-down"></i>학습분석 사례 조사 과제 양식.pdf</a>
          </li>
        </ul>
       </div>
  </section>

  <div class="card attendance">
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered table-md report">
            <tr>
              <th>제출여부</th>
              <td class="text-left">제출안함</td>
            </tr>
            <tr>
              <th>체점상황</th>
              <td class="text-left">체점되지 않음</td>
            </tr>
            <tr>
              <th>종료일시</th>
              <td class="text-left">2021.05.01 오전 1:00</td>
            </tr>
            <tr>
              <th class="align-middle">내용</th>
              <td class="textArea">
                <textarea class="form-control" rows="5" cols="1000" id="bo_cont"></textarea>
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
                        <div class="row uploadDoc col-sm-4">
                          <div class="col-sm-10">
                            <div class="fileUpload btn btn-orange">
                              <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon">
                              <span class="upl" id="upload"> 클릭하여 파일업로드</span>
                              <input type="file" class="upload up" id="up" onchange="readURL(this);"/>
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
              <a href="${cPath }/lecture/task.do" class="btn btn-secondary">취소</a>
              <button type="button" class="btn btn-primary" id="submitBtn">제출</button>
          </div>
        </div>
      </div>
    </div>
  <!-- contents end -->
</div>
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
                    	$(input).attr("name", "task_files");
                    }
                    else if (extension == 'docx'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/281/281760.svg');
                    	$(input).attr("name", "task_files");
                    }
                    else if (extension == 'rtf'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136539.svg');
                    	$(input).attr("name", "task_files");
                    }
                    else if (extension == 'png'){ $(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136523.svg'); 
                    	$(input).attr("name", "task_files");
                    }
                    else if (extension == 'jpg' || extension == 'jpeg'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136524.svg');
                    	$(input).attr("name", "task_files");
                    }
                  	else if (extension == 'txt'){
                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136538.svg');
                    	$(input).attr("name", "task_files");
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
    
</script>