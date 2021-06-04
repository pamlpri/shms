<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 4.   김보미       최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="clear: both;"></div>

<!-- 컨텐츠 -->
<div class="contents">
<div id="location">
  <ul>
    <li class="first"><a class="text-color" href="${cPath }/main/community/academicList.do">대학광장</a></li>
    <li><a class="text-color" href="${cPath }/main/community/academicList.do">학사공지</a></li>
    <li class="last"><a class="text-color" href="${cPath }/main/community/academicList.do">학사공지</a></li>
  </ul>
</div>
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
      <td><span>작성자</span> ${board.bo_writer }</td>
      <td><span>작성일</span> ${board.bo_write_de }</td>
      <td><span>조회수</span> ${board.bo_hit }</td>
      </tr>
    </tbody>
  </table>
	<div class="noticeContent">
		${board.bo_cont }
	</div>
	<c:if test="${not empty board.attachList}">
		<div class="board_downloader">
			<ul class="downloader">
			<c:forEach items="${board.attachList }" var="attach">
				<c:url value="/main/community/download.do" var="downloadURL">
					<c:param name="bo_no" value="${board.bo_no }" />
					<c:param name="atch_file_no" value="${attach.atch_file_no }" />
					<c:param name="atch_file_seq" value="${attach.atch_file_seq }" />
				</c:url>
				<li>
					<a href="${downloadURL }" class="text-color">
						<i class="fas fa-arrow-alt-circle-down"></i>${attach.file_nm }
					</a>
				</li>
			</c:forEach>
			</ul>
		</div>
	</c:if>
  <a id="listBtn" href="${cPath }/subject/subjectNoticeList.do">목록으로</a>
</div>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(0).children("a").addClass("navy");
		$(".sideMain").eq(0).children(".sideSub").addClass("cur");
	});
</script>