<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 20.      송수미        강의 공지사항 목록 조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>${lec_name }</h1>
    </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="#">강의개요</a></li>
          <li class="breadcrumb-item active" aria-current="page">공지사항</li>
      </ol>
  </nav>

  <section class="section">
      <div class="section-body">
          <h2 class="section-title">공지사항</h2>
          <div class="row">
              <div class="col-12">
                  <div class="card">
                  <div class="card-body">
                      <div class="table-responsive">
                      <table class="table table-striped" id="notice-table">
                          <thead>                                 
                          <tr>
                              <th class="text-center">No.</th>
                              <th class="text-center">제목</th>
                              <th class="text-center">작성일</th>
                              <th class="text-center">작성자</th>
                              <th class="text-center">조회수</th>
                          </tr>
                          </thead>
                          <tbody>
                          	<c:choose>
                          		<c:when test="${not empty boardList }">
                          			<c:forEach items="${boardList }" var="board" varStatus="idx">
				                          <tr>
				                              <td class="text-center">${idx.count }</td>
				                              <td class="text-center">
				                                <a class="text-color" href="${cPath}/lecture/noticeView.do?bo_no=${board.bo_no}">${board.bo_title }</a>
				                              </td>
				                              <td class="text-center">${board.bo_write_de }</td>
				                              <td class="text-center">${board.bo_writer }</td>
				                              <td class="text-center">${board.bo_hit }</td>
				                          </tr>
                          			</c:forEach>
                          		</c:when>
                          		<c:otherwise>
                          			<tr class="text-center">
                          				<td colspan="5">현재 표시 가능한 공지사항이 없습니다.</td>
                          			</tr>
                          		</c:otherwise>
                          	</c:choose>                                 
                          </tbody>
                      </table>
                      <!-- 교수한테만 보여야 하는 버튼 -->
                      <div class="text-right" style="margin-top: 3%;">
                        <a href="${cPath }/lecture/noticeInsert.do" class="btn btn-icon icon-left btn-primary">
                          <i class="far fa-edit"></i> 글쓰기
                        </a>
                      </div>
                      </div>
                  </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>
<script>
$(document).ready(function() {
    $('#notice-table').DataTable({
    	
    });
} );
</script>