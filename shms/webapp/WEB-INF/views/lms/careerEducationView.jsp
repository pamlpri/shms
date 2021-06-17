<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* 2021. 6. 16.		최희수	진로교육 게시글 보기
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
      <div class="card-body">
          <div class="table-responsive">
              <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                  <tr>
                      <th class="align-middle text-center">교육명</th>
                      <td colspan="3">${courseEduc.educ_title }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">강사명</th>
                      <td>${courseEduc.instrctr_nm }</td>
                      <th class="align-middle text-center">소속</th>
                      <td>${courseEduc.instrctr_com }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">장소</th>
                      <td>${courseEduc.lecrum_info }</td>
                      <th class="align-middle text-center">일시</th>
                      <td>${courseEduc.educ_reg_date }</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">인원</th>
                      <td>${courseEduc.educ_nmpr }명</td>
                      <th class="align-middle text-center">대상</th>
                      <td>${courseEduc.educ_target }학년</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">교육내용</th>
                      <td class="minH" colspan="3">
                          ${courseEduc.educ_cont }
                      </td>
                  </tr>
              </table>
              <div class="text-center">
                  <a href="${cPath }/lms/careerEducation.do" class="btn btn-primary">목록으로</a>
					<!-- 취업장학과만 보이는 버튼 -->
					<c:if test="${user.user[1] eq 'CJ' }">
						<a href="${cPath }/lms/careerEducationForm.do"
							class="btn btn-primary">수정</a>
						<button type="button" class="btn btn-danger block"
							data-bs-toggle="modal" data-bs-target="#default">삭제</button>
					</c:if>
				</div>

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
          </div>
      </div>
    </div>
  <!-- contents end -->
</div>