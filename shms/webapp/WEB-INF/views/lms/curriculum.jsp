<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 23.      박초원        최초작성
* 2021. 6. 24.      송수미        커리큘럼 조회
* 2021. 6. 25.      송수미        오류 수정
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-content">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lms/main.do">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lms/curriculum.do?key=major">강의관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">${key eq 'major'? '전공강의' : '교양강의' }</li>
      </ol>
  </nav>

  <!-- contents start -->
  <section class="section">
      <div class="card">
          <div class="card-body">
              <form id="searchForm">
              	<input type="hidden" name="page" />
              	<input type="hidden" name="open_at"/>
                  <div class="row">
                      <div class="col-12">
                          <div class="row">
                              <div class="col-md-2 mb-2 row">
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
                              <div class="col-md-4 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>개설가능학기</h6>
                                  </div>
                                  <div class="col-md-4">
                                      <fieldset class="form-group">
                                          <select class="form-select" name="posbl_semstr">
                                              <option value="">전체</option>
                                              <option value="1">1학기</option>
                                              <option value="2">2학기</option>
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
                                          <input name="searchWord" type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
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
                              <th class="text-center">커리큘럼코드</th>
                              <th class="text-center">강의명</th>
                              <th class="text-center">학과</th>
                              <th class="text-center">담당교수</th>
                              <th class="text-center">학점</th>
                              <th class="text-center">이수구분</th>
                              <th class="text-center">개설연도</th>
                              <th class="text-center">개설가능학기</th>
                              <th class="text-center">정원</th>
                              <th class="text-center">등록여부</th>
                          </tr>
                      </thead>
                      <tbody id="listBody">
                      
                      </tbody>
                  </table>
                  <div class="float-right mt-3">
                      <a class="btn btn-primary" id="notOpen">
                          <i class="fas fa-chalkboard"></i>&nbsp; 미등록/전체 강의 조회
                      </a>
                  </div>
                  <nav id="pagingArea" aria-label="Page navigation example" class="pagenationNav">
                  	${pagingVO.pagingHTMLBS }
                  </nav>
              </div>
          </div>
      </div>
  </section>  
  <!-- contents end -->
</div>
<script>
	
	let thisSemstr = "${indexInfoList[0].semstr}";
	console.log(thisSemstr);
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
	
	let pagingArea = $("#pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
	
	let listBody = $("#listBody");
	let searchForm = $("#searchForm").on("change", ":input[name]", function(){
		searchForm.submit();
	}).ajaxForm({
		dataType : "json",
		beforeSubmit:function(){
			searchForm.find("[name='page']").val("");	
		},
		success : function(resp){
			listBody.empty();
			let trTags = [];
			if(resp.dataList){
				$(resp.dataList).each(function(idx, curr){
					let lec_cl_nm = curr.lec_cl == '01' ? '전필' : 
										(curr.lec_cl == '02' ? '전선' : (curr.lec_cl == '03' ? '교필' : '교선'));
					
					let spanTag = curr.open_at == 'N' ? '<span class="badge bg-light-danger">N</span>'
									: '<span class="badge bg-light-primary">Y</span>';
					let posbl_semstr = curr.posbl_semstr == null ? '전체' : curr.posbl_semstr;				
					let curCodeTag = "";
					let lecNameTag = "";
					let posblSemstr = curr.posbl_semstr;
					if(posblSemstr == null || posblSemstr == thisSemstr){
						if(curr.open_at == 'Y'){
							curCodeTag = '<a href="${cPath}/lms/curriculumView.do?cur_code=' + curr.cur_code + '" class="text-color">' + curr.cur_code + '</a>';
							lecNameTag = '<a href="${cPath}/lms/curriculumView.do?cur_code=' + curr.cur_code + '" class="text-color">' + curr.lec_name + '</a>';
						}else{
							curCodeTag = '<a href="${cPath}/lms/lectureRegister.do?cur_code=' + curr.cur_code + '" class="text-color">' + curr.cur_code + '</a>';
							lecNameTag = '<a href="${cPath}/lms/lectureRegister.do?cur_code=' + curr.cur_code + '" class="text-color">' + curr.lec_name + '</a>';
						}
					}else{
						curCodeTag = '<a href="${cPath}/lms/curriculumView.do?cur_code=' + curr.cur_code + '" class="text-color">' + curr.cur_code + '</a>';
						lecNameTag = '<a href="${cPath}/lms/curriculumView.do?cur_code=' + curr.cur_code + '" class="text-color">' + curr.lec_name + '</a>';
					}
					
					let tr = $("<tr>").append(
								$("<td>").html(curCodeTag).addClass("text-center")
								,$("<td>").html(lecNameTag).addClass("text-center")
								,$("<td>").text(curr.sub_name).addClass("text-center")
								,$("<td>").text(curr.name).addClass("text-center")
								,$("<td>").text(curr.lec_pnt).addClass("text-center")
								,$("<td>").text(lec_cl_nm).addClass("text-center")
								,$("<td>").text(curr.estbl_year).addClass("text-center")
								,$("<td>").text(posbl_semstr).addClass("text-center")
								,$("<td>").text(curr.lec_cpacity + "명").addClass("text-center")
								,$("<td>").html(spanTag).addClass("text-center")
							);
					trTags.push(tr);
				});	
			}else {
				trTags.push(
					$("<tr>").html("<td colspan='10' class='text-center'>조건에 맞는 커리큘럼이 없습니다.</td>")
				);
			}
			listBody.html(trTags);
			$("#pagingArea").html(resp.pagingHTMLBS);
		}, error : function(xhr, resp, error){
			console.log(xhr);
		}
	});
	
	searchForm.submit();
	let flag = true;
	
	$("#notOpen").on("click", function(){
		
		if(flag){
			$("input[name='open_at']").val("N");
			flag = false;
		}else{
			$("input[name='open_at']").val("");
			flag = true;
		}
		searchForm.submit();
	});
</script>