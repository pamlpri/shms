<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
	<title><tiles:getAsString name="majorTitle" /></title>
	<tiles:insertAttribute name="majorPreScript" />
  </head>

  <body>
    <!--================ Start Header Menu Area =================-->
    <header class="header_area">
      <tiles:insertAttribute name="majorHeader" />
    </header>
    <!--================ End Header Menu Area =================-->
	
	<tiles:insertAttribute name="majorContent"/>
    
    <!--================ Start footer Area  =================-->
    <footer class="footer-area section_gap">
      <tiles:insertAttribute name="majorFooter"/>
    </footer>
    <!--================ End footer Area  =================-->
    
    <tiles:insertAttribute name="majorPostScript" />
  </body>
</html>
