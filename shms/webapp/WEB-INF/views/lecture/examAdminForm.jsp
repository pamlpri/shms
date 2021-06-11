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
          <li class="breadcrumb-item"><a href="#">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">시험관리</li>
      </ol>
  </nav>

  <form>
    <section class="section">
      <h2 class="section-title">시험출제</h2>
    </section>

    <div class="card attendance">
        <div class="card-body">
	        <div class="table-responsive">
	          <table class="table table-bordered table-md report">
	            <tr>
	              <th class="align-middle">시험명</th>
	              <td class="text-left"><input type="text" class="form-control"></td>
	            </tr>
	            <tr>
	              <th class="align-middle">시험시작</th>
	              <td>
	                <input type="datetime-local" class="form-control col-md-6">
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">시험종료</th>
	              <td>
	                <input type="datetime-local" class="form-control col-md-6">
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">시험유형</th>
	              <td class="text-left">
	                <select class="form-control col-md-6">
	                  <option>-- 유형선택 --</option>
	                  <option>온라인시험</option>
	                  <option>오프라인시험</option>
	                </select>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">객관식 문항수</th>
	              <td class="text-left">
	                <input type="number" class="form-control col-md-6"/>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">주관식 문항수</th>
	              <td class="text-left">
	                <input type="number" class="form-control col-md-6"/>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">서술형 문항수</th>
	              <td class="text-left">
	                <input type="number" class="form-control col-md-6"/>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle">총 문항수</th>
	              <td class="text-left">
	                <input type="number" class="form-control col-md-6"/>
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
	                            <div class="docErr">업로드할 수 없는 파일입니다.</div><!--error-->
	                            <div class="fileUpload btn btn-orange">
	                              <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon">
	                              <span class="upl" id="upload"> 클릭하여 파일업로드</span>
	                              <input type="file" class="upload up" id="up" onchange="readURL(this);" />
	                            </div><!-- btn-orange -->
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
            <a href="#" class="btn btn-warning">답안 양식 다운로드</a>
            <a href="#" class="btn btn-icon btn-primary"><i class="far fa-file"></i> <input id="excelUpload" type="file" onchange="readExcel();" /> 답안 업로드</a>
          </div>
          <div class="table-responsive">
            <table class="table table-bordered table-md attendance omrExcel">
              <thead>
                <tr>
                  <th class="text-center">문항번호</th>
                  <th class="text-center">문항종류</th>
                  <th class="text-center">정답</th>
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
                      else if (extension == 'docx'){
                        $(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/281/281760.svg');
                      }
                      else if (extension == 'rtf'){
                        $(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136539.svg');
                      }
                      else if (extension == 'png'){ $(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136523.svg'); 
                      }
                      else if (extension == 'jpg' || extension == 'jpeg'){
                        $(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136524.svg');
                      }
                    else if (extension == 'txt'){
                        $(input).closest('.fileUpload').find(".icon").attr('src','https://image.flaticon.com/icons/svg/136/136538.svg');
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
              $(".omrExcel").children("tbody").append(
                "<tr>"
                + "<td class='text-center'>" + obj.문항번호 + "</td>"
                + "<td class='text-center'>" + obj.문항종류 + "</td>"
                + "<td class='text-center'>" + obj.정답 + "</td>"
                + "<td class='text-center'>" + obj.배점 + "</td>"
                + "</tr>"
              );
            }
            
        };
        reader.readAsBinaryString(input.files[0]);
      }
  </script>