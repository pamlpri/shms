<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자         수정내용
* ----------  ---------  -----------------
* 2021. 6. 5.  김보미         최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div style="clear: both;"></div>
<!-- 컨텐츠 -->
<section class="feature_area section_gap_top">
<div class="container">
<div class="contents">
	<form class="row" id="passForm" method="post">
		<p>비밀글은 작성자와 비밀번호 확인 후 열람 가능합니다.</p>
		<span id="passChkRes"></span>
		<div class="col-12">
			<input id="board_no" type="hidden" value="${bo_no }" />
			<input type="text" class="form-control mb-3" id="noticeName"
				placeholder="Name" name="bo_writer">
		</div>
		<div class="col-12">
			<input type="password" class="form-control mb-3" id="noticePass"
				placeholder="Password" name="bo_password">
		</div>
		<div class="col-12">
			<input type="submit" class="btn btn-primary" id="noticeBtn" value="확인"/>
		</div>
	</form>
</div>
</div>
</section>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(3).children("a").addClass("navy");
		$(".sideMain").eq(3).children(".sideSub").addClass("cur");
	});
	
	$('#passForm').on("submit", function(event){
		event.preventDefault();
		var board = {
			bo_no : $("#board_no").val()
			, bo_writer : $("#noticeName").val()
			, bo_password : $("#noticePass").val()
		}
		
		$.ajax({
			url : "${cPath}/subject/subjectQnaPass.do"
			, method : "post"
			, contentType : "application/json; charset='utf-8'"
			, data : JSON.stringify(board)
			, dataType : "json"
			, success : function(resp){
				if(resp == true){
					location.href = "${cPath}/subject/subjectQnaView.do?bo_no=${bo_no}";
				}else{
					$('#passChkRes').text("작성자명 또는 비밀번호가 올바르지 않습니다.");
				}
			}
			, error : function(xhr, error, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
		});
	});
</script>