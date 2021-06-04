<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 4.      박초원        최초작성
* 2021. 6. 4.      송수미        웹메일 조회 기능 구현
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="page-content">
   <!-- contents start -->
   <nav aria-label="breadcrumb">
       <ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">웹메일</a></li>
       		<li class="breadcrumb-item active" aria-current="page">받은메일</li>
       </ol>
   </nav>
   
   <div class="card">
       <div class="card-body">
           <div class="container-fluid">
               <div class="email-right-box">
                   <div class="toolbar" role="toolbar">
                       <div class="btn-group m-b-20">
                       		<c:choose>
                       			<c:when test="${selectMenu eq 'inbox' }">
                       				<c:url value="/lms/inbox.do" var="url" />
                       			</c:when>
                       			<c:otherwise>
                       				<c:url value="/lms/send.do" var="url" />
                       			</c:otherwise>
                       		</c:choose>
                           <button type="button" class="btn btn-light"><i class="fas fa-reply" onclick="location.href='${url}'"></i>
                           </button>
                           <button type="button" class="btn btn-light" onclick="location.href='${cPath}/lms/webmailDelete.do?send_no=${webmail.send_no }&selectMenu=${selectMenu }'"><i class="fa fa-trash"></i>
                           </button>
                       </div>
                   </div>
                   
                   <div class="read-content">
                       <div class="media pt-5">
                           <div class="media-body">
                               <h4 class="m-0 text-primary">${webmail.title }</h4>
                               <middle class="text-muted">To :
                               		<c:forEach items="${webmail.receiverList}" var="receiver" varStatus="idx">
	                               		<c:if test="${receiver.cc_at eq 'N'}">
		                               		${receiver.user.name }(${receiver.user.webmail })
		                               		<c:if test="${fn:length(webmail.receiverList) gt idx.count}">
		                               			,
		                               		</c:if>
	                               		</c:if>
                               		</c:forEach>
                               	</middle><br/>
                               <span class="float-right">${webmail.send_date }</span>
                           </div>
                           <div class="media-body">
                               <middle class="text-muted">참조 :
                               		<c:forEach items="${webmail.receiverList}" var="ccreceiver">
	                               		<c:if test="${receiver.cc_at eq 'Y'}">
		                               		${ccreceiver.user.name }(${ccreceiver.user.webmail })
		                               		<c:if test="${fn:length(webmail.receiverList) gt idx.count}">
		                               			,
		                               		</c:if>
	                               		</c:if>
                               		</c:forEach>
                               	</middle>
                           </div>
                       </div>
                       <hr>
                       <p>${webmail.cont }
                       </p>
                       <middle class="text-muted">from : ${webmail.sender_name }(${webmail.sender_webmail})</middle>
                       <hr>
                       <h6 class="p-t-15"><i class="fa fa-download mb-2"></i> 첨부파일 <span>(${fn:length(webmail.attachList) })</span></h6>
                       <div class="row m-b-30">
                       		<c:forEach items="${webmail.attachList }" var="attach">
	                           <div class="col-auto"><a href="#" class="text-muted">${attach.file_nm }</a>
	                           </div>
                       		</c:forEach>
                       </div>
                       <hr>
                   </div>
               </div>
           </div>
           <div class="text-center">
               <a href="${cPath }/lms/inbox.do" class="btn btn-primary">목록으로</a>
           </div>
       </div>
   </div>
   <!-- contents end -->
</div>