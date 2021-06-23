<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
 <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#">HOME</a></li>
         <li class="breadcrumb-item"><a href="#">학적관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">학적조회</li>
     </ol>
 </nav>

 <!-- contents start -->
 <section class="section">
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

             <div class="table-responsive">
                 <table class="table table-bordered mb-0">
                     <thead>
                         <tr class="bg-th">
                             <th class="text-center">단과대</th>
                             <th class="text-center">학과</th>
                             <th class="text-center">학번</th>
                             <th class="text-center">이름</th>
                             <th class="text-center">생년월일</th>
                             <th class="text-center">성별</th>
                             <th class="text-center">학년 / 학기</th>
                             <th class="text-center">학적상태</th>
                             <th class="text-center">입학유형</th>
                             <th class="text-center">입학일</th>
                         </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                         <tr>
                             <td class="text-center">사회과학대학</td>
                             <td class="text-center">경영학과</td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">S1023455</a></td>
                             <td class="text-center"><a class="text-color" href="${cPath}/lms/academicView.do">김윤지</a></td>
                             <td class="text-center">120502</td>
                             <td class="text-center">여자</td>
                             <td class="text-center">2학년 1학기</td>
                             <td class="text-center">재학</td>
                             <td class="text-center">신입학</td>
                             <td class="text-center">2021.03.02</td>
                         </tr>
                     </tbody>
                 </table>
                 <div class="float-right mt-3">
                     <a href="#" class="btn btn-primary">
                         <i class="far fa-file"></i> Excel 다운로드
                     </a>
                 </div>
                 <nav aria-label="Page navigation example" class="pagenationNav">
                     <ul class="pagination pagination-primary">
                         <li class="page-item">
                             <a class="page-link" href="#">
                                 <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                             </a>
                         </li>
                         <li class="page-item"><a class="page-link" href="#">1</a></li>
                         <li class="page-item active"><a class="page-link" href="#">2</a></li>
                         <li class="page-item"><a class="page-link" href="#">3</a></li>
                         <li class="page-item">
                             <a class="page-link" href="#">
                                 <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                             </a>
                         </li>
                     </ul>
                 </nav>
             </div>
         </div>
     </div>
 </section>                
 <!-- contents end -->
</div>