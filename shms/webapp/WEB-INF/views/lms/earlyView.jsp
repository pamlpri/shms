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
          <li class="breadcrumb-item active" aria-current="page">조기졸업 신청</li>
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
                      <td>조기졸업</td>
                      <th class="align-middle text-center">제출서류</th>
                      <td>
                          <ul class="attat">
                              <li>성적증명서.pdf</li>
                              <li>추천서.pdf</li>
                          </ul>
                      </td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">총 이수학점</th>
                      <td>142</td>
                      <th class="align-middle text-center">총 평점평균</th>
                      <td>4.48</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">처리상태</th>
                      <td>완료</td>
                      <th class="align-middle text-center">처리일</th>
                      <td>2021.05.02</td>
                  </tr>
              </table>
              <div class="text-center">
                  <a href="${cPath }/lms/early.do" class="btn btn-primary">목록으로</a>
              </div>
          </div>
      </div>
    </div>
  <!-- contents end -->
</div>