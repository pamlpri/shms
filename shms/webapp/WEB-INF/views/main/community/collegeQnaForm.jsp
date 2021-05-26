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
	<form id="qnaForm">
		<table>
			<tr>
				<th>문의유형</th>
				<td><select>
						<option value="" style="color: #aaa">--문의유형--</option>
						<option value="">학사일정문의</option>
						<option value="">장학금문의</option>
						<option value="">편의시설문의</option>
						<option value="">시설보수문의</option>
				</select></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<th>세부설정</th>
				<td><span class="label-box">비밀글</span> <label for="isprivate">
						<input type="checkbox" value="Y" id="isprivate" checked /> <span>작성자와
							관리자만 확인 가능하게 설정 합니다.</span>
				</label></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" value="" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" value="" name="bo_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="textArea"><textarea class="form-control" rows="5"
						cols="1000" id="bo_cont"></textarea></td>
			</tr>
		</table>
		<div class="btnBox">
			<a href="${cPath }/main/community/collegeQnaList.do" id="listBtn">목록으로</a>
			<button type="submit" id="saveBtn">저장</button>
		</div>
	</form>
</div>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(3).children("a").addClass("navy");
		$(".sideMain").eq(3).children(".sideSub").addClass("cur");
	});
</script>