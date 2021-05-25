<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="location">
	<ul>
		<li class="first"><a class="text-color" href="${cPath }/main/community/academicList.do">대학광장</a></li>
		<li><a class="text-color" href="${cPath }/main/community/scholarshipSystem.do">장학공지</a></li>
		<li class="last"><a class="text-color" href="${cPath }/main/community/scholarshipSystem.do">장학제도</a></li>
	</ul>
</div>

<div style="clear: both;"></div>

<!-- 컨텐츠 -->
<div class="contents" id="scholarshipSystem">
	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="pills-home-tab" data-toggle="pill"
			href="#Excellent-grades1" role="tab" aria-controls="pills-home"
			aria-selected="true">성적우수(신입생)</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="pills-profile-tab" data-toggle="pill" href="#Excellent-grades2"
			role="tab" aria-controls="pills-profile" aria-selected="false">성적우수(재학생)</a>
		</li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="pills-contact-tab" data-toggle="pill" href="#accompany"
			role="tab" aria-controls="pills-contact" aria-selected="false">동반
				장학금</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="pills-contact-tab" data-toggle="pill" href="#welfare" role="tab"
			aria-controls="pills-contact" aria-selected="false">복지 장학금</a></li>
	</ul>
	<div class="tab-content" id="pills-tabContent">
		<div class="tab-pane fade show active" id="Excellent-grades1"
			role="tabpanel" aria-labelledby="pills-home-tab">
			<div class="widget">
				<h5 class="widget-title">성적우수(신입생)</h5>
				<table>
					<thead>
						<tr>
							<th>장학명</th>
							<th>선발기준</th>
							<th>선발인원</th>
							<th>장학금액</th>
							<th>지급기간<br />(선발제한)
							</th>
							<th>지급시기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>전체수석</th>
							<td>단과대학<br />수석 중 최상위자
							</td>
							<td>1명</td>
							<td>등록금전액<br />(입학금포함)
							</td>
							<td>졸업시까지<br />(15학점 취득, 3.50이상 유지)
							</td>
							<td>학비감면</td>
						</tr>
						<tr>
							<th>단과대학 수석</th>
							<td>단과대학<br />수석 합격자
							</td>
							<td>5명</td>
							<td>등록금전액<br />(입학금포함)
							</td>
							<td>졸업시까지<br />(15학점 취득, 3.50이상 유지)
							</td>
							<td>학비감면</td>
						</tr>
						<tr>
							<th>단과대학 차석</th>
							<td>단과대학<br />차석 합격자
							</td>
							<td>5명</td>
							<td>등록금 70% 감면<br />(입학금포함)
							</td>
							<td>2년간<br />(15학점 취득, 3.50이상 유지)
							</td>
							<td>학비감면</td>
						</tr>
						<tr>
							<th>학과 수석</th>
							<td>학과 수석 합격자<br />(수시, 정시)
							</td>
							<td>학과별<br />1명
							</td>
							<td>등록금전액<br />(입학금포함)
							</td>
							<td>1년간<br />(15학점 취득, 3.50이상 유지)
							</td>
							<td>학비감면</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="tab-pane fade" id="Excellent-grades2" role="tabpanel"
			aria-labelledby="pills-profile-tab">
			<div class="widget">
				<h5 class="widget-title">성적우수(재학생)</h5>
				<table>
					<thead>
						<tr>
							<th>장학명</th>
							<th>선발기준</th>
							<th>선발인원</th>
							<th>장학금액</th>
							<th>지급기간<br />(선발제한)
							</th>
							<th>지급시기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>전체수석</th>
							<td>단과대학<br />수석 중 최상위자
							</td>
							<td>1명</td>
							<td>등록금전액</td>
							<td>해당학기<br />(15학점 취득, 3.50이상)
							</td>
							<td>학비감면</td>
						</tr>
						<tr>
							<th>단과대학 수석</th>
							<td>단과대학<br />수석 합격자
							</td>
							<td>5명</td>
							<td>등록금전액</td>
							<td>해당학기<br />(15학점 취득, 3.50이상)
							</td>
							<td>학비감면</td>
						</tr>
						<tr>
							<th>단과대학 차석</th>
							<td>단과대학<br />차석 합격자
							</td>
							<td>5명</td>
							<td>등록금 70% 감면</td>
							<td>해당학기</td>
							<td>학비감면</td>
						</tr>
						<tr>
							<th>학과 수석</th>
							<td>학과 수석 합격자<br />(수시, 정시)
							</td>
							<td>학과별<br />1명
							</td>
							<td>등록금전액</td>
							<td>해당학기</td>
							<td>학비감면</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="tab-pane fade" id="accompany" role="tabpanel"
			aria-labelledby="pills-contact-tab">
			<div class="widget">
				<h5 class="widget-title">동반 장학금</h5>
				<table>
					<colgroup>
						<col>
						<col style="width: 30%;">
						<col style="width: 9%;">
						<col style="width: 25%;">
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>장학명</th>
							<th style="max-width: 200px">선발기준</th>
							<th>선발인원</th>
							<th>장학금액</th>
							<th>지급시기</th>
							<th>지급기간<br />(선발제한)
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>국가<br></th>
							<td>국가유공자 본인(배우자) 및 직계(손)자녀로 국가보훈처에서 교육지원대상자로 지정된 자</td>
							<td>해당자<br />전원
							</td>
							<td>등록금전액<br />(입학금포함)
							</td>
							<td>졸업시까지</td>
							<td>학비감면</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="tab-pane fade" id="welfare" role="tabpanel"
			aria-labelledby="pills-contact-tab">
			<div class="widget">
				<h5 class="widget-title">복지 장학금</h5>
				<table>
					<thead>
						<tr>
							<th>장학명</th>
							<th>선발기준</th>
							<th>선발인원</th>
							<th>장학금액</th>
							<th>지급기간<br />(선발제한)
							</th>
							<th>지급시기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>영어</th>
							<td>TOEIC 성적이<br />우수한 학생
							</td>
							<td>해당자<br />전원
							</td>
							<td>50만원</td>
							<td>해당학기</td>
							<td>매월말</td>
						</tr>
						<tr>
							<th>중국어</th>
							<td>HSK, CPT 성적이<br />우수한 학생
							</td>
							<td>해당자<br />전원
							</td>
							<td>50만원</td>
							<td>해당학기</td>
							<td>매월말</td>
						</tr>
						<tr>
							<th>일본어</th>
							<td>JLPT, JPT, NIKKEN 성적이<br />우수한 학생
							</td>
							<td>해당자<br />전원
							</td>
							<td>50만원</td>
							<td>해당학기</td>
							<td>매월말</td>
						</tr>
						<tr>
							<th>기사</th>
							<td>기사 자격증<br />취득 학생
							</td>
							<td>해당자<br />전원
							</td>
							<td>50만원</td>
							<td>해당학기</td>
							<td>매월말</td>
						</tr>
						<tr>
							<th>산업기사</th>
							<td>산업기사 자격증<br />취득 학생
							</td>
							<td>해당자<br />전원
							</td>
							<td>30만원</td>
							<td>해당학기</td>
							<td>매월말</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".sideMain").eq(1).children("a").addClass("navy");
		$(".sideMain").eq(1).children(".sideSub").addClass("cur");
	});
</script>