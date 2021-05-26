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
		<li class="last"><a class="text-color" href="${cPath }/main/community/collegeQnaList.do">대학문의</a></li>
	</ul>
</div>

<div style="clear: both;"></div>

<!-- 컨텐츠 -->
<div class="contents">
	<table class="noticeView">
		<thead>
			<tr>
				<td colspan="3" class="noticeTitle">[입시지원팀] 2021학년도 수시모집 일정
					문의드려요!</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><span>작성자</span>박초원</td>
				<td><span>작성일</span>2021.05.04</td>
				<td><span>답변</span>완료</td>
			</tr>
		</tbody>
	</table>
	<div class="noticeContent">
		안녕하세요!<br /> 2021학년도 수시일정이 어떻게 되나요?<br />
	</div>
	<div class="noticeAns">
		<p class="userAns">
			입시지원팀<span>2020.05.03</span>
		</p>
		<p class="contAns">
			안녕하세요. 입시지원팀 입니다.<br /> 본교에 대한 관심에 진심으로 감사드리며, 질의하신 사항에 답변 드리겠습니다.<br />
			수시 일정은 2021.02.14에 마감됩니다.<br /> 마감일을 확인해주시고 제출서류를 작성하여 우편으로 보내주시기
			바랍니다.<br /> 감사합니다.
		</p>
	</div>
	<div id="noticeBtnBox">
		<a id="deleteBtn" class="text-uppercase text-color d-inline-block"
			href="#" data-toggle="modal" data-target="#deleteModal">삭제</a> <a
			id="updateBtn" href="${cPath }/main/community/collegeQnaForm.do">수정</a> <a id="listBtn"
			href="${cPath }/main/community/collegeQnaList.do">목록으로</a>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content rounded-0 border-0 p-4">
			<div class="modal-header border-0">
				<h3>Password</h3>
				<p>작성자 이름과 비밀번호를 입력하세요.</p>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="#" class="row">
					<div class="col-12">
						<input type="text" class="form-control mb-3" id="deleteName"
							placeholder="Name">
					</div>
					<div class="col-12">
						<input type="password" class="form-control mb-3" id="deletePass"
							placeholder="Password">
					</div>
					<div class="col-12">
						<button type="button" class="btn btn-primary"
							onclick="location.href='collegeQna.html'">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(3).children("a").addClass("navy");
		$(".sideMain").eq(3).children(".sideSub").addClass("cur");
	});
</script>