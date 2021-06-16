<%--
* [[개정이력(Modification Information)]]
* 수정일            수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">등록금관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">등록금 환불</li>
      </ol>
  </nav>
  <section class="section">
      <div class="card inputTable">
          <div class="card-body">
              <div style="clear: both;"></div>
              <div class="table-responsive">
                  <p>
                      ※ 수업료를 납부하고 자퇴 및 제적처분을 받은 자 중
                      아래에 해당하는 경우에는 수업료 환불 신청을 하여야 한다.
                  </p>
                  <table class="table table-bordered table-md bill" style="border-color: #dfdfdf; overflow: hidden;">
                      <tr>
                          <th class="text-center">반환사유 발생일</th>
                          <th class="text-center">반환금액</th>
                      </tr>
                      <tr>
                          <td class="text-center">학기개시일(개강일자)부터 30일 경과 전</td>
                          <td class="text-center">납부금액의 6분의 5 해당액</td>
                      </tr>
                      <tr>
                          <td class="text-center">학기개시일(개강일자)부터 60일 경과 전</td>
                          <td class="text-center">납부금액의 3분의 2 해당액</td>
                      </tr>
                      <tr>
                          <td class="text-center">학기개시일(개강일자)부터 90일 경과 전</td>
                          <td class="text-center">납부금액의 2분의 1 해당액</td>
                      </tr>
                      <tr>
                          <td class="text-center">학기개시일(개강일자)부터 90일 경과 후	</td>
                          <td class="text-center">반환하지 않음</td>
                      </tr>
                  </table>
              </div>
          </div>
      </div>
  </section>
  
  <section class="section">
      <div class="card">
          <div class="card-body">
              <table class="table table-striped" id="table1">
                  <thead>
                      <tr>
                          <th class="text-center">신청번호</th>
                          <th class="text-center">신청사유</th>
                          <th class="text-center">환불금액</th>
                          <th class="text-center">환불신청일</th>
                          <th class="text-center">환불완료일</th>
                          <th class="text-center">상태</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td class="text-center">2345</td>
                          <td class="text-center">자퇴</td>
                          <td class="text-center">2,500,000원</td>
                          <td class="text-center">2021.05.02</td>
                          <td class="text-center">2021.05.07</td>
                          <td class="text-center"><span class="badge bg-success">완료</span></td>
                      </tr>
                      <tr>
                          <td class="text-center">2345</td>
                          <td class="text-center">자퇴</td>
                          <td class="text-center">2,500,000원</td>
                          <td class="text-center">2021.05.02</td>
                          <td class="text-center"></td>
                          <td class="text-center">
                              <button type="button" class="btn badge bg-danger block failBtn"
                                  data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
                              반려
                              </button>
                          </td>
                      </tr>
                      <tr>
                          <td class="text-center">2345</td>
                          <td class="text-center">자퇴</td>
                          <td class="text-center">2,500,000원</td>
                          <td class="text-center">2021.05.02</td>
                          <td class="text-center"></td>
                          <td class="text-center"><span class="badge bg-primary">승인</span></td>
                      </tr>
                      <tr>
                          <td class="text-center">2345</td>
                          <td class="text-center">자퇴</td>
                          <td class="text-center">2,500,000원</td>
                          <td class="text-center">2021.05.02</td>
                          <td class="text-center"></td>
                          <td class="text-center"><span class="badge bg-info">대기</span></td>
                      </tr>
                  </tbody>
              </table>
              <div class="text-center" style="margin-top: 40px;">
	              <c:if test="${reginfoStat eq '재학'} ">
	              </c:if>
	              <c:if test="${empty tuition }">
	              </c:if>
	              <c:if test="${reginfoStat  eq '재학'} AND ${not empty tuition }">
	                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="margin-top: -1%;">
	                      환불신청
	                  </button>
	              </c:if>
          
              </div>
          </div>
      </div>
  </section>

  <!--login form Modal -->
  <div class="modal fade text-left" id="inlineForm" tabindex="-1"
  role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
          role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel33">등록금환불신청</h4>
                  <button type="button" class="close" data-bs-dismiss="modal"
                      aria-label="Close">
                      <i data-feather="x"></i>
                  </button>
              </div>
              <form action="${cPath }/lms/tuitionRefundForm.do">
                  <div class="modal-body">
                      <div class="form-group">
                          <h6>학번</h6>
                          <input class="form-control form-control-default" type="text" value="${tuition.stdnt_no }" disabled>
                      </div>
                      <div class="form-group">
                          <h6>이름</h6>
                          <input class="form-control form-control-default" type="text" value="${tuition.name }" disabled>
                      </div>
                      <div class="form-group">
                          <h6>환불금액</h6>
                          <input class="form-control form-control-default" type="text" value="${refundAmt }원" disabled/>
                      </div>
                      <div class="form-group">
                          <h6>신청사유</h6>
                          <fieldset class="form-group">
                              <select class="form-select" id="basicSelect">
                                  <option value="">-- 사유선택 --</option>
                                  <c:forEach var="resnList" items="${resnList }">
                                  		<option value="${resnList.com_code }">${resnList.com_code_nm }</option>
                                  </c:forEach>
                              </select>
                          </fieldset>
                      </div>
                      <p>등록금 환불을 원하는 학생은 환불원인 발생일로 부터 10일 이내에
                          등록금 환불신청서를 제출하여야 합니다.</p>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-light-secondary"
                          data-bs-dismiss="modal">
                          <i class="bx bx-x d-block d-sm-none"></i>
                          <span class="d-none d-sm-block">닫기</span>
                      </button>
                      <button type="button" class="btn btn-primary ml-1"
                          data-bs-dismiss="modal">
                          <i class="bx bx-check d-block d-sm-none"></i>
                          <span class="d-none d-sm-block">저장</span>
                      </button>
                  </div>
              </form>
          </div>
      </div>
  </div>

  <!-- Vertically Centered modal Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
        role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">
                    환불반려
                </h5>
                <button type="button" class="close" data-bs-dismiss="modal"
                    aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <div class="modal-body">
                <p>
                    자퇴 취소로 인한 환불 취소
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
	$(function(){
		let 
		
		$(".ml-1").on("click", function(){
			$.ajax({
				url : "${cPath}/lms/tuitionRefundForm.do"
				, method : "post"
				, datType : "json"
				, success : function(res){
					
				}, error : function(error, xhr, msg){
					console.log(xhr);
					console.log(error);
					console.log(msg);
				} 
			});
		});
	});

</script>