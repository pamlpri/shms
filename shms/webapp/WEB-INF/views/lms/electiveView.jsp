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
      <h4 class="h4Title"><i class="fas fa-minus"></i> 기본정보</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
                  <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                      <tr>
                          <th class="align-middle text-center">강의코드</th>
                          <td colspan="3" class="align-middle">23456</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의명</th>
                          <td colspan="3" class="align-middle">대학생활의 이해란 무엇인가?</td>
                      </tr>
                      <tr>
                          <th class="text-center">담당자사번</th>
                          <td>P2345135</td>
                          <th class="text-center">담당자명</th>
                          <td>하재관</td> 
                      </tr>
                  </table>
              </div>
          </div>
      </div>

      <h4 class="h4Title"><i class="fas fa-minus"></i> 기타정보</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
                  <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                      <tr>
                          <th class="text-center">개설연도</th>
                          <td>2021학년도</td>
                          <th class="text-center">개설학기</th>
                          <td>1학기</td> 
                      </tr>
                      <tr>
                          <th class="text-center">이수구분</th>
                          <td>전필</td> 
                          <th class="text-center">학점</th>
                          <td>3</td>
                      </tr>
                      <tr>
                          <th class="text-center">강의요일</th>
                          <td>월요일</td> 
                          <th class="text-center">강의시간</th>
                          <td>1-3교시</td>
                      </tr>
                      <tr>
                          <th class="text-center">대상학과</th>
                          <td>간호학과</td> 
                          <th class="text-center">대상학년</th>
                          <td>1학년</td>
                      </tr>
                      <tr>
                          <th class="text-center">강의정원</th>
                          <td>35명</td> 
                          <th class="text-center">강의실</th>
                          <td>경영관 301호</td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의계획서</th>
                          <td class="align-middle" colspan="3">
                              <ul class="attat">
                                  <li><a href="#" class="text-color">토익성적.pdf</a></li>
                                  <li><a href="#" class="text-color">중국어.pdf</a></li>
                              </ul>
                          </td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의개요</th>
                          <td class="align-middle" colspan="3">
                              강의개요 입니다.
                          </td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">평가방법</th>
                          <td class="align-middle" colspan="3">
                              <ul id="gradePar">
                                  <li class="float-left">
                                      <h6>성적</h6>
                                      <input class="form-control form-control-sm" type="number" placeholder="단위 %">
                                  </li>
                                  <li class="float-left">
                                      <h6>과제</h6>
                                      <input class="form-control form-control-sm" type="number" placeholder="단위 %">
                                  </li>
                                  <li class="float-left">
                                      <h6>출석</h6>
                                      <input class="form-control form-control-sm" type="number" placeholder="단위 %">
                                  </li>
                              </ul>
                          </td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의교재</th>
                          <td class="align-middle" colspan="3">
                              강의교재
                          </td>
                      </tr>
                      <tr>
                          <th class="align-middle text-center">강의부교재</th>
                          <td class="align-middle" colspan="3">
                              강의교재
                          </td>
                      </tr>
                  </table>
              </div>
          </div>  
      </div>
      <div class="text-center">
          <a href="major.html" class="btn btn-primary">목록으로</a>
          <a href="majorForm.html" class="btn btn-primary">수정</a>
          <button type="button" class="btn btn-danger block" data-bs-toggle="modal"
              data-bs-target="#default">
              삭제
          </button>
      </div>
  </section>

  <!--Basic Modal -->
  <div class="modal fade text-left" id="default" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="myModalLabel1">강의삭제</h5>
                  <button type="button" class="close rounded-pill"
                      data-bs-dismiss="modal" aria-label="Close">
                      <i data-feather="x"></i>
                  </button>
              </div>
              <div class="modal-body">
                  <p>
                      삭제한 강의는 복원이 불가합니다.<br/>
                      삭제하시겠습니까?
                  </p>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn  btn-secondary" data-bs-dismiss="modal">
                      <i class="bx bx-x d-block d-sm-none"></i>
                      <span class="d-none d-sm-block">닫기</span>
                  </button>
                  <button type="button" class="btn btn-primary ml-1"
                      data-bs-dismiss="modal">
                      <i class="bx bx-check d-block d-sm-none"></i>
                      <span class="d-none d-sm-block">삭제</span>
                  </button>
              </div>
          </div>
      </div>
  </div>
  <!-- contents end -->
</div>