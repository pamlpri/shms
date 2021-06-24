<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">학적관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">학적조회</li>
     </ol>
 </nav>

 <!-- contents start -->
 <section class="section">
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
                                             <option>전체</option>
                                             <c:forEach items="${collegeList }" var="college">
												<option value="${college.col_code}" >
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
                                             <option>전체</option>
                                             <c:forEach items="${subjectList }" var="subject">
												<option class="${subject.col_code }" value="${subject.sub_code }" >
													${subject.sub_name }
												</option>
											</c:forEach>
                                         </select>
                                     </fieldset>
                                 </div>
                             </div>
                             <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>학적상태</h6>
                                 </div>
                                 <div class="col-md-8">
                                     <fieldset class="form-group">
                                         <select class="form-select">
                                             <option>전체</option>
                                             <c:forEach items="${academicStatusList }" var="academicStatus">
												<option class="${academicStatus.com_code }" value="${academicStatus.com_code }" >
													${academicStatus.com_code_nm }
												</option>
											</c:forEach>
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
                                         <input type="text" class="form-control" name="searchWord" value="" aria-label="Recipient's username" aria-describedby="button-addon2">
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
                             <th class="text-center">단과대</th>
                             <th class="text-center">학과</th>
                             <th class="text-center">학번</th>
                             <th class="text-center">이름</th>
                             <th class="text-center">생년월일</th>
                             <th class="text-center">성별</th>
                             <th class="text-center">학년 / 학기</th>
                             <th class="text-center">학적상태</th>
                             <th class="text-center">입학유형</th>
                             <th class="text-center">입학일</th>
                         </tr>
                     </thead>
                     <tbody id="listBody">
                     	<c:choose>
                     		<c:when test="${not empty pagingVO.dataList }">
                     			<c:forEach items="${pagingVO.dataList }" var="arList">
                     				<tr>
			                             <td class="text-center">${arList.col_name }</td>
			                             <td class="text-center">${arList.sub_name }</td>
			                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do?stdnt_no=${arList.stdnt_no }">${arList.stdnt_no }</a></td>
			                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do?stdnt_no=${arList.stdnt_no }">${arList.name }</a></td>
			                             <td class="text-center">${arList.regno1 }</td>
			                             <td class="text-center">${arList.gen }</td>
			                             <td class="text-center">${arList.grade }학년 ${arList.semstr }학기</td>
			                             <td class="text-center">${arList.reginfo_stat }</td>
			                             <td class="text-center">신입학</td>
			                             <td class="text-center">${arList.entsch_de }</td>
			                         </tr>
                     			</c:forEach>
                     		</c:when>
                     		<c:otherwise>
                     			<tr>
                     				<td class="text-center" colspan="5">조회할 데이터가 없습니다.</td>
                     			</tr>
                     		</c:otherwise>
                     	</c:choose>
                     </tbody>
                 </table>
                 <div class="float-right mt-3">
                     <a href="#" class="btn btn-primary">
                         <i class="far fa-file"></i> Excel 다운로드
                     </a>
                 </div>
                 <div id="pagingArea" class="d-flex justify-content-center">
					${pagingVO.pagingHTMLBS }
				 </div>
<!--                  <nav aria-label="Page navigation example" class="pagenationNav"> -->
<!--                      <ul class="pagination pagination-primary"> -->
<!--                          <li class="page-item"> -->
<!--                              <a class="page-link" href="#"> -->
<!--                                  <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span> -->
<!--                              </a> -->
<!--                          </li> -->
<!--                          <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--                          <li class="page-item active"><a class="page-link" href="#">2</a></li> -->
<!--                          <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--                          <li class="page-item"> -->
<!--                              <a class="page-link" href="#"> -->
<!--                                  <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span> -->
<!--                              </a> -->
<!--                          </li> -->
<!--                      </ul> -->
<!--                  </nav> -->
             </div>
         </div>
     </div>
 </section>                
 <!-- contents end -->
</div>
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

let searchForm = $('#searchForm');
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
$("#searchForm").on("change", ":input[name]", function(){
	searchForm.submit();
}).ajaxForm({
	dataType : "json",
	success : function(resp){
		listBody.empty();
		let trTags = [];
		if(resp.dataList){
			$(resp.dataList).each(function(idx, arList){
				let tr = $("<tr>").append(
							$("<td>").text(arList.sub_name).addClass("text-center")
							,$("<td>").text(arList.col_name).addClass("text-center")
							,$("<td>").text(arList.stdnt_no).addClass("text-center")
							,$("<td>").text(arList.name).addClass("text-center")
							,$("<td>").text(arList.regno1).addClass("text-center")
							,$("<td>").text(arList.gen).addClass("text-center")
							,$("<td>").text(arList.grade + "학년" + arList.semstr + "학기").addClass("text-center")
							,$("<td>").text(arList.reginfo_stat).addClass("text-center")
							,$("<td>").text(arList.entsch_de).addClass("text-center")
						);
				trTags.push(tr);
			});
		}else {
			trTags.push(
				$("<tr>").html("<td colspan='10' class='text-center'>일치하는 강의가 없습니다.</td>")
			);
		}
		listBody.html(trTags);
	}, error : function(xhr, resp, error){
		console.log(xhr);
	}
});

</script>