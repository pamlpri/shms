<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 08.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">학적관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">학적조회</li>
      </ol>
  </nav>

  <!-- contents start -->
  <section class="section">
      <div class="card">
          <div class="card-body">
              <table class="table table-striped" id="table1">
                  <thead>
                      <tr>
                          <th class="text-center">No.</th>
                          <th class="text-center">학과</th>
                          <th class="text-center">학번</th>
                          <th class="text-center">이름</th>
                          <th class="text-center">생년월일</th>
                          <th class="text-center">성별</th>
                          <th class="text-center">학년 / 학기</th>
                          <th class="text-center">학적상태</th>
                          <th class="text-center">입학유형</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">김유리</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">재학</td>
                          <td class="text-center">신입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">이민지</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">휴학</td>
                          <td class="text-center">편입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">김유리</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">재학</td>
                          <td class="text-center">신입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">이민지</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">휴학</td>
                          <td class="text-center">편입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">김유리</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">재학</td>
                          <td class="text-center">신입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">이민지</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">휴학</td>
                          <td class="text-center">편입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">김유리</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">재학</td>
                          <td class="text-center">신입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">이민지</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">휴학</td>
                          <td class="text-center">편입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">김유리</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">재학</td>
                          <td class="text-center">신입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">이민지</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">휴학</td>
                          <td class="text-center">편입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">김유리</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">재학</td>
                          <td class="text-center">신입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">이민지</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">휴학</td>
                          <td class="text-center">편입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">김유리</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">재학</td>
                          <td class="text-center">신입학</td>
                      </tr>
                      <tr>
                          <td class="text-center">2</td>
                          <td class="text-center">사회복지학과</td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">S1052345</a>
                          </td>
                          <td class="text-center">
                              <a href="${cPath}/lms/academicView.do" class="text-color">이민지</a>
                          </td>
                          <td class="text-center">950503</td>
                          <td class="text-center">여자</td>
                          <td class="text-center">2학년 1학기</td>
                          <td class="text-center">휴학</td>
                          <td class="text-center">편입학</td>
                      </tr>
                  </tbody>
              </table>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>