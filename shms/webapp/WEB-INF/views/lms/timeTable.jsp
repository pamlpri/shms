<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 06. 04		최희수	최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 	
<div class="page-content">
   <!-- contents start -->
   <nav aria-label="breadcrumb">
       <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
           <li class="breadcrumb-item"><a href="#">수강신청</a></li>
           <li class="breadcrumb-item active" aria-current="page"><a href="${cPath }/lms/timeTableView.do">내 시간표</li>
       </ol>
   </nav>

   <section class="section">
       <div class="card inputTable">
           <div class="card-body">
               <h5>${student.name }의 시간표</h5>
               <div class="table-responsive">
					<table id="timeTable">
						<thead>
							<tr class="text-center">
								<th scope="col" style="width: 150px">시간</th>
								<th scope="col" style="width: 300px">월</th>
								<th scope="col" style="width: 300px">화</th>
								<th scope="col" style="width: 300px">수</th>
								<th scope="col" style="width: 300px">목</th>
								<th scope="col" style="width: 300px">금</th>
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
								$(".t02"+i).html(v.lec_name).css("background-color", color);
							}
							if(v.dayotw == 03) {
								for(var j=1; j< v.lec_pnt; j++) {
									var element = ".t03" + (v.lec_time + j);
									$(element).remove();
								}
								$(".t03"+i).attr("rowSpan", v.lec_pnt);
								let color = makecir();
								$(".t03"+i).html(v.lec_name).css("background-color", color);
							}
							if(v.dayotw == 04) {
								for(var j=1; j< v.lec_pnt; j++) {
									var element = ".t04" + (v.lec_time + j);
									$(element).remove();
								}
								$(".t04"+i).attr("rowSpan", v.lec_pnt);
								let color = makecir();
								$(".t04"+i).html(v.lec_name).css("background-color", color);
							}
							if(v.dayotw == 05) {
								for(var j=1; j< v.lec_pnt; j++) {
									var element = ".t05" + (v.lec_time + j);
									$(element).remove();
								}
								$(".t05"+i).attr("rowSpan", v.lec_pnt);
								let color = makecir();
								$(".t05"+i).html(v.lec_name).css("background-color", color);
							}
							if(v.dayotw == 06) {
								for(var j=1; j< v.lec_pnt; j++) {
									var element = ".t06" + (v.lec_time + j);
									$(element).remove();
								}
								$(".t06"+i).attr("rowSpan", v.lec_pnt);
								let color = makecir();
								$(".t06"+i).html(v.lec_name).css("background-color", color);
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
			
			var s = rand(30,100);
			var x = rand(0,800);
			var y = rand(0,500);
			var r = rand(230,255);
			var g = rand(180,200);
			var b = rand(180,200);
			
			return "rgb("+ r +","+ g +","+ b +")";
		}
	</script>
</div>