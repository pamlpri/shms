<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
			<li class="breadcrumb-item active" aria-current="page">지도교수상담</li>
		</ol>
	</nav>

	<section class="section">
		<div class="card">
			<div class="card-body">
				<table class="table table-striped" id="table1">
					<thead>
						<tr>
							<th class="text-center">No.</th>
							<th class="text-center">상담코드</th>
							<th class="text-center">상담분류</th>
							<th class="text-center">지도교수</th>
							<th class="text-center">상담일자</th>
							<th class="text-center">상담시간</th>
							<th class="text-center">상담상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center">1</td>
							<td class="text-center">2345</td>
							<td class="text-center">학업</td>
							<td class="text-center">하재관</td>
							<td class="text-center">2021.05.25</td>
							<td class="text-center">PM 02:00</td>
							<td class="text-center"><a href="${cPath }/lms/consultingView.do"
								class="badge bg-success white-color">완료</a></td>
						</tr>
						<tr>
							<td class="text-center">2</td>
							<td class="text-center">2345</td>
							<td class="text-center">진로</td>
							<td class="text-center">하재관</td>
							<td class="text-center">2021.05.25</td>
							<td class="text-center">PM 02:00</td>
							<th class="text-center">
								<button type="button" class="btn badge bg-danger block failBtn"
									data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
									반려</button>
							</th>
						</tr>
						<tr>
							<td class="text-center">3</td>
							<td class="text-center">2345</td>
							<td class="text-center">생활</td>
							<td class="text-center">하재관</td>
							<td class="text-center">2021.05.25</td>
							<td class="text-center">PM 02:00</td>
							<th class="text-center">
								<!-- 상담시간이 됐을때 --> <a href="${cPath }/lms/consulting.do"
								class="badge bg-primary">승인</a> <!-- 상담시간이 안됐을때 -->
								<button type="button" class="btn badge bg-primary block failBtn"
									data-bs-toggle="modal" data-bs-target="#exampleModalCenter2">
									승인</button>
							</th>
						</tr>
						<tr>
							<td class="text-center">4</td>
							<td class="text-center">2345</td>
							<td class="text-center">생활</td>
							<td class="text-center">하재관</td>
							<td class="text-center">2021.05.25</td>
							<td class="text-center">PM 02:00</td>
							<th class="text-center">
								<button type="button" class="btn badge bg-info white-color"
									data-bs-toggle="modal" data-bs-target="#inlineForm"
									style="margin-top: -1%;">대기</button>
							</th>
						</tr>
					</tbody>
				</table>
				<!-- 학생한테만 보이는 버튼 -->
				<div class="breadcrumb breadcrumb-right">
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#inlineForm"
						style="margin-top: -1%;">상담신청</button>
				</div>
			</div>
		</div>
	</section>

	<!--신청 modal -->
	<div class="modal fade text-left" id="inlineForm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel33">지도교수상담</h4>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<form action="#">
					<div class="modal-body">
						<div class="form-group">
							<h6>학번</h6>
							<input class="form-control form-control-default" type="text"
								value="S14010001" disabled>
						</div>
						<div class="form-group">
							<h6>이름</h6>
							<input class="form-control form-control-default" type="text"
								value="강미나" disabled>
						</div>
						<div class="form-group">
							<h6>지도교수</h6>
							<input class="form-control form-control-default" type="text"
								value="하재관" disabled>
						</div>
						<div class="form-group">
							<h6>상담분류</h6>
							<fieldset class="form-group">
								<select class="form-select" id="basicSelect">
									<option>-- 분류선택 --</option>
									<option>학업</option>
									<option>진로</option>
									<option>생활</option>
								</select>
							</fieldset>
						</div>
						<div class="form-group">
							<h6>상담사유</h6>
							<textarea class="form-control" placeholder="상담을 신청하는 사유를 적어주세요."
								id="floatingTextarea"></textarea>
						</div>
						<div class="form-group">
							<h6>상담희망일시</h6>
							<input class="form-control form-control-default" type="date"
								value="">
						</div>
						<div class="form-group">
							<h6>상담희망시간</h6>
							<input class="form-control form-control-default" type="time"
								value="">
						</div>
						<p>지도교수의 일정에 따라 상담신청이 반려될 수 있습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-light-secondary"
							data-bs-dismiss="modal">
							<i class="bx bx-x d-block d-sm-none"></i> <span
								class="d-none d-sm-block">닫기</span>
						</button>
						<!-- update시에만 나오는 버튼 -->
						<button type="button" class="btn btn-danger ml-1"
							data-bs-toggle="modal" data-bs-target="#default" id="deleteBtn">
							<i class="bx bx-check d-block d-sm-none"></i> <span
								class="d-none d-sm-block">삭제</span>
						</button>
						<button type="button" class="btn btn-primary ml-1"
							data-bs-dismiss="modal">
							<i class="bx bx-check d-block d-sm-none"></i> <span
								class="d-none d-sm-block">저장</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 반려 모달 -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">상담반려사유</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<p>
						해당 시간에는 일정이 있어 상담 시간을 일주일 후로 미뤄주게나<br /> 일주일 후에 적성검사지를 준비해주게나.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 상담시간 경고 모달 -->
	<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">상담시간 안내</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<p>
						예약된 상담시간이 아닙니다.<br /> 상담시간에 버튼을 클릭하면 비대면 상담이 시작됩니다.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 삭제확인 -->
	<!--Basic Modal -->
	<div class="modal fade text-left" id="default" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel1">게시글 삭제</h5>
					<button type="button" class="close rounded-pill"
						data-bs-dismiss="modal" aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<p>
						삭제한 게시글은 복원이 불가합니다.<br /> 삭제하시겠습니까?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn  btn-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
					<button type="button" class="btn btn-primary ml-1"
						data-bs-dismiss="modal">
						<i class="bx bx-check d-block d-sm-none"></i> <span
							class="d-none d-sm-block">삭제</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>
<script>
    $(function(){
        $("#deleteBtn").on("click" ,function(){
            $("#inlineForm").removeClass("show");
            $("#default").find("button").on("click", function(){
                $(".modal-backdrop").removeClass("show");
            });
        });
    });
</script>