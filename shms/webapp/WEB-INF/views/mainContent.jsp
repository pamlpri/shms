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
  
  
  <link rel="stylesheet" href="${cPath }/resources/main/assets/css/bootstrap.css">
  <link rel="stylesheet" href="${cPath }/resources/main/assets/vendors/bootstrap-icons/bootstrap-icons.css">
  <tiles:insertAttribute name="mainPreScript" />
  <link href="${cPath }/resources/main/css/sub_common.css" rel="stylesheet">
  <link href="${cPath }/resources/main/css/about.css" rel="stylesheet">
  <link href="${cPath }/resources/main/css/community.css" rel="Stylesheet">
  
  <link href='${cPath }/resources/main/lib/main.css' rel='stylesheet' />
  <script src='${cPath }/resources/main/lib/main.js'></script>
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
<div class="body-inner">
  <section id="main-container" class="main-container">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 order-1 order-lg-0">
          <tiles:insertAttribute name="mainSide"/>
  
        <div class="col-lg-9 mb-5 mb-lg-0 order-0 order-lg-1">
          	<tiles:insertAttribute name="mainContent"/>
        </div><!-- Content Col end -->
      </div><!-- Main row end -->
  
    </div><!-- Container end -->
  </section><!-- Main container end -->

<!-- footer -->
<footer>
  <tiles:insertAttribute name="mainFooter"/>
</footer>
<!-- /footer -->

<tiles:insertAttribute name="mainPostScript"/>

<script src="${cPath }/resources/main/js/sidebar.js"></script>
</body>
</html>