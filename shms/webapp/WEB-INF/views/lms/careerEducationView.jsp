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
                      <td colspan="3">자신있게 말하는 법</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">강사명</th>
                      <td>김혜나</td>
                      <th class="align-middle text-center">소속</th>
                      <td>고용노동부</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">장소</th>
                      <td>경영학관 101호</td>
                      <th class="align-middle text-center">일시</th>
                      <td>2021.05.20 PM 04:00</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">인원</th>
                      <td>150명</td>
                      <th class="align-middle text-center">대상</th>
                      <td>1학년</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">교육내용</th>
                      <td colspan="3">
                          Lorem Ipsum is simply dummy text of the printing and 
                          typesetting industry. Lorem Ipsum has been the industry's
                          standard dummy text ever since the 1500s, when an unknown 
                          printer took a galley of type and scrambled it to make 
                          a type specimen book. It has survived not only five centuries,
                          but also the leap into electronic typesetting, 
                          remaining essentially unchanged. It was popularised 
                          in the 1960s with the release of Letraset sheets 
                          containing Lorem Ipsum passages, and more recently with 
                          desktop publishing software like Aldus PageMaker including 
                          versions of Lorem Ipsum.
                      </td>
                  </tr>
              </table>
              <div class="text-center">
                  <a href="${cPath }/lms/careerEducation.do" class="btn btn-primary">목록으로</a>
                  <!-- 취업장학과만 보이는 버튼 -->
                  <a href="${cPath }/lms/careerEducationForm.do" class="btn btn-primary">수정</a>
                  <button type="button" class="btn btn-danger block" data-bs-toggle="modal"
                      data-bs-target="#default">
                      삭제
                  </button>
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