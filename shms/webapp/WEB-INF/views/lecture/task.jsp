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
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">과제제출</li>
      </ol>
  </nav>

  <div class="card">
      <div class="card-body">
        <table class="table text-center">
          <thead>
            <tr>
              <th scope="col">No.</th>
              <th scope="col">과제명</th>
              <th scope="col">상태</th>
              <th scope="col">점수</th>
              <th scope="col">배점</th>
              <th scope="col">마감일</th>
              <th scope="col">제출</th>
            </tr>
          </thead>
          <tbody>
              <tr>
                  <td>4</td>
                  <td>대학생활은 무엇인가? ppt 제출</td>
                  <td>진행중</td>
                  <td></td>
                  <td>50</td>
                  <td>2021.05.01 오전 1:00</td>
                  <td><a href="${cPath}/lecture/taskForm.do" class="btn btn-outline-primary">
                      제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출
                  </a></td>
              </tr>
              <tr>
                  <td>3</td>
                  <td>자바 프로그래밍 준비하기 ppt</td>
                  <td>진행중</td>
                  <td></td>
                  <td>15</td>
                  <td>2021.05.01 오전 1:00</td>
                  <td><a href="${cPath}/lecture/taskForm.do" class="btn btn-primary">제출완료</a></td>
              </tr>
              <tr>
                  <td>2</td>
                  <td>자바 프로그래밍 준비하기 ppt</td>
                  <td>마감</td>
                  <td>15</td>
                  <td>15</td>
                  <td>2021.05.01 오전 1:00</td>
                  <td><a href="${cPath}/lecture/taskForm.do" class="btn btn-primary disabled">제출완료</a></td>
              </tr>
              <tr>
                  <td>1</td>
                  <td>자바 프로그래밍 준비하기 ppt</td>
                  <td>마감</td>
                  <td>15</td>
                  <td>15</td>
                  <td>2021.05.01 오전 1:00</td>
                  <td><a href="${cPath}/lecture/taskForm.do" class="btn btn-primary disabled">제출완료</a></td>
              </tr>
          </tbody>
        </table>
    </div>
  <!-- contents end -->
</div>