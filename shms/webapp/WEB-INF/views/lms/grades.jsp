<%--
* [[개정이력(Modification Information)]]
* 수정일            수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lms/grades.do">성적관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">성적조회</li>
      </ol>
  </nav>


  <section class="section">
      <h4 class="h4Title"><i class="fas fa-minus"></i> 학적정보</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
                  <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                      <tr>
                          <th class="align-middle text-center">학번</th>
                          <td class="align-middle">S1002001</td>
                          <th class="align-middle text-center">이름</th>
                          <td class="align-middle">김민지</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">주민번호</th>
                          <td class="align-middle">205223 - 2******</td>
                          <th class="align-middle text-center">학적상태</th>
                          <td class="align-middle">재학</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">학과</th>
                          <td class="align-middle">치기공과</td>
                          <th class="align-middle text-center">학년 / 년제</th>
                          <td class="align-middle">3학년 / 4년제</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">입학일</th>
                          <td class="align-middle">2021.03.03</td>
                          <th class="align-middle text-center">졸업일</th>
                          <td class="align-middle"></td>
                      </tr>
                  </table>
              </div>
          </div>
      </div>
      
      <h4 class="h4Title"><i class="fas fa-minus"></i> 성적누계</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
                  <div class="table-responsive">
                      <table class="table table-bordered mb-0" style="border-color: #dfdfdf;">
                          <thead>
                              <tr>
                                  <th class="text-center">학년도 / 학기</th>
                                  <th class="text-center">신청학점</th>
                                  <th class="text-center">취득학점</th>
                                  <th class="text-center">평점계</th> 
                                  <th class="text-center">평점평균</th>
                                  <th class="text-center">백분율</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td class="text-center">2012학년도 / 1학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2012학년도 / 2학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2013학년도 / 1학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2013학년도 / 2학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2014학년도 / 1학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <td class="text-center">2014학년도 / 2학기</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">21</td>
                                  <td class="text-center">80</td>
                                  <td class="text-center">3.05</td>
                                  <td class="text-center">80.15</td>
                              </tr>
                              <tr>
                                  <th class="text-center">누계</th>
                                  <th class="text-center">126</th>
                                  <th class="text-center">126</th>
                                  <th class="text-center">420</th>
                                  <th class="text-center">3.05</th>
                                  <th class="text-center">80.15</th>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      
      <h4 class="h4Title"><i class="fas fa-minus"></i> 성적조회</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="row">
                  <div class="col-lg-12 row">
                      <div class="col-md-3 mb-4">
                          <h6>학년도</h6>
                          <fieldset class="form-group">
                              <select class="form-select">
                                  <option>12학년도</option>
                                  <option>13학년도</option>
                                  <option>14학년도</option>
                              </select>
                          </fieldset>
                      </div>
                      <div class="col-md-3 mb-4">
                          <h6>학기</h6>
                          <fieldset class="form-group">
                              <select class="form-select">
                                  <option>1학기</option>
                                  <option>2학기</option>
                              </select>
                          </fieldset>
                      </div>
                  </div>
              </div>

              <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                  <tr>
                      <th class="align-middle text-center">학년도 / 학기</th>
                      <td class="align-middle text-center">12학년도 / 2학기</td>
                      <th class="align-middle text-center">신청학점 / 취득학점</th>
                      <td class="align-middle text-center">21 / 21</td>
                      <th class="align-middle text-center">평점 / 평균</th>
                      <td class="align-middle text-center">92 / A+</td>
                  </tr>
              </table>

              <div class="table-responsive">
                  <div class="table-responsive">
                      <table class="table table-bordered mb-0" style="border-color: #dfdfdf;">
                          <thead>
                              <tr>
                                  <th class="text-center">강의코드</th>
                                  <th class="text-center">강의명</th>
                                  <th class="text-center">담당교수</th>
                                  <th class="text-center">이수구분</th> 
                                  <th class="text-center">학점</th>
                                  <th class="text-center">점수</th>
                                  <th class="text-center">등급</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td class="text-center">12345</td>
                                  <td class="text-center">자바 프로그래밍 기초</td>
                                  <td class="text-center">이성엽</td>
                                  <td class="text-center">전필</td>
                                  <td class="text-center">3</td>
                                  <td class="text-center">92</td>
                                  <td class="text-center">A</td>
                              </tr>
                              <tr>
                                  <td class="text-center">12345</td>
                                  <td class="text-center">자바 프로그래밍 기초</td>
                                  <td class="text-center">이성엽</td>
                                  <td class="text-center">전필</td>
                                  <td class="text-center">3</td>
                                  <td class="text-center">92</td>
                                  <td class="text-center">A</td>
                              </tr>
                              <tr>
                                  <td class="text-center">12345</td>
                                  <td class="text-center">자바 프로그래밍 기초</td>
                                  <td class="text-center">이성엽</td>
                                  <td class="text-center">전필</td>
                                  <td class="text-center">3</td>
                                  <td class="text-center">92</td>
                                  <td class="text-center">A</td>
                              </tr>
                              <tr>
                                  <td class="text-center">12345</td>
                                  <td class="text-center">자바 프로그래밍 기초</td>
                                  <td class="text-center">이성엽</td>
                                  <td class="text-center">전필</td>
                                  <td class="text-center">3</td>
                                  <td class="text-center">92</td>
                                  <td class="text-center">A</td>
                              </tr>
                              <tr>
                                  <td class="text-center">12345</td>
                                  <td class="text-center">자바 프로그래밍 기초</td>
                                  <td class="text-center">이성엽</td>
                                  <td class="text-center">전필</td>
                                  <td class="text-center">3</td>
                                  <td class="text-center">92</td>
                                  <td class="text-center">A</td>
                              </tr>
                              <tr>
                                  <td class="text-center">12345</td>
                                  <td class="text-center">자바 프로그래밍 기초</td>
                                  <td class="text-center">이성엽</td>
                                  <td class="text-center">전필</td>
                                  <td class="text-center">3</td>
                                  <td class="text-center">92</td>
                                  <td class="text-center">A</td>
                              </tr>
                              <tr>
                                  <td class="text-center">12345</td>
                                  <td class="text-center">자바 프로그래밍 기초</td>
                                  <td class="text-center">이성엽</td>
                                  <td class="text-center">전필</td>
                                  <td class="text-center">3</td>
                                  <td class="text-center">92</td>
                                  <td class="text-center">A</td>
                              </tr>
                              <tr>
                                  <td class="text-center">12345</td>
                                  <td class="text-center">자바 프로그래밍 기초</td>
                                  <td class="text-center">이성엽</td>
                                  <td class="text-center">전필</td>
                                  <td class="text-center">3</td>
                                  <td class="text-center">92</td>
                                  <td class="text-center">A</td>
                              </tr>
                              <tr>
                                  <td class="text-center">12345</td>
                                  <td class="text-center">자바 프로그래밍 기초</td>
                                  <td class="text-center">이성엽</td>
                                  <td class="text-center">전필</td>
                                  <td class="text-center">3</td>
                                  <td class="text-center">92</td>
                                  <td class="text-center">A</td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>