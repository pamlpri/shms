<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">편의시설</a></li>
			<li class="breadcrumb-item active" aria-current="page">도서관 열람실
				예약</li>
		</ol>
	</nav>

	<section class="section">
		<div class="card">
			<div class="card-body">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link active tabBtn" id="seatWrap1-tab"
						data-bs-toggle="tab" href="#seatWrap1" role="tab"
						aria-controls="seatWrap1" aria-selected="false">1열람실</a></li>
					<li class="nav-item" role="presentation"><a
						class="nav-link tabBtn" id="seatWrap2-tab" data-bs-toggle="tab"
						href="#seatWrap2" role="tab" aria-controls="seatWrap2"
						aria-selected="true">2열람실</a></li>
					<li class="nav-item" role="presentation"><a
						class="nav-link tabBtn" id="mySeat-tab" data-bs-toggle="tab"
						href="#mySeat" role="tab" aria-controls="mySeat"
						aria-selected="true">예약내역</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade seat show active" id="seatWrap1"
						role="tabpanel" aria-labelledby="seatWrap1-tab">
						<div class="row">
							<div class="col-lg-9" id="seat1">
								<!-- seat 출력 -->
								<div class="text-center front">
									<strong>출입문</strong>
								</div>
								<c:set var="i" value="0" />
								<c:set var="j" value="10" />
								<c:set var="flag" value="false" />
								<table class="seatTable">
									<c:forEach items="${facilityList }" var="facility">
										<c:if test="${facility.detail_no eq 101}">
											<c:set var="flag" value="true" />
										</c:if>
										<c:if test="${not flag }">
											<c:if test="${i % j == 0 }">
												<tr>
											</c:if>
											<c:choose>
												<c:when test="${facility.rsv_posbl_at eq 'N' }">
													<td class="rent">${facility.detail_no }</td>
												</c:when>
												<c:otherwise>
													<td>${facility.detail_no }</td>
												</c:otherwise>
											</c:choose>
											<c:if test="${i % j == j-1 }">
												</tr>
											</c:if>
											<c:set var="i" value="${i+1}" />
										</c:if>
									</c:forEach>
								</table>
							</div>
							<div class="col-lg-3 choiceWrap">
								<p style="margin: 10px 0;">※ 열람실은 당일 예약만 가능합니다.</p>
								<form class="choiceBox">
									<h5>열람실 예약</h5>
									<ul class="seatInfo">
										<li><strong>학번 </strong>${student.stdnt_no }</li>
										<li><strong>이름 </strong>${student.name }</li>
										<li><strong>열람실 </strong>1열람실</li>
										<li><strong>좌석 </strong> <span class="seatNum"></span></li>
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<fmt:formatDate value="${now }" var="today" />
										<li><strong>예약일 </strong>${today }</li>
									</ul>
									<div>
										<button type="button" class="btn btn-primary block rentBtn"
											style="width: 100%;" data-bs-toggle="modal"
											data-bs-target="#exampleModalCenter">좌석예약</button>
									</div>
									<ul class="seatStat">
										<li><span class="nomal"></span> <span>예약가능</span></li>
										<li><span class="rent"></span> <span>예약불가</span></li>
										<li><span class="choice"></span> <span>선택좌석</span></li>
									</ul>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane fade row seat" id="seatWrap2" role="seatWrap2"
						aria-labelledby="seatWrap2-tab">
						<div class="row">
							<div class="col-lg-9" id="seat1">
								<!-- seat 출력 -->
								<div class="text-center front">
									<strong>출입문</strong>
								</div>
								<c:set var="a" value="100" />
								<c:set var="b" value="10" />
								<c:set var="flag_b" value="false" />
								<table class="seatTable">
									<c:forEach items="${facilityList }" var="facility"
										varStatus="cnt">
										<c:if test="${cnt.index >= 100 }">
											<c:if test="${facility.detail_no eq 201}">
												<c:set var="flag_b" value="true" />
											</c:if>
											<c:if test="${not flag_b }">
												<c:if test="${a % b == 0 }">
													<tr>
												</c:if>
												<c:choose>
													<c:when test="${facility.rsv_posbl_at eq 'N' }">
														<td class="rent">${facility.detail_no }</td>
													</c:when>
													<c:otherwise>
														<td>${facility.detail_no }</td>
													</c:otherwise>
												</c:choose>
												<c:if test="${a % b == b-1 }">
													</tr>
												</c:if>
												<c:set var="a" value="${a+1}" />
											</c:if>
										</c:if>
									</c:forEach>
								</table>
							</div>
							<div class="col-lg-3 choiceWrap">
								<p style="margin: 10px 0;">※ 열람실은 당일 예약만 가능합니다.</p>
								<form class="choiceBox">
									<h5>열람실 예약</h5>
									<ul class="seatInfo">
										<li><strong>학번 </strong>${student.stdnt_no }</li>
										<li><strong>이름 </strong>${student.name }</li>
										<li><strong>열람실 </strong>2열람실</li>
										<li><strong>좌석 </strong> <span class="seatNum"></span></li>
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<fmt:formatDate value="${now }" var="today" />
										<li><strong>예약일 </strong>${today }</li>
									</ul>
									<div>
										<button type="button" class="btn btn-primary block rentBtn"
											style="width: 100%;" data-bs-toggle="modal"
											data-bs-target="#exampleModalCenter">좌석예약</button>
									</div>
									<ul class="seatStat">
										<li><span class="nomal"></span> <span>예약가능</span></li>
										<li><span class="rent"></span> <span>예약불가</span></li>
										<li><span class="choice"></span> <span>선택좌석</span></li>
									</ul>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane fade row seat" id="mySeat" role="mySeat"
						aria-labelledby="mySeat-tab">
						<section class="section">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-4">
											<!-- 예약한 좌석이 있을때 -->
											<div class="roomQr" id="roomQrBlock">
												<!-- QR 자리 -->
												<img src="${cPath}/resources/lms/assets/images/qr.jpg" />
												<div id="qrcode"></div>
												<p class="text-center">
													<br/>
													입구에 비치된 카메라에<br />QR코드 인식 후 입실해야 합니다.
												</p>
											</div>
											<!-- 예약한 좌석이 없을때 -->
											<div class="roomQr text-center" id="roomQrNone">
												<img
													src="${cPath}/resources/lms/vendors/images/logo_black.png" />
												<p class="text-center">예약한 열람실 좌석이 없습니다.</p>
											</div>
										</div>
										<div class="col-lg-8">
											<table class="table table-striped" id="table1">
												<thead>
													<tr>
														<th class="text-center">No.</th>
														<th class="text-center">예약번호</th>
														<th class="text-center">좌석번호</th>
														<th class="text-center">예약일</th>
													</tr>
												</thead>
												<tbody>
													<c:choose>
														<c:when test="${not empty facilityRcvList }">
															<c:forEach items="${facilityRcvList }" var="facilityRcv"
																varStatus="i">
																<tr>
																	<td class="text-center">${i.index +1 }</td>
																	<td class="text-center">${facilityRcv.rsv_no }</td>
																	<td class="text-center"><c:choose>
																			<c:when test="${facilityRcv.facility_no <= 100 }">
			                                                    			1열람실 ${facilityRcv.detail_no }번
			                                                    		</c:when>
																			<c:otherwise>
			                                                    			2열람실 ${facilityRcv.detail_no }번
			                                                    		</c:otherwise>
																		</c:choose></td>
																	<td class="text-center">${facilityRcv.rsv_dt }</td>
																</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<tr>
																<td class="text-center" colspan="4">도서관 열람실 예약 내역이
																	없습니다.</td>
															</tr>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 모달 -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">도서관 열람실
						예약</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<p>
						도서관 열람실 예약이 완료되었습니다.<br /> 예약한 좌석은 본인만 사용할 수 있습니다.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- contents end -->
</div>
<script type="text/javascript"
	src="${cPath }/resources/lecture/dist/js/qrcode.js"></script>
<script>
    $(function(){
    	let exist = "${exist}";
    	console.log(exist);
    	if(exist == "notNull") {
    		$("#roomQrBlock").css("display", "block");
    		$("#roomQrNone").css("display", "none");
    	} else {
    		$("#roomQrBlock").css("display", "none");
    		$("#roomQrNone").css("display", "block");
    	}
    	
    	$(".roomQr").addClass("hide");
    	$("#roomQrNone").removeClass("hide");
    	var qrcode = new QRCode(document.getElementById("qrcode"), {
			text : '${user.user[0]},readingroom',
			width: 128,
			height: 128,
			colorDark : "#000000",
			colorLight : "#ffffff",
			correctLevel : QRCode.CorrectLevel.H
		});
    	
        $(".seat").find("table").on("click", "td", function(){
            $(".seat").find("table td").removeClass("choice");
            $(this).addClass("choice");
            var num = $(this).text();

            $(".choiceWrap").find(".seatNum").text(num + "번");
            $("input[name='facility_no']").val(num);
        });

        $(".tabBtn").on("click", function(){
            $(".seat").find("table td").removeClass("choice");
            $(".choiceWrap").find(".seatNum").text("");
        });

        $(".rentBtn").on("click", function(){
            if($(".choiceWrap").find(".seatNum").text() == null || $(".choiceWrap").find(".seatNum").text() == ""){
                $("#exampleModalCenter").find(".modal-body p").text("선택하신 좌석이 없습니다.");
                $(".choiceBox").reset();
            }else {
                $("#exampleModalCenter").addClass("show");
                let facility_no = $(".choiceWrap").find(".seatNum").text();
                facility_no = facility_no.split('번');
                $.ajax({
                	url: "${cPath}/lms/readingroomInsert.do"
                	, method: "post"
                	, data: {"facility_no" : facility_no[0]}
                	, success : function(res) {
                		if(res == 'OK') {
                			location.href="${cPath}/lms/readingroom.do"
                			$(".roomQr").removeClass("hide");
                			$("#roomQrNone").addClass("hide");
                		} else if(res == "FAIL") {
                			$("#exampleModalCenter").find(".modal-body p").text("이미 열람실을 예약하셨습니다.");
                			$(".roomQr").removeClass("hide");
                			$("#roomQrNone").addClass("hide");
                		}
                	}
                	, error : function(xhr, error, msg) {
                		console.log(xhr);
                		console.log(error);
                		console.log(msg);
                	}
                });
            }
        });
        
//         $("#mySeat-tab").on("click", function(){
//             if($(".choiceWrap").find(".seatNum").text() == null || $(".choiceWrap").find(".seatNum").text() == ""){
//                 $("#exampleModalCenter").find(".modal-body p").text("선택하신 좌석이 없습니다.");
//                 $(".choiceBox").reset();
//             }else {
//                 $("#exampleModalCenter").addClass("show");
//                 let facility_no = $(".choiceWrap").find(".seatNum").text();
//                 facility_no = facility_no.split('번');
//                 $.ajax({
//                 	url: "${cPath}/lms/readingroomInsert.do"
//                 	, method: "post"
//                 	, data: {"facility_no" : facility_no[0]}
//                 	, success : function(res) {
//                 		if(res == 'OK') {
//                 			location.href="${cPath}/lms/readingroom.do"
//                 			$(".roomQr").removeClass("hide");
//                 			$("#roomQrNone").addClass("hide");
//                 		} else if(res == "FAIL") {
//                 			$("#exampleModalCenter").find(".modal-body p").text("이미 열람실을 예약하셨습니다.");
//                 			$(".roomQr").removeClass("hide");
//                 			$("#roomQrNone").addClass("hide");
//                 		}
//                 	}
//                 	, error : function(xhr, error, msg) {
//                 		console.log(xhr);
//                 		console.log(error);
//                 		console.log(msg);
//                 	}
//                 });
//             }
//         });
    });
    
</script>

<script
	src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>
