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
      <h1>${lec_name }</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code }&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">시험관리</li>
      </ol>
  </nav>

  <form action="${cPath }/lecture/examInsert.do" method="post" enctype="multipart/form-data">
    <section class="section">
      <h2 class="section-title">시험출제</h2>
    </section>

    <div class="card attendance">
        <div class="card-body">
	        <div class="table-responsive">
	          <table class="table table-bordered table-md report">
	            <tr>
	              <th class="align-middle">시험분류</th>
	              <td class="text-left">
	                <select class="form-control col-md-4" name="test_cl">
	                  <option value="">-- 분류선택 --</option>
	                  <option value="JG">중간고사</option>
	                  <option value="GM">기말고사</option>
	                </select>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">시험형식</th>
	              <td class="text-left">
	                <select class="form-control col-md-4" name="online_at">
	                  <option value="">-- 형식선택 --</option>
	                  <option value="Y">온라인시험</option>
	                  <option value="N">오프라인시험</option>
	                </select>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">시험유형</th>
	              <td class="text-left">
	                <select class="form-control col-md-4" name="exam_type">
	                  <option value="">-- 유형선택 --</option>
	                  <option value="GG">객관식</option>
	                  <option value="DD">주관식 단답형</option>
	                  <option value="SS">주관식 서술형</option>
	                  <option value="TH">혼합형</option>
	                </select>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">시험시작</th>
	              <td>
	                <input type="datetime-local" class="form-control col-md-4" name="exam_begin_dt">
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">시험종료</th>
	              <td>
	                <input type="datetime-local" class="form-control col-md-4" name="exam_end_dt">
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">총 문항수</th>
	              <td class="text-left">
	                <input type="number" class="form-control col-md-4" name="ques_cnt"/>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">시험문제(PDF)</th>
	              <td class="text-left">
	                <div>
	                  <div class="it">
	                    <div class="col-sm-offset-1" id="one">
	                      <div id="uploader" class="row">
	                        <div class="row uploadDoc col-sm-4">
	                          <div class="col-sm-10">
	                            <div class="fileUpload btn btn-orange">
	                              <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon">
	                              <span class="upl" id="upload"> 클릭하여 파일업로드</span>
	                              <input type="file" class="upload up" id="up" onchange="readURL(this);"/>
	                            </div><!-- btn-orange -->
	                            <div class="docErrs" >업로드할 수 없는 파일입니다.</div><!-- error -->
	                          </div><!-- col-3 -->
	                        </div><!-- row -->
	                      </div><!--uploader-->
	                    </div><!--one-->
	                  </div><!-- row -->
	                </div><!-- container -->
	              </td>
	              </tr>
	            </table>
	        </div>
        </div>
      </div>

      <section class="section" style="padding-top: 0.5%;">
        <h2 class="section-title">답안</h2>
        <p>답안지 양식을 다운받아 답안을 입력하신후 답안을 업로드해주세요.</p>
      </section>

      <div class="card">
        <div class="card-body">
          <div class="text-left excelWrap">
            <a href="https://storage.cloud.google.com/shms/exam/%EB%8B%B5%EC%95%88_%EC%96%91%EC%8B%9D.xlsx?authuser=1" class="btn btn-warning">답안 양식 다운로드</a>
            <a href="#" class="btn btn-icon btn-primary"><i class="far fa-file"></i> <input id="excelUpload" type="file" onchange="readExcel();" /> 답안 업로드</a>
          </div>
          <div class="table-responsive">
            <table class="table table-bordered table-md attendance omrExcel">
              <colgroup>
			        <col width="10%" />
			        <col width="10%" />
			        <col width="70%" />
			        <col width="10%" />
			    </colgroup>
              <thead>
                <tr>
                  <th class="text-center">문항번호</th>
                  <th class="text-center">문항종류</th>
                  <th class="text-center align-middle">정답</th>
                  <th class="text-center">배점</th>
                </tr>
              </thead>
              <tbody>

              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="text-center">
        <a href="${cPath }/lecture/examAdmin.do" class="btn btn-secondary">취소</a>
        <button type="submit" class="btn btn-primary">저장</button>
      </div>
    </form>
  <!-- contents end -->
  </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>

<script>
 	   var fileTypes = ['pdf'];  //acceptable file types
 	   function readURL(input) {
 	        if (input.files && input.files[0]) {
 	            var extension = input.files[0].name.split('.').pop().toLowerCase(),  //file extension from input file
 	                isSuccess = fileTypes.indexOf(extension) > -1;  //is extension in acceptable types

 	            if (isSuccess) { //yes
 	                var reader = new FileReader();
 	                reader.onload = function (e) {
 	                    if (extension == 'pdf'){
 	                    	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/179/179483.svg');
 	                    	$(input).attr("name", "exam_files");
 	                   		$('.docErrs').fadeOut('slow');
 	                    }
 	                    else {
 	                    	//console.log('here=>'+$(input).closest('.uploadDoc').length);
 	                    	$(input).closest('.uploadDoc').find(".docErr").slideUp('slow');
 	                    }
 	                }

 	                reader.readAsDataURL(input.files[0]);
 	            }
 	            else {
 	            	$(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136549.svg');
 	                $(input).closest('.uploadDoc').find(".docErrs").fadeIn();
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
    });		

      function readExcel() {
        let input = event.target;
        let reader = new FileReader();
        reader.onload = function () {
            $(".omrExcel").children("tbody").empty();
            let data = reader.result;
            let workBook = XLSX.read(data, { type: 'binary' });
            let rows = XLSX.utils.sheet_to_json(workBook.Sheets["Sheet1"]);
            console.log(JSON.stringify(rows));
            for(var i = 0; i < rows.length; i++){
              var obj = rows[i];
      		  if(obj.문항코드 != ""){
	              $(".omrExcel").children("tbody").append(
	                "<tr>"
	                + "<input type='hidden' name='quesList["+ (obj.문항번호 - 1) +"].ques_no' value='" + obj.문항번호 +"'/>"
	                + "<input type='hidden' name='quesList["+ (obj.문항번호 - 1) +"].ques_type' value='" + obj.문항코드 +"'/>"
	                + "<input type='hidden' name='quesList["+ (obj.문항번호 - 1) +"].ques_ans' value='" + obj.정답 +"'/>"
	                + "<input type='hidden' name='quesList["+ (obj.문항번호 - 1) +"].ques_allot' value='" + obj.배점 +"'/>"
	                + "<td class='text-center align-middle'>" + obj.문항번호 + "</td>"
	                + "<td class='text-center align-middle'>" + obj.문항종류 + "</td>"
	                + "<td class='text-center align-middle'>" + obj.정답 + "</td>"
	                + "<td class='text-center align-middle'>" + obj.배점 + "</td>"
	                + "</tr>"
	              );
      		  }
            }
            
        };
        reader.readAsBinaryString(input.files[0]);
      }
  </script>