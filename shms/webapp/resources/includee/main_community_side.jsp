<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="sidebar sidebar-left">
    <div class="widget">
      <h3 class="widget-title">대학광장</h3>
      <ul id="sideNav">
        <li class="sideMain">
          <a href="#" class="text-color">학사공지<span>+</span></a>
          <ul class="sideSub">
            <li><a href="${cPath }/main/community/academicList.do" class="text-color">학사공지</a></li>
            <li><a href="${cPath }/main/community/regulations.do" class="text-color">학칙열람</a></li>
          </ul>
        </li>
        <li class="sideMain">
            <a href="#" class="text-color">장학공지<span>+</span></a>
            <ul class="sideSub">
              <li><a href="${cPath }/main/community/scholarshipSystem.do" class="text-color">장학제도</a></li>
              <li><a href="${cPath }/main/community/scholarshipList.do" class="text-color">장학공지</a></li>
            </ul>
          </li>
          <li class="sideMain only">
            <a href="${cPath }/main/community/collegeSchedule.do" class="text-color">대학일정</a>
          </li>
          <li class="sideMain only">
            <a href="${cPath }/main/community/collegeQnaList.do" class="text-color">대학문의</a>
          </li>
          <li class="sideMain only">
            <a href="${cPath }/main/community/referenceList.do" class="text-color">자료실</a>
          </li>
      </ul>
    </div><!-- Categories end -->
  </div><!-- Sidebar end -->
</div><!-- Sidebar Col end -->