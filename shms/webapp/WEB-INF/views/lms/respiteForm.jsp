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
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">변동사항</a></li>
          <li class="breadcrumb-item active" aria-current="page">학사학위취득유예 신청</li>
      </ol>
  </nav>
  
  <section class="section">
      <div class="card">
          <div class="card inputTable">
              <div class="card-body">
                  <p>※ 졸업예정자로 확정된 자에 한해 신청이 가능합니다.</p>
                  <form>
                      <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                          <tr>
                              <th class="align-middle text-center">학번</th>
                              <td class="align-middle">S13412345</td>
                              <th class="align-middle text-center">이름</th>
                              <td class="align-middle">김지연</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">학과</th>
                              <td class="align-middle">항공학과</td>
                              <th class="align-middle text-center">학년</th>
                              <td class="align-middle">3학년</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">전화번호</th>
                              <td class="align-middle">
                                  <input type="number" class="form-control" />
                              </td>
                              <th class="align-middle text-center">웹메일</th>
                              <td class="align-middle">S1234535@shms.ac.kr</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">학적상태</th>
                              <td class="align-middle">재학</td>
                              <th class="align-middle text-center">졸업예정자여부</th>
                              <td class="align-middle">예정자</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">신청사유</th>
                              <td class="align-middle" colspan="3">
                                  <select class="form-select float-right">
                                      <option>-- 사유선택 --</option>
                                      <option>졸업에 필요한 학점은 모두 이수 하였으나 취업준비 등 개인사유로 신청</option>
                                      <option>
                                          제1전공 졸업요건은 모두 갖추었으나 복수(부)전공,
                                          연계·융합전공 이수를 위한 추가 학점 취득이 필요하여 신청
                                      </option>
                                  </select>
                              </td>
                          </tr>
                      </table>
                      <h6 class="m-b-20">
						<i class="fa fa-paperclip m-r-5 f-s-18"></i> 증명서류제출
					  </h6>
					  <div class="form-inline fileArea row">
						<p class="fileBox col-lg-6">
							<input class="form-control" type="file" name="mail_files">
							<span class="plusBtn btn btn-secondary">+</span>
						</p>
					  </div>
                      <div class="text-center mt-3">
                          <a href="${cPath }/lms/respite.do" class="btn btn-light-secondary">취소</a>
                          <!-- update시에만 보이는 버튼 -->
                          <button class="btn btn-primary" type="button">저장</button>
                          <button type="button" class="btn btn-danger block" data-bs-toggle="modal"
                              data-bs-target="#default">
                              삭제
                          </button>
                      </div>
                  </form>
              </div>
          </div>
      </div>
  </section>

  <!--Basic Modal -->
  <div class="modal fade text-left" id="default" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="myModalLabel1">게시글 삭제</h5>
                  <button type="button" class="close rounded-pill"
                      data-bs-dismiss="modal" aria-label="Close">
                      <i data-feather="x"></i>
                  </button>
              </div>
              <div class="modal-body">
                  <p>
                      삭제한 게시글은 복원이 불가합니다.<br/>
                      삭제하시겠습니까?
                  </p>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn  btn-secondary" data-bs-dismiss="modal">
                      <i class="bx bx-x d-block d-sm-none"></i>
                      <span class="d-none d-sm-block">닫기</span>
                  </button>
                  <button type="button" class="btn btn-primary ml-1"
                      data-bs-dismiss="modal">
                      <i class="bx bx-check d-block d-sm-none"></i>
                      <span class="d-none d-sm-block">삭제</span>
                  </button>
              </div>
          </div>
      </div>
  </div>
  <!-- contents end -->
</div>
<script>
	var source = '<p class="fileBox col-lg-6">'
		+ '<input class="form-control" type="file" name="mail_files">'
		+ '<span class="plusBtn btn btn-secondary">+</span>'
		+ '<span class="delBtn btn btn-danger">-</span>'
	    + '</p>';
	    
	$(".fileArea").on("click", ".plusBtn" ,function(){
		$(this).parents(".fileArea:first").append(source);
	});
	
	$(".fileArea").on("click", ".delBtn", function(){
		$(this).parent("p").remove();
	});
</script>