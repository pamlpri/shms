<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- footer content -->
<div class="footer bg-footer section border-bottom">
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-sm-8 mb-5 mb-lg-0">
        <!-- logo -->
        <a class="logo-footer" href="${cPath }/"><img class="img-fluid mb-4" src="${cPath }/resources/main/images/logo.png" alt="logo"></a>
        <ul class="list-unstyled">
          <li class="mb-2">34940 대전광역시 중구 중앙로 76 영민빌딩 4층</li>
          <li class="mb-2">042-222-8202</li>
          <li class="mb-2">042-252-0678</li>
          <li class="mb-2">gotoinjae@shms.com</li>
        </ul>
      </div>
      <!-- company -->
      <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
        <h4 class="text-white mb-5">대학안내</h4>
        <ul class="list-unstyled">
          <li class="mb-3"><a class="text-color" href="${cPath }/main/about/message.do">인사말</a></li>
          <li class="mb-3"><a class="text-color" href="education.html">교육이념</a></li>
          <li class="mb-3"><a class="text-color" href="organization.html">조직도</a></li>
          <li class="mb-3"><a class="text-color" href="map.html">오시는 길</a></li>
        </ul>
      </div>
      <!-- links -->
      <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
        <h4 class="text-white mb-5">대학광장</h4>
        <ul class="list-unstyled">
          <li class="mb-3"><a class="text-color" href="${cPath }/main/community/collegeSchedule.do">대학일정</a></li>
          <li class="mb-3"><a class="text-color" href="${cPath }/main/community/academicList.do">학사공지</a></li>
          <li class="mb-3"><a class="text-color" href="${cPath }/main/community/scholarshipList.do">장학공지</a></li>
          <li class="mb-3"><a class="text-color" href="${cPath }/main/community/referenceList.do">자료실</a></li>
        </ul>
      </div>
      <!-- support -->
      <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
        <h4 class="text-white mb-5">단과대안내</h4>
        <ul class="list-unstyled">
          <li class="mb-3"><a class="text-color" href="economics.html">경상대학</a></li>
          <li class="mb-3"><a class="text-color" href="liberal.html">인문대학</a></li>
          <li class="mb-3"><a class="text-color" href="social.html">사회과학대학</a></li>
          <li class="mb-3"><a class="text-color" href="engineering.html">공학대학</a></li>
          <li class="mb-3"><a class="text-color" href="health.html">보건대학</a></li>
        </ul>
      </div>
      <!-- support -->
      <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-5 mb-md-0">
        <h4 class="text-white mb-5">교내사이트</h4>
        <ul class="list-unstyled">
          <li class="mb-3"><a class="text-color" href="${cPath }/lms/login.do">통합정보시스템</a></li>
          <li class="mb-3"><a class="text-color" href="../admission/index.html">입학안내</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- copyright -->
<div class="copyright py-4 bg-footer">
  <div class="container">
    <div class="row">
      <div class="col-sm-7 text-sm-left text-center">
        <p class="mb-0">Copyright
          <script>
            var CurrentYear = new Date().getFullYear()
            document.write(CurrentYear)
          </script> 
          © SHMS</p>
      </div>
    </div>
  </div>
</div>


<div id="top">
  <img src="${cPath }/resources/main/images/btn_top_m.png" alt="to top"/>
</div>