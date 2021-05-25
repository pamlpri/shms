<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${staff.prof_at eq 'Y' }">
		<c:import url="/WEB-INF/views/lms/professorMain.jsp"></c:import>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${not empty staff.sub_code }">
				<c:import url="/WEB-INF/views/lms/departmentMain.jsp"></c:import>
			</c:when>
			<c:when test="${staff.dept_code eq '01' }">	
				<c:import url="/WEB-INF/views/lms/serviceMain.jsp"></c:import>
			</c:when>
			<c:when test="${staff.dept_code eq '02' }">	
				<c:import url="/WEB-INF/views/lms/academicMain.jsp"></c:import>
			</c:when>
			<c:when test="${staff.dept_code eq '03' }">	
				<c:import url="/WEB-INF/views/lms/employmentMain.jsp"></c:import>
			</c:when>
			<c:when test="${staff.dept_code eq '04' }">	
				<c:import url="/WEB-INF/views/lms/admissionsMain.jsp"></c:import>
			</c:when>
		</c:choose>
	</c:otherwise>
</c:choose>