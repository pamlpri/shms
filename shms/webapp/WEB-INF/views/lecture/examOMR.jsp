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
        <form class="table-responsive">
          <table class="table table-bordered table-md">
            <tr>
              <th>이름</th>
              <td class="text-left">송수미</td>
            </tr>
            <tr>
              <th>학번</th>
              <td class="text-left">S1605001</td>
            </tr>
            <tr>
              <th>학과</th>
              <td class="text-left">행정학과</td>
            </tr>
            <tr>
              <th>객관식</th>
              <td class="text-left">50점</td>
            </tr>
            <tr>
              <th>주관식</th>
              <td class="text-left">30점</td>
            </tr>
            <tr>
                <th class="align-middle">서술형 1</th>
                <td>
                  <p class="text-left"> 
                      서술형 답안 출력되는곳 서술형 답안 출력되는곳
                      서술형 답안 출력되는곳
                      서술형 답안 출력되는곳
                      서술형 답안 출력되는곳
                      서술형 답안 출력되는곳
                      서술형 답안 출력되는곳
                  </p>
                  <input type="number" class="form-control" placeholder="점수입력" style="width:10%;"/>
                </td>
            </tr>
            <tr>
              <th class="align-middle">서술형 2</th>
              <td>
                <p class="text-left"> 
                    서술형 답안 출력되는곳 서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                </p>
                <input type="number" class="form-control" placeholder="점수입력" style="width:10%;"/>
              </td>
           </tr>
           <tr>
              <th class="align-middle">서술형 3</th>
              <td>
                <p class="text-left"> 
                    서술형 답안 출력되는곳 서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                    서술형 답안 출력되는곳
                </p>
                <input type="number" class="form-control" placeholder="점수입력" style="width:10%;"/>
              </td>
           </tr>
            <tr>
              <th>총점</th>
              <td class="text-left"></td>
            </tr>
          </table>
          <div class="text-center">
              <a href="${cPath }/lecture/examAdminList.do" class="btn btn-secondary">취소</a>
              <button type="button" class="btn btn-primary">저장</button>
          </div>
        </form>
      </div>
    </div>
  <!-- contents end -->
</div>