<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 21.      송수미        비밀번호 확인
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
      <h1>대학생활의 이해</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/notice.do">강의개요</a></li>
          <li class="breadcrumb-item active" aria-current="page">강의 Q&A</li>
      </ol>

  </nav>

  <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="card card-primary">
              <div class="card-header"><h4>password</h4></div>
              <div class="card-body">
                <div class="text-center red-color">
                	${message }
                </div>
                <form method="POST" class="needs-validation" id="submitForm">
                  <div class="form-group">
                  	<input type="hidden" name="bo_no" value="${bo_no }"/>
                    <input id="password" type="password" class="form-control im" name="bo_password" tabindex="2"/>
                  </div>
                  <div class="form-group">
                    <button id="saveBtn" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      	확인
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  <!-- contents end -->
</div>
