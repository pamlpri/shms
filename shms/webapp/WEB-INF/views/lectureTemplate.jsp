<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
	name="viewport">
<title><tiles:getAsString name="lectureTitle" /></title>

<tiles:insertAttribute name="lecturePreScript" />

</head>

<body>
	<div id="app">
		<div class="main-wrapper main-wrapper-1">
			<tiles:insertAttribute name="lectureHeader"/>
			<tiles:insertAttribute name="lectureSide" />
			<tiles:insertAttribute name="lectureContent" />
			<tiles:insertAttribute name="lectureFooter" />
		</div>
	</div>

	<tiles:insertAttribute name="lecturePostScript"/>
</body>
</html>