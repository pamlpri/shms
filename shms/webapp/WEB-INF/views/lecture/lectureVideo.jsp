<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 14.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>${week.diary_title} 강의영상</title>
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/css/components.css">
</head>
<body onunload="Ev_onbeforeunload();">
	<div class="video-wrap">
		<div id="player"></div>
	</div>
	<form id="reqForm">
		<input type="hidden" name="first_sugang_req" value="${week.sugang_req }" />
		<input type="hidden" name="sugang_req" />
		<input type="hidden" name="diary_no" value="${week.diary_no }" />
		<input type="hidden" name="stdnt_no" value="${week.stdnt_no }" />
		<input type="hidden" name="lec_code" value="${week.lec_code}" />
	</form>
	<script type="text/javascript" src="${cPath }/resources/lecture/dist/modules/jquery.min.js"></script>
	<script type="text/javascript" src="${cPath }/resources/lecture/dist/modules/popper.js"></script>
	<script src = "https://www.youtube.com/iframe_api"></script>
	<script>
		var player;
		let videoId = '${week.ut_lec_link}';
		let start = ${week.sugang_req * week.sugang_len / 100};
		let startNum = parseInt(start);
		videoIds = videoId.split("/");
		videoId = videoIds[videoIds.length-1];

		function onYouTubeIframeAPIReady() {
			player = new YT.Player('player', {
				height : '390',
				width : '640',
				videoId : videoId,
				playerVars: {
				      autoplay: 1, // Auto-play the video on load
				      controls: 1, // Hide pause/play buttons in player
				      showinfo: 1, // Hide the video title
				      start: startNum
				    },
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
			case "percentLoaded":
				$("input[name='sugang_req']").val(player.getVideoLoadedFraction()* 100);
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
	
		function loadNewVideo() {
			player.loadVideoById(document.getElementById("video_idOption").value);
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
		function seekTo() {
			player.seekTo(document.getElementById("currentTimeOption").value);
		};
		function setVolume() {
			player.setVolume(document.getElementById("volumeOption").value);
		};
		function mute() {
			player.mute();
		};
		function unmute() {
			player.unMute();
		};
		function setQuality() {
			player
					.setPlaybackQuality(document.getElementById("qualityOption").value);
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
		
		let reqForm = $("#reqForm");
		$(window).bind("beforeunload", function (e){
			let sugang_req = parseInt($("[name='sugang_req']").val());
			let diary_no = $("[name='diary_no']").val();
			let stdnt_no = $("[name='stdnt_no']").val();
			let first_sugang_req = $("[name='first_sugang_req']").val();
			let lec_code = $("[name='lec_code']").val();
			
			if(first_sugang_req != 100){
				$.ajax({
					url : "${cPath}/lecture/lectureWeekInsert.do"
					, data : {
						sugang_req : sugang_req,
						diary_no : diary_no,
						stdnt_no : stdnt_no
					}, method : "post"
					, dataType : "json"
					, success : function(resp){
						if(resp.result == 'OK'){
						    window.close();
						}
					},error : function(xhr, error, msg){
						console.log(xhr);
						console.log(error);
						console.log(msg);
					}
				});
				
				if(sugang_req == 100){
					$.ajax({
						url : "${cPath}/lecture/lectureAttendance.do"
						, data : {
							lec_code : lec_code,
							stdnt_no : stdnt_no
						}, method : "post"
						, dataType : "json"
						, success : function(resp){
							if(resp.result == 'OK'){
							    console.log(resp.result);
							}
						},error : function(xhr, error, msg){
							console.log(xhr);
							console.log(error);
							console.log(msg);
						}
					});
				}
			}
			
		});
		
		function Ev_onbeforeunload(){
		  window.opener.document.location.href = "${cPath}/lecture/lectureWeek.do";
		}
	</script>
</body>