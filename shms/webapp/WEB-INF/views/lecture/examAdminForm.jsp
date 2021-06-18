<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 06. 17. 	  박초원			 교수 시험,문제 수정
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
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code }&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">시험관리</li>
      </ol>
  </nav>

  <form method="post" enctype="multipart/form-data" id="examForm">
  	<input type="hidden" value="${exam.exam_no }" name="exam_no" />
  	<input type="hidden" value="${exam.atch_file_no }" name="atch_file_no" />
    <section class="section">
      <h2 class="section-title">시험출제</h2>
    </section>

    <div class="card attendance">
        <div class="card-body">
	        <div class="table-responsive">
	          <table class="table table-bordered table-md report">
	            <tr>
	              <th class="align-middle"><span class="red-color">* </span>시험분류</th>
	              <td class="text-left">
	                <select class="form-control col-md-4 im" name="test_cl">
	                  <option value="">-- 분류선택 --</option>
	                  <option value="JG" ${exam.test_cl eq 'JG'?'selected':'' }>중간고사</option>
	                  <option value="GM" ${exam.test_cl eq 'GM'?'selected':'' }>기말고사</option>
	                </select>
	                <div class="invalid-feedback">
                      필수항목
                    </div>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle"><span class="red-color">* </span>시험형식</th>
	              <td class="text-left">
	                <select class="form-control col-md-4 im" name="online_at">
	                  <option value="">-- 형식선택 --</option>
	                  <option value="Y" ${exam.online_at eq 'Y'?'selected':'' }>온라인시험</option>
	                  <option value="N" ${exam.online_at eq 'N'?'selected':'' }>오프라인시험</option>
	                </select>
	                <div class="invalid-feedback">
                      필수항목
                    </div>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle"><span class="red-color">* </span>시험유형</th>
	              <td class="text-left">
	                <select class="form-control col-md-4 im" name="exam_type">
	                  <option value="">-- 유형선택 --</option>
	                  <option value="GG" ${exam.exam_type eq 'GG'?'selected':'' }>객관식</option>
	                  <option value="DD" ${exam.exam_type eq 'DD'?'selected':'' }>주관식 단답형</option>
	                  <option value="SS" ${exam.exam_type eq 'SS'?'selected':'' }>주관식 서술형</option>
	                  <option value="TH" ${exam.exam_type eq 'TH'?'selected':'' }>혼합식</option>
	                </select>
	                <div class="invalid-feedback">
                      필수항목
                    </div>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle"><span class="red-color">* </span>시험시작</th>
	              <td class="text-left">
	                <input type="datetime-local" class="form-control col-md-4 im" name="exam_begin_dt" value="${exam.exam_begin_dt }">
	                <div class="invalid-feedback">
                      필수항목
                    </div>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle"><span class="red-color">* </span>시험종료</th>
	              <td class="text-left">
	                <input type="datetime-local" class="form-control col-md-4 im" name="exam_end_dt" value="${exam.exam_end_dt }">
	                <div class="invalid-feedback">
                      필수항목
                    </div>
	              </td>
	            </tr>
	            <tr>
	              <th class="align-middle"><span class="red-color">* </span>총 문항수</th>
	              <td class="text-left">
	                <input type="number" class="form-control col-md-4 im" name="ques_cnt" value="${exam.ques_cnt }"/>
	                <div class="invalid-feedback">
                      필수항목
                    </div>
	              </td>
	            </tr>
	            <c:if test="${not empty update }">
		            <tr>
		              <th class="align-middle">시험문제(PDF)<br/>원본파일</th>
		              <td class="text-left">
		              	<c:forEach items="${exam.attachList }" var="attach">
		              		<div class="fileArea ml-2">
			                	<c:url value="/lecture/examDownload.do" var="downloadURL">
			                		<c:param name="atch_file_no" value="${attach.atch_file_no }"/>
			                		<c:param name="atch_file_seq" value="${attach.atch_file_seq }"/>
			                	</c:url>
			                	<a href="${downloadURL }" data-attno="${attach.atch_file_seq }" class="text-color mr-2 oriFile">${attach.file_nm}</a>
		              		</div>
		              	</c:forEach>
		              </td>
		            </tr>
	            </c:if>
	            <c:choose>
	            	<c:when test="${not empty update }">
	            		<tr>
			              <th class="align-middle">시험문제(PDF)<br/>수정파일</th>
			              <td class="text-left">
			                <div>
			                  <div class="it">
			                    <div class="col-sm-offset-1" id="one">
			                      <div id="uploader" class="row">
			                        <div class="row uploadDoc col-md-4">
			                          <div class="col-md-12">
			                            <div class="fileUpload btn btn-orange">
			                              <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon">
			                              <span class="upl" id="upload"> 클릭하여 파일업로드</span>
			                              <input type="file" name="common_files" class="upload up" id="up" onchange="readURL(this);" value=""/>
			                            </div><!-- btn-orange -->
			                            <div class="docErrs" >업로드할 수 없는 파일입니다.</div><!-- error -->
				                        <div class="invalid-feedback">
				                         필수항목
				                        </div>
			                          </div><!-- col-3 -->
			                        </div><!-- row -->
			                      </div><!--uploader-->
			                    </div><!--one-->
			                  </div><!-- row -->
			                </div><!-- container -->
			              </td>
	              		</tr>
	            	</c:when>
	            	<c:otherwise>
			            <tr>
			              <th class="align-middle"><span class="red-color">* </span>시험문제(PDF)</th>
				              <td class="text-left">
				                <div>
				                  <div class="it">
				                    <div class="col-sm-offset-1" id="one">
				                      <div id="uploader" class="row">
				                        <div class="row uploadDoc col-md-4">
				                          <div class="col-md-12">
				                            <div class="fileUpload btn btn-orange">
				                              <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon">
				                              <span class="upl" id="upload"> 클릭하여 파일업로드</span>
				                              <input type="file" name="common_files" class="upload up" id="up" onchange="readURL(this);" value=""/>
				                            </div><!-- btn-orange -->
				                            <div class="docErrs" >업로드할 수 없는 파일입니다.</div><!-- error -->
					                        <div class="invalid-feedback">
					                         필수항목
					                        </div>
				                          </div><!-- col-3 -->
				                        </div><!-- row -->
				                      </div><!--uploader-->
				                    </div><!--one-->
				                  </div><!-- row -->
				                </div><!-- container -->
				              </td>
			              </tr>
	            	</c:otherwise>
	            </c:choose>
	            </table>
	            <c:if test="${not empty update }">
		            <p>※ 시험문제를 수정하여 재업로드하면 원본파일이 삭제됩니다. 단, 수정파일이 업로드할 수 없는 파일이거나 업로드가 제대로 이루어지지 않았다면 원본파일은 그대로 보존됩니다.</p>
	            </c:if>
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
            <a href="https://storage.cloud.google.com/shms/exam/%EB%8B%B5%EC%95%88_%EC%96%91%EC%8B%9D.xlsx?authuser=0" class="btn btn-warning">답안 양식 다운로드</a>
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
				  <c:if test="${not empty exam.quesList }">
				  	<c:forEach items="${exam.quesList }" var="ques" varStatus="i">
				  		<tr>
					  		<input type='hidden' name='quesList[${i.index }].ques_no' value='${ques.ques_no}'/>
			                <input type='hidden' name='quesList[${i.index }].ques_type' value='${ques.ques_type}'/>
			                <input type='hidden' name='quesList[${i.index }].ques_ans' value='${ques.ques_ans}'/>
			                <input type='hidden' name='quesList[${i.index }].ques_allot' value='${ques.ques_allot}'/>
				  			<td class='text-center align-middle'>${ques.ques_no}</td>
				  			<td class='text-center align-middle'>
				  				<c:choose>
				  					<c:when test="${ques.ques_type eq 'GG'}">객관식</c:when>
				  					<c:when test="${ques.ques_type eq 'DD'}">단답형</c:when>
				  					<c:when test="${ques.ques_type eq 'SS'}">서술형</c:when>
				  				</c:choose> 
				  			</td>
				  			<td class='text-center align-middle'>${ques.ques_ans}</td>
				  			<td class='text-center align-middle'>${ques.ques_allot}</td>
				  		</tr>
				  	</c:forEach>
				  </c:if>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="text-center">
        <a href="${cPath }/lecture/examAdmin.do" class="btn btn-secondary">취소</a>
        <c:choose>
        	<c:when test="${not empty update }">
		        <button type="button" class="btn btn-primary actionBtn" id="updateBtn">저장</button>
        	</c:when>
        	<c:otherwise>
		        <button type="button" class="btn btn-primary actionBtn" id="saveBtn">저장</button>
        	</c:otherwise>
        </c:choose>
      </div>
    </form>

	<div class="modal fade" tabindex="-1" role="dialog" id="fire-modal-2" style="display: block; padding-right: 17px;">
		<div class="modal-dialog modal-md modal-dialog-centered"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
	<div class="modal-backdrop fade"></div>
  <!-- contents end -->
  </div>
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
<script>
	  $("body").removeClass("modal-open").css("padding-right","0px");
	  $(".modal-backdrop").removeClass("show").css("display", "none");
	  $(".modal").removeClass("show").css("display", "none");
	
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
//             console.log(JSON.stringify(rows));
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
      
	  
	  $(".modal .close, .modal").on("click", function(){
		  $("body").removeClass("modal-open").css("padding-right","0px");
	      $(".modal-backdrop").removeClass("show").css("display", "none");
		  $(".modal").removeClass("show").css("display", "none");
	  });
	  
      let examForm = $("#examForm");
      var frag = [true, true, true, true, true];
      
      $("input[type='datetime-local']").on("change", function(){
 		 let exam_begin_dt = $("[name='exam_begin_dt']").val(); 
 		 let exam_end_dt = $("[name='exam_end_dt']").val();
 		 
 		 frag[0] = true;
 		 if(exam_end_dt != ""  && exam_begin_dt >= exam_end_dt){
 			$(".modal-title").text("시험시간 오류");
 			$(".modal-body").text("시험시작이 시험종료 시간 보다 크거나 같을 수 없습니다.");
 			$("body").addClass("modal-open").css("padding-right", "17px");
   			$(".modal-backdrop").addClass("show").css("display", "block");
 			$(".modal").addClass("show").css("display", "block");
 			frag[0] = false;
 		 }
 	  });
       
  	  $(".actionBtn").on("click",function(){ 
  		let btnType = $(this).attr("id");
  		console.log(btnType);
  		let inputs = $(examForm).find(":input[name]");
  		
  		$(inputs).each(function(idx, input){
  			console.log($(this).val());
  			if($(this).val() == ""){
  				if($(this).hasClass("im")){
  					$(this).addClass("is-invalid");
  					frag[1] = false;
  				}
  			}
  			
  			if($("[name='common_files']")){
  				if($(this).val() == ""){
  					$(this).parents(".uploadDoc").find(".invalid-feedback").fadeIn();
  				}
  			}
  		});
  		
//   		console.log($(".omrExcel").children("tbody").text());
  		if($(".omrExcel").children("tbody").text().trim() == ""){
  			$(".modal-title").text("답안 미제출");
			$(".modal-body").text("답안을 업로드하지 않으면 시험출제가 불가합니다.");
			$("body").addClass("modal-open").css("padding-right", "17px");
  			$(".modal-backdrop").addClass("show").css("display", "block");
			$(".modal").addClass("show").css("display", "block");
			frag[2] = false;
  		}
  		
  		let tds = $(".omrExcel").children("tbody").find("td");
  		$(tds).each(function(idx, tdTag){
//   			console.log($(this).text());
  			if($(this).text() == "undefined"){
  				$(".modal-title").text("답안 양식 오류");
  				$(".modal-body").text("공백이거나 값을 찾을 수 없는 항목이 있으면 답안 업로드가 불가합니다.");
  				$("body").addClass("modal-open").css("padding-right", "17px");
  	  			$(".modal-backdrop").addClass("show").css("display", "block");
  				$(".modal").addClass("show").css("display", "block");
  				frag[3] = false;
  			}else {
  				frag[3] = true;	
  			}
  		});
  		
  		
  		if(btnType == "saveBtn"){
	        var reg = /(.*?)\.(pdf)$/;
	      	if($("[name='common_files']").val() != null && !$("[name='common_files']").val().match(reg)) {
	      		$(".modal-title").text("파일오류");
				$(".modal-body").text("시험문제는 pdf파일로 제출해야 합니다.");
				$("body").addClass("modal-open").css("padding-right", "17px");
	  			$(".modal-backdrop").addClass("show").css("display", "block");
				$(".modal").addClass("show").css("display", "block");
				frag[4] = false;
	    	}else if($("[name='common_files']").val() != null && $("[name='common_files']").val().match(reg)){
	    		frag[4] = true;
	    	}
  		}else {
  			var reg = /(.*?)\.(pdf)$/;
	      	if($("[name='common_Files']").val() != "" && $("[name='common_Files']").val() != null){
	      		if(!$("[name='common_files']").val().match(reg)){
		      		$(".modal-title").text("파일오류");
					$(".modal-body").text("시험문제는 pdf파일로 제출해야 합니다.");
					$("body").addClass("modal-open").css("padding-right", "17px");
		  			$(".modal-backdrop").addClass("show").css("display", "block");
					$(".modal").addClass("show").css("display", "block");
					frag[4] = false;
		    	}else if($("[name='common_files']").val().match(reg)){
		    		frag[4] = true;
		    	}
  	  		}else {
  	  			frag[4] = true;
  	  		}
  		}
  		
  		if(btnType == "updateBtn"){
  			if($("[name='common_Files']").val() != "" && $("[name='common_Files']").val() != null){
  				console.log($("[name='common_files']").val());
  				let delAttNo = $(".oriFile").data("attno");
  				console.log("delAttNo" + delAttNo);
  				let newInput = $("<input>").attr({
  					"type" : "hidden"
  					, "name" : "delAttNos"
  				}).val(delAttNo);
  				
  				examForm.append(newInput);
  			}
  		}
  		
      	let count = 0;
      	for(var i = 0; i < frag.length; i++){
      		console.log(i+"번쨰" + frag[i]);
      		if(frag[i]){
      			count += 1;
      		}
      		if(!frag[0]){
      			$(".modal-title").text("시험시간 오류");
     			$(".modal-body").text("시험시작이 시험종료 시간 보다 크거나 같을 수 없습니다.");
     			$("body").addClass("modal-open").css("padding-right", "17px");
       			$(".modal-backdrop").addClass("show").css("display", "block");
     			$(".modal").addClass("show").css("display", "block");
      		}
      	}
      	
  		if(btnType== "saveBtn" && count == 5){
  			$(examForm).attr("action", "${cPath }/lecture/examInsert.do");
  			examForm.submit();
  		}else if(btnType == "updateBtn" && (count == 5 || count == 4)){
  			$(examForm).attr("action", "${cPath }/lecture/examUpdate.do");
  			examForm.submit();
  		}
  	  });
  	  
  	$("[name='common_files']").on("change", function(){
  		$(this).parents(".uploadDoc").find(".invalid-feedback").fadeOut();
  	});
  	
  	$(examForm).on("change",".im", function(){
		$(this).removeClass("is-invalid");
		frag[1] = true;
	});
  </script>