<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 20.      송수미        강의 공지 상세 조회
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
	      <c:choose>
	      	<c:when test="${'ST' eq user.user[1] }">
	      		<li class="breadcrumb-item"><a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
			</c:when>
			<c:otherwise>
				<li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
			</c:otherwise>
	      </c:choose>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/notice.do?lec_code=${lec_code}&lec_name=${lec_name}">강의개요</a></li>
          <li class="breadcrumb-item active" aria-current="page">공지사항</li>
      </ol>
  </nav>

  <section class="section">
      <div class="card">
        <div class="card-header">
          <h4 class="nontice-title">${board.bo_title }<span class="notice-date">${board.bo_write_de }</span></h4>
        </div>
        <div class="card-body">
        	${board.bo_cont }
	      <c:if test="${not empty board.attachList }">
	      	<c:if test="">
		      <div class="board_downloader" style="margin-bottom : 3%;">
		        <ul class="downloader">
			      <c:forEach items="${board.attachList }" var="attach">
				      <c:url value="/lecture/GGDownload.do" var="downloadURL">
				      	<c:param name="atch_file_no" value="${attach.atch_file_no }" />
				      	<c:param name="atch_file_seq" value="${attach.atch_file_seq }" />
				      </c:url>
			          <li>
			            <a href="${downloadURL }" class="text-color">
			            	<i class="fas fa-arrow-alt-circle-down"></i>${attach.file_nm }
			            </a>
			          </li>
			      </c:forEach>
		        </ul>
		       </div>
	      	</c:if>
	      </c:if>
        </div>
        <div class="card-footer bg-whitesmoke">
          <div id="noticeBtnBox" class="text-right">
            <a id="listBtn" class="btn btn-icon icon-left btn-primary" href="${cPath }/lecture/notice.do">목록으로</a>
            <!--교수한테만 보이는 버튼-->
            <c:if test="${'PR' eq user.user[1] }">
	            <a id="updateBtn" class="btn btn-icon icon-left btn-primary" href="${cPath }/lecture/noticeUpdate.do?bo_no=${board.bo_no}">수정</a>
				<button type="button" class="btn btn-danger" data-bs-toggle="modal"
                      data-bs-target="#default">
                      		삭제
                </button>
            </c:if>
          </div>
       </div>
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
              <form id="deleteForm" action="${cPath}/lms/subjectNoticeDelete.do" method="post">
              	<input type="hidden" name="bo_no" value="${board.bo_no }">
              	<c:if test="${not empty board.attachList }">
              		<input type="hidden" name="atch_file_no" value="${board.atch_file_no}">
              		<c:forEach items="${board.attachList }" var="attach">
              			<input type="hidden" name="delAttNos" value="${attach.atch_file_seq }">
              		</c:forEach>
              	</c:if>
                  <p>
                         삭제한 게시글은 복원이 불가합니다.<br/>
                         삭제하시겠습니까?		
                  </p>
              </form>
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
  </section>
  <!-- contents end -->
</div>
<script>
	$("#deleteBtn").on("click", function(){
		$("#deleteForm").submit();
	});
</script>