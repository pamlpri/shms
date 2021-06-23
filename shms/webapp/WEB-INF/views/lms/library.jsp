<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="page-content">
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">편의시설</a></li>
         <li class="breadcrumb-item active" aria-current="page">인재도서관</li>
     </ol>
 </nav>
 
 <section class="section">
 
 		<h4 class="h4Title"><i class="fas fa-book"></i> 대출내역</h4>
     <div class="card">
         <div class="card-body">
             <div class="table-responsive  myLibray">
                 <table class="table table-striped mb-0">
                     <thead>
                         <tr>
                             <th class="text-center">No.</th>
                             <th class="text-center">도서번호</th>
                             <th class="text-center">도서명</th>
                             <th class="text-center">저자명</th>
                             <th class="text-center">출판사명</th>
                             <th class="text-center">대출일</th>
                             <th class="text-center">반납예정일</th>
                             <th class="text-center">반납일</th>
                         </tr>
                     </thead>
                     <tbody>
                     	<c:choose>
                     		<c:when test="${not empty bookLoanList }">
                     			<c:forEach items="${bookLoanList }" var="bookLoan" varStatus="i">
	                     			<tr>
			                             <td class="text-center">${i.index + 1 }</td>
			                             <td class="text-center">${bookLoan.book_code }</td>
			                             <td class="text-center">
			                                 <p class="over align-middle">${bookLoan.book_name }</p>
			                             </td>
			                             <td class="text-center">
			                                 <p class="over align-middle">${bookLoan.book_authr }</p>
			                             </td>
			                             <td class="text-center">${bookLoan.book_pubcom }</td>
			                             <td class="text-center">${bookLoan.loan_dt }</td>
			                             <td class="text-center">${bookLoan.return_exp_dt }</td>
			                             <td class="text-center">${bookLoan.return_dt }</td>
			                         </tr>                     			
                     			</c:forEach>
                     		</c:when>
                     		<c:otherwise>
                     			<tr>
                     				<td class="text-center" colspan="8">대출 받은 목록이 없습니다.</td>
                     			</tr>
                     		</c:otherwise>
                     	</c:choose>
                     </tbody>
                 </table>
             </div>
         </div>
     </div>

     <!-- 연체내역 -->
        <h4 class="h4Title"><i class="fas fa-book"></i> 연체내역</h4>
        <div class="card">
            <div class="card-body">
                <div class="table-responsive  myLibray">
                    <table class="table table-striped mb-0">
                        <thead>
                            <tr>
                                <th class="text-center">No.</th>
                                <th class="text-center">도서번호</th>
                                <th class="text-center">도서명</th>
                                <th class="text-center">저자명</th>
                                <th class="text-center">출판사명</th>
                                <th class="text-center">대출일</th>
                                <th class="text-center">반납예정일</th>
                                <th class="text-center">연체일</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:set var="now" value="<%=new java.util.Date() %>" />
                        	<fmt:parseNumber value="${now.time / (1000*60*60*24)}" var="today" integerOnly="true"/>
                   			<c:forEach items="${bookLoanList }" var="bookLoan" varStatus="i">
	                        	<fmt:parseDate value="${bookLoan.return_exp_dt }" pattern="yyyy-MM-dd" var="returnExpDt"/>
               					<fmt:parseNumber value="${returnExpDt.time / (1000*60*60*24)}" var="returnDt" integerOnly="true"/>
                  					<c:if test="${(today - returnDt - 1) > 0 and bookLoan.return_dt == null}">
                  						<c:set var="cnt" value="1"/>
                  						<tr>
			                             <td class="text-center">${i.index + 1 }</td>
			                             <td class="text-center">${bookLoan.book_code }</td>
			                             <td class="text-center">
			                                 <p class="over align-middle">${bookLoan.book_name }</p>
			                             </td>
			                             <td class="text-center">
			                                 <p class="over align-middle">${bookLoan.book_authr }</p>
			                             </td>
			                             <td class="text-center">${bookLoan.book_pubcom }</td>
			                             <td class="text-center">${bookLoan.loan_dt }</td>
			                             <td class="text-center">${bookLoan.return_exp_dt }</td>
			                             <td class="text-center">${bookLoan.return_dt }</td>
			                         </tr>
                  					</c:if>
                   			</c:forEach>
                   			<c:if test="${empty cnt}">
           						<tr>
                    				<td class="text-center" colspan="8">연체 내역이 없습니다.</td>
                    			</tr>
                   			</c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
     <div class="card">
         <div class="card-body">
             <!-- 도서내역 -->
             <table class="table table-striped" id="table1">
                 <thead>
                     <tr>
                         <th class="text-center">도서번호</th>
                         <th class="text-center">ISBN</th>
                         <th class="text-center">도서명</th>
                         <th class="text-center">저자명</th>
                         <th class="text-center">출판사명</th>
                         <th class="text-center">상태</th>
                     </tr>
                 </thead>
                 <tbody>
                 	<c:choose>
                 		<c:when test="${not empty bookList }">
                 			<c:forEach items="${bookList }" var="book">
                 				<tr>
			                         <td class="text-center">${book.book_code }</td>
			                         <td class="text-center">${book.book_isbn }</td>
			                         <td class="align-middle text-center">
			                             <p class="over align-middle">${book.book_name }</p>
			                         </td>
			                         <td class="align-middle text-center">
			                             <p class="over2 align-middle">${book.book_authr }</p>
			                         </td>
			                         <td class="text-center">키</td>
			                         <td class="text-center">
			                         	<c:choose>
			                         		<c:when test="${book.book_stat_nm eq '대출가능'}">
			                         			<span class="badge bg-primary">${book.book_stat_nm }</span>
			                         		</c:when>
			                         		<c:otherwise>
			                         			<span class="badge bg-danger">${book.book_stat_nm }</span>
			                         		</c:otherwise>
			                         	</c:choose>
			                         </td>
		                     	</tr>
                 			</c:forEach>
                 		</c:when>
                 		<c:otherwise>
                 			<tr>
                 				<td class="text-center" colspan="6">데이터가 없습니다.</td>
                 			</tr>
                 		</c:otherwise>
                 	</c:choose>
                 </tbody>
             </table>
         </div>
     </div>

     
    </section>    
</div>
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>