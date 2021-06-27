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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.video-wrap {
		display : none;
	}
</style>
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
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code }&lec_name=${lec_name}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/weeks.do">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">주/회차 관리</li>
      </ol>
  </nav>

  <section class="section">
      <h2 class="section-title">주/회차 등록</h2>
  </section>

  <div class="card attendance">
      <div class="card-body">
        <form class="table-responsive" method="post" id="weeksForm">
          <input type="hidden" name="diary_no" value="${week.diary_no }" />
       	  <div class="video-wrap mb-4">
			<div id="player"></div>
		  </div>
          <table class="table table-bordered table-md">
            <tr>
              <th class="align-middle"><span class="red-color">* </span>주차</th>
              <td class="text-left">
              	<c:choose>
              		<c:when test="${not empty insert}">
		                <select class="form-control im" name="lec_week">
		                  <option value="">-- 주차선택 --</option>
		                  <c:forEach var="i" begin="${max + 1}" end="15">
		                  	<option value="${i }">${i }주차</option>
		                  </c:forEach>
		                </select>
		                <div class="invalid-feedback">
	                      필수항목
	                    </div>
              		</c:when>
              		<c:otherwise>
              			<select class="form-control im" name="lec_week">
		                  <option value="">-- 주차선택 --</option>
		                  <c:forEach var="i" begin="1" end="15">
		                  	<c:set var="selected" value="${week.lec_week eq i ? 'selected' : ''}"></c:set>
		                  	<option value="${i }" ${selected }>${i }주차</option>
		                  </c:forEach>
		                </select>
              		</c:otherwise>
              	</c:choose>
              </td>
            </tr>
            <tr>
              <th class="align-middle"><span class="red-color">* </span>주차명</th>
              <td class="text-left">
<%--               	  <input type="text" class="form-control im" name="diary_title" value="${week.diary_title }"> --%>
              	  <input type="text" class="form-control im" name="diary_title" value="전사적자원 관리의 중요성">
	              <div class="invalid-feedback">
	                필수항목
	              </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle"><span class="red-color">* </span>강의종류</th>
              <td class="text-left">
                <select class="form-control im" name="week_lec_cl">
                  <option value="">-- 강의종류 --</option>
                  <option value="DM"  ${week.week_lec_cl eq 'DM' ? 'selected' : ''}>대면</option>
                  <option value="BG"  ${week.week_lec_cl eq 'BG' ? 'selected' : ''}>비대면</option>
                  <option value="SG"  ${week.week_lec_cl eq 'SG' ? 'selected' : ''}>비대면 실시간</option>
                </select>
                <div class="invalid-feedback">
                   필수항목
                 </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle">강의영상</th>
              <td class="text-left">
              	  <input type="text" class="form-control" name="ut_lec_link" value="${week.ut_lec_link }">
	              <div class="invalid-feedback">
	                   필수항목
	               </div>
               </td>
            </tr>
            <tr>
              <th class="align-middle">실시간 강의 주소</th>
              <td class="text-left">
              	 <input type="text" class="form-control" name="rt_lec_link" value="${week.rt_lec_link }">
              	 <div class="invalid-feedback">
                   필수항목
                 </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle"><span class="red-color">* </span>학습기간</th>
              <td>
                <div class="row">
                  <div class="col-md-6 text-left">
                    <label for="inputEmail4"><span class="red-color">* </span>시작일</label>
                    <input type="date" class="form-control im" name="week_bgnde" value="${week.week_bgnde }">
                    <div class="invalid-feedback">
                      필수항목
                    </div>
                  </div>
                  <div class="col-md-6 text-left">
                    <label for="inputEmail4"><span class="red-color">* </span>종료일</label>
                    <input type="date" class="form-control im" name="week_endde" value="${week.week_endde }">
                    <div class="invalid-feedback">
                      필수항목
                    </div>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <th class="align-middle">학습내역</th>
              <td class="textArea">
<%--                 <textarea class="form-control" name="diary_cont">${week.diary_cont }</textarea> --%>
                <textarea class="form-control" name="diary_cont">전사적자원관리를 효율성있게 관리하는 방법에 대해서 알아보자.</textarea>
              </td>
            </tr>
          </table>
          <input type="hidden" name="sugang_len" />
          <div class="text-center">
              <a href="${cPath }/lecture/weeks.do" class="btn btn-secondary">취소</a>
              <c:choose>
           		<c:when test="${not empty insert}">
	              <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
           		</c:when>
           		<c:otherwise>
	              <button type="button" class="btn btn-primary" id="updateBtn">저장</button>
	              <button id="deleteBtn" class="btn btn-danger" data-confirm-yes="deleteWeek();" data-confirm="주/회차 삭제|삭제한 회차는 복원이 불가합니다.<br/>삭제하시겠습니까?">삭제</button>
           		</c:otherwise>
              </c:choose>
          </div>
          </form>
        </div>
      </div>
    </div>
    
    <div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Modal body text goes here.</p>
        </div>
        <div class="modal-footer bg-whitesmoke br">
          <button type="button"  id="delBtn" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>

  <script src = "https://www.youtube.com/iframe_api"></script>
  <script type="text/javascript">
	let week_lec_cl = $("select[name='week_lec_cl']").val();
	if(week_lec_cl == "BG"){
		$("input[name='ut_lec_link']").parents("tr").children("th").prepend('<span class="red-color">* </span>');
		$("input[name='ut_lec_link']").addClass("im");
	}else if(week_lec_cl == "SG"){
		$("input[name='rt_lec_link']").parents("tr").children("th").prepend('<span class="red-color">* </span>');
		$("input[name='rt_lec_link']").addClass("im");
	}
	
    let weeksForm = $("#weeksForm");
    var frag = true;
	$("#saveBtn").on("click",function(){
		let inputs = $(weeksForm).find(":input[name]");
		
		$(inputs).each(function(idx, input){
			console.log($(this).val());
			if($(this).val() == ""){
				if($(this).hasClass("im")){
					$(this).addClass("is-invalid");
					frag = false;
				}
			}
		});
		
		if(frag){
			weeksForm.attr("action", "${cPath }/lecture/weeksInsert.do");
			weeksForm.submit();
		}
	});
	
	$("#updateBtn").on("click",function(){
		let inputs = $(weeksForm).find(":input[name]");
		
		$(inputs).each(function(idx, input){
			console.log($(this).val());
			if($(this).val() == ""){
				if($(this).hasClass("im")){
					$(this).addClass("is-invalid");
					frag = false;
				}
			}
		});
		
		if(frag){
			weeksForm.attr("action", "${cPath }/lecture/weeksUpdate.do");
			weeksForm.submit();
		}
	});
	  
	$(weeksForm).on("change",".im", function(){
		$(this).removeClass("is-invalid");
		frag = true;
		console.log(frag);
	});

	$(weeksForm).find("select[name='week_lec_cl']").on("change", function(){
		let week_lec_cl = $("select[name='week_lec_cl']").val();
		$("input[name='ut_lec_link']").parents("tr").find('.red-color').remove();
		$("input[name='ut_lec_link']").removeClass("im");
		$(".video-wrap").css("display", "none");
		$("input[name='rt_lec_link']").parents("tr").find('.red-color').remove();
		$("input[name='rt_lec_link']").removeClass("im");
		console.log(week_lec_cl);

		if(week_lec_cl == "BG"){
			$("input[name='ut_lec_link']").parents("tr").children("th").prepend('<span class="red-color">* </span>');
			$("input[name='ut_lec_link']").addClass("im");
		}else if(week_lec_cl == "SG"){
			$("input[name='rt_lec_link']").parents("tr").children("th").prepend('<span class="red-color">* </span>');
			$("input[name='rt_lec_link']").addClass("im");
		}
	});
	
	let deleteWeek = function(){
		weeksForm.attr("action", "${cPath }/lecture/weeksDelete.do");
		weeksForm.submit();
	}
	
	var videoId;
	$("input[name='ut_lec_link']").on("change", function(){
		videoId = $(this).val();
		$(".video-wrap").css("display", "block");
		let videoIds = videoId.split("/");
		videoId = videoIds[videoIds.length-1];
		console.log(videoId);
		loadNewVideo(videoId);
	});
	
	var player;
	function onYouTubeIframeAPIReady() {
		let video = videoId;
		console.log(video);
		player = new YT.Player('player', {
			height : '390',
			width : '640',
			videoId : '',
			events : {
				'onReady' : onPlayerReady,
				'onStateChange' : onPlayerStateChange,
				'onPlaybackRateChange' : onPlaybackRateChange,
				'onApiChange' : onApiChange,
			}
		});
	};

	function onPlaybackRateChange() {
		// Update playback rate on page
		update("rate");
	};
	function onApiChange(event) {
		// Update currently availbe APIs
		console.log("API Change!");
	};
	function onPlayerReady() {
		// Update page after player is ready
		updateAll();
		playVideo();
	}

	function onPlayerStateChange(event) {
		switch (event.data) {
		case YT.PlayerState.ENDED:
			updateAll() // set status for state, ...
			clearIntervals() // clear all intervals
			break;
		case YT.PlayerState.PLAYING:
			updateAll() // set status for state, ...
			setIntervals() // set intervals for ...
			break;
		case YT.PlayerState.PAUSED:
			updateAll() // set status for state, ...
			clearIntervals() // clear all intervals
			break;
		case YT.PlayerState.BUFFERING:
			updateAll() // set status for state, ...
			clearIntervals() // clear all intervals
			break;
		case YT.PlayerState.CUED:
			updateAll() // set status for state, ...
			clearIntervals() // clear all intervals
			break;
		default:
			updateAll() // set status for state, ...
			clearIntervals() // clear all intervals
			break;

		}
	};
	
	
	function update(node) {
		switch (node) {
		case "duration":
			$("input[name='sugang_len']").val(parseInt(player.getDuration()));
			break;
		}
	};
	
	function updateAll() {
		for ( var node in nodeList) {
			update(nodeList[node]);
		}
	};
	
	// Array to track all HTML nodes
	var nodeList = [ "duration", "percentLoaded"];
	function loadNewVideo(videoId){
	   player.loadVideoById(videoId);
	 };
	function cueNewVideo() {
		player.cueVideoById(document.getElementById("video_idOption").value);
	};
	function playVideo() {
		player.playVideo();
	};
	function pauseVideo() {
		player.pauseVideo();
	};
	function stopVideo() {
		player.stopVideo();
	};
	function setRate() {
		player.setPlaybackRate(document.getElementById("rateOption").value);
	};

	var activeIntervals = [];
	function setIntervals() {
		activeIntervals[0] = setInterval(function() {
			update("percentLoaded")
		}, 500);
		activeIntervals[1] = setInterval(function() {
			update("currentTime")
		}, 500);
	};
	function clearIntervals() {
		for ( var interval in activeIntervals) {
			clearInterval(interval);
		}
	};

  </script>