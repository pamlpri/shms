<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- top header -->
 <div class="top-header bg-white">
   <div class="container">
     <div class="row no-gutters">
       <div class="col-lg-4 text-center text-lg-left">
         <a href="${cPath }/lms/login.do" class="headerBtn" id="lmsBtn"><strong>통합정보시스템</strong></a>
         <a href="../admission/index.html" class="headerBtn" id="enterBtn"><strong>입학안내</strong></a>
       </div>
       <div class="col-lg-8 text-center text-lg-right py-2">
         <ul class="list-inline">
           <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="${cPath }/main/community/academicList.do">학사공지</a></li>
           <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="${cPath }/main/community/scholarshipList.do">장학공지</a></li>
           <li class="list-inline-item"><a class="text-uppercase text-color p-sm-2 py-2 px-0 d-inline-block" href="admissionNotice.html">입학공지</a></li>
         </ul>
       </div>
     </div>
   </div>
 </div>

<!-- navbar -->
<div class="navigation w-100">
  <div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark p-0">
      <a class="navbar-brand" href="${cPath }/"><img src="${cPath }/resources/main/images/logo.png" alt="logo"></a>
      <button class="navbar-toggler rounded-0" type="button" data-toggle="collapse" data-target="#navigation"
        aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navigation">
        <ul class="navbar-nav ml-auto text-center">
          <li class="nav-item dropdown view">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              대학안내
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li>
                <a class="dropdown-item subWrap" href="message.html">대학소개</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="${cPath }/main/about/message.do">인사말</a></li>
                  <li><a class="text-navy-color" href="education.html">교육이념</a></li>
                  <li><a class="text-navy-color" href="organization.html">조직도</a></li>
                  <li><a class="text-navy-color" href="map.html">오시는길</a></li>
                  <li><a class="text-navy-color" href="campus.html">캠퍼스맵</a></li>
                </ul>
              </li>
              <li>
                <a class="dropdown-item subWrap" href="library.html">편의시설안내</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="library.html">도서관 이용</a></li>
                  <li><a class="text-navy-color" href="bus.html">통학버스 이용</a></li>
                  <li><a class="text-navy-color" href="lend.html">학교 대관</a></li>
                  <li><a class="text-navy-color" href="diet.html">금주의 식단</a></li>
                </ul>
              </li>
              <li>
                <a class="dropdown-item subWrap" href="council.html">학생자치기구</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="council.html">총학생회</a></li>
                  <li><a class="text-navy-color" href="union.html">총동아리연협회</a></li>
                  <li><a class="text-navy-color" href="club.html">동아리</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="nav-item dropdown view">
            <a class="nav-link dropdown-toggle" href="admission.html" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              입학안내
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="../admission/index.html">입학홈페이지</a>
            </div>
          </li>
          <li class="nav-item dropdown view">
            <a class="nav-link dropdown-toggle" href="economics.html" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              학과안내
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li>
                <a class="dropdown-item subWrap" href="economics.html">경상대학</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="../major/index.html">경제학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">경영학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">무역학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">국제무역물류학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">금융보험학과</a></li>
                </ul>
              </li>
              <li>
                <a class="dropdown-item subWrap" href="liberal.html">인문대학</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="../major/index.html">국어국문학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">독일어문학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">프랑스어문학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">심리학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">철학과</a></li>
                </ul>
              </li>
              <li>
                <a class="dropdown-item subWrap" href="social.html">사회과학대학</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="../major/index.html">사회복지학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">국제학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">사회학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">언론방송학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">행정학과</a></li>
                </ul>
              </li>
              <li>
                <a class="dropdown-item subWrap" href="engineering.html">공학대학</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="../major/index.html">화학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">항공학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">기계공학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">자동차공학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">정보통신학과</a></li>
                </ul>
              </li>
              <li>
                <a class="dropdown-item subWrap" href="health.html">보건대학</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="../major/index.html">간호학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">치위생과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">치기공과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">안경광학과</a></li>
                  <li><a class="text-navy-color" href="../major/index.html">재활학과</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="nav-item dropdown view">
            <a class="nav-link dropdown-toggle" href="academic.html" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              대학광장
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li>
                <a class="dropdown-item subWrap" href="${cPath }/main/community/academicList.do">학사공지</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="${cPath }/main/community/academicList.do">학사공지</a></li>
                  <li><a class="text-navy-color" href="${cPath }/main/community/regulations.do"">학칙열람</a></li>
                </ul>
              </li>
              <li>
                <a class="dropdown-item subWrap" href="scholarshipSystem.html">장학공지</a>
                <ul class="sub">
                  <li><a class="text-navy-color" href="scholarshipSystem.html">장학제도</a></li>
                  <li><a class="text-navy-color" href="${cPath }/main/community/scholarshipList.do">장학공지</a></li>
                </ul>
              </li>
              <li style="margin-bottom: 10px;">
                <a class="dropdown-item" href="${cPath }/main/community/collegeSchedule.do">대학일정</a>
              </li>
              <li style="margin-bottom: 10px;"></li>
                <a class="dropdown-item" href="${cPath }/main/community/collegeQnaList.do">대학문의</a>
              </li>
              <li style="margin-bottom: 10px;">
                <a class="dropdown-item" href="${cPath }/main/community/referenceList.do">자료실</a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</div>