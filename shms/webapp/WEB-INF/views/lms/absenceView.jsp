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
          <li class="breadcrumb-item active" aria-current="page">휴학신청</li>
      </ol>
  </nav>
  
  <div class="card inputTable">
      <div class="card-body">
          <div class="table-responsive">
              <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                  <tr>
                      <th rowspan="2" class="align-middle text-center">신청대상</th>
                      <th class="align-middle text-center">학번</th>
                      <td>S1401001</td>
                      <th class="align-middle text-center">이름</th>
                      <td>강미나</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">전화번호</th>
                      <td>010-2344-1234</td>
                      <th class="align-middle text-center">웹메일</th>
                      <td>asdgasdg@shms.ac</td>
                  </tr>
                  <tr>
                      <th rowspan="4" class="align-middle text-center">신청상세</th>
                      <th class="align-middle text-center">신청번호</th>
                      <td>12345</td>
                      <th class="align-middle text-center">신청일자</th>
                      <td>2020.05.01</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">신청종류</th>
                      <td>일반휴학</td>
                      <th class="align-middle text-center">제출서류</th>
                      <td class="align-middle">
                          <ul class="attat">
                              <li><a href="#" class="text-color">성적증명서_첨삭완료.pdf</a></li>
                              <li><a href="#" class="text-color">추천서_첨삭완료.pdf</a></li>
                          </ul>
                      </td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">휴학일</th>
                      <td>2022.03.02</td>
                      <th class="align-middle text-center">복학예정일</th>
                      <td>2022.03.02</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">처리상태</th>
                      <td>완료</td>
                      <th class="align-middle text-center">처리일</th>
                      <td>2021.05.02</td>
                  </tr>
              </table>
              <div class="text-center">
                  <a href="${cPath }/lms/absence.do" class="btn btn-primary">목록으로</a>
                  <!-- 학적과 변동 처리 -> 완료전 승인상태일때만 노출-->
                  <button class="btn btn-danger" type="button" id="completeBtn">학적변동</button>
              </div>
          </div>
      </div>
    </div>
  <!-- contents end -->
</div>