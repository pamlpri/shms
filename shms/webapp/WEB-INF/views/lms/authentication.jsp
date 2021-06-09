<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>인재대학교 통합정보시스템</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="${cPath }/resources/lms/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${cPath }/resources/lms/vendors/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${cPath }/resources/lms/vendors/images/favicon-16x16.png">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${cPath }/resources/lms/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${cPath }/resources/lms/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${cPath }/resources/lms/vendors/jquery-steps/jquery.steps.css">
	<link rel="stylesheet" type="text/css" href="${cPath }/resources/lms/vendors/styles/style.css">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
</head>
<body class="login-page">
	<div class="login-header box-shadow">
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="${cPath }/lms/login.do">
					<img src="${cPath }/resources/lms/vendors/images/logo_black.png" alt="">
				</a>
			</div>
		</div>
	</div>
	<div class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-7">
					<img src="${cPath }/resources/lms/vendors/images/forgot-password.png" alt="">
				</div>
				<div class="col-md-5 col-lg-5">
					<div class="register-box bg-white box-shadow border-radius-10">
						<div class="wizard-content">
							<form class="tab-wizard2 wizard-circle wizard">
								<h5>본인인증<br/>인증방법 선택</h5>
								<section>
									<br/>
									<div class="form-wrap max-width-600 mx-auto">
										<div class="form-group align-items-center row mt-5">
											<div class="row col-lg-12 text-center">
												<div class="custom-control custom-radio pb-0 col-lg-6">
													<input type="radio" id="email" name="authType" class="custom-control-input" value="email">
													<label class="custom-control-label" for="email">이메일인증</label>
												</div>
												<div class="custom-control custom-radio pb-0 col-lg-6">
													<input type="radio" id="phone" name="authType" class="custom-control-input" value="phone">
													<label class="custom-control-label" for="phone">휴대폰인증</label>
												</div>
											</div>
										</div>
										<p class="mt-4">새비밀번호 발급을 위한 본인인증이 필요합니다.</p>
									</div>
								</section>
								<!-- Step 2 -->
								<h5>본인인증<br/>인증정보 입력</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto" id="emailBox">
										<p class="mt-4 text-center mb-4">입력하신 아이디의 회원정보와 일치하는<br/>이메일로 인증번호가 전송됩니다.</p>
										<div class="form-group row mt-5">
											<label class="col-sm-4 col-form-label">아이디</label>
											<div class="col-sm-8">
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">이메일주소</label>
											<div class="col-sm-8">
												<input type="email" class="form-control">
											</div>
										</div>
									</div>
									
									<div class="form-wrap max-width-600 mx-auto" id="phoneBox">
										<p class="mt-4 text-center mb-4">입력하신 아이디의 회원정보와 일치하는<br/>전화번호로 인증번호가 전송됩니다.</p>
										<div class="form-group row mt-5">
											<label class="col-sm-4 col-form-label">아이디</label>
											<div class="col-sm-8">
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">전화번호</label>
											<div class="col-sm-8">
												<input type="tel" class="form-control">
											</div>
										</div>
									</div>
								</section>
								<!-- Step 3 -->
								<h5>본인인증<br/>인증번호 입력</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto">
										<p class="mt-4 text-center mb-4">인증번호가 전송되었습니다.</p>
										<div class="form-group row mt-5">
											<label class="col-sm-4 col-form-label">인증번호 입력</label>
											<div class="col-sm-8">
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="float-right">
											<span style="color :#e83e8c;">유효시간 1:12초</span>
										</div>
									</div>
								</section>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- success Popup html Start -->
	<button type="button" id="success-modal-btn" hidden data-toggle="modal" data-target="#success-modal" data-backdrop="static">Launch modal</button>
	<div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered max-width-400" role="document">
			<div class="modal-content">
				<div class="modal-body text-center font-18">
					<h5 class="mb-4">본인인증 성공</h5>
					<div class="mb-30 text-center"><img src="${cPath }/resources/lms/vendors/images/success.png"></div>
					새비밀번호를 생성하세요.
				</div>
				<div class="modal-footer justify-content-center">
					<a href="${cPath }/lms/password.do" class="btn btn-primary">확인</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- success Popup html End -->
	<!-- js -->
	<script src="${cPath }/resources/lms/vendors/scripts/core.js"></script>
	<script src="${cPath }/resources/lms/vendors/scripts/script.min.js"></script>
	<script src="${cPath }/resources/lms/vendors/scripts/process.js"></script>
	<script src="${cPath }/resources/lms/vendors/scripts/layout-settings.js"></script>
	<script src="${cPath }/resources/lms/vendors/jquery-steps/jquery.steps.js"></script>
	<script src="${cPath }/resources/lms/vendors/scripts/steps-setting.js"></script>
	<script type="text/javascript">
		$("a:contains('Next')").css("opacity", "0");
		$("input[name='authType']").on("click", function(){
			let authType = $(this).val();
			$("a:contains('Next')").animate({"opacity" : 1});
			if(authType == "email"){
				$("#emailBox").css("display", "block");
				$("#phoneBox").css("display", "none");
			}else if(authType == "phone") {
				$("#emailBox").css("display", "none");
				$("#phoneBox").css("display", "phone");
			}
		});
	</script>
</body>
</html>