<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 8.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">강의관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">강의개설</li>
      </ol>
  </nav>

  <section class="section">
      <div class="card">
          <div class="card inputTable">
              <div class="card-body">
                  <div class="row">
                      <div class="col-lg-12 row " style="margin-bottom : -10px">
                          <div class="col-md-3 mb-4">
                              <fieldset class="form-group">
                                  <select class="form-select float-right">
                                      <option>-- 강의선택 --</option>
                                      <option>자바 프로그래밍 고급</option>
                                      <option>파이썬 기초</option>
                                      <option>자바스크립트</option>
                                  </select>
                              </fieldset>
                          </div>
                      </div>
                  </div>
                  <form class="table-responsive">
                      <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                          <tr>
                              <th class="align-middle text-center">강의코드</th>
                              <td class="align-middle">12345</td>
                              <th class="align-middle text-center">이수구분</th>
                              <td class="align-middle">전공필수</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의명</th>
                              <td class="align-middle">자바 프로그래밍 기초</td>
                              <th class="align-middle text-center">담당교수</th>
                              <td class="align-middle">최희연</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">개설연도</th>
                              <td class="align-middle">2021학년도</td>
                              <th class="align-middle text-center">개설학기</th>
                              <td class="align-middle">2학기</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의요일</th>
                              <td class="align-middle">월요일</td>
                              <th class="align-middle text-center">강의시간</th>
                              <td class="align-middle">1-3교시</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의개요</th>
                              <td class="align-middle" colspan="3">
                                  <textarea class="form-control" placeholder="" id="floatingTextarea"></textarea>
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
                                  <textarea class="form-control" placeholder="" id="floatingTextarea"></textarea>
                              </td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">강의부교재</th>
                              <td class="align-middle" colspan="3">
                                  <textarea class="form-control" placeholder="" id="floatingTextarea"></textarea>
                              </td>
                          </tr>
                      </table>
                      <h6 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i> 강의계획서</h6>
                      <div class="form-group">
                          <div class="fallback">
                              <div class="col-12 col-md-12">
                                  <div class="card">
                                      <div class="card-content">
                                          <!-- File uploader with validation -->
                                          <input type="file" class="with-validation-filepond" required multiple data-max-file-size="5MB" data-max-files="3">
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="text-center m-t-15">
                          <a href="lectureList.html" class="btn btn-light-secondary">취소</a>
                          <button class="btn btn-primary" type="button">저장</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>