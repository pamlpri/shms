<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 18.      송수미        시험 응시 기능 구현
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
	name="viewport">
<title>${lec_name }</title>

 <!-- General CSS Files -->
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/fontawesome/css/all.min.css">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/jqvmap/dist/jqvmap.min.css">
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/weather-icon/css/weather-icons.min.css">
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/weather-icon/css/weather-icons-wind.min.css">
  
  <!-- CSS Libraries -->
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/datatables/datatables.min.css">
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/datatables/Select-1.2.4/css/select.bootstrap4.min.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/css/style.css">
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/css/components.css">
 
  <script type="text/javascript" src="${cPath }/resources/lecture/dist/modules/jquery.min.js"></script>
  <script type="text/javascript" src="${cPath }/resources/lecture/dist/modules/popper.js"></script>
</head>

<body style="overflow-x : hidden">
<!-- Main Content -->
<div class="main-content" style="padding-left: 0px; padding-top: 0px; padding-right: 0px; ">
  <section class="section">
    <div class="section-header"  style="background-color : #6777ef;">
      <!-- 강의명 -->
     <h1 style="color : white;">${lec_name }</h1>
   </div>
 </section>
 
 <div class="row" style="padding: 0 30px;">
     <div class="col-12 col-sm-0 col-lg-8">
       <div class="card">
         <div class="card-header">
           <h4>시험문제</h4>
         </div>
         <div class="card-body">
         <!-- 컨텐츠 -->
         <div class="contents">
           <div id="example1" style="margin-top : 0;"></div>
         </div>
         <!-- pdf 뷰어 -->
		<c:url value="/lecture/examViewer.do" var="downloadURL">
			<c:param name="atch_file_no" value="${exam.attachList[0].atch_file_no }"/>
			<c:param name="atch_file_seq" value="${exam.attachList[0].atch_file_seq }"/>
		</c:url>
         <script src="${cPath }/resources/lecture/dist/js/pdfobject.js"></script>
         <script>
           var options = {
             pdfOpenParams: {
               pagemode: "thumbs",
               navpanes: 0,
               toolbar: 0,
               statusbar: 0,
               view: "FitV"
             }
           };

           var myPDF = PDFObject.embed("https://192.168.0.137${downloadURL}", "#example1", options);

           var el = document.querySelector("#results");
           el.setAttribute("class", (myPDF) ? "success" : "fail");
           el.innerHTML = (myPDF) ? "PDFObject successfully added an &lt;embed> element to the page!" : "Uh-oh, the embed didn't work.";
         </script>
         </div>
       </div>
     </div>
     <div class="col-12 col-sm-6 col-lg-4">
       <div class="card" id="sample-login">
         <div class="card-header">
           <h4>답안지</h4>
         </div>
         <div class="card-body">
         	<div id="timer">
             <p>
               <strong>종료시간 : </strong>${exam.exam_end_dt_char }<br/>
               <strong>남은시간 : </strong><span id="remainTime"></span><br/>
               <span class="red-color">종료시간이 되면 자동으로 답안이 제출되며, 재응시가 불가능합니다.</span>
             </p>
           </div>
           <div class="text-left mb-4">
             <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i class="far fa-edit"></i> 답안지제출</button>
           </div>
           <form id="answerWrap" method="post" class="mt-3">
           		<input type="hidden" name="exam_no" value="${exam.exam_no }"/>
	           	<c:forEach items="${quesList }" var="ques" varStatus="idx">
	           		<input type="hidden" name="dtlsList[${idx.index }].ques_no" value="${ques.ques_no }"/>
	           		<c:choose>
	           			<c:when test="${ques.ques_type eq 'GG' }">
				            <div class="answer">
				              <div class="form-check form-check-inline">
				                <h6>${idx.count } </h6>
				              </div>
				              <div class="form-check form-check-inline">
				                  <input class="form-check-input" type="radio" value="1" name="dtlsList[${idx.index }].submit_ans" checked>
				                  <label class="form-check-label">1</label>
				              </div>
				              <div class="form-check form-check-inline">
				                  <input class="form-check-input" type="radio" value="2" name="dtlsList[${idx.index }].submit_ans">
				                  <label class="form-check-label">2</label>
				              </div>
				              <div class="form-check form-check-inline">
				                <input class="form-check-input" type="radio" value="3"  name="dtlsList[${idx.index }].submit_ans">
				                <label class="form-check-label">3</label>
				              </div>  
				              <div class="form-check form-check-inline">
				                <input class="form-check-input" type="radio" value="4" name="dtlsList[${idx.index }].submit_ans">
				                <label class="form-check-label">4</label>
				              </div>
				            </div>
	           			</c:when>
	           			<c:when test="${ques.ques_type eq 'DD' }">
				            <div class="answer">
				              <div class="form-check form-check-inline">
				                <h6>${idx.count }</h6>
				              </div>
				              <div class="form-group">
				                <input type="text" class="form-control" name="dtlsList[${idx.index }].submit_ans" value="단답정답임"/>
				              </div>
				            </div>
	           			</c:when>
	           			<c:otherwise>
				            <div class="answer">
				              <div class="form-check form-check-inline">
				                <h6>${idx.count }</h6>
				              </div>
				              <div class="form-group">
				                <textarea class="form-textarea" name="dtlsList[${idx.index }].submit_ans">서버에 만들어진 서블릿이 스스로 작동하는 것이 아니라, 서블릿을 관리 해주는 것이 필요한데, 이러한 역할을 하는 것이 바로 서블릿 컨테이너 입니다.</textarea>
				              </div>
				            </div>
	           			</c:otherwise>
	           		</c:choose>
	           	</c:forEach>
           </form>
         </div>
       </div>
     </div>
 </div>

 <!-- 시험 제출 경고 모달 -->
 <div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title"><i class="fas fa-info-circle"></i> 답안지 제출</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <p>답안지 제출이 완료되면 재응시는 불가합니다.<br/>답안지를 제출하시겠습니까?</p>
       </div>
       <div class="modal-footer bg-whitesmoke br">
         <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
         <button type="button" id="saveBtn" class="btn btn-primary">제출</button>
       </div>
     </div>
   </div>
 </div>
 <!-- 시험 종료 시간 알림 모달 -->
  <div class="modal fade" tabindex="-1" role="dialog" id="timeOutModal">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title"><i class="fas fa-info-circle"></i> 시간 안내 </h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <p>시험 종료 5분 남았습니다. <br/>종료시간이 되면 자동으로 답안이 제출되며 재응시가 불가능합니다.</p>
       </div>
     </div>
   </div>
 </div>
 <!-- contents end -->
</div>
</body>
<!-- General JS Scripts -->
	<script src="${cPath }/resources/lecture/dist/modules/jquery.min.js" type="text/javascript"></script>
  	<script src="${cPath }/resources/lecture/dist/modules/popper.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/tooltip.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/moment.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/js/stisla.js" type="text/javascript"></script>

	<!-- JS Libraies -->
	<script src="${cPath }/resources/lecture/dist/modules/simple-weather/jquery.simpleWeather.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/chart.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/jqvmap/dist/jquery.vmap.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/jqvmap/dist/maps/jquery.vmap.world.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/chocolat/dist/js/jquery.chocolat.min.js" type="text/javascript"></script>
	
	<!-- JS Libraies -->
	<script src="${cPath }/resources/lecture/dist/modules/datatables/datatables.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/datatables/Select-1.2.4/js/dataTables.select.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
	
	<!-- Page Specific JS File -->
	<script src="${cPath }/resources/lecture/dist/js/page/modules-datatables.js" type="text/javascript"></script>

	<!-- Template JS File -->
	<script src="${cPath }/resources/lecture/dist/js/scripts.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/js/custom.js" type="text/javascript"></script>
	
	<script src="${cPath }/resources/lecture/dist/js/jquery.table2excel.min.js"></script>
<script type="text/javascript">

$("#saveBtn").on("click", function(){
	$("#answerWrap").submit();
});

/* 시험 시간 표시, 종료시간되면 자동 제출 */
let endTime = "${exam.exam_end_dt}";
window.onload = function(){
	endTime = endTime.replace(" ", "T");
	StartClock();
};

function PrintTime() {
	let end = new Date(endTime);   
    let today = new Date();
    let remainTime = end - today;
    if(remainTime <= 0){
		$("#answerWrap").submit();
    }
    let hour = Math.floor(remainTime / 1000 / 60 / 60);
    let minute = Math.floor((remainTime - (hour * 1000 * 60 * 60)) / 1000 / 60);
    let second = Math.floor((remainTime - (hour * 1000 * 60 * 60) - (minute * 1000 * 60)) / 1000);
    $("#remainTime").html(pad(hour, 2) + " : " + pad(minute, 2) + " : " + pad(second, 2));
    if(hour == 0 && minute == 5 && second == 0){
		$("#timeOutModal").addClass("show").css("display","block");
    }
    
    $(".close, .modal").on("click", function(){
		$("#timeOutModal").removeClass("show").css("display","none");
	})
    
}

function StartClock() {
    PrintTime();
    setInterval(PrintTime, 1000);
}

function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
};
</script>

<script>
function noEvent() {
	if (event.keyCode == 116) {
		event.keyCode = 2;
		return false;
	}
		else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82))
	{
		return false;
	}
}
document.onkeydown = noEvent;
	


</script>




