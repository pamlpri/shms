<%--
* [[개정이력(Modification Information)]]
* 수정일         수정자      수정내용
* ----------   ---------  -----------------
* 2021. 6. 5.  김보미        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div style="clear: both;"></div>
<!-- 컨텐츠 -->
<section class="feature_area section_gap_top">
<div class="container">
	<div class="contents" id="sub">
		<div class="card board" style="border: none;">
			<div class="card-body board-body">
				<form id="searchForm">
					<input type="hidden" name="searchType" value="${pagingVO.searchMap.searchType }"/>
					<input type="hidden" name="searchWord" value="${pagingVO.searchMap.searchWord }"/>
					<input type="hidden" name="page" />
				</form>
				<form class="row" id="searchUI">
					<div class="col-md-3 mb-4">
						<select class="form-select" id="basicSelect" name="searchType">
							<option value>전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="col-md-7">
						<input type="text" class="searchInput" name="searchWord" value="${pagingVO.searchMap.searchWord }">
					</div>
					<div class="col-md-2">
						<input type="button" value="검색" id="searchBtn">
					</div>
				</form>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th class="text-center">제목</th>
								<th class="text-center">작성일</th>
								<th class="text-center">조회수</th>
							</tr>
						</thead>
						<tbody>
		                    <c:choose>
		                    	<c:when test="${not empty pagingVO.dataList }">
		                    		<c:forEach items="${pagingVO.dataList }" var="board">
		                         <tr>
		                           <th scope="row" class="text-center">${board.p_bo_no}</th>
		                           <td class="text-center"><a class="text-color" href="${cPath }/subject/subjectNoticeView.do?bo_no=${board.bo_no}">${board.bo_title }</a></td>
		                           <td class="text-center">${board.bo_write_de }</td>
		                           <td class="text-center">${board.bo_hit }</td>
		                         </tr>
		                    		</c:forEach>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<tr>
		                    			<td colspan="4" class="text-center">등록된 글이 존재하지 않습니다.</td>
		                    		</tr>
		                    	</c:otherwise>
		                    </c:choose>					
						</tbody>
					</table>
					<div id="pagingArea" class="d-flex justify-content-center">
						${pagingVO.pagingHTMLBS }
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(0).children("a").addClass("navy");
		$(".sideMain").eq(0).children(".sideSub").addClass("cur");
	});
	
	searchForm = $('#searchForm');
	let pagingArea = $("#pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
	
	let searchUI = $("#searchUI");
	searchUI.find("[name='searchType']").val("${pagingVO.searchMap.searchType }");
	$("#searchBtn").on("click", function(){
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input){
			let name = $(this).attr("name");
			let sameInput = searchForm.find("[name='"+name+"']");
			$(sameInput).val($(this).val());
		});
		searchForm.submit();
	});
</script>