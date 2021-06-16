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
          <li class="breadcrumb-item"><a href="#">강의실 홈</a></li>
          <li class="breadcrumb-item active" aria-current="page">성적관리</li>
      </ol>
  </nav>

  <section class="section">
      <div class="section-body">
          <h2 class="section-title">성적관리</h2>
          <div class="row">
              <div class="col-12">
                  <div class="card">
                  <div class="card-body table-scroll" id="table-scroll">
                    <div class="table-responsive table-wrap">
                      <table class="table table-striped main-table edit-table" id="grade-table">
                          <div class="text-right excelWrap">
                              <a href="#" class="btn btn-icon btn-primary"><i class="far fa-file"></i> Excel 다운로드</a>
                          </div>
                          <thead>                                 
                          <tr>
                              <th class="text-center">이름</th>
                              <th class="text-center">학번</th>
                              <th class="text-center">중간고사</th>
                              <th class="text-center">기말고사</th>
                              <th class="text-center">중간평가과제</th>
                              <th class="text-center">최종평가과제</th>
                              <th class="text-center">출석</th>
                              <th class="text-center">비고</th>
                          </tr>
                          </thead>
                          <tbody>                                 
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
	                              <td class="text-center">
	                                  <a class="add" title="Add" data-toggle="tooltip"><i class="fas fa-save">&#xE03B;</i></a>
	                                  <a class="edit" title="Edit" data-toggle="tooltip"><i class="fas fa-pen">&#xE254;</i></a>
	                              </td>
	                          </tr>
	                          <tr>
	                              <td class="text-center align-middle">송수미</td>
	                              <td class="text-center align-middle">S1605001</td>
	                              <td class="text-center">90.25</td>
	                              <td class="text-center">92.25</td>
	                              <td class="text-center">20.25</td>
	                              <td class="text-center">30.25</td>
	                              <td class="text-center">17</td>
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
              </div>
          </div>
      </div>
  </section>
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
        $(this).parents("tr").find("td:not(:last-child)").each(function(){
        	if($(this).index() != 0 && $(this).index() != 1){
	            $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
        	}
        });		
        $(this).parents("tr").find(".add, .edit").toggle();
        $(".add-new").attr("disabled", "disabled");
    });
    
    $('#grade-table').DataTable({
    	
    });
});
</script>