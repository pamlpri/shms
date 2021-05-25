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
<div class="contents" id="academic">
	<div class="card board" style="border: none;">
		<div class="card-body board-body">
			<form class="row" id="searchArea">
				<div class="col-md-3 mb-4">
					<select class="form-select" id="basicSelect">
						<option>전체</option>
						<option>제목</option>
						<option>내용</option>
					</select>
				</div>
				<div class="col-md-7">
					<input type="text" class="searchInput">
				</div>
				<div class="col-md-2">
					<a href="#" id="searchBtn">검색</a>
				</div>
			</form>
			<div class="table-responsive">
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
						<tr>
							<th scope="row" class="text-center">10</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[입시지원팀]</span>입시문의드려요!<i class="fas fa-key"></i></a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="wait">대기</span></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">9</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[행정학과]</span>수시모집 인원수 문의요!</a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="success">완료</span></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">8</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[경영학과]</span>수시모집 인원수 문의요!<i class="fas fa-key"></i></a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="success">완료</span></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">7</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[경영학과]</span>수시모집 인원수 문의요!<i class="fas fa-key"></i></a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="success">완료</span></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">6</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[입시지원팀]</span>입시문의드려요!<i class="fas fa-key"></i></a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="wait">대기</span></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">5</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[행정학과]</span>수시모집 인원수 문의요!</a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="success">완료</span></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">4</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[경영학과]</span>수시모집 인원수 문의요!<i class="fas fa-key"></i></a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="success">완료</span></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">3</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[행정학과]</span>수시모집 인원수 문의요!</a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="success">완료</span></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">2</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[경영학과]</span>수시모집 인원수 문의요!<i class="fas fa-key"></i></a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="success">완료</span></td>
						</tr>
						<tr>
							<th scope="row" class="text-center">1</th>
							<td><a class="text-black-color" href="${cPath }/main/community/collegeQnaPass.do"><span
									class="dept">[경영학과]</span>수시모집 인원수 문의요!<i class="fas fa-key"></i></a></td>
							<td class="text-center">박*원</td>
							<td class="text-center">2020.05.05</td>
							<td class="text-center"><span class="success">완료</span></td>
						</tr>
					</tbody>
				</table>
				<nav aria-label="Page navigation example" class="pagination">
					<ul class="pagination  justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&lt;&lt;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&lt;</span>
						</a></li>
						<li class="page-item"><a class="page-link page" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&gt;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&gt;&gt;</span>
						</a></li>
					</ul>
				</nav>
				<a href="${cPath }/main/community/collegeQnaForm.do" id="writeBtn">글쓰기</a>
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