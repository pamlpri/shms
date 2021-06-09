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
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">등록금관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">등록금 영수증</li>
      </ol>
  </nav>
  
  <section class="section">
      <div class="card inputTable">
          <div class="card-body">
              <div class="text-right float-right" style="margin-bottom: 2%">
                  <a href="#" class="btn btn-icon btn-primary"><i class="far fa-file"></i> PDF 다운로드</a>
              </div>
              <div style="clear: both;"></div>
              <div class="table-responsive">
                  <table class="table table-bordered table-md bill" style="border-color: #dfdfdf; overflow: hidden;">
                      <tr>
                          <th class="text-center" colspan="4">납입고지서[은행용]</th>
                      </tr>
                      <tr>
                          <th class="text-center" colspan="4">2011학년도 납입금</th>
                      </tr>
                      <tr>
                          <th class="text-center">대학</th>
                          <td class="text-center" colspan="3">인재대학교</td>
                      </tr>
                      <tr>
                          <th class="text-center">학과(부)</th>
                          <td class="text-center" colspan="3">안경광학과</td>
                      </tr>
                      <tr>
                          <th class="text-center">학년</th>
                          <td class="text-center">1학년</td>
                          <th class="text-center">학번</th>
                          <td class="text-center">S10500010</td>
                      </tr>
                      <tr>
                          <th class="text-center">이름</th>
                          <td class="text-center" colspan="3">박초원</td>
                      </tr>
                      <tr>
                          <th class="text-center">구분</th>
                          <th class="text-center">등록금내역 ①</th>
                          <th class="text-center">장학금내역 ②</th>
                          <th class="text-center">납입금액 ① - ②</th>
                      </tr>
                      <tr>
                          <th class="text-center">수업료</th>
                          <td class="text-center">2,122,500</td>
                          <td class="text-center">122,500</td>
                          <td class="text-center">2,000,000</td>
                      </tr>
                      <tr>
                          <td colspan="4" class="text-center">
                              <ul class="billList">
                                  <li>위 금액을 영수하였기에 통지합니다.</li>
                                  <li>&nbsp;</li>
                                  <li>2012년 2월 5일</li>
                              </ul>
                              <ul class="billList universtiyName">
                                  <li>인</li>
                                  <li>재</li>
                                  <li>대</li>
                                  <li>학</li>
                                  <li>교</li>
                                  <li>수</li>
                                  <li>입</li>
                                  <li>징</li>
                                  <li>수</li>
                                  <li>관</li>
                                  <li><img src="${cPath }/resources/lms/assets/images/signature.png" /></li>
                              </ul>
                          </td>
                      </tr>
                  </table>
              </div>
              <p style="margin-top: 20px;">
                  ※ 예치금 납부자는 예치금이 입학금으로 대치됩니다.
                  단, 장학금으로 입학금을 받는 사람은 입학 후 예치금을 환불 해 드립니다.
              </p>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>