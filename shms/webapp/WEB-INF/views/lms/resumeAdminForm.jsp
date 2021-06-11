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
                      </table>
                      <h6 class="m-b-20">
						<i class="fa fa-paperclip m-r-5 f-s-18"></i> 이력서 / 자기소개서 첨삭파일
					  </h6>
					  <div class="form-inline fileArea row">
						<p class="fileBox col-lg-6">
							<input class="form-control" type="file" name="mail_files">
							<span class="plusBtn btn btn-secondary">+</span>
						</p>
					  </div>
                      <div class="text-center mt-3">
                          <a href="${cPath }/lms/resumeAdmin.do" class="btn btn-light-secondary">취소</a>
                          <button type="button" class="btn btn-primary">저장</button>
                      </div>
                  </form>
              </div>
          </div>
      </div>
  </section>
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