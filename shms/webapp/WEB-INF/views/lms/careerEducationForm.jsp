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
<link href="${cPath }/resources/lms/assets/css/calendar2/pignose.calendar.min.css" rel="stylesheet">
<div class="page-content">
 <!-- contents start -->
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">취업지원</a></li>
         <li class="breadcrumb-item active" aria-current="page">진로교육</li>
     </ol>
 </nav>

 <div class="card inputTable">
     <div class="card-body row">
         <div class="col-lg-8">
             <form class="table-responsive">
                 <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                     <tr>
                         <th class="align-middle text-center">교육명</th>
                         <td colspan="3"><input type="text" class="form-control"></td>
                     </tr>
                     <tr>
                         <th class="align-middle text-center">강사명</th>
                         <td><input type="text" class="form-control"></td>
                         <th class="align-middle text-center">소속</th>
                         <td><input type="text" class="form-control"></td>
                     </tr>
                     <tr>
                         <th class="align-middle text-center" >장소</th>
                         <td><input type="text" class="form-control" disabled id="place"></td>
                         <th class="align-middle text-center">일시</th>
                         <td><input type="text" class="form-control" disabled id="dataTime"></td>
                     </tr>
                     <tr>
                         <th class="align-middle text-center">인원</th>
                         <td>
                             <input type="number" class="form-control" style="width: 100px; display: inline-block;">
                             <span>명</span>
                         </td>
                         <th class="align-middle text-center">대상</th>
                         <td>
                             <input type="number" class="form-control" style="width: 100px; display: inline-block;">
                             <span>학년</span>
                         </td>
                     </tr>
                     <tr>
                         <th class="align-middle text-center">교육내용</th>
                         <td colspan="3">
							<textarea class="form-control" rows="5" cols="5000" name="cont" id="cont"></textarea>
                         </td>
                     </tr>
                 </table>
                 <div class="text-center">
                     <a href="${cPath }/lms/careerEducation.do" class="btn btn-light-secondary">취소</a>
                     <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                         data-bs-target="#default">
                         저장
                     </button>
                 </div>
             </form>
         </div>
         <div class="col-lg-4">
             <form id="roomRent">
                 <h5>진로교육 강의실 예약</h5>
                 <div class="row educationRoom">
                     <div class="col-lg-6">
                         <select class="form-select" id="rentBuild">
                             <option>-- 건물선택 --</option>
                             <option>경영대학관</option>
                             <option>공과대학관</option>
                         </select>
                     </div>
                     <div class="col-lg-6">
                         <select class="form-select" id="rentClass">
                             <option>-- 강의실선택 --</option>
                             <option>101호</option>
                             <option>202호</option>
                         </select>
                     </div>
                 </div>
                 <div id="roomCalendar" class="row">
                     <div class="col-lg-12">
                         <p class="rentTitle">예약날짜 선택</p>
                         <div class="card">
                             <div class="card-body">
                                 <div class="year-calendar"></div>
                                 <table class="calColor">
                                     <tr>
                                         <td>
                                             <span class="no"></span>
                                             <span>예약불가</span>
                                         </td>
                                         <td>
                                             <span class="pick"></span>
                                             <span>선택</span>
                                         </td>
                                     </tr>
                                 </table>
                             </div>
                         </div>
                         <!-- /# card -->
                     </div>
                 </div>
                 <div id="roomTime" class="row">
                     <div class="col-lg-12" style="margin-bottom: 30px;">
                         <p class="rentTitle">예약시간 선택</p>
                         <table>
                             <tr>
                                 <td class="rentNo">09:00-10:00</td>
                                 <td class="rentNo">10:00-11:00</td>
                                 <td>11:00-12:00</td>
                                 <td>12:00-13:00</td>
                                 <td>13:00-14:00</td>
                                 <td>14:00-15:00</td>
                                 <td>15:00-16:00</td>
                                 <td>16:00-17:00</td>
                                 <td>17:00-18:00</td>
                                 <td>18:00-19:00</td>
                                 <td>19:00-20:00</td>
                                 <td>20:00-21:00</td>
                             </tr>
                         </table>
                     </div>
                 </div>
                 <div class="row">
                     <button type="button" id="rentBtn" class="btn btn-primary block rentBtn" style="width: 100%; margin-bottom: 30px;"
                         data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
                         강의실예약
                     </button>
                 </div>
             </form>
         </div>
     </div>
   </div>
 <!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/js/calendar-2/moment.latest.min.js"></script>
<script src="${cPath }/resources/lms/assets/js/calendar-2/pignose.calendar.min.js"></script>
<script src="${cPath }/resources/lms/assets/js/calendar-2/pignose.init.js"></script>
<script type="text/javascript" src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>
<script>
    CKEDITOR.replace("cont", {
		filebrowserUploadUrl : '${cPath}/lms/mailFiles.do',
		height: 800
	});
</script>
<script>
        $(function(){
            $("#rentBtn").on("click", function(){
                let build = $("#rentBuild").val();
                let classRoom = $("#rentClass").val();
                let date = $(".year-calendar").find(".pignose-calendar-unit-active").data("date");
                console.log(date);
                let time = [];
                $(".rentPick").each(function(){
                    time.push($(this).text().split("-")[0]);
                });
                let len = time.length;
                console.log(time[0] + ", " + time[len-1]);
                $("#place").val(build + " " + classRoom);
                $("#dataTime").val(date + " " + time[0] + "-" + time[len-1]);
            });

            $("#roomTime").find("td").on("click", function(){
                var has = $(this).hasClass("rentPick");
                if(has){
                    if($(this).prev().hasClass("rentPick") && $(this).next().hasClass("rentPick")){
                        $(this).removeClass("rentPick");
                        $(this).nextAll().removeClass("rentPick");
                        has = false;
                    }else if($(this).prev().hasClass("rentPick") && !$(this).next().hasClass("rentPick")){
                        $(this).removeClass("rentPick");
                        has = false;
                    }else if(!$(this).prev().hasClass("rentPick") && $(this).next().hasClass("rentPick")){
                        $(this).removeClass("rentPick");
                        $(this).nextAll().removeClass("rentPick");
                        has = false;
                    }else {
                        $(this).removeClass("rentPick");
                        has = false;
                    }
                }else {
                    $(this).addClass("rentPick");
                    has = true;
                }
            });
        });
    </script>