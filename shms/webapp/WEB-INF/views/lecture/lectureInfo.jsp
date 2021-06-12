<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
		<h1>${lec_name}</h1>
	</div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <c:choose>
      	<c:when test="${'ST' eq user.user[1] }">
      		<li class="breadcrumb-item"><a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
		</c:when>
		<c:otherwise>
			<li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
		</c:otherwise>
      </c:choose>
      <li class="breadcrumb-item"><a href="${cPath }/lecture/lectureInfo.do">강의실홈</a></li>
      <li class="breadcrumb-item active" aria-current="page">강의정보</li>
    </ol>
  </nav>
  
  <!-- 컨텐츠 -->
  <div class="contents">
      <div id="example1"></div>
  </div>
   <!-- pdf 뷰어 -->
  <script src="${cPath }/resources/lecture/dist/js/pdfobject.js"></script>
  <script>PDFObject.embed("https://storage.cloud.google.com/shms/lecture/%EC%83%9D%ED%99%9C%EA%B3%BC_%EC%9E%91%EB%AC%B8%EA%B0%95%EC%9D%98%EA%B3%84%ED%9A%8D%EC%84%9C.pdf?authuser=0", "#example1");</script>
  <!-- contents end -->
</div>
