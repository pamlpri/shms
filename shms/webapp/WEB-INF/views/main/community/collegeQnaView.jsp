<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* 2021. 5. 26.      송수미        학사문의 게시글 목록 조회 페이지 구현
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
				<td colspan="3" class="noticeTitle">
					${board.bo_title }
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><span>작성자</span>${board.bo_writer }</td>
				<td><span>작성일</span>${board.bo_write_de }</td>
				<td><span>답변</span>${not empty board.bo_ans? '완료' : '대기' }</td>
			</tr>
		</tbody>
	</table>
	<div class="noticeContent">
		${board.bo_cont }
	</div>
	<div class="noticeAns">
		<p class="userAns">
			${board.ans_writer }<span>${board.ans_de }</span>
		</p>
		<p class="contAns">
			${board.bo_ans }
		</p>
	</div>
	<div id="noticeBtnBox">
		<a id="deleteBtn" class="text-uppercase text-color d-inline-block"href="#" data-toggle="modal" data-target="#deleteModal">삭제</a>
		<a id="updateBtn" href="${cPath }/main/community/collegeQnaUpdate.do?bo_no=${board.bo_no}">수정</a>
		<a id="listBtn" href="${cPath }/main/community/collegeQnaList.do">목록으로</a>
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="#" class="row" method="post">
					<input type="hidden" name="bo_no" value="${board.bo_no }" />
					<div class="col-12">
						<input type="text" class="form-control mb-3" id="deleteName" placeholder="Name" name="bo_writer">
					</div>
					<div class="col-12">
						<input type="password" class="form-control mb-3" id="deletePass" placeholder="Password" name="bo_password">
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