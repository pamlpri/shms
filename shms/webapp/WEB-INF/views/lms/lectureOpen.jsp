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
          <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
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
		                                      <option value="${lec.lec_code }">${lec.lec_name }</option>
	                                      </c:forEach>
                                      </c:if>
                                  </select>
                              </fieldset>
                          </div>
                      </div>
                  </div>
                  <form class="table-responsive" method="post" enctype="multipart/form-data">
                  	  <input type="text" id="staff_no" name="staff_no"/>
                  	  <input type="text" id="lec_code" name="lec_code"/>
                      <table id="lecInfoTb" class="table table-bordered table-md" style="border-color: #dfdfdf;">
                      	  <colgroup>
                      	  	<col style="width : 10%">
                      	  	<col style="width : 10%">
                      	  	<col style="width : 10%">
                      	  	<col style="width : 10%">
                      	  </colgroup>
                          <tr>
                              <th class="align-middle text-center">강의코드</th>
                              <td class="align-middle">-</td>
                              <th class="align-middle text-center">이수구분</th>
                              <td class="align-middle">-</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의명</th>
                              <td class="align-middle">-</td>
                              <th class="align-middle text-center">담당교수</th>
                              <td class="align-middle">-</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">개설연도</th>
                              <td class="align-middle">-</td>
                              <th class="align-middle text-center">개설학기</th>
                              <td class="align-middle">-</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의요일</th>
                              <td class="align-middle">-</td>
                              <th class="align-middle text-center">강의시간</th>
                              <td class="align-middle">-</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의개요</th>
                              <td class="align-middle" colspan="3">
                                  <textarea class="form-control" placeholder="" id="floatingTextarea" name="summary"></textarea>
                              </td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">평가방법</th>
                              <td class="align-middle" colspan="3">
                                  <ul id="gradePar">
                                      <li class="float-left">
                                          <h6>중간고사</h6>
                                          <input class="form-control form-control-sm" type="number" placeholder="단위 %" name="midterm">
                                      </li>
                                      <li class="float-left">
                                          <h6>기말고사</h6>
                                          <input class="form-control form-control-sm" type="number" placeholder="단위 %" name="finals">
                                      </li>
                                      <li class="float-left">
                                          <h6>과제</h6>
                                          <input class="form-control form-control-sm" type="number" placeholder="단위 %" name="task">
                                      </li>
                                      <li class="float-left">
                                          <h6>출석</h6>
                                          <input class="form-control form-control-sm" type="number" placeholder="단위 %" name="attend">
                                      </li>
                                      <li class="float-left">
                                          <h6>기타</h6>
                                          <input class="form-control form-control-sm" type="number" placeholder="단위 %" name="etc">
                                      </li>
                                  </ul>
                              </td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의교재</th>
                              <td class="align-middle" colspan="3">
                                  <textarea class="form-control" placeholder="" name="tchmtr" id="floatingTextarea"></textarea>
                              </td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의부교재</th>
                              <td class="align-middle" colspan="3">
                                  <textarea class="form-control" placeholder="" name="adi_tchmtr" id="floatingTextarea"></textarea>
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
                                          <input type="file" class="with-validation-filepond" required multiple data-max-file-size="5MB" data-max-files="3">
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="text-center m-t-15">
                          <a href="lectureList.html" class="btn btn-light-secondary">취소</a>
                          <button id="saveBtn" class="btn btn-primary" type="submit">저장</button>
                      </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

<script>
	let lecSelect = $("#lecSelect");
	let lecInfoTb = $("#lecInfoTb");
	let staff_no = $("#staff_no");
	
	lecSelect.on("change", function(){
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
					$("#lecInfoTb td").eq(2).text(resp.lec_name);
					$("#lecInfoTb td").eq(3).text(resp.name);
					$("#lecInfoTb td").eq(4).text(resp.estbl_year);
					$("#lecInfoTb td").eq(5).text(resp.estbl_semstr);
					$("#lecInfoTb td").eq(6).text(resp.dayotw_nm);
					$("#lecInfoTb td").eq(7).text(resp.lec_full_time);
					staff_no.val(resp.staff_no);
				}, error : function(xhr, resp, error){
					console.log(xhr);
				}
			});
		}
	});
</script>