<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 3.   박초원      최초작성
* 2021. 6. 7.   김보미		정보출력
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
   <!-- contents start -->
   <nav aria-label="breadcrumb">
       <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="#">HOME</a></li>
           <li class="breadcrumb-item"><a href="#">증명서</a></li>
           <li class="breadcrumb-item active" aria-current="page">증명서신청</li>
       </ol>
   </nav>

   <section class="section">
       <div class="card inputTable">
           <div class="card-body">
               <h5>증명서결제</h5>
               <form class="table-responsive">
                   <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                       <tr>
                           <th class="align-middle text-center">학과</th>
                           <td class="align-middle">${student.sub_name }</td>
                       </tr>
                       <tr>
                           <th class="align-middle text-center">신청증명서</th>
                           <td class="align-middle">${crtf_kind }</td>
                       </tr>
                       <tr>
                           <th class="align-middle text-center">발급통수</th>
                           <td class="align-middle">${no_of_issue} 통</td>
                       </tr>
                       <tr>
                           <th class="align-middle text-center">결제금액</th>
                           <td class="align-middle">${won }원</td>
                       </tr>
                   </table>
                   <div class="text-center">
                       <button type="button" class="btn btn-primary"
                           style="margin-top: 20px;" id="payBtn">결제
                       </button>
                   </div>
                   <!--primary theme Modal -->
                   <div class="modal fade text-left" id="primary" tabindex="-1"
                       role="dialog" aria-labelledby="myModalLabel160"
                       aria-hidden="true">
                       <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                           role="document">
                           <div class="modal-content">
                               <div class="modal-header bg-primary">
                                   <h5 class="modal-title white" id="myModalLabel160">
                                       증명서 발급완료
                                   </h5>
                                   <button type="button" class="close"
                                       data-bs-dismiss="modal" aria-label="Close">
                                       <i data-feather="x"></i>
                                   </button>
                               </div>
                               <div class="modal-body text-center">
                                   <i class="fas fa-comment-dollar text-primary" style="font-size: 2em; margin-bottom:3%;"></i><br/>
                                   <br/>
                                   <h4>결제가 정상적으로 완료 되었습니다.</h4>
                                   <p>
                                       확인을 누르시면 증명서보관함으로 이동합니다.
                                   </p>
                                   <br/>
                                   <a href="${cPath}/lms/certificateStorage.do" class="btn btn-primary ml-1">
                                       <i class="bx bx-check d-block d-sm-none"></i>
                                       <span class="d-none d-sm-block">확인</span>
                                   </a>
                               </div>
                           </div>
                       </div>
                   </div>
               </form>
           </div>
       </div>
       <div class="card">
           <div class="card-body">
               <ul class="certificateInfo">
                   <li>
                       효율적인 고객지원을 위하여 신용카드 결제를 권장합니다.
                   </li>
                   <li>
                       결제내역은 LG데이콤 홈페이지에서 확인 가능합니다.
                   </li>
                   <li>
                       결제창이 열리지 않을 시, 도구 -> 호환성보기를 선택한 후 다시
                       시도하여 주시기 바랍니다.
                   </li>
               </ul>
           </div>
       </div>
   </section>
   <!-- contents end -->
</div>
<div class="modal-backdrop fade"></div>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$("#payBtn").on("click", function(){
		var IMP = window.IMP; // 생략가능
		  IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		  IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '증명서명:${crtf_kind}',
		    amount : '100',
		    buyer_email : '${student.email}',
		    buyer_name : '${student.sub_name}',
		    buyer_tel : '${student.tel_no}',
		    buyer_addr : '${student.addr1}',
		    buyer_postcode : '${student.zipcode}',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        $(".modal-backdrop").addClass("show").css("display", "block");
				$("#primary").addClass("show").css("display","block");
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		});
	});
</script>
