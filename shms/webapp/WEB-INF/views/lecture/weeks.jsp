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
          <li class="breadcrumb-item active" aria-current="page">주/회차 관리</li>
      </ol>
  </nav>

  <div class="text-left" style="margin-bottom:2%;">
      <a href="${cPath }/lecture/weeksForm.do" class="btn btn-icon icon-left btn-primary"><i class="fas fa-plus"></i> 주/회차 등록</a>
  </div>

  <div class="card lectureList">
      <div class="card-header">
          <h4>4주차 대학생활의 개념</h4>
          <a href="weeksForm.html" class="edit"><i class="fas fa-pen">&#xE254;</i></a>
      </div>
      <div class="card-body">
          <p><strong>학습기간 : </strong>2021년 05월 03일 오전 8:00 ~ 2021.05.10 오후 1:00</p>
          <p><strong>학습내역 : </strong>대학생활의 개념을 확립하자</p>
      </div>
      <div class="card-body">
          <a href="lectureVideo.html" onclick="window.open(this.href, '_blanck', 'width=600, height=400'); return false" class="btn btn-icon icon-left btn-primary">
              <i class="fas fa-video"></i> 강의영상
          </a>
      </div>
  </div>

  <div class="card lectureList">
      <div class="card-header">
          <h4>3주차 대학생활의 개념</h4>
          <a href="weeksForm.html" class="edit"><i class="fas fa-pen">&#xE254;</i></a>
      </div>
      <div class="card-body">
          <p><strong>학습기간 : </strong>2021년 05월 03일 오전 8:00 ~ 2021.05.10 오후 1:00</p>
          <p><strong>학습내역 : </strong>대학생활의 개념을 확립하자</p>
      </div>
      <div class="card-body">
          <a class="btn btn-icon icon-left disabled btn-secondary"><i class="far fa-user"></i> 대면강의</a>
      </div>
  </div>

  <div class="card lectureList">
      <div class="card-header">
          <h4>2주차 대학생활의 개념</h4>
          <a href="weeksForm.html" class="edit"><i class="fas fa-pen">&#xE254;</i></a>
      </div>
      <div class="card-body">
          <p><strong>학습기간 : </strong>2021년 05월 03일 오전 8:00 ~ 2021.05.10 오후 1:00</p>
          <p><strong>학습내역 : </strong>대학생활의 개념을 확립하자</p>
      </div>
      <div class="card-body">
          <a href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-user"></i> 실시간 강의</a>
      </div>
  </div>

  <div class="card lectureList">
      <div class="card-header">
          <h4>1주차 대학생활의 개념</h4>
          <a href="weeksForm.html" class="edit"><i class="fas fa-pen">&#xE254;</i></a>
      </div>
      <div class="card-body">
          <p><strong>학습기간 : </strong>2021년 05월 03일 오전 8:00 ~ 2021.05.10 오후 1:00</p>
          <p><strong>학습내역 : </strong>대학생활의 개념을 확립하자</p>
      </div>
      
      <div class="card-body">
          <a href="lectureVideo.html" onclick="window.open(this.href, '_blanck', 'width=600, height=400'); return false" class="btn btn-icon icon-left btn-primary video">
              <i class="fas fa-video"></i> 강의영상
          </a>
      </div>
  </div>
  <!-- contents end -->
</div>