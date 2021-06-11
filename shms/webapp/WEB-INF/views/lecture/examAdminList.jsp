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
      <!-- 강의명 -->
      <h1>대학생활의 이해</h1>
    </div>
  </section>

  <div class="card attendance">
      <div class="card-body">
        <div class="table-responsive">
          <div class="text-right excelWrap">
            <a href="examAdminForm.html" class="btn btn-icon btn-primary"><i class="fas fa-pen"></i> 시험수정</a>
          </div>
          <table class="table table-bordered table-md">
            <tr>
              <th>제목</th>
              <td class="text-left">2학기 중간고사</td>
            </tr>
            <tr>
              <th>시험형태</th>
              <td class="text-left">온라인 시험</td>
            </tr>
            <tr>
              <th>객관식</th>
              <td class="text-left">50점</td>
            </tr>
            <tr>
              <th>단답형</th>
              <td class="text-left">30점</td>
            </tr>
            <tr>
              <th>서술형</th>
              <td class="text-left">20점</td>
            </tr>
            <tr>
              <th>총점</th>
              <td class="text-left">100점</td>
            </tr>
            <tr>
              <th>시작시간</th>
              <td class="text-left">2021.05.05 오후 12:00</td>
            </tr>
            <tr>
              <th>종료시간</th>
              <td class="text-left">2021.05.05 오후 13:00</td>
            </tr>
            <tr>
              <th>시험시간</th>
              <td class="text-left">60분</td>
            </tr>
            <tr>
              <th>응시</th>
              <td class="text-left">12 / 15</td>
            </tr>
          </table>
        </div>
      </div>

      <div class="card-body table-scroll" id="table-scroll">
          <div class="text-right excelWrap" style="margin-top: -2%;">
              <a href="#" class="btn btn-icon btn-primary"><i class="far fa-file"></i> Excel 다운로드</a>
          </div>
          <div class="table-responsive table-wrap">
              <table class="table table-striped main-table edit-table" id="report-table">
                  <thead>                                 
                  <tr>
                      <th class="text-center">이름</th>
                      <th class="text-center">학번</th>
                      <th class="text-center">학과</th>
                      <th class="text-center">상태</th>
                      <th class="text-center">객관식</th>
                      <th class="text-center">주관식</th>
                      <th class="text-center">서술형</th>
                      <th class="text-center">총점</th>
                      <th class="text-center">비고</th>
                  </tr>
                  </thead>
                  <tbody>                                 
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center">20</td>
                      <td class="text-center">98 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">미응시</td>
                      <td class="text-center"></td>
                      <td class="text-center"></td>
                      <td class="text-center"></td>
                      <td class="text-center">0 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center">19</td>
                      <td class="text-center">97 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center"></td>
                      <td class="text-center">78 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center"></td>
                      <td class="text-center">78 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center"></td>
                      <td class="text-center">78 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center"></td>
                      <td class="text-center">78 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center"></td>
                      <td class="text-center">78 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">미응시</td>
                      <td class="text-center"></td>
                      <td class="text-center"></td>
                      <td class="text-center"></td>
                      <td class="text-center">0 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center"></td>
                      <td class="text-center">78 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">미응시</td>
                      <td class="text-center"></td>
                      <td class="text-center"></td>
                      <td class="text-center"></td>
                      <td class="text-center">0 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center"></td>
                      <td class="text-center">78 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center"><a href="${cPath}/lecture/examOMR.do" class="text-color">송수미</a></td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center">응시</td>
                      <td class="text-center">50</td>
                      <td class="text-center">28</td>
                      <td class="text-center"></td>
                      <td class="text-center">78 / 100</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  </tbody>
              </table>
          </div>
      </div>
    </div>
  <!-- contents end -->
</div>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        var actions = $("table td:last-child").html();
        // Append table with add row form on add new button click
        
        // Add row on add button click
        $(document).on("click", ".add", function(){
            var empty = false;
            var input = $(this).parents("tr").find('input[type="text"]');
            input.each(function(){
                if(!$(this).val()){
                    $(this).addClass("error");
                    empty = true;
                } else{
                    $(this).removeClass("error");
                }
            });
            $(this).parents("tr").find(".error").first().focus();
            if(!empty){
                input.each(function(){
                    $(this).parent("td").html($(this).val());
                });			
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").removeAttr("disabled");
            }		
        });
        // Edit row on edit button click
        $(document).on("click", ".edit", function(){		
            $(this).parents("tr").find("td").eq(6).each(function(){
                $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
            });		
            $(this).parents("tr").find(".add, .edit").toggle();
            $(".add-new").attr("disabled", "disabled");
        });
        
        
        $('#report-table').DataTable({
        	
        });
    });
    </script>