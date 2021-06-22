<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자       수정내용
* ----------  ---------  -----------------
* 2021. 6. 21.  박초원      최초작성
* 2021. 6. 22.  김보미		내역 조회			
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
             <li class="breadcrumb-item"><a href="#">장학금지원</a></li>
             <li class="breadcrumb-item active" aria-current="page">자격증 취득 장학금</li>
         </ol>
     </nav>
     
     <section class="section">
         <div class="card">
             <div class="card inputTable">
                 <div class="card-body">
                     <form class="table-responsive" id="submitForm" action="${cPath}/lms/updateSchlStatus.do" method="post"> 
                     <input type="hidden" value="${schl.req_no }" name="req_no">
                     <input type="hidden" value="${schl.refuse_resn }" name="refuse_resn">
                     <input id="process_stat" type="hidden" name="process_stat" value="">
                         <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                             <tr>
                                 <th rowspan="2" class="align-middle text-center">신청대상</th>
                                 <th class="align-middle text-center">학번</th>
                                 <td>${schl.stdnt_no }</td>
                                 <th class="align-middle text-center">이름</th>
                                 <td>${schl.name }</td>
                             </tr>
                             <tr>
                                 <th class="align-middle text-center">전화번호</th>
                                 <td>${schl.tel_no }</td>
                                 <th class="align-middle text-center">웹메일</th>
                                 <td>${schl.webmail }</td>
                             </tr>
                             <tr>
                                 <th rowspan="4" class="align-middle text-center">신청상세</th>
                                 <th class="align-middle text-center">신청번호</th>
                                 <td>${schl.req_no }</td>
                                 <th class="align-middle text-center">신청일자</th>
                                 <td>${schl.req_de }</td>
                             </tr>
                             <tr>
                                 <th class="align-middle text-center">신청종류</th>
                                 <td>${schl.schlship_nm }</td>
                                 <th class="align-middle text-center">제출서류</th>
                                 <td>
                                 <ul class="attat">
                                     <c:choose>
	                                     <c:when test="${not empty schl.attachList }">
		                                     <c:forEach items="${schl.attachList }" var="attList">
		                                         <li><a href="#" class="text-color">${attList.file_nm }</a></li>
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
                                 <th class="align-middle text-center">처리상태</th>
                                 <td>대기</td>
                                 <th class="align-middle text-center">지급일</th>
                                 <td></td>
                             </tr>
                             <tr>
                                 <th class="align-middle text-center">반려사유</th>
                                 <td colspan="4">
                                     <textarea class="form-control" rows="3" id="returnResult" name="refuse_resn"></textarea>
                                     <span id="returnWarning"></span>
                                 </td>
                             </tr>
                         </table>
                         <c:if test="${process_stat ne 'SI'}">
	                         <div class="text-center">
	                             <button type="button" class="btn btn-light-secondary" id="returnBtn" value="BR" name="stat">반려</button>
	                             <button type="button" class="btn btn-primary" id="SIBtn" value="SI" name="stat">승인</button>
	                         </div>
                         </c:if>
                     </form>
                 </div>
             </div>
         </div>
     </section>
     <!-- contents end -->
 </div>
<script>
	
	
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
    </script>