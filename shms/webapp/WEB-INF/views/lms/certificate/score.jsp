<%--
* [[개정이력(Modification Information)]]
* 수정일        수정자         수정내용
* ----------  ---------  -----------------
* 2021. 6. 3.  김보미         최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${cPath }/resources/lms/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${cPath }/resources/lms/assets/js/html2canvas.js"></script>
<script type="text/javascript"
	src="${cPath }/resources/lms/assets/js/jspdf.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
<!--
P.HStyle0, LI.HStyle0, DIV.HStyle0 {
	style-name: "바탕글";
	margin-left: 0.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle1, LI.HStyle1, DIV.HStyle1 {
	style-name: "본문";
	margin-left: 15.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle2, LI.HStyle2, DIV.HStyle2 {
	style-name: "개요 1";
	margin-left: 10.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle3, LI.HStyle3, DIV.HStyle3 {
	style-name: "개요 2";
	margin-left: 20.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle4, LI.HStyle4, DIV.HStyle4 {
	style-name: "개요 3";
	margin-left: 30.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle5, LI.HStyle5, DIV.HStyle5 {
	style-name: "개요 4";
	margin-left: 40.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle6, LI.HStyle6, DIV.HStyle6 {
	style-name: "개요 5";
	margin-left: 50.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle7, LI.HStyle7, DIV.HStyle7 {
	style-name: "개요 6";
	margin-left: 60.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle8, LI.HStyle8, DIV.HStyle8 {
	style-name: "개요 7";
	margin-left: 70.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle9, LI.HStyle9, DIV.HStyle9 {
	style-name: "쪽 번호";
	margin-left: 0.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 160%;
	font-size: 10.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle10, LI.HStyle10, DIV.HStyle10 {
	style-name: "머리말";
	margin-left: 0.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: 0.0pt;
	line-height: 150%;
	font-size: 9.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle11, LI.HStyle11, DIV.HStyle11 {
	style-name: "각주";
	margin-left: 13.1pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: -13.1pt;
	line-height: 130%;
	font-size: 9.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle12, LI.HStyle12, DIV.HStyle12 {
	style-name: "미주";
	margin-left: 13.1pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: justify;
	text-indent: -13.1pt;
	line-height: 130%;
	font-size: 9.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.0pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}

P.HStyle13, LI.HStyle13, DIV.HStyle13 {
	style-name: "메모";
	margin-left: 0.0pt;
	margin-right: 0.0pt;
	margin-top: 0.0pt;
	margin-bottom: 0.0pt;
	text-align: left;
	text-indent: 0.0pt;
	line-height: 130%;
	font-size: 9.0pt;
	font-family: 맑은 고딕;
	letter-spacing: 0.5pt;
	font-weight: "normal";
	font-style: "normal";
	color: #000000;
}
-->
</style>
</head>
<body>
	<button type="button" class="btn btn-primary" id="savePdf"
		style='margin-left: 25%;'>PDF 저장</button>
	<div id="pdfDiv">
		<P CLASS=HStyle0 STYLE='text-align: center;'>
		<TABLE border="1" cellspacing="0" cellpadding="0"
			style='border-collapse: collapse; border: none; margin-left: 25%;'>
			<TR>
				<TD width="900" height="1025" valign="middle"
					style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
					<P CLASS=HStyle0 STYLE='text-align: center;'>
						<SPAN
							STYLE='font-size: 28.0pt; font-family: "굴림"; line-height: 160%;'>성
							적 증 명 서</SPAN>
					<TABLE border="1" cellspacing="0" cellpadding="0"
						style='border-collapse: collapse; border: none;'>
						<CAPTION align="top">
							<P CLASS=HStyle0>제 ${crtf.year }-${crtf.req_no } 호</P>
						</CAPTION>
						<TR>
							<TD colspan="4" width="170" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: right;'>
									<SPAN STYLE='font-family: "굴림";'>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번:</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="82" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>${crtf.stdnt_no}</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: right;'>
									<SPAN STYLE='font-family: "굴림";'>대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학:</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="82" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>${crtf.col_name}</SPAN>
								</P>
							</TD>
							<TD colspan="4" width="154" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: right;'>
									<SPAN STYLE='font-family: "굴림";'>졸&nbsp;&nbsp;업&nbsp;&nbsp;년&nbsp;&nbsp;월&nbsp;&nbsp;일
										:</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="75" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>${crtf.grdtn_de }</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD colspan="4" width="170" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: right;'>
									<SPAN STYLE='font-family: "굴림";'>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명
										:</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="82" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>${crtf.name }</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: right;'>
									<SPAN STYLE='font-family: "굴림";'>전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공
										:</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="82" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>${crtf.sub_name }</SPAN>
								</P>
							</TD>
							<TD colspan="7" width="154" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
							</TD>
						</TR>
						<TR>
							<TD colspan="4" width="170" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: right;'>
									<SPAN STYLE='font-family: "굴림";'>생&nbsp;&nbsp;&nbsp;년&nbsp;&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;&nbsp;
										일 :</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="82" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>${crtf.regno }</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: right;'>
									<SPAN STYLE='font-family: "굴림";'>부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공
										:</SPAN>
								</P>
							</TD>
							<TD colspan="8" width="312" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD colspan="4" width="170" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: right;'>
									<SPAN STYLE='font-family: "굴림";'>입&nbsp;&nbsp;학&nbsp;&nbsp; 년&nbsp;&nbsp;월&nbsp; 일 :</SPAN>
								</P>
							</TD>
							<TD colspan="6" width="248" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>${crtf.entsch_de }</SPAN>
								</P>
							</TD>
							<TD colspan="8" width="162" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="38" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>이수<BR>구분
									</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="38" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>이수과목명</SPAN>
								</P>
							</TD>
							<TD width="41" height="38" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>학점</SPAN>
								</P>
							</TD>
							<TD width="41" height="38" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>성적</SPAN>
								</P>
							</TD>
							<TD width="41" height="38" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>이수<BR>구분
									</SPAN>
								</P>
							</TD>
							<TD colspan="4" width="128" height="38" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>이수과목명</SPAN>
								</P>
							</TD>
							<TD width="41" height="38" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>학점&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="38" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>성적</SPAN>
								</P>
							</TD>
							<td colspan="6" width="41" height="38" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
							</td>
						</TR>
						<c:choose>
							<c:when test="${not empty  lecScoreList}">
								<c:forEach items="${selectSemstrList }" var="selectSemstrList">
									<TR>
										<TD colspan="6" width="252" height="17" valign="middle"
											style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
											<P CLASS=HStyle0 STYLE='text-align: center;'>
												<SPAN STYLE='font-family: "굴림";'>${selectSemstrList.year }년도
													${selectSemstrList.semstr }학기</SPAN>
											</P>
										</TD>
										<TD colspan="7" width="252" height="17" valign="middle"
											style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
											<P CLASS=HStyle0 STYLE='text-align: center;'>
												<SPAN STYLE='font-family: "굴림";'>년도 학기</SPAN>
											</P>
										</TD>
										<TD colspan="6" width="229" height="17" valign="middle"
											style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
											<P CLASS=HStyle0 STYLE='text-align: center;'>
												<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
											</P>
										</TD>
										<c:forEach items="${lecScoreList }" var="scoreList">
											<TR>
												<TD width="41" height="17" valign="middle"
													style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
													<P CLASS=HStyle0>
														<SPAN STYLE='font-family: "굴림";'>${scoreList.lec_cl_nm }</SPAN>
													</P>
												</TD>
												<TD colspan="3" width="128" height="17" valign="middle"
													style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
													<P CLASS=HStyle0>
														<SPAN STYLE='font-family: "굴림";'>${scoreList.lec_name }</SPAN>
													</P>
												</TD>
												<TD width="41" height="17" valign="middle"
													style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
													<P CLASS=HStyle0>
														<SPAN STYLE='font-family: "굴림";'>${scoreList.lec_pnt }</SPAN>
													</P>
												</TD>
												<TD width="41" height="17" valign="middle"
													style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
													<P CLASS=HStyle0>
														<SPAN STYLE='font-family: "굴림";'>${scoreList.pnt_rank_nm }</SPAN>
													</P>
												</TD>
												<TD colspan="5" width="169" height="17" valign="middle"
													style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
													<P CLASS=HStyle0>
														<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
													</P>
												</TD>
												<TD width="41" height="17" valign="middle"
													style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
													<P CLASS=HStyle0>
														<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
													</P>
												</TD>
												<TD width="41" height="17" valign="middle"
													style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
													<P CLASS=HStyle0>
														<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
													</P>
												</TD>
										</c:forEach>
										<TD colspan="3" width="117" height="17" valign="middle"
											style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
											<P CLASS=HStyle0 STYLE='text-align: center;'>
												<SPAN STYLE='font-family: "굴림";'>취득학점 계 :</SPAN>
											</P>
										</TD>
										<TD colspan="3" width="113" height="17" valign="middle"
											style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
											<P CLASS=HStyle0 STYLE='text-align: center;'>
												<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
											</P>
										</TD>
									</TR>
									</TR>
								</c:forEach>
							</c:when>
						</c:choose>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>영어회화</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="117" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: center;'>
									<SPAN STYLE='font-family: "굴림";'>백 점 확 산 :</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="113" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: center;'>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD rowspan="34" colspan="6" width="229" height="581"
								valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: center;'>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD colspan="2" width="81" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>취득학점&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="56" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="74" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>평점평균</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="83" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>취득학점</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="86" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>평점평균</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD colspan="6" width="252" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: center;'>
									<SPAN STYLE='font-family: "굴림";'>년도 학기</SPAN>
								</P>
							</TD>
							<TD colspan="7" width="252" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: center;'>
									<SPAN STYLE='font-family: "굴림";'>년도 학기</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD colspan="2" width="81" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>취득학점&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="56" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="74" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>평점평균</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="83" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>취득학점</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="86" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>평점평균</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD colspan="6" width="252" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: center;'>
									<SPAN STYLE='font-family: "굴림";'>년도 학기</SPAN>
								</P>
							</TD>
							<TD colspan="7" width="252" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: center;'>
									<SPAN STYLE='font-family: "굴림";'>년도 학기</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>

						<TR>
							<TD colspan="2" width="81" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>취득학점&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="56" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="74" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>평점평균</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="83" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>취득학점</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="86" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>평점평균</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD colspan="6" width="252" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: center;'>
									<SPAN STYLE='font-family: "굴림";'>년도 학기</SPAN>
								</P>
							</TD>
							<TD colspan="7" width="252" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0 STYLE='text-align: center;'>
									<SPAN STYLE='font-family: "굴림";'>년도 학기</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="128" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="5" width="169" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'></SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<TR>
							<TD colspan="2" width="81" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>취득학점&nbsp;</SPAN>
								</P>
							</TD>
							<TD width="56" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="74" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>평점평균</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="2" width="83" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>취득학점</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
							<TD colspan="3" width="86" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>평점평균</SPAN>
								</P>
							</TD>
							<TD width="41" height="17" valign="middle"
								style='border-left: solid #000000 0.4pt; border-right: solid #000000 0.4pt; border-top: solid #000000 0.4pt; border-bottom: solid #000000 0.4pt; padding: 1.4pt 5.1pt 1.4pt 5.1pt'>
								<P CLASS=HStyle0>
									<SPAN STYLE='font-family: "굴림";'>&nbsp;</SPAN>
								</P>
							</TD>
						</TR>
						<tr>

						</tr>
					</TABLE>
					</P>
					<P CLASS=HStyle0 STYLE='text-align: center;'>
						<SPAN
							STYLE='font-size: 13.0pt; font-family: "굴림"; line-height: 160%;'>위와
							같이 이수하였음을 증명합니다.</SPAN>
					</P>
					<P CLASS=HStyle0 STYLE='text-align: center;'>
						<SPAN
							STYLE='font-size: 13.0pt; font-family: "굴림"; line-height: 160%;'>${crtf.req_year }년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${crtf.req_month }월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${crtf.req_day }일</SPAN>
					</P>
					<P CLASS=HStyle0 STYLE='text-align: center;'>
						<SPAN
							STYLE='font-size: 13.0pt; font-family: "굴림"; line-height: 160%;'>&nbsp;</SPAN>
					</P>
					<P CLASS=HStyle0 STYLE='text-align: center;'>
						<SPAN
							STYLE='font-size: 13.0pt; font-family: "굴림"; line-height: 160%;'>&nbsp;</SPAN>
					</P>
					<P CLASS=HStyle0 STYLE='text-align: center;'>
						<SPAN
							STYLE='font-size: 29.0pt; font-family: "굴림"; line-height: 160%;'>인
							재 대 학 교 총 장</SPAN>
					</P> <IMG src="https://storage.cloud.google.com/shms/logo/sig.png"
					width="182" height="151" vspace="0" hspace="0" border="0">
					<P CLASS=HStyle0 STYLE='text-align: center;'>&nbsp;</P>
				</TD>
			</TR>
		</TABLE>
		</P>
		<BR> <BR>
	</div>
	<script>
		$(document).ready(
				function() {
					$('#savePdf').click(
							function() { // pdf저장 button id

								html2canvas($('#pdfDiv')[0]).then(
										function(canvas) { //저장 영역 div id		
											// 캔버스를 이미지로 변환
											var imgData = canvas
													.toDataURL('image/png');
											var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
											var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
											var imgHeight = canvas.height
													* imgWidth / canvas.width;
											var heightLeft = imgHeight;
											var margin = 10; // 출력 페이지 여백설정
											var doc = new jsPDF('p', 'mm');
											var position = 0;

											// 첫 페이지 출력
											doc.addImage(imgData, 'PNG',
													margin, position, imgWidth,
													imgHeight);
											heightLeft -= pageHeight;

											// 한 페이지 이상일 경우 루프 돌면서 출력
											while (heightLeft >= 20) {
												position = heightLeft
														- imgHeight;
												doc.addPage();
												doc.addImage(imgData, 'PNG', 0,
														position, imgWidth,
														imgHeight);
												heightLeft -= pageHeight;
											}

											// 파일 저장
											doc.save("test.pdf");
											// 		    doc.output("D:/Test.pdf");
											// 파일 출력
											// 		    window.open(doc.output('bloburl'), '_blank')
										});
							});
				})
	</script>

</body>
</html>