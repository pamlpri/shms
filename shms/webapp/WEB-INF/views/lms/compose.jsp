<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cPath }/resources/lms/assets/vendors/toastify/toastify.css">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet">
<link rel="stylesheet" href="${cPath }/resources/lms/assets/vendors/summernote/summernote-lite.min.css">

<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">HOME</a></li>
			<li class="breadcrumb-item"><a href="${cPath }/lms/compose.do">웹메일</a></li>
			<li class="breadcrumb-item active" aria-current="page">메일보내기</li>
		</ol>
	</nav>

	<section class="section">
		<div class="card">
			<div class="card-body">
				<div class="compose-content">
					<p style="font-size: 0.9em;">
						전체 메일을 보낼 경우에는 <strong>,</strong> 로 구분하세요.
					</p>
					<form action="#">
						<div class="form-group">
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1"><i
									class="bi bi-search"></i></span> <input id="mailTo" type="text"
									class="form-control bg-transparent" placeholder=" To">
								<!-- Button trigger for scrolling content modal -->
								<button type="button" class="btn btn-outline-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModalScrollable"
									id="button-addon2" style="border: 1px solid #dce7f1;">
									검색</button>
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control bg-transparent"
								placeholder=" Subject">
						</div>
						<div class="form-group">
							<div id="summernote"></div>
						</div>
						<h6 class="m-b-20">
							<i class="fa fa-paperclip m-r-5 f-s-18"></i> 첨부파일
						</h6>
						<div class="form-group">
							<div class="fallback">
								<div class="col-12 col-md-12">
									<div class="card">
										<div class="card-content">
											<!-- File uploader with validation -->
											<input type="file" class="with-validation-filepond" required
												multiple data-max-file-size="5MB" data-max-files="3">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="text-center m-t-15">
							<a href="inbox.html"
								class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"><i
								class="ti-close m-r-5 f-s-12"></i> 취소</a>
							<button onclick="location.href='${cPath}/lms/send.do'"
								class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
								type="button">
								<i class="fa fa-paper-plane m-r-5"></i> 메일보내기
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!--scrolling content Modal -->
		<div class="modal fade" id="exampleModalScrollable" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalScrollableTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel33">주소록 검색</h4>
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
									<option>웹메일</option>
									<option>이름</option>
									<option>학과</option>
									<option>부서</option>
								</select>
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1"><i
									class="bi bi-search"></i></span> <input type="text"
									class="form-control" placeholder="검색어를 입력하세요."
									aria-label="Recipient's username"
									aria-describedby="button-addon2">
								<button class="btn btn-outline-secondary" type="button"
									id="button-addon2" style="border: 1px solid #dce7f1;">검색</button>
							</div>
							<div id="mailList">
								<ul class="list-group">
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="김영민 (abc@shms.ac)" aria-label="..."> 김영민
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Dapibus (abc@shms.ac)" aria-label="...">
										Dapibus (abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Morbi (abc@shms.ac)" aria-label="..."> Morbi
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Porta (abc@shms.ac)" aria-label="..."> Porta
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Vestibulum (abc@shms.ac)" aria-label="...">
										Vestibulum (abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="김영민 (abc@shms.ac)" aria-label="..."> 김영민
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Dapibus (abc@shms.ac)" aria-label="...">
										Dapibus (abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Morbi (abc@shms.ac)" aria-label="..."> Morbi
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Porta (abc@shms.ac)" aria-label="..."> Porta
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Vestibulum (abc@shms.ac)" aria-label="...">
										Vestibulum (abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="김영민 (abc@shms.ac)" aria-label="..."> 김영민
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Dapibus (abc@shms.ac)" aria-label="...">
										Dapibus (abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Morbi (abc@shms.ac)" aria-label="..."> Morbi
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Porta (abc@shms.ac)" aria-label="..."> Porta
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Vestibulum (abc@shms.ac)" aria-label="...">
										Vestibulum (abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="김영민 (abc@shms.ac)" aria-label="..."> 김영민
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Dapibus (abc@shms.ac)" aria-label="...">
										Dapibus (abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Morbi (abc@shms.ac)" aria-label="..."> Morbi
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Porta (abc@shms.ac)" aria-label="..."> Porta
										(abc@shms.ac)</li>
									<li class="list-group-item"><input
										class="form-check-input me-1" type="checkbox"
										value="Vestibulum (abc@shms.ac)" aria-label="...">
										Vestibulum (abc@shms.ac)</li>
								</ul>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light-secondary"
								data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> <span
									class="d-none d-sm-block">닫기</span>
							</button>
							<button id="mailChoice" type="button"
								class="btn btn-primary ml-1" data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> <span
									class="d-none d-sm-block">선택</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- contents end -->
</div>
<!-- filepond validation -->
<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>

<!-- image editor -->
<script src="https://unpkg.com/filepond-plugin-image-exif-orientation/dist/filepond-plugin-image-exif-orientation.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-filter/dist/filepond-plugin-image-filter.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.js"></script>

<script src="${cPath }/resources/lms/assets/vendors/apexcharts/apexcharts.js"></script>
<script src="${cPath }/resources/lms/assets/js/pages/dashboard.js"></script>

<script src="${cPath }/resources/lms/assets/vendors/summernote/summernote-lite.min.js"></script>
<script>
    $('#summernote').summernote({
        tabsize: 2,
        height: 420,
    })
    $("#hint").summernote({
        height: 100,
        toolbar: false,
        placeholder: 'type with apple, orange, watermelon and lemon',
        hint: {
            words: ['apple', 'orange', 'watermelon', 'lemon'],
            match: /\b(\w{1,})$/,
            search: function (keyword, callback) {
                callback($.grep(this.words, function (item) {
                    return item.indexOf(keyword) === 0;
                }));
            }
        }
    });

</script>

<!-- toastify -->
<script src="${cPath }/resources/lms/assets/vendors/toastify/toastify.js"></script>

<!-- filepond -->
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>
<script>
    // register desired plugins...
    FilePond.registerPlugin(
        // validates the size of the file...
        FilePondPluginFileValidateSize,
        // validates the file type...
        FilePondPluginFileValidateType,
    );
    
    // Filepond: With Validation
    FilePond.create( document.querySelector('.with-validation-filepond'), { 
        allowImagePreview: false,
        allowMultiple: true,
        allowFileEncode: false,
        required: true,
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });
</script>

<script src="${cPath }/resources/lms/assets/js/main.js"></script>

<script>
    $(function(){
        $("#mailChoice").on("click", function(){
            var list = [];
            $("#mailList").find("input[type='checkbox']:checked").each(function(index, element){
                var mail = element.value;
                list.push(mail);
            });
            $("#mailTo").val(list.join(", "));
        });
    });
</script>