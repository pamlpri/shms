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
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
	<title><tiles:getAsString name="subjectTitle" /></title>
	<tiles:insertAttribute name="subjectPreScript" />
  </head>

  <body>
    <!--================ Start Header Menu Area =================-->
    <header class="header_area">
      <tiles:insertAttribute name="subjectHeader" />
    </header>
    <!--================ End Header Menu Area =================-->
	
	<tiles:insertAttribute name="subjectContent"/>
    
    <!--================ Start footer Area  =================-->
    <footer class="footer-area section_gap">
      <tiles:insertAttribute name="subjectFooter"/>
    </footer>
    <!--================ End footer Area  =================-->
    
    <tiles:insertAttribute name="subjectPostScript" />
  </body>
</html>
