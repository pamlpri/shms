<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 08.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">학적관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">학적조회</li>
      </ol>
  </nav>

  <!-- contents start -->
  <section class="section">
      <div class="card">
          <div class="card-body">
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item" role="presentation">
                      <a class="nav-link active" id="profile-tab" data-bs-toggle="tab" href="#profile"
                          role="tab" aria-controls="profile" aria-selected="false">학적정보</a>
                  </li>
                  <li class="nav-item" role="presentation">
                      <a class="nav-link" id="trans-tab" data-bs-toggle="tab" href="#trans"
                          role="tab" aria-controls="trans" aria-selected="true">학적변동</a>
                  </li>
                  <li class="nav-item" role="presentation">
                      <a class="nav-link" id="grades-tab" data-bs-toggle="tab" href="#grades"
                          role="tab" aria-controls="grades" aria-selected="true">성적조회</a>
                  </li>
              </ul>
              <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active studentDetail" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                      <div class="row">
                          <div class="col-lg-3 profileImg">
                              <img src="${cPath }/resources/lms/assets/images/faces/1.jpg" />
                          </div>
                          <div class="col-12 col-lg-9">
                              <div class="card-content">
                                  <!-- table striped -->
                                  <div class="table-responsive">
                                      <table class="table .thead-light mb-0" style="border-top:2px solid #95a3d6;">
                                          <tbody">
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">학번</th>
                                                      <td class="col-lg-4">S1401001</td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">이름</th>
                                                      <td class="col-lg-4">강미나</td>
                                                  </div>
                                              </tr>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">주민번호</th>
                                                      <td class="col-lg-4">010312 - 1234561</td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">성별</th>
                                                      <td class="col-lg-4">남자</td>
                                                  </div>
                                              </tr>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">전공</th>
                                                      <td class="col-lg-4">항공학과</td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">년제</th>
                                                      <td class="col-lg-4">4년제</td>
                                                  </div>
                                              </tr>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">입학구분</th>
                                                      <td class="col-lg-4">신입학</td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">입학일자</th>
                                                      <td class="col-lg-4">2014-03-03</td>
                                                  </div>
                                              </tr>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">학년</th>
                                                      <td class="col-lg-4">2학년</td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">학기</th>
                                                      <td class="col-lg-4">1학기</td>
                                                  </div>
                                              </tr>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">학적상태</th>
                                                      <td class="col-lg-4">재학</td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">최종변동</th>
                                                      <td class="col-lg-4">신입학</td>
                                                  </div>
                                              </tr>
                                          </tbody>
                                      </table>
                                      <table class="table .thead-light mb-0" style="border-top:2px solid #95a3d6">
                                          <tbody>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">졸업상태</th>
                                                      <td class="col-lg-4"></td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">졸업년도</th>
                                                      <td class="col-lg-4"></td>
                                                  </div>
                                              </tr>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">졸업일자</th>
                                                      <td class="col-lg-4"></td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">학위명</th>
                                                      <td class="col-lg-4"></td>
                                                  </div>
                                              </tr>
                                          </tbody>
                                      </table>
                                      <table class="table .thead-light mb-0" style="border-top:2px solid #95a3d6; border-bottom : 2px solid #95a3d6;">
                                          <tbody>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">계좌은행</th>
                                                      <td class="col-lg-4">농협</td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">계좌변호</th>
                                                      <td class="col-lg-4">453017-56-105902</td>
                                                  </div>
                                              </tr>
                                          </tbody>
                                      </table>
                                      <table class="table .thead-light mb-0">
                                          <tbody>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">웹메일</th>
                                                      <td colspan="3" class="col-lg-10">sasdg@shms.ac.kr</td>
                                                  </div>
                                              </tr>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">전화번호</th>
                                                      <td class="col-lg-4">010-1234-4567</td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">Email</th>
                                                      <td class="col-lg-4">shms@co.kr</td>
                                                  </div>
                                              </tr>
                                              <tr>
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">우편번호</th>
                                                      <td colspan="3" class="col-lg-10">34562</td>
                                                  </div>
                                              </tr>
                                              <tr style="border-bottom:2px solid #95a3d6;">
                                                  <div class="row">
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">기본주소</th>
                                                      <td class="col-lg-4">대전광역시 중구 대흥동</td>
                                                      <th class="text-bold-500 text-center align-middle col-lg-2">상세주소</th>
                                                      <td class="col-lg-4">영민빌딩 301호</td>
                                                  </div>
                                              </tr>
                                          </tbody>
                                      </table>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="trans" role="tabpanel" aria-labelledby="trans-tab">
                      <div class="table-responsive">
                          <table class="table table-striped mb-0">
                              <thead>
                                  <tr>
                                      <th class="text-center">No.</th>
                                      <th class="text-center">학적변동</th>
                                      <th class="text-center">변동상세</th>
                                      <th class="text-center">변동일</th>
                                      <th class="text-center">복학예정년도</th>
                                      <th class="text-center">복학예정학기</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td class="text-center">1</td>
                                      <td class="text-center">휴학</td>
                                      <td class="text-center">일반휴학</td>
                                      <td class="text-center">2020.03.04</td>
                                      <td class="text-center">2021년</td>
                                      <td class="text-center">1학기</td>
                                  </tr>
                                  <tr>
                                      <td class="text-center">2</td>
                                      <td class="text-center">복학</td>
                                      <td class="text-center">일반복학</td>
                                      <td class="text-center">2021.03.04</td>
                                      <td class="text-center"></td>
                                      <td class="text-center"></td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                  </div>
                  <div class="tab-pane fade" id="grades" role="tabpanel" aria-labelledby="grades-tab">
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
                      <div class="col-md-3 mb-2">
                          <h6>학년도</h6>
                          <fieldset class="form-group">
                              <select class="form-select">
                                  <option>12학년도</option>
                                  <option>13학년도</option>
                                  <option>14학년도</option>
                              </select>
                          </fieldset>
                      </div>
                      <div class="col-md-3 mb-2">
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
                  </div>
              </div>
          </div>
      </div>
  </section>  
  <!-- contents end -->
</div>