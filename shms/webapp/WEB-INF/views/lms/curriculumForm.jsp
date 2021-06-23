<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 23.      박초원        최초작성
* 2021. 6. 23.      송수미        커리큘럼 생성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lms/main.do">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lms/curriculum.do?key=major">강의관리</a></li>
            <li class="breadcrumb-item active" aria-current="page">전공강의</li>
        </ol>
    </nav>

    <!-- contents start -->
    <section class="section">
    	<form method="post">
	        <h4 class="h4Title"><i class="fas fa-minus"></i> 기본정보</h4>
	        <div class="card inputTable">
	            <div class="card-body">
	                <div class="table-responsive">
	                    <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
	                        <tr>
	                            <th class="text-center align-middle">강의명</th>
	                            <td class="text-center" colspan="3"><input name="lec_name" type="text" class="form-control" value="${curriculum.lec_name }"></td> 
	                        </tr>
	                        <tr>
	                            <th class="align-middle text-center align-middle">담당 교수명</th>
	                            <td class="text-center">
	                                <div class="input-group">
	                                    <input type="text" class="form-control bg-transparent" readonly id="profName" name="name" value="${curriculum.name }"/>
	                                    <!-- Button trigger for scrolling content modal -->
	                                    <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"  data-bs-target="#exampleModalScrollable" style="border: 1px solid #dce7f1;">
	                                        검색
	                                    </button>
	                                </div>
	                            </td>
	                            <th class="text-center align-middle">교수 사번</th>
	                            <td class="text-center"><input name="staff_no" id="profNo" readonly type="text" class="form-control" value="${curriculum.staff_no }"></td> 
	                        </tr>
	                    </table>
	                </div>
	            </div>
	        </div>
	
	        <h4 class="h4Title"><i class="fas fa-minus"></i> 기타정보</h4>
	        <div class="card inputTable">
	            <div class="card-body">
	                <div class="table-responsive">
	                    <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
	                        <tr>
	                            <th class="text-center align-middle">개설연도</th>
	                            <td class="text-center">
	                            	<input type="number" name="estbl_year" class="form-control" readonly value="${not empty curriculum.estbl_year ? curriculum.estbl_year : indexInfoList[0].year }">
	                            </td>
	                            <th class="text-center align-middle">개설가능학기</th>
	                            <td class="text-center">
	                            	<select class="form-select" name="posbl_semstr">
	                            		<option value="">전체</option>
	                            		<option value="1">1학기</option>
	                            		<option value="2">2학기</option>
	                            	</select>
	                            </td> 
	                        </tr>
	                        <tr>
	                            <th class="text-center align-middle">이수구분</th>
	                            <td class="text-center">
	                                <select class="form-select float-right" name="lec_cl">
	                                    <option value="">-- 분류선택 --</option>
	                                    <c:forEach items="${indexInfoList }" var="indexInfo">
		                                    <option value="${indexInfo.lec_cl }">${indexInfo.lec_cl_nm }</option>
	                                    </c:forEach>
	                                </select>
	                            </td> 
	                            <th class="text-center align-middle">대상학년</th>
	                            <td class="text-center">
									<select class="form-select" name="lec_atnlc">
										<option value="">전체</option>
										<c:forEach begin="1" end="4" var="grade">
											<option value="${grade }">${grade }학년</option>
										</c:forEach>
									</select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th class="text-center align-middle">강의정원</th>
	                            <td class="text-center">
	                            	<input type="number" class="form-control" name="lec_cpacity" value="${curriculum.lec_cpacity }">
	                            </td> 
	                            <th class="text-center align-middle">학점</th>
	                            <td class="text-center">
	                            	<input type="number" class="form-control" name="lec_pnt" value="${curriculum.lec_pnt }" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <th class="text-center align-middle">단과</th>
	                            <td class="text-center">
									<select class="form-select" name="col_code">
										<option value="">-- 단과선택 --</option>
										<c:forEach items="${collegeList }" var="college">
											<option value="${college.col_code}" ${selected }>
												${college.col_name }
											</option>
										</c:forEach>
									</select>
								</td>
	                            <th class="text-center align-middle">학과	</th>
	                            <td class="text-center">
									<select class="form-select" name="sub_code">
										<option value="">-- 학과선택 --</option>
										<c:forEach items="${subjectList }" var="subject">
											<option class="${subject.col_code }" value="${subject.sub_code }" ${selected }>
												${subject.sub_name }
											</option>
										</c:forEach>
									</select>
	                            </td> 
	                        </tr>
	                    </table>
	                </div>
	            </div>  
	        </div>
	        <div class="text-center">
	            <a href="${cPath }/lms/curriculum.do?key=major" class="btn btn-light-secondary">취소</a>
	            <button type="submit" class="btn btn-primary">저장</button>
	        </div>
        </form>
    </section>

    <!--scrolling content Modal -->
    <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">강사 검색</h4>
                    <button type="button" class="close" data-bs-dismiss="modal"
                        aria-label="Close">
                        <i data-feather="x"></i>
                    </button>
                </div>
                <div class="modal-body row">
                	<form action="${cPath }/lms/profSearch.do" id="searchForm">
                		<input type="hidden" name="searchType" value="${prof.searchMap.searchType }"/>
                		<input type="hidden" name="searchWord" value="${prof.searchMap.searchType }"/>
                	</form>
                	<div id="searchUI">
	                    <div class="input-group mb-3">
	                        <select class="form-select" name="searchType" id="basicSelect">
	                            <option value="">전체</option>
	                            <option value="sub_name">학과</option>
	                            <option value="name">강사명</option>
	                        </select>
	                    </div>
	                    <div class="input-group mb-3">
	                        <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
	                        <input type="text" name="searchWord" class="form-control" placeholder="검색어를 입력하세요." 
	                        	aria-label="Recipient's username">
	                        <button id="searchBtn" class="btn btn-outline-secondary" type="button"style="border: 1px solid #dce7f1;">검색</button>
	                    </div>
                	</div>
                    <div id="profList">
                        <ul class="list-group" id="listBody">
                        
                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light-secondary"
                        data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">닫기</span>
                    </button>
                    <button id="profChoice" type="button" class="btn btn-primary ml-1"
                        data-bs-dismiss="modal">
                        <i class="bx bx-check d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">선택</span>
                    </button>
                </div>
            </div>
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
<c:if test="${not empty message }">
	<script>
		$("#default").find(".modal-body p").empty().text("${message}");
		$("#default").addClass("show").css("display","block");
	    $("#close, .modal").on("click", function(){
			$("#default").removeClass("show").css("display","none");
		})
	</script>
</c:if>
<script>
$(function(){
	let searchUI = $("#searchUI");
	
    searchUI.find("[name='searchType']").val("${searchMap.searchType }");
    $("#searchBtn").on("click", function(){
    	let inputs = searchUI.find(":input[name]");
    	$(inputs).each(function(idx, input){
    		let name = $(this).attr("name");
    		let sameInput = searchForm.find("[name='"+name+"']");
    		$(sameInput).val($(this).val());
    	});
    	
    	searchForm.submit();
    });
    
    let listBody = $("#listBody");
    let searchForm = $("#searchForm").ajaxForm({
    	dataType : "json"
    	, success : function(resp){
    		listBody.empty();
    		let liTags = [];
    		if(resp){
    			$(resp).each(function(idx, prof){
    				let li = $("<li>").attr("class", "list-group-item").text(prof.name + "(" + prof.sub_name + ") - " + prof.staff_no)
    				.prepend(
    					$("<input>").attr("class", "form-check-input me-1").attr("type", "radio").attr("name", "staff_no").attr("data-name", prof.name).val(prof.staff_no)
    				);
    				
    				liTags.push(li);
    			})
    		}else{
    			liTags.push(
    				$("<li>").attr("class", "list-group-item").text("검색조건에 해당하는 결과가 없습니다.")
    			);
    		}
    		listBody.html(liTags);
    	}, error : function(xhr, resp, error){
    		console.log(xhr);
    	}
    });
    
    searchForm.submit();
    
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
	
    $("#profChoice").on("click", function(){
    	let prof = $("#profList").find("input[type='radio']:checked")[0];
    	let profNo = $(prof).val();
    	let profName = $(prof).data("name");
    	$("#profNo").val(profNo);
    	$("#profName").val(profName);
    });
});
</script>