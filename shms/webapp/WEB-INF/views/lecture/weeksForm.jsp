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
		                <select class="form-control im" name="lec_week">
		                  <option value="">-- 주차선택 --</option>
		                  <c:forEach var="i" begin="${max + 1}" end="${15}">
		                  	<option value="${i }">${i }주차</option>
		                  </c:forEach>
		                </select>
		                <div class="invalid-feedback">
	                      필수항목
	                    </div>
              		</c:when>
              		<c:otherwise>
<%--               			${lecture.lec_week} --%>
              		</c:otherwise>
              	</c:choose>
              </td>
            </tr>
            <tr>
              <th class="align-middle"><span class="red-color">* </span>주차명</th>
              <td class="text-left">
              	  <input type="text" class="form-control im" name="diary_title">
	              <div class="invalid-feedback">
	                필수항목
	              </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle"><span class="red-color">* </span>강의종류</th>
              <td class="text-left">
                <select class="form-control im" name="week_lec_cl">
                  <option value="">-- 강의종류 --</option>
                  <option value="DM">대면</option>
                  <option value="BG">비대면</option>
                  <option value="SG">비대면 실시간</option>
                </select>
                <div class="invalid-feedback">
                   필수항목
                 </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle">강의영상</th>
              <td class="text-left">
              	  <input type="text" class="form-control" name="ut_lec_link">
	              <div class="invalid-feedback">
	                   필수항목
	               </div>
               </td>
            </tr>
            <tr>
              <th class="align-middle">실시간 강의 주소</th>
              <td class="text-left">
              	 <input type="text" class="form-control" name="rt_lec_link">
              	 <div class="invalid-feedback">
                   필수항목
                 </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle"><span class="red-color">* </span>학습기간</th>
              <td>
                <div class="row">
                  <div class="col-md-6 text-left">
                    <label for="inputEmail4"><span class="red-color">* </span>시작일</label>
                    <input type="date" class="form-control im" name="week_bgnde">
                    <div class="invalid-feedback">
                      필수항목
                    </div>
                  </div>
                  <div class="col-md-6 text-left">
                    <label for="inputEmail4"><span class="red-color">* </span>종료일</label>
                    <input type="date" class="form-control im" name="week_endde">
                    <div class="invalid-feedback">
                      필수항목
                    </div>
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
  
  <script type="text/javascript">
    let weeksForm = $("#weeksForm");
    var frag = false;
	$("#saveBtn").on("click",function(){
		let inputs = $(weeksForm).find(":input[name]");
		
		$(inputs).each(function(idx, input){
			console.log($(this).val());
			if($(this).val() == ""){
				if($(this).hasClass("im")){
					$(this).addClass("is-invalid");
				}
				frag = false;
			}else {
				frag = true;
			}
		});
		
		if(frag){
			weeksForm.submit();
		}
	});
	
	$(weeksForm).find(":input[name]").on("change", function(){
		$(this).removeClass("is-invalid");
		
	});
	
	$(weeksForm).find("select[name='week_lec_cl']").on("change", function(){
		let week_lec_cl = $("select[name='week_lec_cl']").val();
		console.log(week_lec_cl);

		if(week_lec_cl == "BG"){
			$("input[name='ut_lec_link']").parents("tr").children("th").prepend('<span class="red-color">* </span>');
			$("input[name='ut_lec_link']").addClass("im");
		}else if(week_lec_cl == "SG"){
			$("input[name='rt_lec_link']").parents("tr").children("th").prepend('<span class="red-color">* </span>');
			$("input[name='rt_lec_link']").addClass("im");
		}
	});
  </script>