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
      <li class="breadcrumb-item active" aria-current="page">강의설정</li>
    </ol>
  </nav>
  
  <section class="section">
      <h2 class="section-title">강의 설정</h2>
  </section>

  <div class="card attendance">
      <div class="card-body">
        <form class="table-responsive">
          <table class="table table-bordered table-md report">
            <tr>
              <th class="align-middle">학습목표</th>
              <td class="text-left"><textarea class="form-control" rows="5" cols="1000" id="bo_cont"></textarea></td>
            </tr>
            <tr>
              <th class="align-middle">강의교재</th>
              <td class="text-left"><textarea class="form-control" rows="5" cols="1000" id="bo_cont"></textarea></td>
            </tr>
            <tr>
              <th class="align-middle">강의부교재</th>
              <td>
                  <textarea class="form-control" rows="5" cols="1000" id="bo_cont"></textarea>
              </td>
            </tr>
            <tr>
               <th class="align-middle text-center">평가방법</th>
               <td class="align-middle" colspan="3">
                   <ul id="gradePar">
                   	   <li class="float-left">
                           <h6>중간</h6>
                           <input class="form-control form-control-sm" type="number" placeholder="단위 %">
                       </li>
                       <li class="float-left">
                           <h6>기말</h6>
                           <input class="form-control form-control-sm" type="number" placeholder="단위 %">
                       </li>
                       <li class="float-left">
                           <h6>과제</h6>
                           <input class="form-control form-control-sm" type="number" placeholder="단위 %">
                       </li>
                       <li class="float-left">
                           <h6>출석</h6>
                           <input class="form-control form-control-sm" type="number" placeholder="단위 %">
                       </li>
                       <li class="float-left">
                           <h6>기타</h6>
                           <input class="form-control form-control-sm" type="number" placeholder="단위 %">
                       </li>
                   </ul>
               </td>
           </tr>
          </table>
          <div class="text-center">
              <a href="lectureSetting.html" class="btn btn-secondary">취소</a>
              <a href="lectureSetting.html" class="btn btn-primary">저장</a>
          </div>
        </form>
      </div>
    </div>
    <!-- contents end -->
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
  
<script>
    $(function(){
    var fileTypes = ['pdf', 'docx', 'rtf', 'jpg', 'jpeg', 'png', 'txt'];  //acceptable file types
    function readURL(input) {
        if (input.files && input.files[0]) {
            var extension = input.files[0].name.split('.').pop().toLowerCase(),  //file extension from input file
                isSuccess = fileTypes.indexOf(extension) > -1;  //is extension in acceptable types

            if (isSuccess) { //yes
                var reader = new FileReader();
                reader.onload = function (e) {
                    if (extension == 'pdf'){
                      $(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/179/179483.svg');
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
                $(input).closest('.uploadDoc').find(".docErr").fadeIn();
                setTimeout(function() {
                $('.docErr').fadeOut('slow');
              }, 9000);
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
            $("#uploader").append('<div class="row uploadDoc col-sm-4"><div class="col-sm-10"><div class="docErr">업로드할 수 없는 파일입니다.</div><!--error--><div class="fileUpload btn btn-orange"> <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon"><span class="upl" id="upload"> 클릭하여 파일업로드</span><input type="file" class="upload up" id="up" onchange="readURL(this);" /></div></div><div class="col-sm-2"><a class="btn-check"><i class="fa fa-times"></i></a></div></div>');
      });

      $(document).on("click", "a.btn-check" , function() {
        if($(".uploadDoc").length>1){
            $(this).closest(".uploadDoc").remove();
          }
      });
    });
  });
</script>