<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="location">
	<ul>
		<li class="first"><a class="text-color" href="${cPath }/main/community/academicList.do">대학광장</a></li>
		<li><a class="text-color" href="${cPath }/main/community/academicList.do">학사공지</a></li>
		<li class="last"><a class="text-color" href="${cPath }/main/community/regulations.do">학칙열람</a></li>
	</ul>
</div>

<div style="clear: both;"></div>

<!-- 컨텐츠 -->
<div class="contents">
	<div id="example1"></div>
</div>

<!-- pdf 뷰어 -->
<script src="${cPath }/resources/main/js/pdfobject.js"></script>
<script>PDFObject.embed("https://shms302.dothome.co.kr/community/학칙.pdf", "#example1");</script>

<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(0).children("a").addClass("navy");
		$(".sideMain").eq(0).children(".sideSub").addClass("cur");
	});
</script>