<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 23.      박초원        최초작성
* 2021. 6. 25.      송수미	  강의 조회
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
          <li class="breadcrumb-item active" aria-current="page">전공강의</li>
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
                          <th class="align-middle text-center">강의코드</th>
                          <td colspan="3" class="align-middle">${lecture.lec_code }</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의명</th>
                          <td colspan="3" class="align-middle">${lecture.lec_name }</td>
                      </tr>
                      <tr>
                          <th class="text-center">담당자사번</th>
                          <td>${lecture.staff_no }</td>
                          <th class="text-center">담당자명</th>
                          <td>${lecture.name }</td> 
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
                          <th class="text-center">개설연도</th>
                          <td>${lecture.estbl_year }</td>
                          <th class="text-center">개설학기</th>
                          <td>${lecture.estbl_semstr }</td> 
                      </tr>
                      <tr>
                          <th class="text-center">이수구분</th>
                          <td>${lecture.lec_cl_nm }</td> 
                          <th class="text-center">학점</th>
                          <td>${lecture.lec_pnt }</td>
                      </tr>
                      <tr>
                          <th class="text-center">강의요일</th>
                          <td>${lecture.dayotw_nm }</td> 
                          <th class="text-center">강의시간</th>
                          <td>
	                          <c:if test="${not empty lecture}">
		                          ${lecture.lec_time - 8} - ${lecture.lec_time + lecture.lec_pnt - 9}교시
	                          </c:if>
                          </td>
                      </tr>
                      <tr>
                          <th class="text-center">대상학과</th>
                          <td>${lecture.sub_name }</td> 
                          <th class="text-center">대상학년</th>
                          <td>
	                          <c:if test="${not empty lecture}">
		                          ${lecture.lec_atnlc }학년
	                          </c:if>
                          </td>
                      </tr>
                      <tr>
                          <th class="text-center">강의정원</th>
                          <td>
	                          <c:if test="${not empty lecture}">
                          		${lecture.lec_cpacity } 명
	                          </c:if>
                          </td> 
                          <th class="text-center">강의실</th>
                          <td>${lecture.lecrum }</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의계획서</th>
                          <td class="align-middle" colspan="3">
                              <ul class="attat">
                              	<c:if test="${not empty lecture.attachList }">
                              		<c:forEach items="${lecture.attachList }" var="attach">
                       					<c:url value="/lms/curriculumDownload.do" var="downloadURL">
									      	<c:param name="atch_file_no" value="${attach.atch_file_no }" />
									      	<c:param name="atch_file_seq" value="${attach.atch_file_seq }" />
								      	</c:url>
	                                    <li>
	                                    	<a href="${downloadURL }" class="text-color">${attach.file_nm }</a>
	                                    </li>
                              		</c:forEach>
                              	</c:if>
                              </ul>
                          </td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의개요</th>
                          <td class="align-middle" colspan="3">
                              ${lecture.summary }
                          </td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">평가방법</th>
                          <td class="align-middle" colspan="3">
                              <ul id="gradePar">
                                  <li class="float-left">
                                      <h6>중간</h6>
                                      <input class="form-control form-control-sm" type="text" value="${not empty lecture.midterm? (lecture.midterm += '%') : ''}" disabled>
                                  </li>
                                  <li class="float-left">
                                      <h6>기말</h6>
                                      <input class="form-control form-control-sm" type="text" value="${not empty lecture.finals? (lecture.finals += '%') : ''}" disabled>
                                  </li>
                                  <li class="float-left">
                                      <h6>과제</h6>
                                      <input class="form-control form-control-sm" type="text"  value="${not empty lecture.task? (lecture.task += '%') : ''}" disabled>
                                  </li>
                                  <li class="float-left">
                                      <h6>출석</h6>
                                      <input class="form-control form-control-sm" type="text"  value="${not empty lecture.attend? (lecture.attend += '%') : ''}" disabled>
                                  </li>
                                  <li class="float-left">
                                      <h6>기타</h6>
                                      <input class="form-control form-control-sm" type="text"  value="${not empty lecture.etc? (lecture.etc += '%') : ''}" disabled>
                                  </li>
                              </ul>
                          </td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의교재</th>
                          <td class="align-middle" colspan="3">
                              ${lecture.tchmtr }
                          </td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의부교재</th>
                          <td class="align-middle" colspan="3">
                              ${lecture.adi_tchmtr }
                          </td>
                      </tr>
                  </table>
              </div>
          </div>  
      </div>
      <div class="text-center">
          <a href="${cPath }/lms/curriculum.do?key=major" class="btn btn-primary">목록으로</a>
          <a href="electiveForm.html" class="btn btn-primary">수정</a>
          <button type="button" class="btn btn-danger block" data-bs-toggle="modal"
              data-bs-target="#default">
              삭제
          </button>
      </div>
  </section>

  <!--Basic Modal -->
  <div class="modal fade text-left" id="default" tabindex="-1" role="dialog"
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
              	<input type="hidden" value="${empty lecture.cur_code ? cur_code : lecture.cur_code}" name="cur_code"/>
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
  <div class="modal fade text-left" id="info" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="myModalLabel1">안내</h5>
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
                  <button type="button" class="btn  btn-secondary" data-bs-dismiss="modal">
                      <i class="bx bx-x d-block d-sm-none"></i>
                      <span class="d-none d-sm-block">닫기</span>
                  </button>
              </div>
          </div>
      </div>
  </div>
  <!-- contents end -->
</div>
<c:if test="${not empty message }">
	<script>
		$("#info").find(".modal-body p").empty().text("${message}");
		$("#info").addClass("show").css("display","block");
	    $("#close, .modal").on("click", function(){
			$("#info").removeClass("show").css("display","none");
		})		
	</script>
</c:if>
<script>
$("#submitBtn").on("click", function(){
	$("#deleteForm").submit();
});
</script>