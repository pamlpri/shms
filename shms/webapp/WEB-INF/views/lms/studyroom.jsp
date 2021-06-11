<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${cPath }/resources/lms/assets/css/calendar2/pignose.calendar.min.css" rel="stylesheet">
<div class="page-content">
 <!-- contents start -->
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">편의시설</a></li>
         <li class="breadcrumb-item active" aria-current="page">도서관 스터디룸 예약</li>
     </ol>
 </nav>

 <section class="section">
     <div class="card">
         <div class="card-body">
             <ul class="nav nav-tabs" id="myTab" role="tablist">
                 <li class="nav-item" role="presentation">
                     <a class="nav-link active tabBtn" id="studyRoom-tab" data-bs-toggle="tab" href="#studyRoom"
                         role="tab" aria-controls="studyRoom" aria-selected="false">스터디룸</a>
                 </li>
                 <li class="nav-item" role="presentation">
                     <a class="nav-link tabBtn" id="myRoom-tab" data-bs-toggle="tab" href="#myRoom"
                         role="tab" aria-controls="myRoom" aria-selected="true">예약내역</a>
                 </li>
             </ul>
             <div class="tab-content" id="myTabContent">
                 <div class="tab-pane fade show active" id="studyRoom" role="studyRoom" aria-labelledby="studyRoom-tab">
                     <div class="row">
                         <div class="col-lg-8">
                             <div class="room row">
                                 <div class="roomImg col-lg-7">
                                     <img src="${cPath }/resources/lms/assets/images/room1.jpg" />
                                 </div>
                                 <div class="col-lg-5">
                                     <div class="form-check form-check-lg">
                                         <h5 class="text-left">스터디룸 1</h5>
                                         <div class="custom-control custom-checkbox roomCheck float-right">
                                             <input type="radio" name="choiceRoom" value="스터디룸1" class="form-check-input form-check-primary form-check-glow" id="study1">
                                             <label class="form-check-label" for="study1">신청</label>
                                         </div>
                                     </div>
                                     <table class="roomInfo">
                                         <tr>
                                             <th>최대인원</th>
                                             <td>5명</td>
                                         </tr>
                                         <tr>
                                             <th>시설형태</th>
                                             <td>평면</td>
                                         </tr>
                                         <tr>
                                             <th>기자재</th>
                                             <td>빔프로젝트(1)</td>
                                         </tr>
                                         <tr>
                                             <th>냉난방시설</th>
                                             <td>개별</td>
                                         </tr>
                                     </table>
                                 </div>
                             </div>

                             <div class="room row">
                                 <div class="roomImg col-lg-7">
                                     <img src="${cPath }/resources/lms/assets/images/room2.jpg" />
                                 </div>
                                 <div class="col-lg-5">
                                     <div class="form-check form-check-lg">
                                         <h5 class="text-left">스터디룸 2</h5>
                                         <div class="custom-control custom-checkbox roomCheck float-right">
                                             <input type="radio" name="choiceRoom"  value="스터디룸2" class="form-check-input form-check-primary form-check-glow" id="study1">
                                             <label class="form-check-label" for="study1">신청</label>
                                         </div>
                                     </div>
                                     <table class="roomInfo">
                                         <tr>
                                             <th>최대인원</th>
                                             <td>8명</td>
                                         </tr>
                                         <tr>
                                             <th>시설형태</th>
                                             <td>평면</td>
                                         </tr>
                                         <tr>
                                             <th>기자재</th>
                                             <td>빔프로젝트(1)</td>
                                         </tr>
                                         <tr>
                                             <th>냉난방시설</th>
                                             <td>중앙</td>
                                         </tr>
                                     </table>
                                 </div>
                             </div>
                             
                             <div class="room row">
                                 <div class="roomImg col-lg-7">
                                     <img src="${cPath }/resources/lms/assets/images/room3.jpg" />
                                 </div>
                                 <div class="col-lg-5">
                                     <div class="form-check form-check-lg">
                                         <h5 class="text-left">스터디룸 3</h5>
                                         <div class="custom-control custom-checkbox roomCheck float-right">
                                             <input type="radio" name="choiceRoom"  value="스터디룸3" class="form-check-input form-check-primary form-check-glow" id="study1">
                                             <label class="form-check-label" for="study1">신청</label>
                                         </div>
                                     </div>
                                     <table class="roomInfo">
                                         <tr>
                                             <th>최대인원</th>
                                             <td>20명</td>
                                         </tr>
                                         <tr>
                                             <th>시설형태</th>
                                             <td>평면</td>
                                         </tr>
                                         <tr>
                                             <th>기자재</th>
                                             <td>무선마이크(2)</td>
                                         </tr>
                                         <tr>
                                             <th>냉난방시설</th>
                                             <td>중앙</td>
                                         </tr>
                                     </table>
                                 </div>
                             </div>

                             <div class="room row">
                                 <div class="roomImg col-lg-7">
                                     <img src="${cPath }/resources/lms/assets/images/room2.jpg" />
                                 </div>
                                 <div class="col-lg-5">
                                     <div class="form-check form-check-lg">
                                         <h5 class="text-left">스터디룸 4</h5>
                                         <div class="custom-control custom-checkbox roomCheck float-right">
                                             <input type="radio" name="choiceRoom"  value="스터디룸4" class="form-check-input form-check-primary form-check-glow" id="study1">
                                             <label class="form-check-label" for="study1">신청</label>
                                         </div>
                                     </div>
                                     <table class="roomInfo">
                                         <tr>
                                             <th>최대인원</th>
                                             <td>10명</td>
                                         </tr>
                                         <tr>
                                             <th>시설형태</th>
                                             <td>평면</td>
                                         </tr>
                                         <tr>
                                             <th>기자재</th>
                                             <td>빔프로젝트(1)</td>
                                         </tr>
                                         <tr>
                                             <th>냉난방시설</th>
                                             <td>개별</td>
                                         </tr>
                                     </table>
                                 </div>
                             </div>
                         </div>
                         <form class="col-lg-4" id="roomRent">
                             <h5>예약현황 보기 및 신청</h5>
                             <div class="choiceRoomName">스터디룸 선택</div>
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
                                 <button type="button" class="btn btn-primary block rentBtn" style="width: 100%;"
                                     data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
                                     스터디룸 예약
                                 </button>
                             </div>
                         </form>
                     </div>
                 </div>
                 <div class="tab-pane fade row" id="myRoom" role="myRoom" aria-labelledby="myRoom-tab">
                     <section class="section">
                         <div class="card">
                             <div class="card-body">
                                 <div class="row">
                                     <div class="col-lg-4">
                                         <!-- 예약한 좌석이 있을때 -->
                                         <div class="roomQr" id="roomQrBlock">
                                             <img src="${cPath }/resources/lms/assets/images/qr.jpg" />
                                             <p class="text-center">입구에 비치된 카메라에<br/>QR코드 인식 후 입실해야 합니다.</p>
                                         </div>
                                         <!-- 예약한 좌석이 없을때 -->
                                         <div class="roomQr text-center" id="roomQrNone">
                                             <img src="${cPath }/resources/lms/vendors/images/logo_black.png" />
                                             <p class="text-center">예약한 열람실 좌석이 없습니다.</p>
                                         </div>
                                     </div>
                                     <div class="col-lg-8">
                                         <table class="table table-striped" id="table1">
                                             <thead>
                                                 <tr>
                                                     <th class="text-center">No.</th>
                                                     <th class="text-center">예약번호</th>
                                                     <th class="text-center">예약룸</th>
                                                     <th class="text-center">예약인원</th>
                                                     <th class="text-center">예약일</th>
                                                     <th class="text-center">예약시간</th>
                                                 </tr>
                                             </thead>
                                             <tbody>
                                                 <tr>
                                                     <td class="text-center">1</td>
                                                     <td class="text-center">1231415</td>
                                                     <td class="text-center">스터디룸 1</td>
                                                     <td class="text-center">3</td>
                                                     <td class="text-center">2021.05.23</td>
                                                     <td class="text-center">10:00 ~ 13:00</td>
                                                 </tr>
                                                 <tr>
                                                     <td class="text-center">1</td>
                                                     <td class="text-center">1231415</td>
                                                     <td class="text-center">스터디룸 1</td>
                                                     <td class="text-center">3</td>
                                                     <td class="text-center">2021.05.23</td>
                                                     <td class="text-center">10:00 ~ 13:00</td>
                                                 </tr>
                                                 <tr>
                                                     <td class="text-center">1</td>
                                                     <td class="text-center">1231415</td>
                                                     <td class="text-center">스터디룸 1</td>
                                                     <td class="text-center">3</td>
                                                     <td class="text-center">2021.05.23</td>
                                                     <td class="text-center">10:00 ~ 13:00</td>
                                                 </tr>
                                                 <tr>
                                                     <td class="text-center">1</td>
                                                     <td class="text-center">1231415</td>
                                                     <td class="text-center">스터디룸 1</td>
                                                     <td class="text-center">3</td>
                                                     <td class="text-center">2021.05.23</td>
                                                     <td class="text-center">10:00 ~ 13:00</td>
                                                 </tr>
                                             </tbody>
                                         </table>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </section>
                 </div>
             </div>
            
         </div>
     </div>
 </section>    

 <!-- 모달 -->
 <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
         role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalCenterTitle">
                     도서관 스터디룸 예약
                 </h5>
                 <button type="button" class="close" data-bs-dismiss="modal"
                     aria-label="Close">
                     <i data-feather="x"></i>
                 </button>
             </div>
             <div class="modal-body">
                 <p class="text-center">
                     도서관 스터디룸 예약이 완료되었습니다.<br/>
                     입실시간 30분후까지 입실하지 않으면<br/>
                     
                     자동으로 예약이 취소됩니다.
                 </p>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-primary"
                     data-bs-dismiss="modal">
                     <i class="bx bx-x d-block d-sm-none"></i>
                     <span class="d-none d-sm-block">닫기</span>
                 </button>
             </div>
         </div>
     </div>
 </div>

 <!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/js/calendar-2/moment.latest.min.js"></script>
<script src="${cPath }/resources/lms/assets/js/calendar-2/pignose.calendar.min.js"></script>
<script src="${cPath }/resources/lms/assets/js/calendar-2/pignose.init.js"></script>
<script>
    $(function(){
        $(".roomCheck").children("input[name='choiceRoom']").on("change", function(){
           let choiceRoom = $(this).val();
           $(".choiceRoomName").text(choiceRoom);
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
<script src="${cPath }/resources/lms/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>