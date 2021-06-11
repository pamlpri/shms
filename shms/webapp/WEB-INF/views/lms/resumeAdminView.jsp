<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">진로상담</a></li>
          <li class="breadcrumb-item active" aria-current="page">이력서/자기소개서</li>
      </ol>
  </nav>
  
  <section class="section">
      <div class="card">
          <div class="card inputTable">
              <div class="card-body">
                  <form>
                      <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                          <tr>
                              <th class="align-middle text-center">신청번호</th>
                              <td>12345</td>
                              <th class="align-middle text-center">신청일자</th>
                              <td>2020.05.01</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">학번</th>
                              <td>S1401001</td>
                              <th class="align-middle text-center">이름</th>
                              <td>강미나</td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">처리상태</th>
                              <td>승인</td>
                              <th class="align-middle text-center">처리일</th>
                              <td></td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">제목</th>
                              <td colspan="3">자기소개서 첨삭 부탁드립니다!</td>
                          </tr>
                          <tr>
                              <th class="text-center align-middle">내용</th>
                              <td colspan="4">
                                  이력서, 자기소개서 첨부파일로 보내드립니다.<br/>
                                  첨삭 부탁드립니다^^
                              </td>
                          </tr>
                          <tr>
                              <th class="text-center align-middle">요청파일</th>
                              <td colspan="3">
                                  <ul class="attat">
                                      <li><a href="#" class="text-color">성적증명서.pdf</a></li>
                                      <li><a href="#" class="text-color">추천서.pdf</a></li>
                                  </ul>
                              </td>
                          </tr>
                          <tr>
                              <th class="align-middle text-center">반려사유</th>
                              <td colspan="3">
                                  <textarea class="form-control" rows="3" id="returnResult"></textarea>
                                  <span id="returnWarning"></span>
                              </td>
                          </tr>
                      </table>
                      <div class="text-center">
                          <button type="button" class="btn btn-light-secondary" id="returnBtn">반려</button>
                          <button type="button" class="btn btn-primary">승인</button>
                      </div>
                  </form>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>

<script>
    $("#returnBtn").on("click", function(){
        let txt = $("#returnResult").val();
        if(txt == null || txt == ""){
            console.log(txt)
            $("#returnWarning").text("반려사유는 필수입력 항목입니다.");
            $("#returnResult").focus();
        }else {
            location.href="resumeAdmin.html";
        }
    }); 
</script>
