<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 18.      박초원       학생 출석현황 페이지 조회 및 출석상태 수정 
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- CSS Libraries -->
<link rel="stylesheet" href="${cPath }/resources/lecture/dist/modules/izitoast/css/iziToast.min.css">

 <div class="main-content">
   <section class="section">
     <div class="section-header">
		<h1>${lec_name }</h1>
	 </div>
   </section>

   <!-- contents start -->
   <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <c:choose>
      	<c:when test="${'ST' eq user.user[1]}">
			<li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
		</c:when>
		<c:otherwise>
      		<li class="breadcrumb-item"><a href="${cPath }/lecture/index.do?lec_code=${lec_code}&lec_name=${lec_name}">Home</a></li>
		</c:otherwise>
      </c:choose>
      <li class="breadcrumb-item"><a href="${cPath }/lecture/lectureInfo.do">강의실홈</a></li>
      <li class="breadcrumb-item active" aria-current="page">출석관리</li>
    </ol>
  </nav>
   
   <div class="card attendance">
     <div class="card-body">
       <div class="table-responsive">
         <table class="table table-bordered table-md">
           <tr>
             <th>강의명</th>
             <td colspan="5">${lec_name }</td>
           </tr>
           <tr>
             <th>강의기간</th>
             <td colspan="5">${attend.lec_term }</td>
           </tr>
           <tr>
             <th>강의시간</th>
             <td colspan="5">${attend.dayotw_nm } (${attend.lec_time }:00 ~ ${attend.end_time }:00)</td>
           </tr>
           <tr>
             <th>학생명</th>
             <td colspan="5">${attend.name }</td>
           </tr>
           <tr>
             <th>총 수강일</th>
             <th>출석일</th>
             <th>지각일</th>
             <th>조퇴일</th>
             <th>결석일</th>
             <th>출석률(일수)</th>
           </tr>
           <tr>
           	 <td>15일</td>
           	 <td class="cs_cnt">${attend.cs_cnt }일</td>
             <td class="jg_cnt">${attend.jg_cnt }일</td>
             <td class="jt_cnt">${attend.jt_cnt }일</td>
             <td class="gs_cnt">${attend.gs_cnt }일</td>
             <td class="per">${attend.attend_per }%</td>
           </tr>
         </table>
       </div>
     </div>
   </div>

   <div class="card attendance">
     <div class="card-body">
       <div class="table-responsive">
       	 <p>※ 비대면 강의는 출석시간, 퇴실시간을 조회할 수 없습니다.</p>
         <table class="table table-bordered table-md attendance">
           <tr>
             <th>주차</th>
             <th>강의분류</th>
             <th>일자</th>
             <th>출석시간</th>
             <th>퇴실시간</th>
             <th>출결상태</th>
             <c:if test="${user.user[1] eq 'PR' }">
	             <th>비고</th>
             </c:if>
           </tr>
           <c:forEach items="${attendList }" var="attnd">
	           <tr class="${attnd.atndan_no }">
	             <td>${attnd.lec_week }주차</td>
	             <td>
	             	<c:choose>
	             		<c:when test="${attnd.week_lec_cl eq 'DM' }">대면</c:when>
	             		<c:when test="${attnd.week_lec_cl eq 'BG' }">비대면</c:when>
	             		<c:when test="${attnd.week_lec_cl eq 'SG' }">실시간</c:when>
	             	</c:choose>
	             </td>
	             <fmt:parseDate var="dataFmt" pattern="yyyy-MM-dd HH:mm:ss.SSS" value="${attnd.attend_date }"/>
	             <fmt:formatDate var="dataTempParse" pattern="yyyy-MM-dd" value="${dataFmt}"/>
	             <td>${dataTempParse }</td>
	             <td>${empty attnd.attend_time_char ? '-':attnd.attend_time_char }</td>
	             <td>${empty attnd.exit_time_char ? '-':attnd.exit_time_char }</td>
	             <c:choose>
	             	<c:when test="${attnd.attend_stat eq 'CS'}"><td class="attend_stat">출석</td></c:when>
	             	<c:when test="${attnd.attend_stat eq 'JG'}"><td class="attend_stat">지각</td></c:when>
	             	<c:when test="${attnd.attend_stat eq 'JT'}"><td class="attend_stat">조퇴</td></c:when>
	             	<c:when test="${attnd.attend_stat eq 'GS'}"><td class="attend_stat">결석</td></c:when>
	             </c:choose>
	             <c:if test="${user.user[1] eq 'PR'}">
	             	 <c:choose>
	             	 	<c:when test="${attnd.attend_stat eq 'GS'}">
	             	 		<td>
	             	 			<button class="btn btn-primary updateBtn" data-type="CS">출석인정</button>
	             	 		</td>
	             	 	</c:when>
	             	 	<c:otherwise>
	             	 		<td>
	             	 			<button class="btn btn-secondary updateBtn" style="background-color: #6c757d;" data-type="GS">출석취소</button>
	             	 		</td>
	             	 	</c:otherwise>
	             	 </c:choose>
	             </c:if>
	           </tr>
           </c:forEach>
         </table>
       </div>
     </div>
   </div>
   <!-- contents end -->
 </div>
<!-- JS Libraies -->
<script src="${cPath }/resources/lecture/dist/modules/izitoast/js/iziToast.min.js"></script>
<!-- Page Specific JS File -->
<script src="${cPath }/resources/lecture/dist/js/page/modules-toastr.js"></script>
<script>
	$(".attendance").on("click", ".updateBtn", function(){
		let type = $(this).data("type");
		let atndan_no = $(this).parents("tr").attr("class");
		let obj = $(this);
		
		let cs_cnt = parseInt($(".cs_cnt").text());
		let gs_cnt = parseInt($(".gs_cnt").text());
		let jg_cnt = parseInt($(".jg_cnt").text());
		let jt_cnt = parseInt($(".jt_cnt").text());
		let per = parseInt($("per").text());
		
		let stat = $(this).parents("tr").children(".attend_stat").text(); 
		
		$.ajax({
			url : "${cPath}/lecture/attendanceUpdate.do"
			, data : {
				atndan_no : atndan_no,
				attend_stat : type
			}
			,method : "post"
			,dataType : "json"
			,success : function(resp){
				if(resp.result == "OK"){
					if(type == "CS") {
						$(obj).parents("tr").children(".attend_stat").text("출석");	
						$(obj).parent("td").prepend($("<button>").addClass("btn btn-secondary updateBtn").text("출석취소").data("type", "GS").css("background-color","#6c757d"));
						$(obj).remove();
						$(".cs_cnt").text(cs_cnt + 1 + "일");
						$(".gs_cnt").text(gs_cnt - 1 + "일");
						let per = ((cs_cnt + 1) / 15 * 100);
						$(".per").text(Math.floor(per) + "%");
					}else if(type == "GS"){
						$(obj).parents("tr").children(".attend_stat").text("결석");	
						$(obj).parent("td").prepend($("<button>").addClass("btn btn-primary updateBtn").text("출석인정").data("type", "CS").css("background-color","#6777ef"));
						$(obj).remove();
						$(".cs_cnt").text(cs_cnt - 1 + "일");
						$(".gs_cnt").text(gs_cnt + 1 + "일");
						let per = ((cs_cnt - 1) / 15 * 100);
						$(".per").text(Math.floor(per) + "%");
					}
				}
			},error : function(xhr, error, msg){ 
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
		});
		
		function jg(){
			console.log("호출됨");
			iziToast.error({
			    toastOnce: true ,
			    title: '오류',
			    message: '이미 지각처리 된 항목입니다.',
			    position: 'bottomCenter'
		    });
		}
	});
</script>