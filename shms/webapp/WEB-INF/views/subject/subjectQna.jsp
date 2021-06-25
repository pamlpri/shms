<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 4.   김보미 		최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="feature_area section_gap_top">
<form>
	<input type="hidden" name="sub_code" value="${sub_code }">
</form>
	<div class="container">
		<div style="clear: both;"></div>
		<div class="contents" id="academic">
			<div class="card" style="border: none;">
				<div class="card-body board-body">
					<form id="searchForm">
						<input type="hidden" name="searchType"
							value="${pagingVO.searchMap.searchType }" /> <input type="hidden"
							name="searchWord" value="${pagingVO.searchMap.searchWord }" /> <input
							type="hidden" name="page" />
					</form>
					<form class="row" id="searchUI">
						<div class="col-md-3 mb-4">
							<select class="form-select" id="basicSelect" name="searchType">
								<option value>전체</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select>
						</div>
						<div class="col-md-7">
							<input type="text" class="searchInput" name="searchWord"
								value="${pagingVO.searchMap.searchWord }">
						</div>
						<div class="col-md-2">
							<input type="button" value="검색" id="searchBtn">
						</div>
					</form>
					<div class="table-responsive" style="flex-direction: column;">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">제목</th>
									<th class="text-center">작성자</th>
									<th class="text-center">작성일</th>
									<th class="text-center">답변</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty pagingVO.dataList }">
										<c:forEach items="${pagingVO.dataList }" var="board">
											<tr>
												<th scope="row" class="text-center">${board.p_bo_no }</th>
												<td><c:choose>
														<c:when test="${board.bo_secret_at eq 'Y' }">
															<a class="text-black-color"
																href="${cPath }/subject/subjectQnaPass.do?bo_no=${board.bo_no}">
																${board.bo_title }
																<i class="fas fa-key"></i>
															</a>
														</c:when>
														<c:otherwise>
															<a class="text-black-color"
																href="${cPath }/subject/subjectQnaView.do?bo_no=${board.bo_no}">
																${board.bo_title }
															</a>
														</c:otherwise>
													</c:choose></td>
												<td class="text-center">${board.bo_writer }</td>
												<td class="text-center">${board.bo_write_de }</td>
												<td class="text-center"><c:choose>
														<c:when test="${not empty board.bo_ans }">
															<span class="success">완료</span>
														</c:when>
														<c:otherwise>
															<span class="wait">대기</span>
														</c:otherwise>
													</c:choose></td>
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
						<div  style="flex-direction : column">
							<div id="pagingArea" class="d-flex justify-content-center">
								${pagingVO.pagingHTMLBS }</div>
							<a href="${cPath }/subejct/subjectQnaInsert.do" id="writeBtn">글쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="delChkModal" tabindex="-1"
			aria-labelledby="delChkModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="delChkModalBody">
						<c:if test="${not empty message }">
        	${message }
        	<script type="text/javascript">
										$("#delChkModal").modal();
									</script>
						</c:if>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(3).children("a").addClass("navy");
		$(".sideMain").eq(3).children(".sideSub").addClass("cur");
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
