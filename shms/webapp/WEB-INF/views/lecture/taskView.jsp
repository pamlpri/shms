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
          <li class="breadcrumb-item active" aria-current="page">과제관리</li>
      </ol>
  </nav>

  <div class="card attendance">
      <div class="card-body">
        <form class="table-responsive">
          <table class="table table-bordered table-md">
            <tr>
              <th>이름</th>
              <td class="text-left">송수미</td>
            </tr>
            <tr>
              <th>학번</th>
              <td class="text-left">S1605001</td>
            </tr>
            <tr>
              <th>학과</th>
              <td class="text-left">행정학과</td>
            </tr>
            <tr>
              <th class="align-middle">내용</th>
              <td class="text-left">과제 제출합니다!<br/>감사합니다.</td>
            </tr>
            <tr>
              <th class="align-middle">첨부파일</th>
              <td class="text-left">
                  <div class="board_downloader" style="border :none;">
                      <ul class="downloader">
                        <li>
                          <a href="#" class="text-color"><i class="fas fa-arrow-alt-circle-down"></i>1._현대카드대학등록금_학생용_납부_메뉴얼.pdf</a>
                        </li>
                        <li>
                          <a href="#" class="text-color"><i class="fas fa-arrow-alt-circle-down"></i>2._현대카드_2021년_1학기_혜택_공지문(대학).png</a>
                        </li>
                      </ul>
                  </div>
              </td>
            </tr>
            <tr>
                <th class="align-middle">성적</th>
                <td>
                  <input type="number" class="form-control" style="width:20%;"/>
                </td>
            </tr>
          </table>
          <div class="text-center">
              <a href="${cPath }/lecture/reportList.do" class="btn btn-secondary">취소</a>
              <button type="button" class="btn btn-primary">저장</button>
          </div>
        </form>
      </div>
    </div>
  <!-- contents end -->
</div>