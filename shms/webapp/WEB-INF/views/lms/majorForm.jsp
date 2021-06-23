<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 23.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-content">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">HOME</a></li>
            <li class="breadcrumb-item"><a href="#">강의관리</a></li>
            <li class="breadcrumb-item active" aria-current="page">전공강의</li>
        </ol>
    </nav>

    <!-- contents start -->
    <section class="section">
        <h4 class="h4Title"><i class="fas fa-minus"></i> 기본정보</h4>
        <div class="card inputTable">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                        <tr>
                            <th class="align-middle text-center">강의명</th>
                            <td colspan="3" class="align-middle"><input type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <th class="text-center align-middle">담당자사번</th>
                            <td class="text-center">
                                <div class="input-group">
                                    <input id="mailTo" type="text" class="form-control bg-transparent" placeholder="사번">
                                    <!-- Button trigger for scrolling content modal -->
                                    <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"  data-bs-target="#exampleModalScrollable" id="button-addon2" style="border: 1px solid #dce7f1;">
                                        검색
                                    </button>
                                </div>
                            </td>
                            <th class="text-center align-middle">담당자명</th>
                            <td class="text-center"><input id="professorName" type="text" class="form-control"></td> 
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <h4 class="h4Title"><i class="fas fa-minus"></i> 기타정보</h4>
        <div class="card inputTable">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-md" style="border-color: #dfdfdf;">
                        <tr>
                            <th class="text-center">개설연도</th>
                            <td class="text-center"><input type="number" class="form-control"></td>
                            <th class="text-center">개설학기</th>
                            <td class="text-center"><input type="number" class="form-control"></td> 
                        </tr>
                        <tr>
                            <th class="text-center">이수구분</th>
                            <td class="text-center">
                                <select class="form-select float-right">
                                    <option>-- 분류선택 --</option>
                                    <option>전필</option>
                                    <option>전선</option>
                                </select>
                            </td> 
                            <th class="text-center">학점</th>
                            <td class="text-center"><input type="number" class="form-control"></td>
                        </tr>
                        <tr>
                            <th class="text-center">강의요일</th>
                            <td class="text-center"><input type="text" class="form-control"></td> 
                            <th class="text-center">강의시간</th>
                            <td class="text-center">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="time" class="form-control col-md-6">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="time" class="form-control col-md-6">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center">대상학과</th>
                            <td class="text-center"><input type="text" class="form-control"></td> 
                            <th class="text-center">대상학년</th>
                            <td class="text-center"><input type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <th class="text-center">강의정원</th>
                            <td class="text-center"><input type="number" class="form-control"></td> 
                            <th class="text-center">강의실</th>
                            <td class="text-center"><input type="text" class="form-control"></td>
                        </tr>
                    </table>
                </div>
            </div>  
        </div>
        <div class="text-center">
            <a href="major.html" class="btn btn-light-secondary">취소</a>
            <a href="major.html" class="btn btn-primary">저장</a>
        </div>
    </section>

    <!--scrolling content Modal -->
    <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel33">사번 검색</h4>
                    <button type="button" class="close" data-bs-dismiss="modal"
                        aria-label="Close">
                        <i data-feather="x"></i>
                    </button>
                </div>
                <form action="#">
                    <div class="modal-body row">
                        <div class="input-group mb-3">
                            <select class="form-select" id="basicSelect">
                                <option>전체</option>
                                <option>단과대</option>
                                <option>학과</option>
                                <option>이름</option>
                            </select>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
                            <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon2" style="border: 1px solid #dce7f1;">검색</button>
                        </div>
                        <div id="mailList">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    김영민 (P1234566) - 컴퓨터공학과
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Dapibus (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Morbi (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Porta (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Vestibulum (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    김영민 (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Dapibus (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Morbi (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Porta (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Vestibulum (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    김영민 (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Dapibus (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Morbi (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Porta (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Vestibulum (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    김영민 (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Dapibus (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Morbi (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Porta (P1234566)
                                </li>
                                <li class="list-group-item">
                                    <input class="form-check-input" type="checkbox" name="professor" onclick="doOpenCheck(this);">
                                    Vestibulum (P1234566)
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light-secondary"
                            data-bs-dismiss="modal">
                            <i class="bx bx-x d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">닫기</span>
                        </button>
                        <button id="mailChoice" type="button" class="btn btn-primary ml-1"
                            data-bs-dismiss="modal">
                            <i class="bx bx-check d-block d-sm-none"></i>
                            <span class="d-none d-sm-block">선택</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- contents end -->
</div>