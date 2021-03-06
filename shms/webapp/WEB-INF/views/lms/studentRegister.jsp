<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- CSS Libraries -->
<link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/datatables/datatables.min.css">
<link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/datatables/Select-1.2.4/css/select.bootstrap4.min.css">
<div class="page-content">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">학적관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">학생등록</li>
      </ol>
  </nav>

  <!-- contents start -->
  <section class="section">
      <h4 class="h4Title">신입생명단</h4>
      <div class="card">
          <div class="card-body">
              <form id="searchForm">
              	  <input type="hidden" name="page" />
                  <div class="row">
                      <div class="col-12">
                          <div class="row">
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>단과대</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
										<select class="form-select" name="col_code">
											<option value="">전체</option>
											<c:forEach items="${collegeList }" var="college">
												<option value="${college.col_code}" ${selected }>
													${college.col_name }
												</option>
											</c:forEach>
										</select>
									  </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>학과</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
										<select class="form-select" name="sub_code">
											<option value="">전체</option>
											<c:forEach items="${subjectList }" var="subject">
												<option class="${subject.col_code }" value="${subject.sub_code }" ${selected }>
													${subject.sub_name }
												</option>
											</c:forEach>
										</select>
									  </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>신입생검색</h6>
                                 </div>
                                 <div class="col-md-8">
                                     <fieldset class="form-group">
                                         <select class="form-select" name="searchType">
                                            <option value="">전체</option>
											<option value="applicnt_no">수험번호</option>
											<option value="name">이름</option>
											<option value="telno">전화번호</option>
											<option value="email">이메일</option>
                                         </select>
                                     </fieldset>
                                 </div>
                             </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>검색</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <div class="input-group mb-3">
                                          <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" name="searchWord">
                                          <button class="btn btn-outline-secondary searchInput" type="button">
                                              <i class="bi bi-search"></i>
                                          </button>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </form>

              <div class="table-responsive">
                  <table class="table table-bordered mb-0">
                      <thead>
                          <tr class="bg-th">
                              <th class="text-center">수험번호</th>
                              <th class="text-center">모집년도</th>
                              <th class="text-center">단과대</th>
                              <th class="text-center">학과</th>
                              <th class="text-center">이름</th>
                              <th class="text-center">성별</th>
                              <th class="text-center">생년월일</th>
                              <th class="text-center">전화번호</th>
                          </tr>
                      </thead>
                      <tbody id="listBody">
                      	
                      </tbody>
                  </table>
                 <div class="float-right mt-3">
                     <a href="#" class="btn btn-primary"  onclick="ReportToExcelConverter()">
                         <i class="far fa-file" ></i> Excel 다운로드
                     </a>
                 </div>
                 <div id="pagingArea" class="d-flex justify-content-center mt-4">
					${pagingVO.pagingHTMLBS }
				 </div>
              </div>
          </div>
      </div>
      
      <h4 class="h4Title">학생등록</h4>
      <div class="card">
          <div class="card-body">
              <div class="col-md-12 mb-3">
                  <a href="https://storage.cloud.google.com/shms/student/학생등록_양식.xlsx" class="btn btn-outline-primary">
                      Excel 양식 다운로드
                  </a>
                  <a href="#" class="btn btn-icon btn-primary" style="cursor:pointer;">
                  	<i class="far fa-file"></i> 
                  	<input id="excelUpload" type="file" onchange="readExcel();" /> Excel 일괄 등록
                  </a>
              </div>

              <form class="table-responsive">
                  <table class="table table-bordered mb-0 studentExcel"  id="table">
                      <thead>
                          <tr class="bg-th">
                              <th class="text-center">학번</th>
                              <th class="text-center">수험번호</th>
                              <th class="text-center">모집년도</th>
                              <th class="text-center">단과대</th>
                              <th class="text-center">학과</th>
                              <th class="text-center">이름</th>
                              <th class="text-center">성별</th>
                              <th class="text-center">생년월일</th>
                              <th class="text-center">전화번호</th>
                              <th class="text-center">입학일</th>
                          </tr>
                      </thead>
                      <tbody>
                          
                      </tbody>
                  </table>
                  <div class="float-right mt-3">
                      <button type="button" id="resetBtn" class="btn btn-danger">초기화</button>
                      <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
                  </div>
              </form>
          </div>
      </div>
  </section> 
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
			<div class="modal-body" style="padding:35px 25px;"></div>
		</div>
	</div>
</div>
<div class="modal-backdrop fade"></div>              
  <!-- contents end -->
</div>
<script src="${cPath }/resources/lecture/dist/js/jquery.table2excel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
<!-- JS Libraies -->
<script src="${cPath }/resources/lecture/dist/modules/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${cPath }/resources/lecture/dist/modules/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
<script src="${cPath }/resources/lecture/dist/modules/datatables/Select-1.2.4/js/dataTables.select.min.js" type="text/javascript"></script>
<script src="${cPath }/resources/lecture/dist/modules/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${cPath }/resources/lecture/dist/js/page/modules-datatables.js" type="text/javascript"></script>
<script>
	let subjectTag = $("[name='sub_code']");
	$("[name='col_code']").on("change", function(){
		let selectedCode = $(this).val();
		subjectTag.val("");
		if(selectedCode){
			subjectTag.find("option").hide();
			subjectTag.find("option."+selectedCode).show();
		}else {
			subjectTag.find("option").show();
		}
		subjectTag.find("option:first").show();
	});
	
	let listBody = $("#listBody");
	let searchForm = $("#searchForm").on("change", ":input[name]", function(){
		searchForm.submit();
	}).ajaxForm({
		dataType : "json",
		beforeSubmit:function(){
			searchForm.find("[name='page']").val("");	
		},success : function(resp){
			listBody.empty();
			let trTags = [];
			if(resp.dataList){
				$(resp.dataList).each(function(idx, fresher){
					let tr = $("<tr>").append(
								$("<td>").text(fresher.applicnt_no).addClass("text-center")
								,$("<td>").text(fresher.rcrt_year).addClass("text-center")
								,$("<td>").text(fresher.col_name).addClass("text-center")
								,$("<td>").text(fresher.sub_name).addClass("text-center")
								,$("<td>").text(fresher.name).addClass("text-center")
								,$("<td>").text(fresher.gen).addClass("text-center")
								,$("<td>").text(fresher.regno1).addClass("text-center")
								,$("<td>").text(fresher.telno).addClass("text-center")
							);
					trTags.push(tr);
				});
			}else {
				let tr = $("<tr>").html("<td colspan='9' class='text-center'>일치하는 신입생이 없습니다.</td>");
				trTags.push(tr);
			}
			listBody.html(trTags);
			$("#pagingArea").html(resp.pagingHTMLBS);
		}, error : function(xhr, resp, error){
			console.log(xhr);
		}
	});
	
	searchForm.submit();
	
	let pagingArea = $("#pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
	
	function ReportToExcelConverter() {
		let loadingImg = " <img src='${cPath}/resources/lms/assets/images/loading.gif' style='display: block; margin: 0px auto;'/>";
		
		$(".modal-title").text("Excel 변환작업중..");
		$(".modal-body").html(loadingImg);
		$("body").addClass("modal-open").css("padding-right", "17px");
		$(".modal-backdrop").addClass("show").css("display", "block");
		$(".modal").addClass("show").css("display", "block");
		let header = `
			<tr class="bg-th">
	            <th class="text-center">수험번호</th>
	            <th class="text-center">모집년도</th>
	            <th class="text-center">단과대</th>
	            <th class="text-center">학과</th>
	            <th class="text-center">이름</th>
	            <th class="text-center">성별</th>
	            <th class="text-center">생년월일</th>
	            <th class="text-center">전화번호</th>
	        </tr>
		`;
		
		$.ajax({
			url: "${cPath}/lms/fresherExcel.do"
			, success: function(resp) {
				let trTags = [];
				if(resp){
					$(resp).each(function(idx, fresher){
						let tr = $("<tr>").append(
									$("<td>").text(fresher.applicnt_no).addClass("text-center")
									,$("<td>").text(fresher.rcrt_year).addClass("text-center")
									,$("<td>").text(fresher.col_name).addClass("text-center")
									,$("<td>").text(fresher.sub_name).addClass("text-center")
									,$("<td>").text(fresher.name).addClass("text-center")
									,$("<td>").text(fresher.gen).addClass("text-center")
									,$("<td>").text(fresher.regno1).addClass("text-center")
									,$("<td>").text(fresher.telno).addClass("text-center")
								);
						trTags.push(tr);
					});
					$('<table>').append(header,trTags).table2excel({
						exclude: ".noExl"
						, name: "Excel Document Name",
						filename: "신입생명단" +'.xls',
						fileext: ".xls", 
						exclude_img: true, 
						exclude_links: true,
						exclude_inputs: true 
					}); 
					$(".modal-title").text("Excel 변환작업 성공");
		 			$(".modal-body").text("Excel 변환작업에 성공했습니다.");
				}
			}
			, error: function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
		});		
	} 

	$(".modal .close, .modal").on("click", function(){
		$("body").removeClass("modal-open").css("padding-right","0px");
	    $(".modal-backdrop").removeClass("show").css("display", "none");
		$(".modal").removeClass("show").css("display", "none");
	});
	
    function readExcel() {
        let input = event.target;
        let reader = new FileReader();
        reader.onload = function () {
            $(".studentExcel").children("tbody").empty();
            let data = reader.result;
            let workBook = XLSX.read(data, { type: 'binary' });
            let rows = XLSX.utils.sheet_to_json(workBook.Sheets["학생등록양식"]);
            console.log(JSON.stringify(rows));
	        
            for(var i = 0; i < rows.length; i++){
                var obj = rows[i];
                $(".studentExcel").children("tbody").append(
                    "<tr>"
                    + "<td class='text-center'>" + obj.학번 + "<input type='hidden' name='applicantList["+i+"].stdnt_no' value='"+obj.학번+"'/></td>"
                    + "<td class='text-center'>" + obj.수험번호 + "<input type='hidden' name='applicantList["+i+"].applicnt_no' value='"+obj.수험번호+"'/></td>"
                    + "<td class='text-center'>" + obj.모집년도 + "</td>"
                    + "<td class='text-center'>" + obj.단과대 + "</td>"
                    + "<td class='text-center'>" + obj.학과 + "</td>"
                    + "<td class='text-center'>" + obj.이름 + "</td>"
                    + "<td class='text-center'>" + obj.성별 + "</td>"
                    + "<td class='text-center'>" + obj.생년월일 + "<input type='hidden' name='applicantList["+i+"].regno1' value='"+obj.생년월일+"'/></td>"
                    + "<td class='text-center'>" + obj.전화번호 + "</td>"
                    + "<td class='text-center'>" + obj.입학일 + "<input type='hidden' name='applicantList["+i+"].entsch_de' value='"+obj.입학일+"'/></td>"
                    + "</tr>"
                );
            }
            
            $('#table').DataTable();
        };
        reader.readAsBinaryString(input.files[0]);
    }

    $("#resetBtn").on("click", function(){
        $(".studentExcel").children("tbody").empty(); 
        table.destroy();
    });
    
    $("#saveBtn").on("click", function(){
    	let table = $("<table>").append($("#table").DataTable().$('tr').clone()).attr("class", "allTable").css("display", "none");
    	$("body").append(table);
    	let len = $(table).find("tr").length;
    	
    	let loadingImg = " <img src='${cPath}/resources/lms/assets/images/loading.gif' style='display: block; margin: 0px auto;'/>";
    	
    	$(".modal-title").text("학생등록중..");
    	$(".modal-body").html(loadingImg);
    	$("body").addClass("modal-open").css("padding-right", "17px");
    	$(".modal-backdrop").addClass("show").css("display", "block");
    	$(".modal").addClass("show").css("display", "block");
    	
    	var toData = new Object();
    	var dataList = new Array();
    	for(var i = 0; i < len; i++){
    		var data = new Object();
    		data["stdnt_no"] = $(".allTable").find("input[name='applicantList["+ i +"].stdnt_no']").val();
    		data["applicnt_no"] = $(".allTable").find("input[name='applicantList["+ i +"].applicnt_no']").val();
    		data["entsch_de"] = $(".allTable").find("input[name='applicantList["+ i +"].entsch_de']").val();
    		data["regno1"] = $(".allTable").find("input[name='applicantList["+ i +"].regno1']").val();
    		dataList.push(data);
    	}
    	toData["applicantList"] = dataList;
    	console.log(toData);
    	
    	$.ajax({
    		method : "post"
    		, url : "${cPath }/lms/fresherInsert.do"
    		, data : JSON.stringify(toData)
    		, dataType : "json"
    		, contentType : "application/json"
    		, success : function(resp){
    			console.log(resp)
    			if(resp.result == "OK"){
    				$(".modal-title").text("학생등록 성공");
    	 			$(".modal-body").text("학생등록이 성공적으로 완료되었습니다.");
    			}else {
    				$(".modal-title").text("학생등록 실패");
    	 			$(".modal-body").html("학생등록에 실패했습니다.<br/>잠시후에 다시 시도해주세요.");
    			}
    		},error : function(xhr, error, msg){ 
    			console.log(xhr);
    			console.log(error);
    			console.log(msg);
    		}
    	});
    });
</script>