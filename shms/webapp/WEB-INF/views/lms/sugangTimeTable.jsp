<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 04		최희수	최초작성
* 2021. 06. 09		박초원	스타일 적용, 조회 컬럼 추가
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${student.name }의 시간표</title>
    
    <!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${cPath }/resources/lms/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${cPath }/resources/lms/vendors/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${cPath }/resources/lms/vendors/images/favicon-16x16.png">
    
<link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="${cPath }/resources/lms/assets/css/bootstrap.css">

 <link rel="stylesheet" href="${cPath }/resources/lms/assets/vendors/iconly/bold.css">

 <link rel="stylesheet" href="${cPath }/resources/lms/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
 <link rel="stylesheet" href="${cPath }/resources/lms/assets/vendors/bootstrap-icons/bootstrap-icons.css">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
 crossorigin="anonymous">

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 <link rel="stylesheet" href="${cPath }/resources/lms/assets/vendors/simple-datatables/style.css">
 <link rel="stylesheet" href="${cPath }/resources/lms/assets/vendors/summernote/summernote-lite.min.css">

 <link rel="stylesheet" href="${cPath }/resources/lms/assets/css/app.css">
 <link rel="shortcut icon" href="${cPath }/resources/lms/assets/images/favicon.svg" type="image/x-icon">
 <link rel="stylesheet" href="${cPath }/resources/lms/assets/css/commons.css" />
 <link rel="stylesheet" href="${cPath }/resources/lms/assets/css/studentMain.css" />

 <script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/javascript"></script>
</head>

<body> 	
<div class="page-content" style="padding : 20px">
   <section class="section">
       <h5 class="mb-3">${student.name }의 시간표</h5>
       <div class="card inputTable">
           <div class="card-body">
               <div class="table-responsive">
					<table id="timeTable">
						<thead>
							<tr class="text-center">
								<th scope="col" >시간</th>
								<th scope="col" >월</th>
								<th scope="col" >화</th>
								<th scope="col" >수</th>
								<th scope="col" >목</th>
								<th scope="col" >금</th>
							</tr>
						</thead>
						<tbody id="tableTbody">
							<c:forEach step="1" begin="9" end="18" var="timeVar">
								<tr>
									<th>${timeVar } : 00 ~ ${timeVar } : 50</th>
									<td class="t02${timeVar }"></td>
									<td class="t03${timeVar }"></td>
									<td class="t04${timeVar }"></td>
									<td class="t05${timeVar }"></td>
									<td class="t06${timeVar }"></td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
               </div>
           </div>
       </div>
       
   </section>
   </div>
   <script src="${cPath }/resources/lms/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${cPath }/resources/lms/assets/js/bootstrap.bundle.min.js"></script>

<script src="${cPath }/resources/lms/assets/vendors/apexcharts/apexcharts.js"></script>

<script src="${cPath }/resources/lms/assets/js/main.js"></script>
   <!-- contents end -->
   <script type="text/javascript">
		$.ajax({
			url: "<%=request.getContextPath()%>/lms/tiemTable.do"
			, success: function(res) {
				console.log("???" + res)
				$.each(res, function(idx, v) {
					for(var i=9; i<19; i++) {
						if(v.lec_time == i) {
							if(v.dayotw == 02) {
								for(var j=1; j< v.lec_pnt; j++) {
									var element = ".t02" + (v.lec_time + j);
									$(element).remove();
								}
								$(".t02"+i).attr("rowSpan", v.lec_pnt);
								let color = makecir();
								$(".t02"+i).html(
										v.lec_name + "<br/>("+ v.building_nm + " " + v.lecrum_nm+")<br/>" + v.name 
								).css("background-color", color);
							}
							if(v.dayotw == 03) {
								for(var j=1; j< v.lec_pnt; j++) {
									var element = ".t03" + (v.lec_time + j);
									$(element).remove();
								}
								$(".t03"+i).attr("rowSpan", v.lec_pnt);
								let color = makecir();
								$(".t03"+i).html(
										v.lec_name + "<br/>("+ v.building_nm + " " + v.lecrum_nm+")<br/>" + v.name 
								).css("background-color", color);
							}
							if(v.dayotw == 04) {
								for(var j=1; j< v.lec_pnt; j++) {
									var element = ".t04" + (v.lec_time + j);
									$(element).remove();
								}
								$(".t04"+i).attr("rowSpan", v.lec_pnt);
								let color = makecir();
								$(".t04"+i).html(
										v.lec_name + "<br/>("+ v.building_nm + " " + v.lecrum_nm+")<br/>" + v.name 
								).css("background-color", color);
							}
							if(v.dayotw == 05) {
								for(var j=1; j< v.lec_pnt; j++) {
									var element = ".t05" + (v.lec_time + j);
									$(element).remove();
								}
								$(".t05"+i).attr("rowSpan", v.lec_pnt);
								let color = makecir();
								$(".t05"+i).html(
										v.lec_name + "<br/>("+ v.building_nm + " " + v.lecrum_nm+")<br/>" + v.name 
								).css("background-color", color);
							}
							if(v.dayotw == 06) {
								for(var j=1; j< v.lec_pnt; j++) {
									var element = ".t06" + (v.lec_time + j);
									$(element).remove();
								}
								$(".t06"+i).attr("rowSpan", v.lec_pnt);
								let color = makecir();
								$(".t06"+i).html(
										v.lec_name + "<br/>("+ v.building_nm + "" + v.lecrum_nm+")<br/>" + v.name 
								).css("background-color", color);
							}
						}
					}
				});
			}
			, error : function(error, msg) {
				console.log(error);
				console.log(msg);
			}
			
		});
		function rand(min,max){
			var ran = Math.floor(Math.random() * (max-min+1) + min);
			return ran;
		}
		var num = -1;
		function makecir(){
			num++;
			if(num > 400){
				clearInterval(auto);
				return;
			}
			
			var r = rand(50,80);
			var g = rand(120,180);
			var b = rand(200,250);
			
			return "rgb("+ r +","+ g +","+ b +")";
		}
	</script>

</body>
</html>