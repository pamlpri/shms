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
<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
		<h1>${lec_name}</h1>
	 </div>
  </section>

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lecture/main.do?lec_code=${lec_code}">Home</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lecture/lectureInfo.do">강의실 홈</a></li>
          <li class="breadcrumb-item active" aria-current="page">출석관리</li>
      </ol>
  </nav>

  <section class="section">
      <div class="section-body">
          <h2 class="section-title">출석관리</h2>
          <div class="row">
              <div class="col-12">
                  <div class="card">
                  <div class="card-body table-scroll" id="table-scroll">
                    <div class="table-responsive table-wrap">
                      <table class="table table-striped main-table" id="attendance-table">
                          <div class="text-right excelWrap">
                              <a href="#" class="btn btn-warning">성적부 반영</a>
                              <a href="#" class="btn btn-icon btn-primary"><i class="far fa-file"></i> Excel 다운로드</a>
                          </div>
                          <thead>                                 
                          <tr>
                              <th class="text-center">No.</th>
                              <th class="text-center">이름</th>
                              <th class="text-center">학번</th>
                              <th class="text-center">학과</th>
                              <th class="text-center">1주</th>
                              <th class="text-center">2주</th>
                              <th class="text-center">3주</th>
                              <th class="text-center">4주</th>
                              <th class="text-center">5주</th>
                              <th class="text-center">6주</th>
                              <th class="text-center">7주</th>
                              <th class="text-center">8주</th>
                              <th class="text-center">9주</th>
                              <th class="text-center">10주</th>
                              <th class="text-center">11주</th>
                              <th class="text-center">12주</th>
                              <th class="text-center">13주</th>
                              <th class="text-center">14주</th>
                              <th class="text-center">15주</th>
                              <th class="text-center">16주</th>
                              <th class="text-center">출석</th>
                              <th class="text-center">지각</th>
                              <th class="text-center">결석</th>
                          </tr>
                          </thead>
                          <tbody>                                 
                          <tr>
                              <td class="text-center">1</td>
                              <td class="text-center">
                                  <a class="text-color" href="${cPath}/lecture/attendance.do">박초원</a>
                              </td>
                              <td class="text-center">S1400714</td>
                              <td class="text-center">안경광학과</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">▲</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">12</td>
                              <td class="text-center">1</td>
                              <td class="text-center">4</td>
                          </tr>
                          <tr>
                              <td class="text-center">1</td>
                              <td class="text-center">
                                  <a class="text-color" href="${cPath}/lecture/attendance.do">박초원</a>
                              </td>
                              <td class="text-center">S1400714</td>
                              <td class="text-center">안경광학과</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">▲</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">12</td>
                              <td class="text-center">1</td>
                              <td class="text-center">4</td>
                          </tr>
                          <tr>
                              <td class="text-center">1</td>
                              <td class="text-center">
                                  <a class="text-color" href="${cPath}/lecture/attendance.do">박초원</a>
                              </td>
                              <td class="text-center">S1400714</td>
                              <td class="text-center">안경광학과</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">▲</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">12</td>
                              <td class="text-center">1</td>
                              <td class="text-center">4</td>
                          </tr>
                          <tr>
                              <td class="text-center">1</td>
                              <td class="text-center">
                                  <a class="text-color" href="${cPath}/lecture/attendance.do">박초원</a>
                              </td>
                              <td class="text-center">S1400714</td>
                              <td class="text-center">안경광학과</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">▲</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">12</td>
                              <td class="text-center">1</td>
                              <td class="text-center">4</td>
                          </tr>
                          <tr>
                              <td class="text-center">1</td>
                              <td class="text-center">
                                  <a class="text-color" href="${cPath}/lecture/attendance.do">박초원</a>
                              </td>
                              <td class="text-center">S1400714</td>
                              <td class="text-center">안경광학과</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">▲</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">12</td>
                              <td class="text-center">1</td>
                              <td class="text-center">4</td>
                          </tr>
                          <tr>
                              <td class="text-center">1</td>
                              <td class="text-center">
                                  <a class="text-color" href="${cPath}/lecture/attendance.do">박초원</a>
                              </td>
                              <td class="text-center">S1400714</td>
                              <td class="text-center">안경광학과</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">▲</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">12</td>
                              <td class="text-center">1</td>
                              <td class="text-center">4</td>
                          </tr>
                          <tr>
                              <td class="text-center">1</td>
                              <td class="text-center">
                                  <a class="text-color" href="${cPath}/lecture/attendance.do">박초원</a>
                              </td>
                              <td class="text-center">S1400714</td>
                              <td class="text-center">안경광학과</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">▲</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">12</td>
                              <td class="text-center">1</td>
                              <td class="text-center">4</td>
                          </tr>
                          <tr>
                              <td class="text-center">1</td>
                              <td class="text-center">
                                  <a class="text-color" href="${cPath}/lecture/attendance.do">박초원</a>
                              </td>
                              <td class="text-center">S1400714</td>
                              <td class="text-center">안경광학과</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">▲</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">12</td>
                              <td class="text-center">1</td>
                              <td class="text-center">4</td>
                          </tr>
                          <tr>
                              <td class="text-center">1</td>
                              <td class="text-center">
                                  <a class="text-color" href="${cPath}/lecture/attendance.do">박초원</a>
                              </td>
                              <td class="text-center">S1400714</td>
                              <td class="text-center">안경광학과</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">▲</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">X</td>
                              <td class="text-center">X</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">O</td>
                              <td class="text-center">12</td>
                              <td class="text-center">1</td>
                              <td class="text-center">4</td>
                          </tr>
                          </tbody>
                      </table>
                      </div>
                  </div>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>
<script>
$(document).ready(function() {
    $('#attendance-table').DataTable({
    	"columnDefs": [ {
	   		"targets": [4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22],
	   		"orderable": false
   		}]
    });
} );
</script>