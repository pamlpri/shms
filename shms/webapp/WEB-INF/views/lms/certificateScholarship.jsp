<%--
* [[개정이력(Modification Information)]]
* 수정일         수정자     수정내용
* ----------  ---------  -----------------
* 2021. 6. 21.   박초원     최초작성
* 2021. 6. 22.   김보미		목록조회
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
          <li class="breadcrumb-item"><a href="#">장학금 지원</a></li>
          <li class="breadcrumb-item active" aria-current="page">자격증 취득 장학금</li>
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
                          <th class="text-center">장학명</th>
                          <th class="text-center">신청자</th>
                          <th class="text-center">신청일</th>
                          <th class="text-center">서류제출</th>
                          <th class="text-center">지급금액</th>
                          <th class="text-center">지급일</th>
                          <th class="text-center">상태</th>
                      </tr>
                  </thead>
                  <tbody>
	              <c:choose>
	              	<c:when test="${not empty schlList }">
	              		<c:forEach items="${schlList }" var="schl">
	                      <tr>
	                          <td class="text-center">${schl.rn }</td>
	                          <td class="text-center">${schl.req_no }</td>
	                          <td class="text-center">${schl.schlship_nm }</td>
	                          <td class="text-center">${schl.name }</td>
	                          <td class="text-center">${schl.req_de }</td>
	                          <td class="text-center">${schl.papers_submit_at }</td>
	                          <td class="text-center">${schl.benefit }</td>
	                          <td class="text-center">${schl.proc_date }</td>
	                          <c:if test="${schl.process_stat eq '완료' }">
		                          <td class="text-center"><a href="${cPath }/lms/certificateScholarshipView.do?req_no=${schl.req_no}" class="badge bg-success white-color">${schl.process_stat }</a></td>
	                          </c:if>
	                          <c:if test="${schl.process_stat eq '대기' }">
		                          <th class="text-center"><a href="${cPath }/lms/certificateScholarshipView.do?req_no=${schl.req_no}" class="badge bg-info">${schl.process_stat }</a></th>
	                          </c:if>
	                          <c:if test="${schl.process_stat eq '반려' }">
		                           <th class="text-center">
		                           <input type="hidden" value="${schl.refuse_resn }" name="refuse_resn">
		                              <button type="button" class="btn badge bg-danger block failBtn"
		                                  data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
		                              ${schl.process_stat }
		                              </button>
		                          </th>
	                          </c:if>
	                          <c:if test="${schl.process_stat eq '승인' }">
									<td class="text-center"><a href="${cPath }/lms/certificateScholarshipView.do?req_no=${schl.req_no}&proc_stat=${schl.process_stat }" class="badge bg-primary white-color">${schl.process_stat }</a></td>
	                          </c:if>
	                      </tr>
	              			
	              		</c:forEach>
	              	</c:when>
	              </c:choose>
                  </tbody>
              </table>
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
                  <p id="inputText">
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
<script type="text/javascript">
	$(".failBtn").on("click", function(){
		let refuse_resn = $(this).parent().find("[name='refuse_resn']").val();
		document.getElementById("inputText").innerText=refuse_resn;
	})
</script>