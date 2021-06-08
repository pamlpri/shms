<%--
* [[개정이력(Modification Information)]]
* 수정일            수정자      수정내용
* ----------      ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* 2021. 5. 22.      최희수       로그인 form action 추가
* 2021. 5. 22.      박초원		로그인 validate 에러 효과 추가
* Copyright (c) 2021 by DDIT All right reserved
 --%>
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
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src="${cPath }/resources/lms/vendors/images/login-page-img.png" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">Login To LMS</h2>
						</div>
						<form action="${cPath }/lms/loginProcess.do" method="post" id="loginForm">
							<select	id="uId" name="user_id" onchange="Login()">
								<option>--로그인 선택--</option>
								<option value="S19101001">학생</option>
								<option value="P19101001">교수</option>
								<option value="E15002001">학적과</option>
								<option value="E15001002">학생지원과</option>
								<option value="E15004001">입학과</option>
								<option value="E15003001">취업장학과</option>
								<option value="M15101001">학과관리자</option>
							</select>
							<c:choose>
								<c:when test="${not empty errorMsg }">
								<div class="input-group custom">
		                            <input type="text" name="user_id" class="form-control form-control-lg is-invalid" placeholder="id" value="${cookie.checkID.value }">
								</div>
								<div class="input-group custom">
									<input type="password" name="user_password" class="form-control form-control-lg is-invalid uPass" placeholder="**********">
									<div class="invalid-feedback">
		                                <i class="bx bx-radio-circle"></i>
		                                ${errorMsg }
										<c:remove var="errorMsg" scope="session"/>
		                            </div>
								</div>
								</c:when>
								<c:otherwise>
									<div class="input-group custom">	
										<input type="text" name="user_id" class="form-control form-control-lg" placeholder="id" value="${cookie.checkID.value }">
										<div class="input-group-append custom">
											<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
										</div>
									</div>
									<div class="input-group custom">
										<input type="password" name="user_password" class="form-control form-control-lg uPass" placeholder="**********">
									</div>
								</c:otherwise>
							</c:choose>
						
							<div class="row pb-30">
								<div class="col-6">
									<div class="custom-control custom-checkbox">
										<c:choose>
											<c:when test="${cookie.checkID.name eq 'checkID' }">
												<input type="checkbox" class="custom-control-input" id="customCheck1" name="rememberId" checked>												
											</c:when>
											<c:otherwise>
												<input type="checkbox" class="custom-control-input" id="customCheck1" name="rememberId">
											</c:otherwise>
										</c:choose>
										<label class="custom-control-label" for="customCheck1">Remember</label>
									</div>
								</div>
								<div class="col-6">
									<div class="forgot-password"><a href="forgot_password.html">Forgot Password</a></div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										<!--
											use code for form submit
											<input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign In">
										-->
										<input type="submit" class="btn btn-primary btn-lg btn-block" value="Sign In">
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
	<script type="text/javascript">
// 		테스트용 script
	function Login() {
		let uId = $("#uId").val(); 
		switch (uId) {
		case 'S19101001':
			$(".uPass").val("001010");
			break;
		case 'P19101001':
			$(".uPass").val("770101");		
			break;
		case 'E15001002':
			$(".uPass").val("781105");
			break;
		case 'E15002001':
			$(".uPass").val("770101");
			break;
		case 'E15003001':
			$(".uPass").val("770101");
			break;
		case 'E15004001':
			$(".uPass").val("770101");	
			break;
		case 'M15101001':
			$(".uPass").val("710210");
			break;
		}
	 $("#loginForm").submit();
	}
	</script>
</body>
</html>