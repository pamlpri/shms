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
                      <td>${cng.stdnt_no }</td>
                      <th class="align-middle text-center">이름</th>
                      <td>${cng.stdnt_name }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">전화번호</th>
                      <td>${cng.tel_no }</td>
                      <th class="align-middle text-center">웹메일</th>
                      <td>${cng.webmail }</td>
                  </tr>
                  <tr>
                      <th rowspan="4" class="align-middle text-center">신청상세</th>
                      <th class="align-middle text-center">신청번호</th>
                      <td>${cng.cng_req_no }</td>
                      <th class="align-middle text-center">신청일자</th>
                      <td>${cng.req_de }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">신청종류</th>
                      <td>${cng.req_cl_code }</td>
                      <th class="align-middle text-center">제출서류</th>
                      <td>${cng.file_nm }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">신청사유</th>
                      <td>${cng.req_resn_code }</td>
                      <th class="align-middle text-center">자퇴일</th>
                      <td>${cng.cng_bgnde }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">처리상태</th>
                      <td>${cng.process_stat }</td>
                      <th class="align-middle text-center">처리일</th>
                      <td>${cng.proc_date }</td>
                  </tr>
                  <tr>
              </table>
              <div class="text-center">
                  <a href="${cPath }/lms/drop.do" class="btn btn-primary">목록으로</a>
              </div>
          </div>
      </div>
    </div>
  <!-- contents end -->
</div>