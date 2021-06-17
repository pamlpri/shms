<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.  박초원      최초작성
* 2021. 6. 17.  김보미 		장학금 내역 조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<div class="page-content">
<!-- contents start -->
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">HOME</a></li>
        <li class="breadcrumb-item"><a href="#">장학금관리</a></li>
        <li class="breadcrumb-item active" aria-current="page">장학금 조회</li>
    </ol>
</nav>

<section class="section">
    <div class="card">
        <div class="card-body">
            <div class="tab-content" id="myTabContent">
                <div class="table-responsive">
                    <table class="table table-striped mb-0">
                        <thead>
                            <tr>
                                <th class="text-center">학년도</th>
                                <th class="text-center">학기</th>
                                <th class="text-center">장학금명</th>
                                <th class="text-center">장학금액</th>
                                <th class="text-center">지급일자</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                        	<c:when test="${not empty schlList }">
                        		<c:forEach var="schlList" items="${schlList }">
		                            <tr>
		                                <td class="text-center">${schlList.reciv_year }학년도</td>
		                                <td class="text-center">${schlList.semstr }학기</td>
		                                <td class="text-center">${schlList.schlship_nm }</td>
		                                <td class="text-center">${schlList.recivAmt }</td>
		                                <td class="text-center">${schlList.reciv_date }</td>
		                            </tr>
                        		</c:forEach>
                        	</c:when>
                        	<c:otherwise>
                        		<tr>
                        			<td class="text-center">장학금 수혜내역이 존재하지 않습니다.</td>
                        		</tr>
                        	</c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- contents end -->
</div>