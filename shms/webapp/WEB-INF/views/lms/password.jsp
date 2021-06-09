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
<body>
	<div class="login-header box-shadow">
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="${cPath }/lms/login.do">
					<img src="${cPath }/resources/lms/vendors/images/logo_black.png" alt="">
				</a>
			</div>
		</div>
	</div>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<img src="${cPath }/resources/lms/vendors/images/forgot-password.png" alt="">
				</div>
				<div class="col-md-6">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">Reset Password</h2>
						</div>
						<h6 class="mb-20">새비밀번호를 입력하세요.</h6>
						<form>
							<div class="input-group custom">
								<input type="text" class="form-control form-control-lg" placeholder="새비밀번호">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="text" class="form-control form-control-lg" placeholder="비밀번호 확인">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							<div class="row align-items-center">
								<div class="col-12">
									<div class="text-center">
										<button class="btn btn-primary btn-lg" style="width:100px">저장</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="${cPath }/resources/lms/vendors/scripts/core.js"></script>
	<script src="${cPath }/resources/lms/vendors/scripts/script.min.js"></script>
	<script src="${cPath }/resources/lms/vendors/scripts/process.js"></script>
	<script src="${cPath }/resources/lms/vendors/scripts/layout-settings.js"></script>
</body>
</html>