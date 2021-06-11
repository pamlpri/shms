<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
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
          <li class="breadcrumb-item"><a href="#">변동사항</a></li>
          <li class="breadcrumb-item active" aria-current="page">복학신청</li>
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
                          <th class="text-center">휴학일</th>
                          <th class="text-center">복학일</th>
                          <th class="text-center">서류제출</th>
                          <th class="text-center">처리상태</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-success white-color">완료</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
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
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <th class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-primary white-color">승인</a></th>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath}/lms/returningForm.do" class="badge bg-info white-color">대기</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-success white-color">완료</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
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
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <th class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-primary white-color">승인</a></th>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath}/lms/returningForm.do" class="badge bg-info white-color">대기</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-success white-color">완료</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
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
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <th class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-primary white-color">승인</a></th>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath}/lms/returningForm.do" class="badge bg-info white-color">대기</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-success white-color">완료</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
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
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <th class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-primary white-color">승인</a></th>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath}/lms/returningForm.do" class="badge bg-info white-color">대기</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-success white-color">완료</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
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
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <th class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-primary white-color">승인</a></th>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath}/lms/returningForm.do" class="badge bg-info white-color">대기</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-success white-color">완료</a></td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
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
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <th class="text-center"><a href="${cPath }/lms/returningView.do" class="badge bg-primary white-color">승인</a></th>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">2345</td>
                          <td class="text-center">복학</td>
                          <td class="text-center">2023.01.25</td>
                          <td class="text-center">2022.03.02</td>
                          <td class="text-center">2023.03.02</td>
                          <td class="text-center">제출완료</td>
                          <td class="text-center"><a href="${cPath}/lms/returningForm.do" class="badge bg-info white-color">대기</a></td>
                      </tr>
                  </tbody>
              </table>
              <div class="breadcrumb breadcrumb-right">
                  <a href="${cPath}/lms/returningForm.do" class="btn btn-primary" style="margin-top: -1%;">
                      복학신청
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
                      서류 미제출로 인한 반려
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
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>