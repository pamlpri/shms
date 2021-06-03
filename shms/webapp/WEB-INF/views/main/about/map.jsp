<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      오세일        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="location">
  <ul>
    <li class="first"><a class="text-color" href="${cPath }/main/about/message.do">대학안내</a></li>
    <li><a class="text-color" href="${cPath }/main/about/message.do">대학소개</a></li>
    <li class="last"><a class="text-color" href="${cPath }/main/about/map.do">오시는길</a></li>
  </ul>
</div>

<div style="clear: both;"></div>

<div class="contents" id="map">
	<br><br>
	<div
		style="font: normal normal 400 12px/normal dotum, sans-serif; width: 640px; height: 392px; color: #333; position: relative">
		<div style="height: 360px;">
			<a
				href="https://map.kakao.com/?urlX=577824.0&amp;
	urlY=797563.0&amp;itemId=12520707&amp;q=%EC%B6%A9%EB%82%A8%EB%8C%80%ED%95%99%EA%B5%90%20%EB%8C%80%EB%8D%95%EC%BA%A0%ED%8D%BC%EC%8A%A4&amp;
	srcid=12520707&amp;map_type=TYPE_MAP&amp;from=roughmap"
				target="_blank"> <img class="map"
				src="http://t1.daumcdn.net/roughmap/imgmap/c6b4d6d563579e4946973717135e7834ba87a4d50835626976402a000c9440e6"
				width="638px" height="358px" style="border: 1px solid #ccc;">
			</a>
		</div>
		<div
			style="overflow: hidden; padding: 7px 11px; border: 1px solid rgba(0, 0, 0, 0.1); border-radius: 0px 0px 2px 2px; background-color: rgb(249, 249, 249);">
			<a href="https://map.kakao.com" target="_blank" style="float: left;">
				<img
				src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png"
				width="72" height="16" alt="카카오맵"
				style="display: block; width: 72px; height: 16px">
			</a>
			<div
				style="float: right; position: relative; top: 1px; font-size: 11px;">
				<a target="_blank"
					href="https://map.kakao.com/?from=roughmap&amp;
	 			 	srcid=12520707&amp;confirmid=12520707&amp
	 			 	;q=%EC%B6%A9%EB%82%A8%EB%8C%80%ED%95%99%EA%B5%90%20%EB%8C%80%EB%8D%95%EC%BA%A0%ED%8D%BC%EC%8A%A4&amp;rv=on"
					style="float: left; height: 15px; padding-top: 1px; line-height: 15px; color: #000; text-decoration: none;">로드뷰</a>
				<span
					style="width: 1px; padding: 0; margin: 0 8px 0 9px; height: 11px; vertical-align: top; position: relative; top: 2px; border-left: 1px solid #d0d0d0; float: left;"></span>
				<a target="_blank"
					href="https://map.kakao.com/?from=roughmap&amp;eName=%EC%B6%A9%EB%82%A8%EB%8C%80%ED%95%99%EA%B5%90%20%EB%8C%80%EB%8D%95%EC%BA%A0%ED%8D%BC%EC%8A%A4&amp;eX=577824.0&amp;eY=797563.0"
					style="float: left; height: 15px; padding-top: 1px; line-height: 15px; color: #000; text-decoration: none;">길찾기</a>
				<span
					style="width: 1px; padding: 0; margin: 0 8px 0 9px; height: 11px; vertical-align: top; position: relative; top: 2px; border-left: 1px solid #d0d0d0; float: left;"></span><a
					target="_blank"
					href="https://map.kakao.com?map_type=TYPE_MAP&amp;from=roughmap&amp;srcid=12520707&amp;itemId=12520707&amp;q=%EC%B6%A9%EB%82%A8%EB%8C%80%ED%95%99%EA%B5%90%20%EB%8C%80%EB%8D%95%EC%BA%A0%ED%8D%BC%EC%8A%A4&amp;urlX=577824.0&amp;urlY=797563.0"
					style="float: left; height: 15px; padding-top: 1px; line-height: 15px; color: #000; text-decoration: none;">지도
					크게 보기</a>
			</div>
		</div>
	</div>
</div>

<br><hr>
<h4>지하철 </h4>
  <p>
  	[유성온천역 하차 7번출구 이용]<br>택시 또는 순환버스 이용<br><br>
  	[시내버스 유성온천역 경유]<br>
  	교내 진입 48 / 정문 101, 102, 105, 106, 113, 114, 115, 121, 704 / 서문 704, 911 / 동문(농업생명과학대학) 105, 115
  </p>
<h4>유성금호고속 </h4>
  <p>[시내버스]<br>
   장대네거리 정류장에서 104번 탑승 후 정문 하차_13분, 또는 도보이용_20분
  </p>
<h4>시내버스 </h4>
  <p>[시내버스]<br>
  교내진입 48, 108 / 정문ㆍ서문ㆍ동문
  </p>
<h4>대전역 </h4>
  <p>[시내버스]<br>목척교 정류장에서 101번 (약45분)<br><br>
  	[지하철]<br>유성온천역 7번 출구 하차 (약45분)
  </p>
<h4>서대전역 </h4>
  <p>[시내버스]<br>서대전네거리역 정류장에서 101번, 119번 탑승 후 정문 하차 (약40분)<br>
  [지하철]<br>서대전네거리역 (도보 10분) 이용 후 유성온천역 7번 출구 하차 (약40분)
  </p>
<h4>승용차</h4>
  <h5>유성 IC</h5>
  <p>
  유성 IC 나와 유성온천방향으로 우회전 후 1km직진 →<br> 지하차도 들어가지 말고 우측차선 진행 → 본교 정문 도착 (유성 IC에서 약 5분)<br><br>
 유성 IC 나와 유성온천방향으로 우회전 후 1km직진 →<br> 첫 사거리에서 좌회전 → 본교 서문 도착 (유성 IC에서 약 5분)
 </p>
<h5>북대전 IC </h5>
<p> 북대전 IC 나와 좌회전 후 우회전 약 3km 직진 → 본교서문도착 (북대전 IC에서 약10분)</p>
<h4>유성시외버스 </h4>
  <p>[시내버스]<br>유성시외버스 정류장에서 102번, 113번, 704번 탑승 후 정문 하차 (약15분) ※ 유성구 마을 버스도 이용가능 5번
  </p>
<h4>서부시외버스 </h4>
  <p>[시내버스]<br>서부터미널 정류장에서 113번 탑승 후 정문 하차 (약50분)
  </p>
<h4>정부청사고속 </h4>
  <p>[시내버스]<br>
  사학연금회관 정류장에서 108번 탑승 후 교내 하차 (약25분)
  </p>
<h4>정부청사 시회버스 </h4>
  <p>[시내버스]<br>
  정부청사 남문 정류장에서 108번 탑승 후 교내하차 (약25분)<br><br>
  [지하철]<br>
  정부청사역 (도보3분) 이용 후, 유성온천역 7번 출구 하차 (약25분)
  </p>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  