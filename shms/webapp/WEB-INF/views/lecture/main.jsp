<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${empty staff }">
		<c:import url="/WEB-INF/views/lecture/studentMain.jsp"></c:import>
	</c:when>
	<c:when test="${not empty staff }">
		<c:import url="/WEB-INF/views/lecture/professorMain.jsp"></c:import>
	</c:when>
</c:choose>