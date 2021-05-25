<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="location">
	<ul>
		<li class="first"><a class="text-color" href="${cPath }/main/community/academicList.do">대학광장</a></li>
		<li class="last"><a class="text-color" href="${cPath }/main/community/collegeQnaList.do">대학문의</a></li>
	</ul>
</div>

<div style="clear: both;"></div>

<!-- 컨텐츠 -->
<div class="contents">
	<form action="" class="row" id="passForm">
		<p>비밀글은 작성자와 비밀번호 확인 후 열람 가능합니다.</p>
		<div class="col-12">
			<input type="text" class="form-control mb-3" id="noticeName"
				placeholder="Name">
		</div>
		<div class="col-12">
			<input type="password" class="form-control mb-3" id="noticePass"
				placeholder="Password">
		</div>
		<div class="col-12">
			<button type="button" class="btn btn-primary" id="noticeBtn"
				onclick="location.href='${cPath }/main/community/collegeQnaView.do'">확인</button>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(3).children("a").addClass("navy");
		$(".sideMain").eq(3).children(".sideSub").addClass("cur");
	});
</script>