<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 23.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">강의관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">교양강의</li>
      </ol>
  </nav>

  <!-- contents start -->
  <section class="section">
      <div class="card">
          <div class="card-body">
              <form id="searchForm"> 
                  <div class="row">
                      <div class="col-12">
                          <div class="row">
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>단과대</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
                                          <select class="form-select">
                                              <option>전체</option>
                                              <option>인문대학</option>
                                              <option>경상대학</option>
                                              <option>공과대학</option>
                                              <option>보건대학</option>
                                              <option>사회과학대학</option>
                                          </select>
                                      </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>학과</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
                                          <select class="form-select">
                                              <option>전체</option>
                                              <option>러시아학과</option>
                                              <option>국어국문학과</option>
                                              <option>독일어문학과</option>
                                              <option>영문학과</option>
                                              <option>항공학과</option>
                                              <option>행정학과</option>
                                              <option>경영학과</option>
                                              <option>간호학과</option>
                                              <option>안경광학과</option>
                                              <option>전체</option>
                                              <option>러시아학과</option>
                                              <option>국어국문학과</option>
                                              <option>독일어문학과</option>
                                              <option>영문학과</option>
                                              <option>항공학과</option>
                                              <option>행정학과</option>
                                              <option>경영학과</option>
                                              <option>간호학과</option>
                                              <option>안경광학과</option>
                                          </select>
                                      </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>개설연도</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
                                          <select class="form-select">
                                              <option>전체</option>
                                              <option>2021학년도</option>
                                              <option>2020학년도</option>
                                              <option>2019학년도</option>
                                              <option>2018학년도</option>
                                              <option>2017학년도</option>
                                          </select>
                                      </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>검색</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <div class="input-group mb-3">
                                          <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                                          <button class="btn btn-outline-secondary searchInput" type="button">
                                              <i class="bi bi-search"></i>
                                          </button>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <input type="hidden" name="searchWord" value=""/>
              </form>

              <div class="table-responsive">
                  <table class="table table-bordered mb-0">
                      <thead>
                          <tr class="bg-th">
                              <th class="text-center">강의코드</th>
                              <th class="text-center">강의명</th>
                              <th class="text-center">학과</th>
                              <th class="text-center">담당교수</th>
                              <th class="text-center">학점</th>
                              <th class="text-center">이수구분</th>
                              <th class="text-center">개설연도</th>
                              <th class="text-center">개설학기</th>
                              <th class="text-center">강의시간</th>
                              <th class="text-center">정원</th>
                              <th class="text-center">개설여부</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">전학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-danger">N</span></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-primary">Y</span></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">전학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-danger">N</span></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-primary">Y</span></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">전학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-danger">N</span></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-primary">Y</span></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">전학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-danger">N</span></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-primary">Y</span></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">전학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-danger">N</span></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">223445</a>
                              </td>
                              <td class="text-center">
                                  <a href="${cPath}/lms/electiveView.do" class="text-color">대학생활의 이해란 무엇인가?</a>
                              </td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3</td>
                              <td class="text-center">교선</td>
                              <td class="text-center">2021</td>
                              <td class="text-center">1학기</td>
                              <td class="text-center">월 1-2교시</td>
                              <td class="text-center">35명</td>
                              <td class="text-center"><span class="badge bg-light-primary">Y</span></td>
                          </tr>
                      </tbody>
                  </table>
                  <div class="float-right mt-3">
                      <a href="${cPath }/lms/electiveForm.do" class="btn btn-primary">
                          <i class="fas fa-chalkboard"></i> 강의생성
                      </a>
                  </div>
                  <nav aria-label="Page navigation example" class="pagenationNav">
                      <ul class="pagination pagination-primary">
                          <li class="page-item"><a class="page-link" href="#">
                                  <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                              </a></li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item active"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item"><a class="page-link" href="#">
                                  <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                              </a></li>
                      </ul>
                  </nav>
              </div>
          </div>
      </div>
  </section>  
  <!-- contents end -->
</div>