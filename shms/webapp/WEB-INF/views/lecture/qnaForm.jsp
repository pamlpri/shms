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
          <li class="breadcrumb-item active" aria-current="page">강좌 Q&A</li>
      </ol>
  </nav>

  <section class="section">
      <h2 class="section-title">강의 Q&A 등록</h2>
  </section>

  <div class="card attendance">
    <div class="card-body">
      <form class="table-responsive">
        <table class="table table-bordered table-md report">
          <tr>
            <th class="align-middle">제목</th>
            <td class="text-left"><input type="text" class="form-control"></td>
          </tr>
          <tr>
            <th class="align-middle">세부설정</th>
            <td class="text-left">
              <span class="label-box">비밀글</span>
              <label for="isprivate" style="padding-left: 5px;">
                <input type="checkbox" value="Y" id="isprivate" style="vertical-align: -1px;" />
                <span>작성자와 교수만 확인 가능하게 설정 합니다.</span>
              </label>
            </td>
          </tr>
          <tr>
            <th class="align-middle">비밀번호</th>
            <td class="text-left"><input type="password" class="form-control"></td>
          </tr>
          <tr>
            <th class="align-middle">내용</th>
            <td class="textArea">
              <textarea class="form-control" rows="5" cols="1000" id="bo_ans"></textarea>
            </td>
          </tr>
			<!-- 교수만 보이게 -->
          <tr>
            <th class="align-middle">답변</th>
            <td class="textArea">
              <textarea class="form-control" rows="5" cols="800" id="bo_cont"></textarea>
            </td>
          </tr>
        </table>
        <div class="text-center">
            <a href="${cPath }/lecture/qna.do" class="btn btn-secondary">취소</a>
            <button type="button" class="btn btn-primary">저장</button>
        </div>
      </form>
    </div>
  </div>

  <!-- contents end -->
</div>
<script src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>
<script>
  $(function(){
    CKEDITOR.replace("bo_cont", {
          filebrowserImageUploadUrl : ''
    });
    
    CKEDITOR.replace("bo_ans", {
        filebrowserImageUploadUrl : ''
 	 });
  });
</script>