<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 23.      박초원        최초작성
* 2021. 6. 24.      송수미        강의 등록 기능 구현
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
          <li class="breadcrumb-item active" aria-current="page">교양강의</li>
      </ol>
  </nav>

  <!-- contents start -->
  <section class="section">
      <h4 class="h4Title"><i class="fas fa-minus"></i> 기본정보</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
                  <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                      <tr>
                          <th class="align-middle text-center">강의명</th>
                          <td class="align-middle">
                          	<input value="${curr.lec_name }" type="text" class="form-control" disabled />
                          </td>
                          <th class="align-middle text-center">커리큘럼 코드</th>
                          <td class="align-middle">
                          	<input value="${curr.cur_code }" name="cur_code" type="text" class="form-control" disabled />
                          </td>
                      </tr>
                      <tr>
                          <th class="text-center align-middle">담당자사번</th>
                          <td class="text-center">
	                          <input value="${curr.staff_no }" id="staffNo" type="text" class="form-control" disabled />
                          </td>
                          <th class="text-center align-middle">담당자명</th>
                          <td class="text-center">
                          	<input value="${curr.name }" type="text" class="form-control" disabled/>
                          </td> 
                      </tr>
                  </table>
              </div>
          </div>
      </div>

      <h4 class="h4Title"><i class="fas fa-minus"></i> 기타정보</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
              	<form method="post" id="regForm">
                  <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                      <tr>
                          <th class="text-center align-middle">개설연도</th>
                          <td class="text-center">
                          	<input value="${indexInfoList[0].year }" name="estbl_year" type="number" class="form-control" readonly />
                          </td>
                          <th class="text-center align-middle">개설학기</th>
                          <td class="text-center">
                          	<input value="${indexInfoList[0].semstr }" name="estbl_semstr" type="number" class="form-control" readonly/>
                          </td> 
                      </tr>
                      <tr>
                          <th class="text-center align-middle">이수구분</th>
                          <td class="text-center">
                          	<input value="${curr.lec_cl_nm }" type="text" class="form-control" readonly/>
                          	<input value="${curr.lec_cl }" name="lec_cl" type="hidden" class="form-control"/>
                          </td> 
                          <th class="text-center align-middle">학점</th>
                          <td class="text-center">
                          	<input value="${curr.lec_pnt }" id="lecPnt" type="number" class="form-control" readonly />
                          </td>
                      </tr>
                      <tr>
                          <th class="text-center align-middle">강의요일</th>
                          <td class="text-center">
                          	<select name="dayotw" class="form-select" id="dayotw">
                          		<option value="">-- 요일 선택 --</option>
                          		<option value="02" ${lecture.dayotw == '02'? 'selected' :'' }>월요일</option>
                          		<option value="03" ${lecture.dayotw == '03'? 'selected' :'' }>화요일</option>
                          		<option value="04" ${lecture.dayotw == '04'? 'selected' :'' }>수요일</option>
                          		<option value="05" ${lecture.dayotw == '05'? 'selected' :'' }>목요일</option>
                          		<option value="06" ${lecture.dayotw == '06'? 'selected' :'' }>금요일</option>
                          	</select>
                          </td> 
                          <th class="text-center align-middle">강의시작시간</th>
                          <td class="text-center">
                              <div class="row">
                                  <div class="col-md-6">
                                  	  <select name="lec_time" class="form-select col-md-6" id="lecTime">
                                  	  		<option value="">-- 시간 선택 --</option>
                                  	  	<c:forEach begin="9" end="15" var="time">
                                  	  		<option value="${time }" ${lecture.lec_time eq time ? 'selected' : '' }>${time }</option>
                                  	  	</c:forEach>
                                  	  </select>
<!--                                       <button type="button" class="btn btn-primary" id="dblChkBtn">강의 시간 중복 확인</button> -->
                                  </div>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <th class="text-center align-middle">대상학과</th>
                          <td class="text-center">
                          	<input data-sub="${curr.sub_code }" id="subCode" value="${curr.sub_name }" type="text" class="form-control" readonly />
                          </td> 
                          <th class="text-center align-middle">대상학년</th>
                          <td class="text-center">
                          	<input value="${curr.lec_atnlc }" type="text" class="form-control" readonly />
                          </td>
                      </tr>
                      <tr>
                          <th class="text-center align-middle">강의정원</th>
                          <td class="text-center">
                          	<input id="lecCpacity" value="${curr.lec_cpacity }" type="number" class="form-control" readonly />
                          </td> 
                          <th class="text-center align-middle">강의실</th>
                          <td class="text-center">
                          	<select class="form-select" name="lecrum_no" id="lecrumSelect">
                          	
                          	</select>
                          </td>
                      </tr>
                  </table>
                </form>
              </div>
          </div>  
      </div>
      <div class="text-center">
          <a href="${cPath }/lms/curriculum.do?key='major'" class="btn btn-light-secondary">취소</a>
          <button id="saveBtn" type="button" class="btn btn-primary">저장</button>
          <button type="button" class="btn btn-danger block" data-bs-toggle="modal"
	         data-bs-target="#deleteModal">
		          삭제
	      </button>
      </div>
      
      <!--Basic Modal -->
	  <div class="modal fade text-left" id="deleteModal" tabindex="-1" role="dialog"
	      aria-labelledby="myModalLabel1" aria-hidden="true">
	      <div class="modal-dialog modal-dialog-scrollable" role="document">
	          <div class="modal-content">
	              <div class="modal-header">
	                  <h5 class="modal-title" id="myModalLabel1">커리큘럼 삭제</h5>
	                  <button type="button" class="close rounded-pill"
	                      data-bs-dismiss="modal" aria-label="Close">
	                      <i data-feather="x"></i>
	                  </button>
	              </div>
	              <div class="modal-body">
	              <form action="${cPath }/lms/curriculumDelete.do" id="deleteForm">
	              	<input type="hidden" value="${curr.cur_code}" name="cur_code"/>
	              </form>
	                  <p>
	                      삭제한 강의는 복원이 불가합니다.<br/>
	                      삭제하시겠습니까?
	                  </p>
	              </div>
	              <div class="modal-footer">
	                  <button type="button" class="btn  btn-secondary" data-bs-dismiss="modal">
	                      <i class="bx bx-x d-block d-sm-none"></i>
	                      <span class="d-none d-sm-block">닫기</span>
	                  </button>
	                  <button type="button" class="btn btn-primary ml-1"
	                      data-bs-dismiss="modal" id="submitBtn">
	                      <i class="bx bx-check d-block d-sm-none"></i>
	                      <span class="d-none d-sm-block">삭제</span>
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
  </section>
  <!-- contents end -->
</div>
<c:if test="${not empty message }">
	<script>
		let message = "${message}";
		setModal(message);
		function setModal(message){
			$("#default").find(".modal-body p").empty().text(message);
			$("#default").addClass("show").css("display","block");
		} 
	</script>
</c:if>
<script>
$("#submitBtn").on("click", function(){
	$("#deleteForm").submit();
});
function setModal(message){
	$("#default").find(".modal-body p").empty().text(message);
	$("#default").addClass("show").css("display","block");
} 

$(function(){
	let lecTime = $("#lecTime");
	let dayotw = $("#dayotw");
	let staffNo = $("#staffNo");
	let lecPnt = $("#lecPnt");
	let lecCpacity = $("#lecCpacity");
	let subCode = $("#subCode").data("sub");
// 	$("#dblChkBtn").on("click", function(){
	$(dayotw).on("change", function(){
		$(lecTime).val("");
	});
	
	$(lecTime).on("change", function(){
		if(lecTime.val() == ""){
			$("#lecrumSelect").empty();
		}
	
		if(dayotw.val() == ""){
			lecTime.val("");
			setModal("강의 요일을 먼저 선택해주세요.");
		}else{
			if(lecTime.val() == null || lecTime.val() == ""){
				setModal("강의 시간을 선택해주세요.");	
			}else{
				$.ajax({
					url : "${cPath}/lms/staffSchdulCheck.do",
					data : {
						lecTime : lecTime.val(),
						staff_no : staffNo.val(),
						lec_pnt : lecPnt.val(),
						dayotw : dayotw.val()
					},
					success : function(resp){
						let message = "";
						if(resp == "NULL"){
							setModal("강의 시간을 선택해주세요.");
							lecTime.val("");
						}else if(resp == "FAIL"){
							setModal("해당 시간은 강의가 중복됩니다.");
							lecTime.val("");
						}else{
							setModal("해당 시간은 선택이 가능합니다.");
							$.ajax({
								url : "${cPath}/lms/lecRumInfo.do",
								data : {
									lecCpacity : lecCpacity.val(),
									subCode : subCode,
									dayotw : dayotw.val(),
									lecTime : lecTime.val(),
									lecPnt : lecPnt.val()
								},
								success : function(resp){
									let option = "";
									$(resp).each(function(idx, lecrum){
										option += "<option value='" + lecrum.lecrum_no + "'>" + lecrum.building_nm + lecrum.lecrum_nm + "</option>";
									});
									$("#lecrumSelect").append(option);
								}, error : function(xhr, resp, error){
									console.log(xhr);
								}
							});
						}
						
					}, error : function(xhr, resp, error){
						console.log(xhr);
					}
				});
			}
		}
	});
	
	$("#lecrumSelect").on("click", function(){
		if(lecTime.val() == ""){
			setModal("강의 시간을 먼저 선택해주세요.");
		}
	})
	
	$("#saveBtn").on("click", function(){
		$("#regForm").submit();
	});
	
    $("#close, .modal").on("click", function(){
		$("#default").removeClass("show").css("display","none");
	});
});
</script>