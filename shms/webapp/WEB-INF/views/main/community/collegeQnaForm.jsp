<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* 2021. 5. 28.      송수미        학사문의 등록 기능 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>
	.error{
		font-size: 0.6em;
		color : red;
	}
</style>
<div id="location">
	<ul>
		<li class="first"><a class="text-color" href="${cPath }/main/community/academicList.do">대학광장</a></li>
		<li class="last"><a class="text-color" href="${cPath }/main/community/collegeQnaList.do">대학문의</a></li>
	</ul>
</div>

<c:if test="${not empty saveBoard }">
	<c:set var="board" value="${saveBoard }"></c:set>
</c:if>

<div style="clear: both;"></div>
<!-- 컨텐츠 -->
<div class="contents">
	<form:form modelAttribute="board" id="qnaForm" method="post">
		<table>
			<tr>
				<th>문의유형</th>
				<td>
					<select name="univ_inqry_kind" id="kindList" ${mode eq "update"? "disabled" : "" }>
						<option value="" style="color: #aaa">--문의유형--</option>
						<option value="PM" ${board.univ_inqry_kind eq 'PM'? 'selected' : '' }>편의시설문의</option>
						<option value="HM" ${board.univ_inqry_kind eq 'HM'? 'selected' : '' }>학사일정문의</option>
						<option value="JM" ${board.univ_inqry_kind eq 'JM'? 'selected' : '' }>장학금문의</option>
					</select>
					<form:errors path="univ_inqry_kind" element="span" cssClass="error" />
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input name="bo_writer" type="text" value="${board.bo_writer }"  ${mode eq "update"? "disabled" : "" }/>
					<form:errors path="bo_writer" element="span" cssClass="error" />
				</td>
			</tr>
			<tr>
				<th>세부설정</th>
				<td>
					<span class="label-box">비밀글</span>
					<label for="isprivate">
						<input type="checkbox" name="bo_secret_at" value="Y" id="isprivate" 
							${board.bo_secret_at eq 'Y'? 'checked' : '' } /> 
						<span>작성자와 관리자만 확인 가능하게 설정 합니다.</span>
					</label>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="bo_password" type="password" />
					<form:errors path="bo_password" element="span" cssClass="error" />
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input name="bo_title" type="text" value="${board.bo_title }"/>
					<form:errors path="bo_title" element="span" cssClass="error" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="textArea">
					<textarea name="bo_cont" class="form-control" rows="5" cols="1000" id="bo_cont" >${board.bo_cont }</textarea>
					<form:errors path="bo_cont" element="span" cssClass="error" />
				</td>
			</tr>
		</table>
		<div class="btnBox">
			<a href="${cPath }/main/community/collegeQnaList.do" id="listBtn">목록으로</a>
			<button type="submit" id="saveBtn">저장</button>
		</div>
	</form:form>
</div>

<!-- Modal -->
<div class="modal fade" id="valiModal" tabindex="-1" aria-labelledby="valiModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="valiModalBody">
        <c:if test="${not empty message }">
        	${message }
        	<script type="text/javascript">
        		$("#valiModal").modal();
        	</script>
		</c:if>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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