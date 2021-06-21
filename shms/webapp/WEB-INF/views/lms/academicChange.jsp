<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 21.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-content">
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">학적관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">학적변동</li>
     </ol>
 </nav>

 <!-- contents start -->
 <section class="section">
     <div class="card">
         <div class="card-body">
             <form id="searchForm"> 
                 <div class="row">
                     <div class="col-12">
                         <div class="row">
                             <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>단과대</h6>
                                 </div>
                                 <div class="col-md-9">
                                     <fieldset class="form-group">
                                         <select class="form-select" name="col_code">
                                             <option value="">전체</option>
                                             <c:forEach items="${collegeList }" var="college">
	                                             <option value="college.col_code">
	                                             	${college.col_name }
	                                             </option>
                                             </c:forEach>
                                         </select>
                                     </fieldset>
                                 </div>
                             </div>
                             <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>학과</h6>
                                 </div>
                                 <div class="col-md-9">
                                     <fieldset class="form-group">
                                         <select class="form-select" name="sub_code">
                                             <option value="">전체</option>
                                             <c:forEach items="${subjectList }" var="subject">
	                                             <option value="${subject.sub_code }">
	                                             	${subject.sub_name }
	                                             </option>
                                             </c:forEach>
                                         </select>
                                     </fieldset>
                                 </div>
                             </div>
                             <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>변동</h6>
                                 </div>
                                 <div class="col-md-9">
                                     <fieldset class="form-group">
                                         <select class="form-select" name="req_cl_code">
                                         	<option>전체</option>
                                         	<c:forEach items="${comcodeList }" var="comcode">
                                            	<option value="${comcode.com_code }">${comcode.com_code_nm }</option>
                                         	</c:forEach>
                                         </select>
                                     </fieldset>
                                 </div>
                             </div>
                             <div class="col-md-3 mb-2 row">
                                 <div class="col-md-auto searchTitle">
                                     <h6>검색</h6>
                                 </div>
                                 <div class="col-md-9">
                                     <div class="input-group mb-3">
                                         <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                                         <button class="btn btn-outline-secondary searchInput" type="button">
                                             <i class="bi bi-search"></i>
                                         </button>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <input type="hidden" name="searchWord" value=""/>
             </form>

             <div class="table-responsive">
                 <table class="table table-bordered mb-0">
                     <thead>
                         <tr class="bg-th">
                             <th class="text-center">신청번호</th>
                             <th class="text-center">단과대</th>
                             <th class="text-center">학과</th>
                             <th class="text-center">학번</th>
                             <th class="text-center">이름</th>
                             <th class="text-center">신청일</th>
                             <th class="text-center">처리일</th>
                             <th class="text-center">변동사항</th>
                             <th class="text-center">상태</th>
                         </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <td class="text-center">23456</td>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center">S1013230</td>
                             <td class="text-center">김윤지</td>
                             <td class="text-center">2020.04.02</td>
                             <td class="text-center">2020.05.02</td>
                             <td class="text-center">휴학</td>
                             <td class="text-center">
                                 <!-- 해당 변동사항의 view로 이동해야함 -->
                                 <a href="${cPath }/lms/academicChangeView.do" class="badge bg-success white-color">완료</a>
                             </td>
                         </tr>
                         <tr>
                             <td class="text-center">23456</td>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center">S1013230</td>
                             <td class="text-center">김윤지</td>
                             <td class="text-center">2020.04.02</td>
                             <td class="text-center">2020.05.02</td>
                             <td class="text-center">휴학</td>
                             <td class="text-center">
                                 <!-- 해당 변동사항의 view로 이동해야함 -->
                                 <button type="button" class="btn badge bg-danger block failBtn" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
                                     반려
                                 </button>
                             </td>
                         </tr>
                         <tr>
                             <td class="text-center">23456</td>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center">S1013230</td>
                             <td class="text-center">김윤지</td>
                             <td class="text-center">2020.04.02</td>
                             <td class="text-center">2020.05.02</td>
                             <td class="text-center">휴학</td>
                             <td class="text-center">
                                 <!-- 해당 변동사항의 view로 이동해야함 학적변동 버튼을 누를 수 있음 -> 상태 완료로 변경됨 -->
                                 <a href="${cPath }/lms/academicChangeView.do" class="badge bg-primary white-color">승인</a>
                             </td>
                         </tr>
                         <tr>
                             <td class="text-center">23456</td>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center">S1013230</td>
                             <td class="text-center">김윤지</td>
                             <td class="text-center">2020.04.02</td>
                             <td class="text-center">2020.05.02</td>
                             <td class="text-center">휴학</td>
                             <!-- 해당 변동사항의 view로 이동해야함 -->
                             <td class="text-center">
                                 <a href="${cPath }/lms/academicChangeView.do" class="badge bg-info white-color">
                                     대기
                                 </a>
                             </td>
                         </tr>
                     </tbody>
                 </table>
                 <nav aria-label="Page navigation example" class="pagenationNav">
                     <ul class="pagination pagination-primary">
                         <li class="page-item">
                             <a class="page-link" href="#">
                                 <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                             </a>
                         </li>
                         <li class="page-item"><a class="page-link" href="#">1</a></li>
                         <li class="page-item active"><a class="page-link" href="#">2</a></li>
                         <li class="page-item"><a class="page-link" href="#">3</a></li>
                         <li class="page-item">
                             <a class="page-link" href="#">
                                 <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                             </a>
                         </li>
                     </ul>
                 </nav>
             </div>
         </div>
     </div>
 </section>    

 <!-- Vertically Centered modal Modal -->
 <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
 <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
     role="document">
     <div class="modal-content">
         <div class="modal-header">
             <h5 class="modal-title" id="exampleModalCenterTitle">
                 반려사유
             </h5>
             <button type="button" class="close" data-bs-dismiss="modal"
                 aria-label="Close">
                 <i data-feather="x"></i>
             </button>
         </div>
         <div class="modal-body">
             <p>
                 서류 미제출로 인한 반려
             </p>
         </div>
         <div class="modal-footer">
             <button type="button" class="btn btn-light-secondary"
                 data-bs-dismiss="modal">
                 <i class="bx bx-x d-block d-sm-none"></i>
                 <span class="d-none d-sm-block">닫기</span>
             </button>
         </div>
     </div>
 </div>
 <!-- contents end -->
</div>
</div>