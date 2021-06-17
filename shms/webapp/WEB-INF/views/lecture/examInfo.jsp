<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 17.      송수미        시험 안내 페이지 구현
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>${lec_name }</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">시험응시</li>
      </ol>
  </nav>

  <section class="section">
      <h2 class="section-title">시험</h2>
  </section>
  <div class="card attendance">
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered table-md">
            <tr>
              <th>제목</th>
              <td class="text-left">${exam.test_nm }</td>
            </tr>
            <tr>
              <th>시험형태</th>
              <td class="text-left">${exam.online_at eq 'Y'? '온라인 시험': '오프라인 시험'}</td>
            </tr>
            <tr>
              <th>시작시간</th>
              <td class="text-left">${exam.exam_begin_dt_char }</td>
            </tr>
            <tr>
              <th>종료시간</th>
              <td class="text-left">${exam.exam_end_dt_char }</td>
            </tr>
            <tr>
              <th>시험시간</th>
              <td class="text-left">${exam.exam_time }분</td>
            </tr>
          </table>
        </div>
        <section class="section">
          <h2 class="section-title">시험시 유의사항</h2>
      </section>
        <p>
            <strong>1. 온라인 시험을 치르기 전에 반드시 컴퓨터와 인터넷 상태를 점검합니다.</strong><br/>
            <strong>2. 시험시간</strong><br/> 
            &nbsp;&nbsp;- 온라인 시험은 지정된 응시기간(시작시간, 종료시간)사이에만 응시할 수 있습니다. <br/>
            &nbsp;&nbsp;- 남은 시험시간이 종료시간을 초과할 경우 종료시간까지만 시험을 볼 수 있습니다.<br/>
            &nbsp;&nbsp;- 시험을 시작하면 시험시간이 흘러가기 시작하고, 다 소진되면 자동 제출됩니다. 제출된 후엔 재응시 할 수 없습니다.<br/>
            <strong>3. 부정행위방지</strong><br/>
            &nbsp;&nbsp;- 시험은 반드시 하나의 창으로만 응시해야 하며, 여러 창에서 시험을 풀 경우 답안이 정상적으로 등록되지 않습니다.<br/>
            &nbsp;&nbsp;- 1개의 기기에서 동시에 여러명이 시험을 볼 수 없습니다.<br/>
            &nbsp;&nbsp;- 시험을 시작하면 중간에 화면을 빠져나오거나 창을 닫더라도 시험시간은 흘러가며 다 소진되면 자동 제출처리 됩니다.<br/>
            <strong>4. 시험시작시간이 되면 하단에 [시험시작] 버튼이 나타납니다.</strong><br/>
            &nbsp;&nbsp;- 시간이 되어도 버튼이 나타나지 않을 경우 페이지를 새로고침해보시기 바랍니다.
        </p>
        <div class="text-center">
            <a href="${cPath }/lecture/examForm.do?exam_no=${exam.exam_no}" class="btn btn-primary">시험시작</a>
        </div>
      </div>
    </div>

  <!-- contents end -->
</div>