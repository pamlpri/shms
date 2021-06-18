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
         <li class="breadcrumb-item"><a class="examSubmitBtn" href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
         <li class="breadcrumb-item"><a class="examSubmitBtn" href="${cPath }/lecture/weeks.do">학습활동</a></li>
         <li class="breadcrumb-item active" aria-current="page">시험응시</li>
     </ol>
 </nav>
 
 <div class="row">
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

           var myPDF = PDFObject.embed("https://localhost${downloadURL}", "#example1", options);

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
           <form id="answerWrap" method="post">
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
				                  <input class="form-check-input" type="radio" value="1" name="dtlsList[${idx.index }].submit_ans">
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
				                <input type="text" class="form-control" name="dtlsList[${idx.index }].submit_ans" />
				              </div>
				            </div>
	           			</c:when>
	           			<c:otherwise>
				            <div class="answer">
				              <div class="form-check form-check-inline">
				                <h6>${idx.count }</h6>
				              </div>
				              <div class="form-group">
				                <textarea class="form-textarea" name="dtlsList[${idx.index }].submit_ans"></textarea>
				              </div>
				            </div>
	           			</c:otherwise>
	           		</c:choose>
	           	</c:forEach>
           </form>
           <div id="timer">
             <p>
               <strong>종료시간 : </strong>${exam.exam_end_dt_char }<br/>
               <strong>남은시간 : </strong><span id="remainTime"></span>
             </p>
           </div>
           <div class="text-right">
             <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i class="far fa-edit"></i> 답안지제출</button>
           </div>
         </div>
       </div>
     </div>
 </div>

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
 <!-- contents end -->
</div>

<script type="text/javascript">
let endTime = "${exam.exam_end_dt}";
window.onload = function(){
	endTime = endTime.replace(" ", "T");
	StartClock();
};

$("#saveBtn").on("click", function(){
	$("#answerWrap").submit();
});

function PrintTime() {
	let end = new Date(endTime);   
    let today = new Date();
    let remainTime = end - today;
    let hour = Math.floor(remainTime / 1000 / 60 / 60);
    let minute = Math.floor((remainTime - (hour * 1000 * 60 * 60)) / 1000 / 60);
    let second = Math.floor((remainTime - (hour * 1000 * 60 * 60) - (minute * 1000 * 60)) / 1000);
    $("#remainTime").html(pad(hour, 2) + " : " + pad(minute, 2) + " : " + pad(second, 2));
}

// 중지를 위해 ID 보관
var timerId = null;

// 시계 시작
function StartClock() {
    PrintTime();
    timerId = setInterval(PrintTime, 1000);
}

// 시계 중지
function StopClock() {
    if(timerId != null) {
        clearInterval(timerId);
    }
}

function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

</script>




