<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 8.      박초원        최초작성
* 2021. 6. 8.      송수미        강의 개설 기능 구현
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
     	<c:choose>
			 <c:when test="${not empty student }">
	               <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
	         </c:when>
	         <c:otherwise>
	               <li class="breadcrumb-item"><a href="${cPath }/lms/main.do">HOME</a></li>
	         </c:otherwise>
     	</c:choose>
          <li class="breadcrumb-item"><a href="${cPath }/lms/lectureList.do">강의관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">강의개설</li>
      </ol>
  </nav>

  <section class="section">
      <div class="card">
          <div class="card inputTable">
              <div class="card-body">
                  <div class="row">
                      <div class="col-lg-12 row " style="margin-bottom : -10px">
                          <div class="col-md-3 mb-4">
                              <fieldset class="form-group">
                                  <select id="lecSelect" class="form-select float-right">
                                      <option value>-- 강의선택 --</option>
                                      <c:if test="${not empty lectures }">
	                                      <c:forEach items="${lectures }" var="lec">
		                                    	<c:set var="selected" value="${lectureVO.lec_code eq lec.lec_code ? 'selected' : 'mbbmbm'}" />
		                                      	<option value="${lec.lec_code }" ${selected }>${lec.lec_name }</option>
	                                      </c:forEach>
                                      </c:if>
                                  </select>
                              </fieldset>
                          </div>
                      </div>
                  </div>
                  <form class="table-responsive" method="post" enctype="multipart/form-data" id="submitForm">
                  	  <input type="hidden" id="staff_no" name="staff_no"
	                  	  	value="${not empty lectureVO.staff_no ? lectureVO.staff_no : '-'}"/>
                  	  <input type="hidden" id="lec_code" name="lec_code"
                  	  	value="${not empty lectureVO.lec_code ? lectureVO.lec_code : '-'}"/>
                  	  <input type="hidden" id="lec_cl_nm" name="lec_cl_nm"
                  	  	value="${not empty lectureVO.lec_cl_nm ? lectureVO.lec_cl_nm : '-'}"/>
                  	  <input type="hidden" id="lec_name" name="lec_name"
                  	  	value="${not empty lectureVO.lec_name ? lectureVO.lec_name : '-'}"/>
                  	  <input type="hidden" id="name" name="name"
                  	  	value="${not empty lectureVO.name ? lectureVO.name : '-'}"/>
                  	  <input type="hidden" id="estbl_year" name="estbl_year"
                  	  	value="${not empty lectureVO.estbl_year ? lectureVO.estbl_year : '-'}"/>
                  	  <input type="hidden" id="estbl_semstr" name="estbl_semstr"
                  	  	value="${not empty lectureVO.estbl_semstr ? lectureVO.estbl_semstr : '-'}"/>
                  	  <input type="hidden" id="dayotw_nm" name="dayotw_nm"
                  	  	value="${not empty lectureVO.dayotw_nm ? lectureVO.dayotw_nm : '-'}"/>
                  	  <input type="hidden" id="lec_full_time" name="lec_full_time"
                  	  	value="${not empty lectureVO.lec_full_time ? lectureVO.lec_full_time : '-'}"/>
                      <table id="lecInfoTb" class="table table-bordered table-md" style="border-color: #dfdfdf;">
                      	  <colgroup>
                      	  	<col style="width : 10%">
                      	  	<col style="width : 10%">
                      	  	<col style="width : 10%">
                      	  	<col style="width : 10%">
                      	  </colgroup>
                          <tr>
                              <th class="align-middle text-center">강의코드</th>
                              <td class="align-middle">${not empty lectureVO.lec_code ? lectureVO.lec_code : "-"}</td>
                              <th class="align-middle text-center">이수구분</th>
                              <td class="align-middle">${not empty lectureVO.lec_cl_nm ? lectureVO.lec_cl_nm : "-" }</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의명</th>
                              <td class="align-middle">${not empty lectureVO.lec_name ? lectureVO.lec_name : "-" }</td>
                              <th class="align-middle text-center">담당교수</th>
                              <td class="align-middle">${not empty lectureVO.name ? lectureVO.name : "-" }</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">개설연도</th>
                              <td class="align-middle">${not empty lectureVO.estbl_year ? lectureVO.estbl_year : "-" }</td>
                              <th class="align-middle text-center">개설학기</th>
                              <td class="align-middle">${not empty lectureVO.estbl_semstr ? lectureVO.estbl_semstr : "-" }</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의요일</th>
                              <td class="align-middle">${not empty lectureVO.dayotw_nm ? lectureVO.dayotw_nm : "-" }</td>
                              <th class="align-middle text-center">강의시간</th>
                              <td class="align-middle">${not empty lectureVO.lec_full_time ? lectureVO.lec_full_time : "-" }</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의개요</th>
                              <td class="align-middle" colspan="3">
                                  <textarea class="form-control" placeholder="" id="floatingTextarea" name="summary">${lectureVO.summary }</textarea>
                              </td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">평가방법</th>
                              <td class="align-middle" colspan="3">
                                  <ul id="gradePar">
                                      <li class="float-left">
                                          <h6>중간고사</h6>
                                          <input class="form-control form-control-sm" type="number" min=0 max= 100 placeholder="단위 %" name="midterm"
                                          	value="${not empty lectureVO.midterm ? lectureVO.midterm : '-'}"/>
                                      </li>
                                      <li class="float-left">
                                          <h6>기말고사</h6>
                                          <input class="form-control form-control-sm" type="number" min=0 max= 100 placeholder="단위 %" name="finals"
                                          	value="${not empty lectureVO.finals ? lectureVO.finals : '-'}"/>
                                      </li>
                                      <li class="float-left">
                                          <h6>과제</h6>
                                          <input class="form-control form-control-sm" type="number" min=0 max= 100 placeholder="단위 %" name="task"
                                          value="${not empty lectureVO.task ? lectureVO.task : '-'}"/>
                                      </li>
                                      <li class="float-left">
                                          <h6>출석</h6>
                                          <input class="form-control form-control-sm" type="number" min=0 max= 100 placeholder="단위 %" name="attend"
                                          value="${not empty lectureVO.attend ? lectureVO.attend : '-'}"/>
                                      </li>
                                      <li class="float-left">
                                          <h6>기타</h6>
                                          <input class="form-control form-control-sm" type="number" min=0 max= 100 placeholder="단위 %" name="etc"
                                          value="${not empty lectureVO.etc ? lectureVO.etc : '-'}"/>
                                      </li>
                                  </ul>
                              </td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의교재</th>
                              <td class="align-middle" colspan="3">
                                  <textarea class="form-control" placeholder="" name="tchmtr" id="floatingTextarea">${lectureVO.tchmtr }</textarea>
                              </td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의부교재</th>
                              <td class="align-middle" colspan="3">
                                  <textarea class="form-control" placeholder="" name="adi_tchmtr" id="floatingTextarea">${lectureVO.adi_tchmtr }</textarea>
                              </td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">비고</th>
                              <td class="align-middle" colspan="3">
                                  <textarea class="form-control" placeholder="" name="lec_rm" id="floatingTextarea">${lectureVO.lec_rm }</textarea>
                              </td>
                          </tr>
                      </table>
                      <h6 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i> 강의계획서</h6>
                      <div class="form-group">
                          <div class="fallback">
                              <div class="col-12 col-md-12">
                                  <div class="card">
                                      <div class="card-content">
                                          <!-- File uploader with validation -->
                                          <input type="file" class="form-control" name="common_files">
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="text-center m-t-15">
                          <a href="${cPath}/lms/lectureAllList.do" class="btn btn-light-secondary">취소</a>
                          <button id="saveBtn" class="btn btn-primary" type="submit">저장</button>
                      </div>
                    </form>
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
</div>
<c:if test="${not empty message }">
	<script>
		$("#default").find(".modal-title").empty().text("");
		$("#default").find(".modal-body p").empty().text("${message}");
		$("#default").addClass("show").css("display","block");
	</script>
</c:if>

<script>
	let lecSelect = $("#lecSelect");
	let lecInfoTb = $("#lecInfoTb");
	
	$("#close, .modal").on("click", function(){
		$("#default").removeClass("show").css("display","none");
	})
	
	lecSelect.on("change", function(){
		 $("#submitForm").find(":input").empty();
		 $("#saveBtn").text("저장");
		lec_code = lecSelect.val();
		if(lec_code == ""){
			for(let i = 0; i < 8; i++){
				$("#lecInfoTb td").eq(i).text("-");
			}
		}else{
			$.ajax({
				url : "${cPath}/lms/lectureOpen.do"
				, data : {
					"lec_code" : lec_code
				}, dataType : "json"
				, success : function(resp){
					$("#lecInfoTb td").eq(0).text(resp.lec_code);
					$("#lec_code").val(resp.lec_code);
					$("#lecInfoTb td").eq(1).text(resp.lec_cl_nm);
					$("#lec_cl_nm").val(resp.lec_cl_nm);
					$("#lecInfoTb td").eq(2).text(resp.lec_name);
					$("#lec_name").val(resp.lec_name);
					$("#lecInfoTb td").eq(3).text(resp.name);
					$("#name").val(resp.name);
					$("#lecInfoTb td").eq(4).text(resp.estbl_year);
					$("#estbl_year").val(resp.estbl_year);
					$("#lecInfoTb td").eq(5).text(resp.estbl_semstr);
					$("#estbl_semstr").val(resp.estbl_semstr);
					$("#lecInfoTb td").eq(6).text(resp.dayotw_nm);
					$("#dayotw_nm").val(resp.dayotw_nm);
					$("#lecInfoTb td").eq(7).text(resp.lec_full_time);
					$("#lec_full_time").val(resp.lec_full_time);
					$("#staff_no").val(resp.staff_no);
					
				}, error : function(xhr, resp, error){
					console.log(xhr);
				}
			});
		}
	});
</script>