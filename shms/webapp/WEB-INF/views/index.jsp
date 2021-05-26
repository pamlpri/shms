<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- hero slider -->
<section class="hero-section overlay bg-cover" data-background="${cPath }/resources/main/images/banner/banner-1.jpg">
  <div class="container">
    <div class="hero-slider">
      <!-- slider item -->
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8">
            <h1 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">미래가치를 창출하다</h1>
            <p class="text-muted mb-4" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">
            	긍지와 의지를 길러 스스로 진리탐구의 고귀한 사명을 다하여<br/>
				      투철한 자립정신으로 국가기반을 확고히 하며<br/>
           		홍익인간의 이념을 구현합니다.                
            </p>
          </div>
        </div>
      </div>
      <!-- slider item -->
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8">
            <h1 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">인재대학교</h1>
            <p class="text-muted mb-4" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">
            	공학과 인문학을 넘어 메디컬까지<br>
				      인재대학교는 진정한 '종합대학'입니다.            	
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /hero slider -->

<!-- banner-feature -->
<section class="bg-gray overflow-md-hidden">
  <div class="container-fluid p-0">
    <div class="row no-gutters">
      <div class="col-xl-4 col-lg-5 align-self-end">
        <img class="img-fluid w-100" src="${cPath }/resources/main/images/banner/banner-feature.png" alt="banner-feature">
      </div>
      <div class="col-xl-8 col-lg-7">
        <div class="row feature-blocks bg-gray justify-content-between">
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-agenda mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4"><a class="facility" href="education.html">교육이념</a></h3>
            <p>
              인재대학교는 성실·인화·창조의 정신으로 심오한 학문의 이론과 응용을 연구하고
              가르치며, 이를 통해 인류사회를 선도할 인재를 양성하고 사회혁신을 이끌
              산학협력을 발전시켜, 국가 및 인류의 발전과 번영에 기여하는 것을 목적으로 한다.
            </p>
          </div>
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-book mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4"><a class="facility" href="library.html">인재도서관</a></h3>
            <p>
              2020년에 개관한 인재대학교 인재도서관은 5층의 공간에,
              25만여 권의 장서 및 학술지와 간행물을 보유한 개가 열람실과,
              각종 멀티미디어 장비를 보유한 스터디룸 그리고 1,2층에 학생들이 자유롭게
              공부할 수 있는 160석 규모의 열람실을 운영하고 있습니다.
            </p>
          </div>
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-blackboard mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4"><a class="facility" href="${cPath }/lms/login.do">체계적 강의</a></h3>
            <p>
              교육의 개념과 목적에 관한 다양한 견해를 검토하고,
              제도교육의 실상에 관한 구체적이고도 체계적인 안목을 제공합니다.
              교육 및 교육학에 대한 체계적인 이해를 도모하고 있습니다.
            </p>
          </div>
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-write mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4"><a class="facility" href="${cPath }/lms/login.do">취업지원</a></h3>
            <p>
               개인별 취업역량 등에 대한 정확한 진단을 토대로 경로설정, 의욕·능력증진, 집중 취업알선에 이르는
               통합적인 취업지원 프로그램을 제공하고, 인재대학교만의 글로벌 인재의 노동시장 진입을
               체계적으로 지원하는 종합적인 취업지원을 제공합니다.
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /banner-feature -->

<!-- /# row -->
<section id="main-content" >
  <div class="row"  id="boardArea">
      <div class="col-lg-6">
          <div class="card board">
              <div class="card-title">
                  <h4>학사공지<a href="${cPath }/main/community/academicList.do" class="text-navy-color" style="float: right; padding-right: 20px;"><i class="fas fa-plus"></i></a></h4>
              </div>
              <div class="card-body board-body">
                  <div class="table-responsive">
                      <table class="table">
                          <thead>
                              <tr>
                                  <th class="text-center">No.</th>
                                  <th class="text-center">제목</th>
                                  <th class="text-center">작성일</th>
                                  <th class="text-center">조회수</th>
                              </tr>
                          </thead>
                          <tbody>
                          <c:choose>
                          	<c:when test="${not empty dgList }">
                          		<c:forEach items="${dgList }" var="dgBoard">
	                              <tr>
	                                <th scope="row" class="text-center">${dgBoard.p_bo_no }</th>
	                                <td class="text-center"><a href="${cPath }/main/community/academicView.do?${dgBoard.bo_no}">${dgBoard.bo_title }</a></td>
	                                <td class="text-center">${dgBoard.bo_write_de }</td>
	                                <td class="text-center">${dgBoard.bo_hit }</td>
	                              </tr>
                          		</c:forEach>
                          	</c:when>
                          	<c:otherwise>
                          		<tr>
                          			<td colspan="4" class="text-center">등록된 글이 존재하지 않습니다.</td>
                          		</tr>
                          	</c:otherwise>
                          </c:choose>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      <!-- /# column -->
      <div class="col-lg-6">
        <div class="card board">
            <div class="card-title">
                <h4>장학공지<a href="${cPath }/main/community/scholarshipList.do" class="text-navy-color" style="float: right; padding-right: 20px;"><i class="fas fa-plus"></i></a></h4>
            </div>
            <div class="card-body board-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="text-center">No.</th>
                                <th class="text-center">제목</th>
                                <th class="text-center">작성일</th>
                                <th class="text-center">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                          <c:choose>
                          	<c:when test="${not empty jgList }">
                          		<c:forEach items="${jgList }" var="jgBoard">
	                              <tr>
	                                <th scope="row" class="text-center">${jgBoard.p_bo_no }</th>
	                                <td class="text-center"><a href="${cPath }/main/community/academicView.do?${jgBoard.bo_no}">${jgBoard.bo_title }</a></td>
	                                <td class="text-center">${jgBoard.bo_write_de }</td>
	                                <td class="text-center">${jgBoard.bo_hit }</td>
	                              </tr>
                          		</c:forEach>
                          	</c:when>
                          	<c:otherwise>
                          		<tr>
                          			<td colspan="4" class="text-center">등록된 글이 존재하지 않습니다.</td>
                          		</tr>
                          	</c:otherwise>
                          </c:choose>                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
      </div>
      <!-- /# column -->
      </div>
      
  </div>
  <!-- /# row -->
</section>

<!-- about us -->
<section class="section">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6 order-2 order-md-1">
        <h2 class="section-title">Welcome Injae</h2>
        <p>
          우리 인재대학교에 찾아주신 여러분께 진심으로 감사드리며 환영합니다.
          인재대학교가 지향하는 긍지와 의지를 길러 스스로 진리탐구의
          고귀한 사명을 다하여 투철한 자립정신으로 국가기반을 확고히 하며
          홍익인간의 이념을 구현합니다.                
        </p>
        <a href="${cPath }/main/about/message.do" class="btn btn-primary-outline">Learn more</a>
      </div>
      <div class="col-md-6 order-1 order-md-2 mb-4 mb-md-0">
        <img class="img-fluid w-100" src="${cPath }/resources/main/images/about/about_us.png" alt="about image">
      </div>
    </div>
  </div>
</section>
<!-- /about us -->

<!-- 학교 서비스 바로가기 -->
<section class="section pt-0">
  <div id="bookmark">
    <div class="container">
      <a href="${cPath }/lms/login.do" class="text-navy-color">
        <i class="fas fa-landmark"></i><br/>
        <p>통합정보시스템</p>
      </a>
      <a href="library.html" class="text-navy-color">
        <i class="fas fa-book"></i><br/>
        <p>도서관</p>
      </a>
      <a href="${cPath }/main/community/scholarshipList.do" class="text-navy-color">
        <i class="fas fa-graduation-cap"></i><br/>
        <p>장학공지</p>
      </a>
      <a href="${cPath }/main/community/academicList.do" class="text-navy-color">
        <i class="fas fa-school"></i><br/>
        <p>학사공지</p>
      </a>
      <a href="${cPath }/main/community/referenceList.do" class="text-navy-color">
        <i class="fas fa-folder-open"></i><br/>
        <p>자료실</p>
      </a>
      <a href="organization.html" class="text-navy-color">
        <i class="fas fa-sitemap"></i><br/>
        <p>조직안내</p>
      </a>
    </div>
  </div>
</section>

<!-- blog -->
<section class="section pt-0" style="margin-top: 4%;">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2 class="section-title">About Injae University</h2>
      </div>
    </div>
    <div class="row justify-content-center">
  <!-- blog post -->
  <article class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
    <div class="card rounded-0 border-bottom border-primary border-top-0 border-left-0 border-right-0 hover-shadow">
      <img class="card-img-top rounded-0" src="${cPath }/resources/main/images/blog/post-1.jpg" alt="Post thumb">
      <div class="card-body">
        <!-- post meta -->
        <ul class="list-inline mb-3">
          <!-- author -->
          <li class="list-inline-item mr-3 ml-0">By injae</li>
        </ul>
        <a href="education.html">
          <h4 class="card-title">INJAE VISION</h4>
        </a>
        <p class="card-text">미래가치를 창출하는 글로벌 산학일체 혁신대학</p>
        <a href="education.html" class="btn btn-primary btn-sm">read more</a>
      </div>
    </div>
  </article>
  <!-- blog post -->
  <article class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
    <div class="card rounded-0 border-bottom border-primary border-top-0 border-left-0 border-right-0 hover-shadow">
      <img class="card-img-top rounded-0" src="${cPath }/resources/main/images/blog/post-2.jpg" alt="Post thumb">
      <div class="card-body">
        <!-- post meta -->
        <ul class="list-inline mb-3">
          <!-- author -->
          <li class="list-inline-item mr-3 ml-0">By injae</li>
        </ul>
        <a href="${cPath }/main/about/message.do">
          <h4 class="card-title">열린총장실</h4>
        </a>
        <p class="card-text">미래를 열어갈 의지가 있는 그 어느 누구라도 인재의 문을 두드리세요!</p>
        <a href="${cPath }/main/about/message.do" class="btn btn-primary btn-sm">read more</a>
      </div>
    </div>
  </article>
  <!-- blog post -->
  <article class="col-lg-4 col-sm-6 mb-5 mb-lg-0">
    <div class="card rounded-0 border-bottom border-primary border-top-0 border-left-0 border-right-0 hover-shadow">
      <img class="card-img-top rounded-0" src="${cPath }/resources/main/images/blog/post-3.jpg" alt="Post thumb">
      <div class="card-body">
        <!-- post meta -->
        <ul class="list-inline mb-3">
          <!-- author -->
          <li class="list-inline-item mr-3 ml-0">By injae</li>
        </ul>
        <a href="map.html">
          <h4 class="card-title">캠퍼스 안내</h4>
        </a>
        <p class="card-text">인재대학교 오시는 길을 안내해 드립니다.<br/>감사드리고 환영합니다.</p>
        <a href="map.html" class="btn btn-primary btn-sm">read more</a>
      </div>
    </div>
  </article>
</div>
  </div>
</section>
<!-- /blog -->