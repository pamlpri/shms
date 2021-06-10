<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.fc-scrollgrid a { color:black; }
.fc-day-sat a { color:blue;  }
.fc-day-sun a { color:red;  }
.fc-daygrid-event-dot { 
   border: calc(var(--fc-daygrid-event-dot-width, 8px) / 2) solid #ff2020;
}
</style>
<div id="location">
  <ul>
    <li class="first"><a class="text-color" href="${cPath }/main/community/academicList.do">대학광장</a></li>
    <li class="last"><a class="text-color" href="${cPath }/main/community/collegeSchedule.do">대학일정</a></li>
  </ul>
</div>

<div style="clear: both;"></div>

<!-- 컨텐츠 -->
<div class="contents" id="scholarshipSystem">
  <div id='calendar'></div>
</div>

<!-- 캘린더 모달 -->
  <div class="modal" tabindex="-1" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">일정 상세보기</h5>
          <button type="button" class="btn-close modalClose" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="label-input">
            <span>구분</span>
            <div class="text-box">
            입시캘린더  </div>
           </div>
           <div class="label-input">
            <span>작성자</span>
            <div class="text-box">
            입학과</div>
           </div>
           <div class="label-input">
            <span>일정</span>
            <div class="text-box">
            2021-01-07 (09:00) ~ 2021-01-18 (23:50)</div>
           </div>
           <div class="label-input">
            <span>일정명</span>
            <div class="text-box">
            정시모집 원서접수  </div>
           </div>
           <div class="label-input">
            <span>내용</span>
            <div class="text-box">
            정시모집 원서접수 </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prevYear,prev,today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek,dayGridDay,next,nextYear'
      }
      , initialDate : new Date()
      , navLinks : true // can click day/week names to navigate views
	  , selectable : true
	  , selectMirror : true
      , editable: false
      , dayMaxEvents: true
      , events: "<c:url value='/main/community/scheduleprocess.do'/>"
   	  , eventDidMount :function(event){
            let el = event.el;
            console.log(arguments);
            console.log(el);
            console.log(event);
            let parentDIV = $(el).parents(".fc-daygrid-day-events");
            let numDIV = $(parentDIV).siblings(".fc-daygrid-day-top:first");
            $(numDIV).find("a").css("color", "red");
         }
   	  
    });

    var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
      keyboard: false
    })
  
    $(".fc-event-title-container, .fc-daygrid-event, .fc-daygrid-event-harness").on("click", function(){
      myModal.show();
    });

    $(".modalClose").on("click", function(){
      myModal.hide();
    });
    calendar.render();
  });
</script>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(2).children("a").addClass("navy");
		$(".sideMain").eq(2).children(".sideSub").addClass("cur");
	});
</script>