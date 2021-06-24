<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 24.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">HOME</a></li>
          <li class="breadcrumb-item"><a href="#">학적관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">등록금납부</li>
      </ol>
  </nav>

  <!-- contents start -->
  
  <section class="section">
      <h4 class="h4Title">가상계좌등록</h4>
      <div class="card">
          <div class="card-body">
              <form id="searchForm"> 
                  <div class="row">
                      <div class="col-12">
                          <div class="row">
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>단과대</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
                                          <select class="form-select">
                                              <option>전체</option>
                                              <option>인문대학</option>
                                              <option>경상대학</option>
                                              <option>공과대학</option>
                                              <option>보건대학</option>
                                              <option>사회과학대학</option>
                                          </select>
                                      </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>학과</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
                                          <select class="form-select">
                                              <option>전체</option>
                                              <option>러시아학과</option>
                                              <option>국어국문학과</option>
                                              <option>독일어문학과</option>
                                              <option>영문학과</option>
                                              <option>항공학과</option>
                                              <option>행정학과</option>
                                              <option>경영학과</option>
                                              <option>간호학과</option>
                                              <option>안경광학과</option>
                                              <option>전체</option>
                                              <option>러시아학과</option>
                                              <option>국어국문학과</option>
                                              <option>독일어문학과</option>
                                              <option>영문학과</option>
                                              <option>항공학과</option>
                                              <option>행정학과</option>
                                              <option>경영학과</option>
                                              <option>간호학과</option>
                                              <option>안경광학과</option>
                                          </select>
                                      </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>학적상태</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
                                          <select class="form-select">
                                              <option>전체</option>
                                              <option>재학</option>
                                              <option>휴학</option>
                                              <option>졸업</option>
                                          </select>
                                      </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>검색</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <div class="input-group mb-3">
                                          <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                                          <button class="btn btn-outline-secondary searchInput" type="button">
                                              <i class="bi bi-search"></i>
                                          </button>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <input type="hidden" name="searchWord" value=""/>
              </form>

              <div class="col-md-12 mb-3">
                  <a href="#" class="btn btn-outline-primary">
                      Excel 학생명단 다운로드
                  </a>
                  <a href="#" class="btn btn-icon btn-primary"><i class="far fa-file"></i> <input id="excelUpload" type="file" onchange="readExcel();" /> Excel 일괄 등록</a>
              </div>

              <div class="table-responsive">
                  <table class="table table-bordered mb-0 tuitionList">
                      <thead>
                          <tr class="bg-th">
                              <th class="text-center">단과대</th>
                              <th class="text-center">학과</th>
                              <th class="text-center">학번</th>
                              <th class="text-center">이름</th>
                              <th class="text-center">등록금</th>
                              <th class="text-center">가상계좌</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td class="text-center">사회과학대학</td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">S23423455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3,550,000</td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">사회과학대학</td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">S23423455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3,550,000</td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">사회과학대학</td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">S23423455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3,550,000</td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">사회과학대학</td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">S23423455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3,550,000</td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">사회과학대학</td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">S23423455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3,550,000</td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">사회과학대학</td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">S23423455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3,550,000</td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">사회과학대학</td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">S23423455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3,550,000</td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">사회과학대학</td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">S23423455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3,550,000</td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">사회과학대학</td>
                              <td class="text-center">경영학과</td>
                              <td class="text-center">S23423455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">3,550,000</td>
                              <td class="text-center"></td>
                          </tr>
                      </tbody>
                  </table>
                  <div class="float-right mt-4">
                      <button type="button" id="resetBtn" class="btn btn-danger">초기화</button>
                      <button type="button" class="btn btn-primary">저장</button>
                  </div>
                  <nav aria-label="Page navigation example" class="pagenationNav">
                      <ul class="pagination pagination-primary">
                          <li class="page-item"><a class="page-link" href="#">
                                  <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                              </a></li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item active"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item"><a class="page-link" href="#">
                                  <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                              </a></li>
                      </ul>
                  </nav>
              </div>
          </div>
      </div>
      
      <h4 class="h4Title">등록금납부현황</h4>
      <div class="card">
          <div class="card-body">
              <form id="searchForm"> 
                  <div class="row">
                      <div class="col-12">
                          <div class="row">
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>단과대</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
                                          <select class="form-select">
                                              <option>전체</option>
                                              <option>인문대학</option>
                                              <option>경상대학</option>
                                              <option>공과대학</option>
                                              <option>보건대학</option>
                                              <option>사회과학대학</option>
                                          </select>
                                      </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>학과</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
                                          <select class="form-select">
                                              <option>전체</option>
                                              <option>러시아학과</option>
                                              <option>국어국문학과</option>
                                              <option>독일어문학과</option>
                                              <option>영문학과</option>
                                              <option>항공학과</option>
                                              <option>행정학과</option>
                                              <option>경영학과</option>
                                              <option>간호학과</option>
                                              <option>안경광학과</option>
                                              <option>전체</option>
                                              <option>러시아학과</option>
                                              <option>국어국문학과</option>
                                              <option>독일어문학과</option>
                                              <option>영문학과</option>
                                              <option>항공학과</option>
                                              <option>행정학과</option>
                                              <option>경영학과</option>
                                              <option>간호학과</option>
                                              <option>안경광학과</option>
                                          </select>
                                      </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>납부여부</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <fieldset class="form-group">
                                          <select class="form-select">
                                              <option>전체</option>
                                              <option>미납</option>
                                              <option>납부</option>
                                          </select>
                                      </fieldset>
                                  </div>
                              </div>
                              <div class="col-md-3 mb-2 row">
                                  <div class="col-md-auto searchTitle">
                                      <h6>검색</h6>
                                  </div>
                                  <div class="col-md-8">
                                      <div class="input-group mb-3">
                                          <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                                          <button class="btn btn-outline-secondary searchInput" type="button">
                                              <i class="bi bi-search"></i>
                                          </button>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <input type="hidden" name="searchWord" value=""/>
              </form>

              <div class="table-responsive">
                  <table class="table table-bordered mb-0 studentExcel">
                      <thead>
                          <tr class="bg-th">
                              <th class="text-center"></th>
                              <th class="text-center">단과대</th>
                              <th class="text-center">학과</th>
                              <th class="text-center">학번</th>
                              <th class="text-center">이름</th>
                              <th class="text-center">등록금</th>
                              <th class="text-center">가상계좌</th>
                              <th class="text-center">납부</th>
                              <th class="text-center">납부일 </th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-primary">납부</span></td>
                              <td class="text-center">2021.03.03</td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-danger">미납</span></td>
                              <td class="text-center">2021.03.03</td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-primary">납부</span></td>
                              <td class="text-center">2021.03.03</td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-danger">미납</span></td>
                              <td class="text-center">2021.03.03</td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-primary">납부</span></td>
                              <td class="text-center">2021.03.03</td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-danger">미납</span></td>
                              <td class="text-center">2021.03.03</td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-primary">납부</span></td>
                              <td class="text-center">2021.03.03</td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-danger">미납</span></td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-primary">납부</span></td>
                              <td class="text-center">2021.03.03</td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-danger">미납</span></td>
                              <td class="text-center"></td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-primary">납부</span></td>
                              <td class="text-center">2021.03.03</td>
                          </tr>
                          <tr>
                              <td class="text-center">
                                  <input class="form-check-input" type="checkbox" name="student" >
                              </td>
                              <td class="text-center">보건대학</td>
                              <td class="text-center">치위생과</td>
                              <td class="text-center">S123455</td>
                              <td class="text-center">김윤지</td>
                              <td class="text-center">2,500,000</td>
                              <td class="text-center">12314513513535</td>
                              <td class="text-center"><span class="badge bg-light-danger">미납</span></td>
                              <td class="text-center"></td>
                          </tr>
                      </tbody>
                  </table>
                  <div class="float-right mt-3">
                      <button class="btn btn-primary" type="button">일괄납부처리</button>
                      <a href="https://storage.cloud.google.com/shms/student/학생등록_양식.xlsx" class="btn btn-primary">
                          Excel 다운로드
                      </a>
                  </div>
                  <nav aria-label="Page navigation example" class="pagenationNav">
                      <ul class="pagination pagination-primary">
                          <li class="page-item"><a class="page-link" href="#">
                                  <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                              </a></li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item active"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                          <li class="page-item"><a class="page-link" href="#">
                                  <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                              </a></li>
                      </ul>
                  </nav>
              </div>
          </div>
      </div>
  </section>  
  <!-- contents end -->
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
<script>
    function readExcel() {
        let input = event.target;
        let reader = new FileReader();
        reader.onload = function () {
            $(".tuitionList").children("tbody").empty();
            let data = reader.result;
            let workBook = XLSX.read(data, { type: 'binary' });
            let rows = XLSX.utils.sheet_to_json(workBook.Sheets["학생등록양식"]);
            console.log(JSON.stringify(rows));
            for(var i = 0; i < rows.length; i++){
                var obj = rows[i];
                $(".tuitionList").children("tbody").append(
                    "<tr>"
                    + "<td class='text-center'>" + obj.단과대 + "</td>"
                    + "<td class='text-center'>" + obj.학과 + "</td>"
                    + "<td class='text-center'>" + obj.학번 + "</td>"
                    + "<td class='text-center'>" + obj.이름 + "</td>"
                    + "<td class='text-center'>" + obj.등록금 + "</td>"
                    + "<td class='text-center'>" + obj.가상계좌 + "</td>"
                    + "</tr>"
                );
            }
            
        };

        reader.readAsBinaryString(input.files[0]);
    }

    $("#resetBtn").on("click", function(){
        $(".tuitionList").children("tbody").empty(); 
    });
    
</script>