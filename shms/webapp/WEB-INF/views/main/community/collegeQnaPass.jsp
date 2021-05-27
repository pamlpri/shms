<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* 2021. 5. 27.      송수미        비밀번호 체크 페이지 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="location">
	<ul>
		<li class="first"><a class="text-color" href="${cPath }/main/community/academicList.do">대학광장</a></li>
		<li class="last"><a class="text-color" href="${cPath }/main/community/collegeQnaList.do">대학문의</a></li>
	</ul>
</div>

<div style="clear: both;"></div>

<c:if test="${not empty message }">
	<script>
		alert("${message}");
	</script>	
</c:if>

<!-- 컨텐츠 -->
<div class="contents">
	<form class="row" id="passForm" method="post">
		<p>비밀글은 작성자와 비밀번호 확인 후 열람 가능합니다.</p>
		<div class="col-12">
			<input type="text" class="form-control mb-3" id="noticeName"
				placeholder="Name" name="writer_name">
		</div>
		<div class="col-12">
			<input type="password" class="form-control mb-3" id="noticePass"
				placeholder="Password" name="writer_pass">
		</div>
		<div class="col-12">
			<input type="submit" class="btn btn-primary" id="noticeBtn" value="확인"/>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(3).children("a").addClass("navy");
		$(".sideMain").eq(3).children(".sideSub").addClass("cur");
	});
</script>