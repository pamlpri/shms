<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
     <h1>대학생활의 이해</h1>
   </div>
 </section>

 <!-- contents start -->
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">Home</a></li>
         <li class="breadcrumb-item"><a href="#">학습활동</a></li>
         <li class="breadcrumb-item active" aria-current="page">시험응시</li>
     </ol>
 </nav>
 
 <div class="row">
     <div class="col-12 col-sm-0 col-lg-9">
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

           var myPDF = PDFObject.embed("https://storage.cloud.google.com/shms/exam/%EC%A0%95%EB%B3%B4%EC%B2%98%EB%A6%AC%EA%B8%B0%EC%82%AC%EC%8B%A4%EA%B8%B0_%EC%B5%9C%EC%A2%85%EC%A0%90%EA%B2%80_%EB%AA%A8%EC%9D%98%EA%B3%A0%EC%82%AC.pdf?authuser=0", "#example1", options);

           var el = document.querySelector("#results");
           el.setAttribute("class", (myPDF) ? "success" : "fail");
           el.innerHTML = (myPDF) ? "PDFObject successfully added an &lt;embed> element to the page!" : "Uh-oh, the embed didn't work.";
         </script>
         </div>
       </div>
     </div>
     <div class="col-12 col-sm-6 col-lg-3">
       <div class="card" id="sample-login">
         <div class="card-header">
           <h4>답안지</h4>
         </div>
         <div class="card-body">
           <form id="answerWrap">
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>1. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no1" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no1" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no1" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no1" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>2. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no2" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no2" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no2" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no2" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>3. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no3" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no3" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no3" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no3" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>4. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no4" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no4" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no4" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no4" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>5. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no5" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no5" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no5" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no5" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>6. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no6" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no6" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no6" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no6" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>7. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no7" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no7" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no7" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no7" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>8. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no8" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no8" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no8" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no8" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>9. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no9" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no9" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no9" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no9" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>10. </h6>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no10" value="1">
                   <label class="form-check-label">1</label>
               </div>
               <div class="form-check form-check-inline">
                   <input class="form-check-input" type="radio" name="no10" value="2">
                   <label class="form-check-label">2</label>
               </div>
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no10" value="3">
                 <label class="form-check-label">3</label>
               </div>  
               <div class="form-check form-check-inline">
                 <input class="form-check-input" type="radio" name="no10" value="4">
                 <label class="form-check-label">4</label>
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>11. </h6>
               </div>
               <div class="form-group">
                 <input type="text" class="form-control">
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>12. </h6>
               </div>
               <div class="form-group">
                 <input type="text" class="form-control">
               </div>
             </div>
             <div class="answer">
               <div class="form-check form-check-inline">
                 <h6>13. </h6>
               </div>
               <div class="form-group">
                 <textarea class="form-textarea"></textarea>
               </div>
             </div>
           </form>
           <div id="timer">
             <p>
               <strong>종료시간 : </strong>2020년 1월 2일 오후 12:00<br/>
               <strong>남은시간 : </strong>48분 52초
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
         <button type="button" class="btn btn-primary" onclick="location.href='${cPath}/lecture/exam.do'">제출</button>
       </div>
     </div>
   </div>
 </div>
 <!-- contents end -->
</div>