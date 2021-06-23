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
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">강의실홈</a></li>
          <li class="breadcrumb-item active" aria-current="page">성적관리</li>
      </ol>
  </nav>

  <div class="card">
      <div class="card-body">
        <table class="table table-hover text-center">
          <thead>
            <tr>
              <th scope="col">성적항목</th>
              <th scope="col">성적</th>
              <th scope="col">범위</th>
              <th scope="col">100점 환산율</th>
              <th scope="col">문자등급</th>
              <th scope="col">석차</th>
              <th scope="col">평균</th>
            </tr>
          </thead>
          <tbody>
          	<c:if test="${not empty mid }">
	            <tr>
	              <th scope="row">${mid.scre_type}</th>
	              <td>${mid.mid_scre }</td>
	              <td>0-100</td>
	              <td>${mid.mid_scre }%</td>
	              <td>${mid.pnt_rank_nm }</td>
	              <td>${mid.rank} / ${mid.stdnt_cnt }</td>
	              <td>${mid.stdnt_svg }</td>
	            </tr>
          	</c:if>
          	<c:if test="${not empty finals }">
          		<tr>
	              <th scope="row">${finals.scre_type}</th>
	              <td>${finals.final_scre }</td>
	              <td>0-100</td>
	              <td>${finals.final_scre }%</td>
	              <td>${finals.pnt_rank_nm }</td>
	              <td>${finals.rank} / ${finals.stdnt_cnt }</td>
	              <td>${finals.stdnt_svg }</td>
	            </tr>
          	</c:if>
          	<c:if test="${not empty task }">
          		<tr>
	              <th scope="row">${task.scre_type}</th>
	              <td>${task.task_scre }</td>
	              <td>0-100</td>
	              <td>${task.task_scre }%</td>
	              <td>${task.pnt_rank_nm }</td>
	              <td>${task.rank} / ${task.stdnt_cnt }</td>
	              <td>${task.stdnt_svg }</td>
	            </tr>
          	</c:if>
          	<c:if test="${not empty attend }">
          		<tr>
	              <th scope="row">${attend.scre_type}</th>
	              <td>${attend.attend_scre }</td>
	              <td>0-100</td>
	              <td>${attend.attend_scre }%</td>
	              <td>${attend.pnt_rank_nm }</td>
	              <td>${attend.rank} / ${attend.stdnt_cnt }</td>
	              <td>${attend.stdnt_svg }</td>
	            </tr>
          	</c:if>
          </tbody>
        </table>
    </div>
  <!-- contents end -->
  </div>
</div>