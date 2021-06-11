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
          <li class="breadcrumb-item"><a href="#">강의개요</a></li>
          <li class="breadcrumb-item active" aria-current="page">강의 Q&A</li>
      </ol>
  </nav>

  <section class="section">
      <div class="card">
        <div class="card-header">
          <h4 class="nontice-title">강의에 대해 문의합니다!<span class="notice-date">2020.05.20</span></h4>
        </div>
        <div class="card-body">
          <p>
            서블릿 컨테이너가 하는일이 무엇인가요??
          </p>
          <div class="noticeAns">
              <p class="userAns">하재관<span>2020.05.03</span></p>
              <p class="contAns">
                서블릿 컨테이너란???
              </p>
          </div>
        </div>
        <div class="card-footer bg-whitesmoke">
          <div id="noticeBtnBox" class="text-right">
            <a id="listBtn" class="btn btn-icon icon-left btn-primary" href="${cPath }/lecture/qna.do">목록으로</a>
            <!--학생한테만 보이는 버튼-->
            <a id="updateBtn" class="btn btn-icon icon-left btn-primary" href="${cPath }/lecture/qnaForm.do">수정</a>
            <button id="deleteBtn" class="btn btn-danger" data-confirm="게시글 삭제|삭제한 게시글은 복원이 불가합니다.<br/>삭제하시겠습니까?">삭제</button>
          </div>
        </div>
      </div>
  </section>
  
  <div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Modal body text goes here.</p>
        </div>
        <div class="modal-footer bg-whitesmoke br">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
  <!-- contents end -->
