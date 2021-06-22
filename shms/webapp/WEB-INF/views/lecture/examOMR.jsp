<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
2021. 6. 22. 	  박초원			 서술형, 단답형 채점, 성적 수정
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>${lec_name }</h1>
    </div>
  </section>

  <div class="card attendance">
      <div class="card-body">
        <form class="table-responsive" action="${cPath }/lecture/examGradeUpdate.do" method="post" id="quesForm">
          <table class="table table-bordered table-md">
          	<colgroup>
          		<col width="10%">
          		<col width="90%">
          	</colgroup>
            <tr>
              <th>이름</th>
              <td class="text-left">${quesList[0].name}</td>
            </tr>
            <tr>
              <th>학번</th>
              <td class="text-left">${quesList[0].stdnt_no }</td>
            </tr>
            <tr>
              <th>학과</th>
              <td class="text-left">${quesList[0].sub_name }</td>
            </tr>
            <c:forEach items="${quesList}" var="ques" varStatus="idx">
	            <tr>
	                <th class="align-middle">${ques.ques_no }</th>
	                <input type="hidden" name="quesList[${idx.index }].ques_no" value="${ques.ques_no }" />
	                <input type="hidden" name="quesList[${idx.index }].applcn_no" value="${ques.applcn_no }" />
	                <td>
	                  <p class="text-left"> 
	                      ${ques.submit_ans }
	                  </p>
	                  <div class="float-left">
		                <div class="form-check form-check-inline">
		                  <input class="form-check-input" type="radio" value="Y" name="quesList[${idx.index }].ans_at">
		                  <label class="form-check-label">정답</label>
		                </div>
		                <div class="form-check form-check-inline">
		                  <input class="form-check-input" type="radio" value="N" name="quesList[${idx.index }].ans_at">
		                  <label class="form-check-label">오답</label>
		                </div>
	               	  </div>
	                </td>
	            </tr>
            </c:forEach>
          </table>
          <div class="text-center">
              <a href="${cPath }/lecture/examAdminList.do" class="btn btn-secondary">취소</a>
              <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
          </div>
        </form>
      </div>
    </div>
    
    <div class="modal fade" tabindex="-1" role="dialog" id="fire-modal-2" style="display: block; padding-right: 17px;">
		<div class="modal-dialog modal-md modal-dialog-centered"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
	<div class="modal-backdrop fade"></div>
  <!-- contents end -->
</div>



<script>
	$("body").removeClass("modal-open").css("padding-right","0px");
	$(".modal-backdrop").removeClass("show").css("display", "none");
	$(".modal").removeClass("show").css("display", "none");

	let quesForm = $("#quesForm");
	let frag = false;
	$("#saveBtn").on("click", function(){
		let radios = $(quesForm).find("input[type='radio']");
		$(radios).each(function(idx, radio){
			let name = $(this).attr("name");
			let value = $("input[name='"+name+"']:checked").val();
			if(typeof value == "undefined"){
				$(".modal-title").text("채점 미완료");
	 			$(".modal-body").text("채점이 완료되지 않은 항목이 있습니다.");
	 			$("body").addClass("modal-open").css("padding-right", "17px");
	   			$(".modal-backdrop").addClass("show").css("display", "block");
	 			$(".modal").addClass("show").css("display", "block");
				frag = false;
				return false;
			}else{
				frag = true;
			}
		});
		
		console.log(frag);
		if(frag == true){
			$(quesForm).submit();
		}
	});
	
	 $(".modal .close, .modal").on("click", function(){
		  $("body").removeClass("modal-open").css("padding-right","0px");
	      $(".modal-backdrop").removeClass("show").css("display", "none");
		  $(".modal").removeClass("show").css("display", "none");
	  });
</script>