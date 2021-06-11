<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <!-- 강의명 -->
      <h1>대학생활의 이해</h1>
    </div>
    <div id="myChart"></div>
  </section>
  
  <div id="qrWrap" class="text-center">
 	 	  <p id="countdown"></p>
          <p>입실, 퇴실 기록이 있으면 5초 후에 자동으로 강의홈으로 이동합니다</p>
	  <div id="qrcode">
	  </div>
      <div>
	      <img src="${cPath }/resources/lms/assets/images/qr.jpg" class="qr"/>
          <p>강의실 입구에 비치된 카메라에<br/>QR코드를 보여주세요.</p>
          <span>※ 강의실에 일찍 도착하셨어도 QR코드 인증시간이<br/>강의 시작시간을 넘어버리면 지각으로 체크됩니다.</span>
      </div>
  </div>
</div>
<form id="submitForm" action="${cPath }/lecture/updateAttendanceStat.do">
	<input type="hidden" name="stdnt_no"/>
	<input type="hidden" name="lec_code"/>
	<input type="hidden" name="attend_time"/>
	<input type="hidden" name="exit_time"/>
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
		var timeleft = 5;
		var downloadTimer = setInterval(function(){
		  if(timeleft <= 0){
		    clearInterval(downloadTimer);
		    document.getElementById("countdown").innerHTML = "";
		  } else {
		    document.getElementById("countdown").innerHTML = timeleft + " 초 후에 이동합니다.";
		  }
		  timeleft -= 1;
		}, 1000);
		var attend_time = "${qrInfo.attend_time}";
		var exit_time = "${qrInfo.exit_time}";
		var atndan = {
			stndt_no : "${qrInfo.stdnt_no}"
			, lec_code : "${qrInfo.lec_code}"
		}
		setInterval(function(){
			$.ajax({
				url : "${cPath}/lecture/qrTimeout.do"
				, data : JSON.stringify(atndan)
				, method : "post"
				, contentType: 'application/json'
				, dataType : "json"
				, success : function(res){
					let stdnt_no = $("input[name='stdnt_no']").val(res.stdnt_no);
					$("input[name='lec_code']").val("${qrInfo.lec_code}");
					$("input[name='attend_time']").val(res.attend_time);
					$("input[name='exit_time']").val(res.exit_time);
					$("#submitForm").submit();
					if(res.result == "FAIL"){
						var count = 5;
						if(attend_time == null){
							var countdown = setInterval(function(){location.href="${cPath }/lecture/index.do?lec_code=${qrInfo.lec_code}"}, 5000);
						}else if(res.result == "OK"){
							location.href="{cPath}/lecture/attendResult.do";
						}else if(res.result == "DUFLICATED"){
	// 						setInterval(function(){location.href="${cPath }/lecture/index.do?lec_code=${qrInfo.lec_code}"}, 1000);
							alert("이미 있어!");
						}
					}else if(res.result == "FAIL"){
						setInterval(function(){location.reload(); }, 5000);
					}
				}
				, error : function(error, xhr, msg){
					console.log(xhr);
					console.log(error);
					console.log(msg);
				}
			});	
		}, 5000);
	});
</script>

</HTML>
