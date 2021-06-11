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
          <li class="breadcrumb-item"><a href="#">강의개요</a></li>
          <li class="breadcrumb-item active" aria-current="page">공지사항</li>
      </ol>
  </nav>

  <section class="section">
      <div class="card">
        <div class="card-header">
          <h4 class="nontice-title">[강의공지사항]공지사항 제목<span class="notice-date">2020.05.20</span></h4>
        </div>
        <div class="card-body">
          <p>
            공 고<br><br/>

            2021학년도 우리대학 학생 동아리(일반, 전공봉사, 학술, 취창업)의 원활한 활동을 위하여아래와 같이 동아리 등록신청 일정을 공고합니다.<br><br>

            -- 아 래 --<br><br><br/>
                        1. 등록기간 : 2021. 03. 04(목) ~ 3. 31(수) 17:00까지<br><br/>
                        2. 구비서류 : 가. 동아리 등록신청서 1부.<br><br/>
                                      나. 회원명단 1부.<br>
                                      다. 신(新)년도 활동계획서 1부.<br>
                                      라. 전(前)년도 활동실적서 1부.<br>
                                      마. 동아리 지도교수 인정서 1부.<br>
                                      바. 서약서 1부.<br>
                                      사. 회칙 1부.<br><br>
                        3. 회원자격 : 가. 우리대학 재학생중(휴학생 제외) 동아리에 가입한 자.<br>
                                      나. 재학생이며 1인 1개 동아리 가입을 원칙으로 한다<br>
                                            (중복가입불가)<br><br>
                        4. 동아리등록 : 가. 활동을 하고자 하는 동아리는 반드시 학교에 필히 등록하여야 함.<br>
                                        나. 가입회원은 일반은 30명, 전공봉사, 학술,창업 동아리는 10명 이상.<br>
                                        다. 등록기간내에 구비서류를 제출하지 않은 동아리는 인정하지 않음. <br><br>
                        6. 구비서류 수령 : 일반동아리 - 학생·취업처 학생지원팀(8동 4층)<br>
                                          전공봉사,학술, 취·창업동아리 - 학과사무실/지도교수   <br><br>
                        7. 서류제출 : 학생·취업처 학생지원팀(8동 4층)<br><br><br>
            
                            인재대학교
          </p>
          <div class="board_downloader">
            <ul class="downloader">
              <li>
                <a href="#" class="text-color"><i class="fas fa-arrow-alt-circle-down"></i>1._현대카드대학등록금_학생용_납부_메뉴얼.pdf</a>
              </li>
              <li>
                <a href="#" class="text-color"><i class="fas fa-arrow-alt-circle-down"></i>2._현대카드_2021년_1학기_혜택_공지문(대학).png</a>
              </li>
            </ul>
         </div>
        </div>
        <div class="card-footer bg-whitesmoke">
          <div id="noticeBtnBox" class="text-right">
            <a id="listBtn" class="btn btn-icon icon-left btn-primary" href="${cPath }/lecture/reference.do">목록으로</a>
            <!--교수한테만 보이는 버튼-->
            <a id="updateBtn" class="btn btn-icon icon-left btn-primary" href="${cPath }/lecture/referenceForm.do">수정</a>
            <button id="deleteBtn" class="btn btn-danger" data-confirm="게시글 삭제|삭제한 게시글은 복원이 불가합니다.<br/>삭제하시겠습니까?">삭제</button>
          </div>
       </div>
    </div>
  </section>
  
  <div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Modal body text goes here.</p>
        </div>
        <div class="modal-footer bg-whitesmoke br">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>
  <!-- contents end -->
</div>