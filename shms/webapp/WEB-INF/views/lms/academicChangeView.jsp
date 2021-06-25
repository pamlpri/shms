<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 21.  박초원        최초작성
* 2021. 6. 24.  김보미        상세조회
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
          <li class="breadcrumb-item"><a href="#">변동사항</a></li>
          <li class="breadcrumb-item active" aria-current="page">자퇴신청</li>
      </ol>
  </nav>
  
  <div class="card inputTable">
      <div class="card-body">
          <div class="table-responsive">
          <form id="submitForm" action="${cPath }/lms/updateReginfoStat.do" method="post">
          <input type="hidden" name="cng_req_no" value="${cngVO.cng_req_no }">
          <input type="hidden" name="refuse_resn" value="${cngVO.refuse_resn }">
          <input id="process_stat" type="hidden" name="process_stat" value="">
              <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                  <tr>
                      <th rowspan="2" class="align-middle text-center">신청대상</th>
                      <th class="align-middle text-center">학번</th>
                      <td>${cngVO.stdnt_no }</td>
                      <th class="align-middle text-center">이름</th>
                      <td>${cngVO.stdnt_name }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">전화번호</th>
                      <td>${cngVO.tel_no }</td>
                      <th class="align-middle text-center">웹메일</th>
                      <td>${cngVO.webmail }</td>
                  </tr>
                  <tr>
                      <th rowspan="4" class="align-middle text-center">신청상세</th>
                      <th class="align-middle text-center">신청번호</th>
                      <td>${cngVO.cng_req_no }</td>
                      <th class="align-middle text-center">신청일자</th>
                      <td>${cngVO.req_de }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">신청종류</th>
                      <td>${cngVO.req_cl_code }</td>
                      <th class="align-middle text-center">제출서류</th>
                                   <td>
                                 <ul class="attat">
                                     <c:choose>
	                                     <c:when test="${not empty cngVO.attachList }">
		                                     <c:forEach items="${cngVO.attachList }" var="attList">
		                                     	<div class="ml-2 fileArea">
												<c:url value="/lms/reginfoDownload.do" var="downloadURL">
													<c:param name="atch_file_no" value="${attList.atch_file_no }" />
													<c:param name="atch_file_seq"
														value="${attList.atch_file_seq }" />
												</c:url>
												<p class="fileBox col-lg-6">
													<a href="${downloadURL }" class="text-color"
														data-attno="${attList.atch_file_seq }">${attList.file_nm}</a>
												</p>
											</div>
		                                     </c:forEach>
	                                     </c:when>
	                                     <c:otherwise>
	                                     		<li>파일 없음</li>
	                                     </c:otherwise>
                                     </c:choose>
                                  </ul>
                                 </td>
                  </tr>
                  <tr>
                  	 <!-- 각 변동 사항에 따라 변해야하는 항목 ex) 휴학은 휴학일과 복학 예정일 -->
                      <th class="align-middle text-center">신청사유</th>
                      <td>${cngVO.req_resn_code }</td>
                      <c:choose>
                      	<c:when test="${cngVO.req_cl_code eq '자퇴' }">
		                      <th class="align-middle text-center">자퇴일</th>
		                      <td>${cngVO.cng_bgnde }</td>
                      	</c:when>
                      	<c:when test="${cngVO.req_cl_code eq '전과' }">
		                      <th class="align-middle text-center">전과일</th>
		                      <td>${cngVO.cng_bgnde }</td>
                      	</c:when>
                      	<c:when test="${cngVO.req_cl_code eq '휴학' }">
		                      <th class="align-middle text-center">휴학일</th>
		                      <td>${cngVO.cng_bgnde }</td>
                      	</c:when>
                      	<c:when test="${cngVO.req_cl_code eq '복학' }">
		                      <th class="align-middle text-center">복학예정일</th>
		                      <td>${cngVO.cng_bgnde }</td>
                      	</c:when>
                      	<c:otherwise>
		                      <th class="align-middle text-center">변경일</th>
		                      <td>${cngVO.cng_bgnde }</td>
                      	</c:otherwise>
                      </c:choose>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">처리상태</th>
                      <td>${cngVO.process_stat }</td>
                      <th class="align-middle text-center">처리일</th>
                      <td>${cngVO.proc_date }</td>
                  </tr>
                  <c:choose>
                  	<c:when test="${not empty process_stat and process_stat eq '대기' }">
	                  <!-- 대기상태일때만 노출 -->
	                  <tr>
	                        <th class="align-middle text-center">반려사유</th>
	                        <td colspan="4">
	                            <textarea class="form-control" rows="3" id="returnResult" name="refuse_resn"></textarea>
	                            <span id="returnWarning"></span>
	                        </td>
	                    </tr>
                  	</c:when>
                  </c:choose>
                </table>
                 <c:choose>
                  	<c:when test="${process_stat eq '대기'}">
		               <div class="text-center">
		                   <button type="button" class="btn btn-light-secondary" id="returnBtn" value="BR">반려</button>
		                   <button type="button" class="btn btn-primary" id="SIBtn" value="SI">승인</button>
		               </div>
                  	</c:when>
                  	<c:when test="${process_stat eq '승인'}">
		              <div class="text-center">
		                  <a href="${cPath }/lms/academicChange.do" class="btn btn-primary">목록으로</a>
		                  <button class="btn btn-danger" type="button" id="completeBtn" value="WR">학적변동</button>
		              </div>
                  	</c:when>
                  	<c:when test="${process_stat eq '완료' }">
		              <div class="text-center">
		                  <a href="${cPath }/lms/academicChange.do" class="btn btn-primary">목록으로</a>
		              </div>
                  	</c:when>
                  </c:choose>
      		</form>
          </div>
      </div>
    </div>
  <!-- contents end -->
</div>
<script type="text/javascript">
	$("#returnBtn").on("click", function(){
	    let txt = $("#returnResult").val();
	    if(txt == null || txt == ""){
	        console.log(txt)
	        $("#returnWarning").text("반려사유는 필수입력 항목입니다.");
	        $("#returnResult").focus();
	    }else {
		   	let br =$("#returnBtn").val();
		   	$("#process_stat").val(br);
	    	$("#submitForm").submit();
	    }
	});
	
	$("#SIBtn").on("click", function(){
	   	let si =$("#SIBtn").val();
	   	$("#process_stat").val(si);
		$("#submitForm").submit();
	});
	
	$("#completeBtn").on("click", function(){
	   	let wr =$("#completeBtn").val();
	   	$("#process_stat").val(wr);
		$("#submitForm").submit();
	})
</script>