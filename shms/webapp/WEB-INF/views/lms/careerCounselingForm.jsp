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
          <li class="breadcrumb-item"><a href="#">진로상담</a></li>
          <li class="breadcrumb-item active" aria-current="page">진로상담</li>
      </ol>
  </nav>
  
  <div class="card inputTable">
      <div class="card-body">
          <form class="table-responsive">
              <table class="table table-bordered table-md">
                  <tr>
                      <th rowspan="2" class="align-middle text-center">상담대상</th>
                      <th class="align-middle text-center">학번</th>
                      <td>S1401001</td>
                      <th class="align-middle text-center">이름</th>
                      <td>강미나</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">전화번호</th>
                      <td>010-2344-1234</td>
                      <th class="align-middle text-center">웹메일</th>
                      <td>asdgasdg@shms.ac</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">상담일자</th>
                      <td colspan="2">2020.05.01</td>
                      <th class="align-middle text-center">작성자</th>
                      <td>하재관</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">상담주제</th>
                      <td colspan="2"><textarea class="form-control" id="floatingTextarea"></textarea></td>
                      <th class="align-middle text-center">상담분류</th>
                      <td>진로</td>
                  </tr>
                  <tr>
                      <th class="align-middle text-center">내용</th>
                      <td colspan="4">
                          <textarea class="form-control" rows="5" cols="5000" name="cont" id="cont"></textarea>
                      </td>
                  </tr>
              </table>
              <div class="text-center">
                  <a href="${cPath}/lms/careerCounselingAdmin.do" class="btn btn-secondary">취소</a>
                  <button type="button" class="btn btn-primary">저장</button>
              </div>
          </form>
      </div>
    </div>
  <!-- contents end -->
</div>
<script type="text/javascript" src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>
<script>
    CKEDITOR.replace("cont", {
		filebrowserUploadUrl : '${cPath}/lms/mailFiles.do',
		height: 800
	});
</script>