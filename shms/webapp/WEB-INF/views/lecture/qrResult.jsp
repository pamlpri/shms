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
            <c:forEach var="lecture" items="${lecture }" begin="0" end="0">
				<h1>${lecture.lec_name}</h1>
            </c:forEach>
          </div>
        </section>
        
        <section class="section">
            <div class="container mt-5">
              <div class="row">
                <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                  <div class="card card-primary">
                    <div class="card-header"><h4>입실완료</h4></div>
                    <div class="card-body">
                        <div class="form-group">
                            <label class="control-label">입실이 정상적으로 완료되었습니다.</label>
                        </div>
                        <div class="form-group">
                          <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4"
                                  onclick="location.href='${cPath}/lecture/index.do?lec_code=${lec_code}'">
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
		<!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <!-- 강의명 -->
            <c:forEach var="lecture" items="${lecture }" begin="0" end="0">
				<h1>${lecture.lec_name}</h1>
            </c:forEach>
          </div>
        </section>
        
        <section class="section">
            <div class="container mt-5">
              <div class="row">
                <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                  <div class="card card-primary">
                    <div class="card-header"><h4>퇴실완료</h4></div>
                    <div class="card-body">
                        <div class="form-group">
                            <label class="control-label">퇴실이 정상적으로 완료되었습니다.</label>
                        </div>
                        <div class="form-group">
                          <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4"
                                  onclick="location.href='${cPath}/lecture/index.do?lec_code=${lec_code}'">
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
</c:choose>
