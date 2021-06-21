<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 21.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">기사 장학금</td>
                          <td class="text-center">한마음</td>
                          <td class="text-center">2021.05.25</td>
                          <td class="text-center">제출</td>
                          <td class="text-center">500,000</td>
                          <td class="text-center">2021.05.25</td>
                          <td class="text-center"><a href="${cPath }/lms/certificateScholarshipDetailView.do" class="badge bg-success white-color">완료</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">산업기사 장학금</td>
                          <td class="text-center">한마음</td>
                          <td class="text-center">2021.05.25</td>
                          <td class="text-center">미제출</td>
                          <td class="text-center">500,000</td>
                          <td class="text-center"></td>
                          <th class="text-center">
                              <button type="button" class="btn badge bg-danger block failBtn"
                                  data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
                              반려
                              </button>
                          </th>
                      </tr>
                      <tr>
                          <td class="text-center">3</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">산업기사 장학금</td>
                          <td class="text-center">한마음</td>
                          <td class="text-center">2021.05.25</td>
                          <td class="text-center">제출</td>
                          <td class="text-center">500,000</td>
                          <td class="text-center"></td>
                          <th class="text-center"><a href="${cPath }/lms/certificateScholarshipDetailView.do" class="badge bg-info">대기</a></th>
                      </tr>
                      <tr>
                          <td class="text-center">4</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">산업기사 장학금</td>
                          <td class="text-center">한마음</td>
                          <td class="text-center">2021.05.25</td>
                          <td class="text-center">제출</td>
                          <td class="text-center">500,000</td>
                          <td class="text-center"></td>
                          <td class="text-center"><a href="${cPath }/lms/certificateScholarshipView.do" class="badge bg-primary white-color">승인</a></td>
                      </tr>
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
                  <p>
                      자격증 증명서 파일 미첨부
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