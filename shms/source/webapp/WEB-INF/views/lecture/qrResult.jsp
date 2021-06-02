<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자       수정내용
* ----------  ---------  -----------------
* 2021. 5. 31.  김보미       최초작성
* 2021. 6. 01.  김보미 		 입실, 퇴실 구분
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${empty attend_time }">
		<h2>${attendInfo.stdnt_no }입실 체크 완료!</h2>
	</c:when>
	<c:when test="${not empty attend_time }">
		<h2>${attendInfo.stdnt_no }퇴실 체크 완료!</h2>
	</c:when>
</c:choose>
