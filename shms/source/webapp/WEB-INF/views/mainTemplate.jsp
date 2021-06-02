<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title><tiles:getAsString name="mainTitle" /></title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  
  <tiles:insertAttribute name="mainPreScript" />
  <link href="${cPath }/resources/main/css/main.css" rel="stylesheet">
</head>

<body>
  <!-- preloader start -->
  <div class="preloader">
    <img src="${cPath }/resources/main/images/preloader.gif" alt="preloader">
  </div>
  <!-- preloader end -->

<!-- header -->
<header class="fixed-top header">
  <tiles:insertAttribute name="mainHeader"/>
</header>
<!-- /header -->

<tiles:insertAttribute name="mainContent"/>

<!-- footer -->
<footer>
  <tiles:insertAttribute name="mainFooter"/>
</footer>
<!-- /footer -->

<tiles:insertAttribute name="mainPostScript"/>

</body>
</html>