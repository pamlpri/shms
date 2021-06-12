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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>${lec_name }</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code }&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">주/회차 관리</li>
      </ol>
  </nav>

  <section class="section">
      <h2 class="section-title">주/회차 등록</h2>
  </section>

  <div class="card attendance">
      <div class="card-body">
        <form class="table-responsive" action="${cPath }/lecture/weeksInsert.do" method="post" id="weeksForm">
          <table class="table table-bordered table-md">
            <tr>
              <th class="align-middle"><span class="red-color">* </span>주차</th>
              <td class="text-left">
              	<c:choose>
              		<c:when test="${not empty insert}">
		                <select class="form-control" name="lec_week">
		                  <option>-- 주차선택 --</option>
		                  <c:forEach var="i" begin="${max + 1}" end="${15}">
		                  	<option value="${i }">${i }주차</option>
		                  </c:forEach>
		                </select>
              		</c:when>
              		<c:otherwise>
<%--               			${lecture.lec_week} --%>
              		</c:otherwise>
              	</c:choose>
              </td>
            </tr>
            <tr>
              <th class="align-middle"><span class="red-color">* </span>주차명</th>
              <td class="text-left"><input type="text" class="form-control" name="diary_title"></td>
            </tr>
            <tr>
              <th class="align-middle"><span class="red-color">* </span>강의종류</th>
              <td class="text-left">
                <select class="form-control" name="week_lec_cl">
                  <option>-- 강의종류 --</option>
                  <option value="DM">대면</option>
                  <option value="BG">비대면</option>
                  <option value="SG">비대면 실시간</option>
                </select>
              </td>
            </tr>
            <tr>
              <th class="align-middle">강의영상</th>
              <td class="text-left"><input type="text" class="form-control" name="ut_lec_link"></td>
            </tr>
            <tr>
              <th class="align-middle">실시간 강의 주소</th>
              <td class="text-left"><input type="text" class="form-control" name="rt_lec_link"></td>
            </tr>
            <tr>
              <th class="align-middle"><span class="red-color">* </span>학습기간</th>
              <td>
                <div class="row">
                  <div class="col-md-6 text-left">
                    <label for="inputEmail4"><span class="red-color">* </span>시작일</label>
                    <input type="date" class="form-control" name="week_bgnde">
                  </div>
                  <div class="col-md-6 text-left">
                    <label for="inputEmail4"><span class="red-color">* </span>종료일</label>
                    <input type="date" class="form-control" name="week_endde">
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle">학습내역</th>
              <td class="textArea">
                <textarea class="form-control" name="diary_cont"></textarea>
              </td>
            </tr>
          </table>
          <div class="text-center">
              <a href="${cPath }/lecture/weeks.do" class="btn btn-secondary">취소</a>
              <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
          </div>
          </form>
        </div>
      </div>
    </div>
  <!-- contents end -->
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
  
  <script>
    let weeksForm = $("#weeksForm");
  	$("#saveBtn").on("click",function(){
  		let lec_week = $(weeksForm).find("input[name='lec_week']").val().length;
  		let week_bgnde = $(weeksForm).find("input[name='lec_week']").val().length;
  		let week_endde = $(weeksForm).find("input[name='lec_week']").val().length;
  		let diary_title = $(weeksForm).find("input[name='lec_week']").val().length;
  		let week_lec_cl = $(weeksForm).find("input[name='lec_week']").val().length;
  		
  		let list = [];
  		list.push(lec_week);
  		console.log(lec_week);
  		list.push(week_bgnde);
  		list.push(week_endde);
  		list.push(diary_title);
  		list.push(week_lec_cl);
  		
  		let multi = 0;
  		for(var i = 0; i < list.length; i++){
  			multi *= list[i];
  		}
  		
  		if(multi == 0){
  			alert("필수입력 누락");
  			$("#exampleModal").addClass("show")
  		}
  	});s
  </script>