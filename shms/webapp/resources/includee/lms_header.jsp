<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="mb-3">
	<a href="#" class="burger-btn d-block d-xl-none"> <i
		class="bi bi-justify fs-3"></i>
	</a>
</header>

<div class="page-heading">
	<nav aria-label="breadcrumb" id="headerTopWrap">
		<ol class="breadcrumb breadcrumb-right">
			<li id="UserName">${user.user_name }</li>
			<li><a href="${cPath}/lms/logout.do" class="btn btn-primary">로그아웃</a></li>
		</ol>
	</nav>
</div>