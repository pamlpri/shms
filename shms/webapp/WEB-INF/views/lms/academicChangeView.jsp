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
          <li class="breadcrumb-item"><a href="#">변동사항</a></li>
          <li class="breadcrumb-item active" aria-current="page">자퇴신청</li>
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
                      <td>자퇴</td>
                      <th class="align-middle text-center">제출서류</th>
                      <td>지도교수확인서.pdf</td>
                  </tr>
                  <tr>
                  	 <!-- 각 변동 사항에 따라 변해야하는 항목 ex) 휴학은 휴학일과 복학 예정일 -->
                      <th class="align-middle text-center">신청사유</th>
                      <td>건강문제</td>
                      <th class="align-middle text-center">자퇴일</th>
                      <td>2022.03.02</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">처리상태</th>
                      <td>완료</td>
                      <th class="align-middle text-center">처리일</th>
                      <td>2021.05.02</td>
                  </tr>
                  <!-- 대기상태일때만 노출 -->
                  <tr>
                        <th class="align-middle text-center">반려사유</th>
                        <td colspan="4">
                            <textarea class="form-control" rows="3" id="returnResult"></textarea>
                            <span id="returnWarning"></span>
                        </td>
                    </tr>
                </table>
                <!-- 대기상태일때만 노출 -->
               <div class="text-center">
                   <button type="button" class="btn btn-light-secondary" id="returnBtn">반려</button>
                   <button type="button" class="btn btn-primary">승인</button>
               </div>
              <div class="text-center">
                  <a href="${cPath }/lms/academicChange.do" class="btn btn-primary">목록으로</a>
                  <!-- 학적과 변동 처리 -> 완료전 승인상태일때만 노출-->
                  <button class="btn btn-danger" type="button" id="completeBtn">학적변동</button>
              </div>
          </div>
      </div>
    </div>
  <!-- contents end -->
</div>