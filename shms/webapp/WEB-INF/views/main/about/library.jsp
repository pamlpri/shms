<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      오세일        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#accordian li{ list-style:none;}
	#accordian li >h4{ cursor:pointer;}
	li > ul{ display:none;}
	li > ul >li{ color:blcak;}
</style>    
    <div id="location">
  <ul>
    <li class="first"><a class="text-color" href="${cPath }/main/about/message.do">대학안내</a></li>
    <li><a class="text-color" href="${cPath }/main/about/message.do">대학소개</a></li>
    <li class="last"><a class="text-color" href="${cPath }/main/about/library.do">도서관 이용</a></li>
  </ul>
</div>

<div style="clear: both;"></div>
<br><br><br>
<div id="accordian">
	<ul>
		<li>
			<h4>1층 신문 자료실<span class="ico_ar">▼</span></h4>
			<ul>
				<li>- 일간지(17종)</li>
			</ul>
		</li>
		<li class="active">
			<h4>2층 연속간행물실, 외국 학술지 지원센터<span class="ico_ar">▼</span></h4>
			<ul>
				<h6>연속간행물실</h6>
				<li>- 국내외 학술지 및 교양잡지</li>
				<li>- 상호대차/원문복사서비스</li>
				<br>
				<h6>외국 학술지 지원센터</h6>
				<li>- 행정,경영, 법학 분야 외국학술지</li>
				<li>- 외국학술지지원센터 소장자료 무료원문복사 서비스</li>
				
			</ul>
		</li>
		<li>
			<h4>3층 대출실, 제1,2 자료실<span class="ico_ar">▼</span></h4>
			<ul>
				<h6>대출실</h6>
				<li>- 도서 대출/반납 및 분실, 훼손도서 신고</li>
				<li>- 타 도서관 자료열람 의뢰</li>
				<li>- 도서관 회원제 및 특별 열람증 운영</li><br>
				<h6>제1자료실</h6>
				<li>- 국내외 단행본 및 참고자료(000 총류, 100 철학, 200 종교, 300 사회과학, 400 어학)</li><br>
				<h6>제2자료실</h6>
				<li>- 국내외 단행본 및 참고자료(500 순수과학, 600 기술과학, 700 예술, 800 문학, 900 역사)</li><br>
			</ul>
		</li>
		<li>
			<h4>4층 고서실<span class="ico_ar">▼</span></h4>
			<ul>
				<li>고서 및 족보, 각종 문집류</li><br>
				<h6>자료실</h6>
				<li>국내외 참고자료(보존)</li>
				<li>개인문고</li>
			</ul>
		</li>
	</ul>
</div>	

<script>
              
$(function(){
	$("#accordian h4").click(function(){
		$("#accordian ul ul").slideUp();
		$('.ico_ar').css('transform','none');
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown();
			$(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
		}
	})
})


</script>
    
