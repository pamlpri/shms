<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>${lec_name }</h1>
    </div>
    <div id="myChart"></div>
  </section>
  
  <div id="qrWrap" class="text-center">
 	 	  <p id="countdown"></p>
	  <div id="qrcode">
	  </div>
      <div>
	      <img src="${cPath }/resources/lms/assets/images/qr.jpg" class="qr"/>
          <p>강의실 입구에 비치된 카메라에<br/>QR코드를 보여주세요.</p>
          <span>※ 강의실에 일찍 도착하셨어도 QR코드 인증시간이<br/>강의 시작시간을 넘어버리면 지각으로 체크됩니다.</span>
      </div>
  </div>
</div>
<form id="submitForm" action="${cPath }/lecture/attendanceResult.do" method="post">
	<input type="hidden" name="attend_time" value="">
	<input type="hidden" name="exit_time" value="">
	<input type="hidden" name="lec_name" value="${lec_name}"/>
</form>

<script type="text/javascript" src="${cPath }/resources/lecture/dist/js/qrcode.js"></script>
<script type="text/javascript" src="${cPath }/resources/lms/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" >

	var qr = "${qrInfo.stdnt_no},${qrInfo.lec_code}";
	
	var qrcode = new QRCode(document.getElementById("qrcode"), {
		text : qr,
		width: 128,
		height: 128,
		colorDark : "#000000",
		colorLight : "#ffffff",
		correctLevel : QRCode.CorrectLevel.H
	});
</script>
<script type="text/javascript" >
	$(function(){		
		timer = setInterval(function(){
			$.ajax({
				url:"${cPath }/lecture/qrCheck.do"
				, success : function(resp) {
					console.log(resp);
					if(resp.qrCheck == true) {
						qrTimeout();
						stopTimer();
					}
				}
			});
		}, 1000);
	});
	function stopTimer(){
	    clearInterval(timer);
	}

	var atndan = {
		stndt_no : "${qrInfo.stdnt_no}"
		, lec_code : "${qrInfo.lec_code}"
	}
	function qrTimeout() {
		$.ajax({
			url : "${cPath}/lecture/qrTimeout.do"
			, data : JSON.stringify(atndan)
			, method : "post"
			, contentType: 'application/json'
			, dataType : "json"
			, success : function(res){
                $("input[name='attend_time']").val(res.attendTime);
                $("input[name='exit_time']").val(res.exitTime);
                
                $("#submitForm").submit();
			}
			, error : function(error, xhr, msg){
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
		});	
	}
</script>

</HTML>
