<%--
* [[개정이력(Modification Information)]]
* 수정일         수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.   박초원      최초작성
* 2021. 6. 17.   김보미		 등록금 신청 내역 조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">장학금관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">교내 장학금 신청</li>
      </ol>
  </nav>
  
  <section class="section">
      <div class="card">
          <div class="card-body">
              <table class="table table-striped" id="table1">
                  <thead>
                      <tr>
                          <th class="text-center">No.</th>
                          <th class="text-center">신청번호</th>
                          <th class="text-center">신청종류</th>
                          <th class="text-center">신청일</th>
                          <th class="text-center">서류제출</th>
                          <th class="text-center">처리상태</th>
                      </tr>
                  </thead>
                  <tbody>
                  <c:choose>
                  	<c:when test="${not empty schlReqList }">
                  		<c:forEach var="schlReqList" items="${schlReqList }">
	                      <tr>
	                          <td class="text-center">${schlReqList.rn }</td>
	                          <td class="text-center">${schlReqList.req_no }</td>
	                          <td class="text-center">${schlReqList.schlship_nm }</td>
	                          <td class="text-center">${schlReqList.req_de }</td>
	                          <td class="text-center">${schlReqList.papers_submit_at }</td>
	                          	<c:if test="${schlReqList.process_stat eq '완료' }">
			                    	<td class="text-center"><a href="${cPath }/lms/scholarshipCampusView.do?req_no=${schlReqList.req_no }" class="badge bg-success white-color">지급완료</a></td>
	                          	</c:if>
	                          	<c:if test="${schlReqList.process_stat eq '대기' }">
			                    	<td class="text-center"><a href="${cPath }/lms/scholarshipCampusForm.do?req_no=${schlReqList.req_no }" class="badge bg-info white-color">신청대기</a></td>
	                          	</c:if>
	                          	<c:if test="${schlReqList.process_stat eq '반려' }">
			                    	<th class="text-center">
		                              <button type="button" class="btn badge bg-danger block failBtn"
		                                  data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
		                              신청반려
		                              </button>
		                          	</th>
	                          	</c:if>
	                          	<c:if test="${schlReqList.process_stat eq '승인' }">
			                    	<th class="text-center"><a href="${cPath }/lms/scholarshipCampusView.do?req_no=${schlReqList.req_no }" class="badge bg-primary white-color">신청승인</a></th>
	                          	</c:if>
	                      </tr>
                  		</c:forEach>
                  	</c:when>
                  </c:choose>
                  </tbody>
              </table>
              <div class="breadcrumb breadcrumb-right mt-3">
                  <a href="${cPath }/lms/scholarshipCampusForm.do" class="btn btn-primary">
                      장학금 신청
                  </a>
              </div>
          </div>
      </div>
  </section>

  <!-- Vertically Centered modal Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">
                    반려사유
                </h5>
                <button type="button" class="close" data-bs-dismiss="modal"
                    aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>
                    자격증 서류 미제출로 인한 반려
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light-secondary"
                    data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>
    <!-- contents end -->
</div>