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
		<li><a class="text-color" href="${cPath }/main/community/scholarshipSystem.do">장학공지</a></li>
		<li class="last"><a class="text-color" href="${cPath }/main/community/scholarshipList.do">장학공지</a></li>
	</ul>
</div>

<div style="clear: both;"></div>

<!-- 컨텐츠 -->
<div class="contents">
	<table class="noticeView">
		<thead>
			<tr>
				<td colspan="3" class="noticeTitle">[학생·취업처] 2021학년도 동아리(일반,
					전공봉사, 학술, 취창업) 등록 일정 공고</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><span>작성자</span> 취업장학과</td>
				<td><span>작성일</span> 2021.05.04</td>
				<td><span>조회수</span> 1316</td>
			</tr>
		</tbody>
	</table>
	<div class="noticeContent">
		공 고<br />
		<br /> 2021학년도 우리대학 학생 동아리(일반, 전공봉사, 학술, 취창업)의 원활한 활동을 위하여아래와 같이 동아리
		등록신청 일정을 공고합니다.<br />
		<br /> -- 아 래 --<br />
		<br />
		<br /> 1. 등록기간 : 2021. 03. 04(목) ~ 3. 31(수) 17:00까지.<br />
		<br /> 2. 구비서류 : 가. 동아리 등록신청서 1부.<br /> 나. 회원명단 1부.<br /> 다. 신(新)년도
		활동계획서 1부.<br /> 라. 전(前)년도 활동실적서 1부.<br /> 마. 동아리 지도교수 인정서 1부.<br /> 바.
		서약서 1부.<br /> 사. 회칙 1부.<br />
		<br /> 3. 회원자격 : 가. 우리대학 재학생중(휴학생 제외) 동아리에 가입한 자.<br /> 나. 재학생이며 1인 1개
		동아리 가입을 원칙으로 한다<br /> (중복가입불가)<br />
		<br /> 4. 동아리등록 : 가. 활동을 하고자 하는 동아리는 반드시 학교에 필히 등록하여야 함.<br /> 나.
		가입회원은 일반은 30명, 전공봉사, 학술,창업 동아리는 10명 이상.<br /> 다. 등록기간내에 구비서류를 제출하지 않은
		동아리는 인정하지 않음. <br />
		<br /> 6. 구비서류 수령 : 일반동아리 - 학생·취업처 학생지원팀(8동 4층)<br /> 전공봉사,학술, 취·창업동아리
		- 학과사무실/지도교수 <br />
		<br /> 7. 서류제출 : 학생·취업처 학생지원팀(8동 4층)<br />
		<br />
		<br /> 인재대학교
	</div>
	<div class="board_downloader">
		<ul class="downloader">
			<li><a href="#" class="text-color"><i
					class="fas fa-arrow-alt-circle-down"></i>1._현대카드대학등록금_학생용_납부_메뉴얼.pdf</a>
			</li>
			<li><a href="#" class="text-color"><i
					class="fas fa-arrow-alt-circle-down"></i>2._현대카드_2021년_1학기_혜택_공지문(대학).png</a>
			</li>
		</ul>
	</div>
	<a id="listBtn" href="${cPath }/main/community/scholarshipList.do">목록으로</a>
</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(1).children("a").addClass("navy");
		$(".sideMain").eq(1).children(".sideSub").addClass("cur");
	});
</script>