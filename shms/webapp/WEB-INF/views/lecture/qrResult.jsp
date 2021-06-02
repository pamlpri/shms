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
		<!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <!-- 강의명 -->
            <h1>대학생활의 이해</h1>
          </div>
        </section>
        
        <section class="section">
            <div class="container mt-5">
              <div class="row">
                <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                  <div class="card card-primary">
                    <div class="card-header"><h4>출석완료</h4></div>
                    <div class="card-body">
                        <div class="form-group">
                            <label class="control-label">출석이 정상적으로 완료되었습니다.</label>
                        </div>
                        <div class="form-group">
                          <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4"
                                  onclick="location.href='index.html'">
                            강의실 홈
                          </button>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
      </div>
	</c:when>
	<c:when test="${not empty attend_time }">
		<h2>${attendInfo.stdnt_no }퇴실 체크 완료!</h2>
	</c:when>
</c:choose>
