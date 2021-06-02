<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 24.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${not empty student}">
		<c:import url="/WEB-INF/views/lecture/studentMain.jsp"></c:import>
	</c:when>
	<c:when test="${not empty staff }">
		<c:import url="/WEB-INF/views/lecture/professorMain.jsp"></c:import>
	</c:when>
</c:choose>