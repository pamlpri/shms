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
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>대학생활의 이해</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="#">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">과제관리</li>
      </ol>
  </nav>

  <div class="text-left" style="margin-bottom:2%;">
    <a href="${cPath }/lecture/reportInsert.do" class="btn btn-icon icon-left btn-primary"><i class="fas fa-plus"></i> 과제출제</a>
  </div>

  <div class="card">
    <div class="card-body">
      <table class="table text-center">
        <thead>
          <tr>
            <th scope="col">No.</th>
            <th scope="col">과제명</th>
            <th scope="col">상태</th>
            <th scope="col">채점</th>
            <th scope="col">제출</th>
            <th scope="col">마감일</th>
          </tr>
        </thead>
        <tbody>
            <tr>
                <td>4</td>
                <td><a class="text-color" href="${cPath}/lecture/reportList.do">대학생활은 무엇인가? ppt 제출</a></td>
                <td>진행중</td>
                <td>5 / 15</td>
                <td>10 / 15</td>
                <td>2021.05.01 오전 1:00</td>
            </tr>
            <tr>
                <td>3</td>
                <td><a class="text-color" href="${cPath}/lecture/reportList.do">자바 프로그래밍 준비하기 ppt</a></td>
                <td>진행중</td>
                <td>5 / 15</td>
                <td>10 / 15</td>
                <td>2021.05.01 오전 1:00</td>
            </tr>
            <tr>
                <td>2</td>
                <td><a class="text-color" href="${cPath}/lecture/reportList.do">자바 프로그래밍 준비하기 ppt</a></td>
                <td>마감</td>
                <td>5 / 15</td>
                <td>10 / 15</td>
                <td>2021.05.01 오전 1:00</td>
            </tr>
            <tr>
                <td>1</td>
                <td><a class="text-color" href="${cPath}/lecture/reportList.do">자바 프로그래밍 준비하기 ppt</a></td>
                <td>마감</td>
                <td>5 / 15</td>
                <td>10 / 15</td>
                <td>2021.05.01 오전 1:00</td>
            </tr>
        </tbody>
      </table>
  </div>
  <!-- contents end -->
  </div>
</div>