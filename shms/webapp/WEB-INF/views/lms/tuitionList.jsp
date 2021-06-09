<%--
* [[개정이력(Modification Information)]]
* 수정일            수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                              <tr>
                                  <td class="text-center">2012학년도 1학기</td>
                                  <td class="text-center">신입학</td>
                                  <td class="text-center">2,500,000</td>
                                  <td class="text-center">500,000</td>
                                  <td class="text-center">2,000,000</td>
                                  <td class="text-center">2012.02.05</td>
                                  <td class="text-center"></td>
                              </tr>
                              <tr>
                                  <td class="text-center">2012학년도 2학기</td>
                                  <td class="text-center">재학</td>
                                  <td class="text-center">2,500,000</td>
                                  <td class="text-center">500,000</td>
                                  <td class="text-center">2,000,000</td>
                                  <td class="text-center">2012.02.05</td>
                                  <td class="text-center"></td>
                              </tr>
                              <tr>
                                  <td class="text-center">2012학년도 2학기</td>
                                  <td class="text-center">복학</td>
                                  <td class="text-center">0</td>
                                  <td class="text-center"></td>
                                  <td class="text-center">0</td>
                                  <td class="text-center">2012.02.05</td>
                                  <td class="text-center"></td>
                              </tr>
                              <tr>
                                  <td class="text-center">2012학년도 2학기</td>
                                  <td class="text-center">재학</td>
                                  <td class="text-center">2,500,000</td>
                                  <td class="text-center">500,000</td>
                                  <td class="text-center">2,000,000</td>
                                  <td class="text-center">2012.02.05</td>
                                  <td class="text-center"></td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>