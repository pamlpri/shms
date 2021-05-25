<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><tiles:getAsString name="lmsTitle" /></title>
    
    <tiles:insertAttribute name="lmsPreScript" />
</head>

<body>
    <div id="app">
	    <tiles:insertAttribute name="lmsSide" />
	    
        <div id="main">
             <tiles:insertAttribute name="lmsHeader"/>
	   		 <tiles:insertAttribute name="lmsContent" />
	   		 <tiles:insertAttribute name="lmsFooter" />
        </div>
    </div>
    <tiles:insertAttribute name="lmsPostScript"/>
</body>

</html>