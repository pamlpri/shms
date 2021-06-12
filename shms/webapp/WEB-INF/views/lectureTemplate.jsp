<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 21.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
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
	
	<script type="text/javascript">
	$(function(){
		var param = document.location.href.split("/");
		url = param[param.length-1].split(".")[0];
		console.log(url);
		
		let aTag = $(".dropdown").find("a");
		$(aTag).each(function(idx, aTag){
			let aHref = $(this).attr("href").split("/");
			aHref = aHref[aHref.length-1].split(".")[0];
			if(aHref.includes(url)){
				console.log(aHref);
				$(this).parent("li").addClass("active");
				$(this).parents(".dropdown-menu").addClass("active");
				$(this).parents(".dropdown").addClass("active");
			}
		});
	})
</script>
</body>
</html>