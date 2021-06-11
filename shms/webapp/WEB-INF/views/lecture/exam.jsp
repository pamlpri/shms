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
          <li class="breadcrumb-item"><a href="#">강의실홈</a></li>
          <li class="breadcrumb-item active" aria-current="page">시험응시</li>
      </ol>
  </nav>

  <div class="card">
      <div class="card-body">
        <table class="table table-hover text-center">
          <thead>
            <tr>
              <th scope="col">No.</th>
              <th scope="col">시험명</th>
              <th scope="col">상태</th>
              <th scope="col">시험시작</th>
              <th scope="col">시험종료</th>
              <th scope="col">응시</th>
            </tr>
          </thead>
          <tbody>
              <tr>
                  <td>2</td>
                  <td>2학기 기말고사</td>
                  <td>진행중</td>
                  <td>2021.05.01 오전 12:00</td>
                  <td>2021.05.01 오후 1:00</td>
                  <td>
                      <a href="${cPath }/lecture/examInfo.do" class="btn btn-outline-primary">
                      응&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시
                      </a>
                  </td>
              </tr>
              <tr>
                  <td>1</td>
                  <td>2학기 중간고사</td>
                  <td>마감</td>
                  <td>2021.05.01 오전 12:00</td>
                  <td>2021.05.01 오후 1:00</td>
                  <td><a href="examInfo.html" class="btn btn-primary disabled">응시완료</a></td>
              </tr>
          </tbody>
        </table>
    </div>
  <!-- contents end -->
  </div>
</div>