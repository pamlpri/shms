<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.   박초원       최초작성
* 2021. 6. 12.  김보미       등록금 납부내역 조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lms/tuitionList.do">등록금관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">등록금 조회</li>
      </ol>
  </nav>
  
  <section class="section">
      <div class="card">
          <div class="card-body">
              <div class="tab-content" id="myTabContent">
                  <div class="table-responsive">
                      <table class="table table-striped mb-0">
                          <thead>
                              <tr>
                                  <th class="text-center">학기</th>
                                  <th class="text-center">구분</th>
                                  <th class="text-center">수업료</th>
                                  <th class="text-center">감면금액</th>
                                  <th class="text-center">납부금액</th>
                                  <th class="text-center">납부일자</th>
                                  <th class="text-center">비고</th>
                              </tr>
                          </thead>
                          <tbody>
                          	<c:forEach var="tuition" items="${tuitionList }">
                          		<tr>
                                  <td class="text-center">${tuition.pay_year }학년도 ${tuition.pay_semstr }학기</td>
                                  <td class="text-center">${tuition.reginfo_stat}</td>
                                  <td class="text-center">${tuition.reg_amt }</td>
                                  <td class="text-center">${tuition.schl}</td>
                                  <td class="text-center">${tuition.pay_amt }</td>
                                  <td class="text-center">${tuition.pay_dt }</td>
                                  <td class="text-center"></td>
                       			</tr>
                       		</c:forEach>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>