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
          <li class="breadcrumb-item active" aria-current="page">주/회차 관리</li>
      </ol>
  </nav>

  <section class="section">
      <h2 class="section-title">주/회차 등록</h2>
  </section>

  <div class="card attendance">
      <div class="card-body">
        <form class="table-responsive">
          <table class="table table-bordered table-md">
            <tr>
              <th class="align-middle">주차</th>
              <td class="text-left">
                <select class="form-control">
                  <option>-- 주차선택 --</option>
                  <option>1주차</option>
                  <option>2주차</option>
                  <option>3주차</option>
                  <option>4주차</option>
                  <option>5주차</option>
                  <option>6주차</option>
                  <option>7주차</option>
                  <option>8주차</option>
                  <option>9주차</option>
                  <option>10주차</option>
                  <option>11주차</option>
                  <option>12주차</option>
                  <option>13주차</option>
                  <option>14주차</option>
                  <option>15주차</option>
                  <option>16주차</option>
                </select>
              </td>
            </tr>
            <tr>
              <th class="align-middle">주차명</th>
              <td class="text-left"><input type="text" class="form-control"></td>
            </tr>
            <tr>
              <th class="align-middle">강의종류</th>
              <td class="text-left">
                <select class="form-control">
                  <option>-- 강의종류 --</option>
                  <option>대면</option>
                  <option>비대면</option>
                  <option>비대면 실시간</option>
                </select>
              </td>
            </tr>
            <tr>
              <th class="align-middle">강의영상</th>
              <td class="text-left"><input type="text" class="form-control"></td>
            </tr>
            <tr>
              <th class="align-middle">실시간 강의 주소</th>
              <td class="text-left"><input type="text" class="form-control"></td>
            </tr>
            <tr>
              <th class="align-middle">학습기간</th>
              <td>
                <div class="row">
                  <div class="col-md-6 text-left">
                    <label for="inputEmail4">시작일</label>
                    <input type="datetime-local" class="form-control">
                  </div>
                  <div class="col-md-6 text-left">
                    <label for="inputEmail4">종료일</label>
                    <input type="datetime-local" class="form-control">
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle">학습내역</th>
              <td class="textArea">
                <textarea class="form-control"></textarea>
              </td>
            </tr>
          </table>
          <div class="text-center">
              <a href="${cPath }/lecture/weeks.do" class="btn btn-secondary">취소</a>
              <button type="submit" class="btn btn-primary">저장</button>
          </div>
          </form>
        </div>
      </div>
    </div>
  <!-- contents end -->