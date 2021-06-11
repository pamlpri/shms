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

  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">학습활동</a></li>
          <li class="breadcrumb-item active" aria-current="page">과제관리</li>
      </ol>
  </nav>

  <div class="card attendance">
      <div class="card-body">
        <div class="table-responsive">
              <div class="text-right excelWrap">
                <a href="reportForm.html" class="btn btn-icon btn-primary"><i class="fas fa-pen"></i> 과제수정</a>
              </div>
              <table class="table table-bordered table-md">
                  <tr>
                  <th>과제명</th>
                  <td class="text-left">대학생활의 이해 ppt 제출</td>
                  </tr>
                  <tr>
                  <th>상태</th>
                  <td class="text-left">진행중</td>
                  </tr>
                  <tr>
                  <th>배점</th>
                  <td class="text-left">20</td>
                  </tr>
                  <tr>
                  <th>채점</th>
                  <td class="text-left">5 / 15</td>
                  </tr>
                  <tr>
                  <th>제출</th>
                  <td class="text-left">10 / 15</td>
                  </tr>
                  <tr>
                  <th>마감일</th>
                  <td class="text-left">2020.05.05 오전 10:00</td>
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
                      <th class="text-center">성적</th>
                      <th class="text-center">비고</th>
                  </tr>
                  </thead>
                  <tbody>                                 
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="#" class="btn btn-secondary disabled">미제출</a></td>
                      <td class="text-center"></td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="#" class="btn btn-secondary disabled">미제출</a></td>
                      <td class="text-center"></td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="#" class="btn btn-secondary disabled">미제출</a></td>
                      <td class="text-center"></td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="#" class="btn btn-secondary disabled">미제출</a></td>
                      <td class="text-center"></td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="${cPath}/lecture/reportView.do" class="btn btn-success">제출완료</a></td>
                      <td class="text-center">20</td>
                      <td class="text-center">
                          <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
                          <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-center">송수미</td>
                      <td class="text-center">S1605001</td>
                      <td class="text-center">행정학과</td>
                      <td class="text-center"><a href="#" class="btn btn-secondary disabled">미제출</a></td>
                      <td class="text-center"></td>
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
        $(this).parents("tr").find("td").eq(4).each(function(){
            $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
        });		
        $(this).parents("tr").find(".add, .edit").toggle();
        $(".add-new").attr("disabled", "disabled");
    });
    
 	$('#report-table').DataTable({
    	
    });
});
</script>