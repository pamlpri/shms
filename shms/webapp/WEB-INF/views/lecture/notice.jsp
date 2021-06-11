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
<!-- CSS Libraries -->
<link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/datatables/datatables.min.css">
<link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/datatables/Select-1.2.4/css/select.bootstrap4.min.css">
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
          <li class="breadcrumb-item active" aria-current="page">공지사항</li>
      </ol>
  </nav>

  <section class="section">
      <div class="section-body">
          <h2 class="section-title">공지사항</h2>
          <div class="row">
              <div class="col-12">
                  <div class="card">
                  <div class="card-body">
                      <div class="table-responsive">
                      <table class="table table-striped" id="notice-table">
                          <thead>                                 
                          <tr>
                              <th class="text-center">No.</th>
                              <th class="text-center">제목</th>
                              <th class="text-center">작성일</th>
                              <th class="text-center">작성자</th>
                              <th class="text-center">조회수</th>
                          </tr>
                          </thead>
                          <tbody>                                 
                          <tr>
                              <td class="text-center">20</td>
                              <td class="text-center">
                                <a class="text-color" href="qnaLecturePass.html">공지 입니다 20</a>
                              </td>
                              <td class="text-center">2020.05.03</td>
                              <td class="text-center">하재관</td>
                              <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">19</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 19</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">18</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 18</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">17</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 17</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">16</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 16</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">15</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 15</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">14</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 14</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">13</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 13</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">12</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 12</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">11</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 11</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">10</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 10</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">9</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 9</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">8</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 8</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">7</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 7</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">6</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 6</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">5</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 5</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">4</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 4</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">최희연</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">3</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 3</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">2</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 2</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          <tr>
                            <td class="text-center">1</td>
                            <td class="text-center">
                              <a class="text-color" href="noticeLectureView.html">강의공지 입니다 1</a>
                            </td>
                            <td class="text-center">2020.05.03</td>
                            <td class="text-center">하재관</td>
                            <td class="text-center">100</td>
                          </tr>
                          </tbody>
                      </table>
                      <!-- 교수한테만 보여야 하는 버튼 -->
                      <div class="text-right" style="margin-top: 3%;">
                        <a href="noticeLectureForm.html" class="btn btn-icon icon-left btn-primary">
                          <i class="far fa-edit"></i> 글쓰기
                        </a>
                      </div>
                      </div>
                  </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>
<!-- Page Specific JS File -->
<script src="${cPath }/resources/lecture/dist/js/page/modules-datatables.js"></script>
<!-- JS Libraies -->
<script src="${cPath }/resources/lecture/dist/modules/datatables/datatables.min.js"></script>
<script src="${cPath }/resources/lecture/dist/modules/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="${cPath }/resources/lecture/dist/modules/datatables/Select-1.2.4/js/dataTables.select.min.js"></script>
<script src="${cPath }/resources/lecture/dist/modules/jquery-ui/jquery-ui.min.js"></script>