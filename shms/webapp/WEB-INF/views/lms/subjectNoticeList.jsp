<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 08.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
     	  <c:choose>
			 <c:when test="${not empty student }">
	               <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
	         </c:when>
	         <c:otherwise>
	               <li class="breadcrumb-item"><a href="${cPath }/lms/main.do">HOME</a></li>
	         </c:otherwise>
     	  </c:choose>
          <li class="breadcrumb-item"><a href="#">게시판/일정관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">학과공지</li>
      </ol>
  </nav>

  <!-- contents start -->
  <section class="section">
      <div class="card">
          <div class="card-body">
              <table class="table table-striped" id="table1">
                  <thead>
                      <tr>
                          <th class="text-center">No.</th>
                          <th class="text-center">제목</th>
                          <th class="text-center">작성자</th>
                          <th class="text-center">작성일</th>
                          <th class="text-center">조회수</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                      <tr>
                          <td class="text-center">1</td>
                          <td class="text-center">
                              <a class="text-color noticeTitle" href="${cPath}/lms/subjectNoticeView.do">학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목 학사공지 제목</a>
                          </td>
                          <td class="text-center">이현수</td>
                          <td class="text-center">2021.05.03</td>
                          <td class="text-center">200</td>
                      </tr>
                  </tbody>
              </table>
              <div class="breadcrumb breadcrumb-right">
                  <a href="${cPath }/lms/subjectNoticeForm.do" type="button" class="btn btn-primary" >
                      <i class="fas fa-edit"></i> 글쓰기
                  </a>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>