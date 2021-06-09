<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 08.      박초원        최초작성
* 2021. 06. 09.      송수미        학과 공지 게시글 조회 기능 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
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
          <li class="breadcrumb-item"><a href="${cPath }/lms/subjectNoticeList.do">게시판/일정관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">학과공지</li>
      </ol>
  </nav>

  <!-- contents start -->
  <div class="card inputTable">
      <div class="card-body">
          <div class="table-responsive">
              <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                  <tr>
                      <th class="align-middle text-center">제목</th>
                      <td colspan="5">${board.bo_title }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">작성자</th>
                      <td>${board.bo_writer }</td>
                      <th class="align-middle text-center">작성일</th>
                      <td>${board.bo_write_de }</td>
                      <th class="align-middle text-center">조회수</th>
                      <td>${board.bo_hit }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">내용</th>
                      <td colspan="5">
                      	${board.bo_cont }
                      </td>
                  </tr>
                  <c:if test="${not empty board.attachList }">
	                  <tr>
	                      <th class="text-center align-middle">첨부파일</th>
	                      <td colspan="5">
	                          <ul class="attat">
	                          	<c:forEach items="${board.attachList }" var="attach">
	                          		<c:url value="/lms/boardDownload.do" var="downloadURL">
	                          			<c:param name="atch_file_no" value="${attach.atch_file_no }"/>
	                          			<c:param name="atch_file_seq" value="${attach.atch_file_seq }"/>
	                          		</c:url>
	                          	</c:forEach>
	                              <li><a href="${downloadURL }" class="text-color">${attach.file_nm }</a></li>
	                          </ul>
	                      </td>
	                  </tr>
                  </c:if>
              </table>
              <div class="text-center">
                  <a href="${cPath }/lms/subjectNoticeList.do" class="btn btn-primary">목록으로</a>
                  <a href="${cPath }/lms/subjectNoticeUpdate.do?bo_no=${board.bo_no}" class="btn btn-primary">수정</a>
                  <button type="button" class="btn btn-danger block" data-bs-toggle="modal"
                      data-bs-target="#default">
                      삭제
                  </button>
              </div>

              <!--Basic Modal -->
              <div class="modal fade text-left" id="default" tabindex="-1" role="dialog"
                  aria-labelledby="myModalLabel1" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-scrollable" role="document">
                      <div class="modal-content">
                          <div class="modal-header">
                              <h5 class="modal-title" id="myModalLabel1">게시글 삭제</h5>
                              <button type="button" class="close rounded-pill"
                                  data-bs-dismiss="modal" aria-label="Close">
                                  <i data-feather="x"></i>
                              </button>
                          </div>
                          <div class="modal-body">
                              <p>
			                                  삭제한 게시글은 복원이 불가합니다.<br/>
			                                  삭제하시겠습니까?		
                              </p>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn  btn-secondary" data-bs-dismiss="modal">
                                  <i class="bx bx-x d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">닫기</span>
                              </button>
                              <button type="button" class="btn btn-primary ml-1"
                                  data-bs-dismiss="modal" id="deleteBtn">
                                  <i class="bx bx-check d-block d-sm-none"></i>
                                  <span class="d-none d-sm-block">삭제</span>
                              </button>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- contents end -->
</div>
<script>
	$("#deleteBtn").on("click", function(){
		location.href = "${cPath}/lms/subjectNoticeDelete.do?bo_no=${board.bo_no}";
	});
</script>