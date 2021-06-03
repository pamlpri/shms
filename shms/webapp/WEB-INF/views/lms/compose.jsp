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
					<form action="${cPath}/lms/webmailSend.do">
						<div class="form-group">
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1">
									<i class="bi bi-search"></i>
								</span>
								<input id="mailTo" type="text" class="form-control bg-transparent" placeholder=" To" name="receiver">
								<!-- Button trigger for scrolling content modal -->
								<button type="button" class="btn btn-outline-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModalScrollable"
									id="button-addon2" style="border: 1px solid #dce7f1;">
									검색</button>
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control bg-transparent"
								placeholder=" Subject" name="title">
						</div>
						<div class="form-group">
							<div id="summernote"></div>
							<input type="hidden" name="cont" id="webCont">
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
							<button
								class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
								type="button" id="sendBtn">
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
					<div class="modal-body row">
						<form action="${cPath }/lms/addressBook.do" id="searchForm">
							<input type="hidden" name="searchType" value="${userVO.searchMap.searchType }"/>
							<input type="hidden" name="searchWord" value="${userVO.searchMap.searchWord }"/>
						</form>
						<div id="searchUI">
							<div class="input-group mb-3">
								<select class="form-select" name="searchType">
									<option value="">전체</option>
									<option value="webmail">웹메일</option>
									<option value="name">이름</option>
									<option value="dept_code">학과</option>
									<option value="sub_code">부서</option>
								</select>
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1"><i
									class="bi bi-search"></i></span>
										<input type="text" name="searchWord"
											class="form-control" placeholder="검색어를 입력하세요." aria-describedby="button-addon2">
								<button class="btn btn-outline-secondary" type="button"
									id="searchBtn" style="border: 1px solid #dce7f1;">검색</button>
							</div>
						</div>
						<div id="mailList">
							<ul class="list-group" id="listBody">
							
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
				</div>
			</div>
		</div>
	</section>
	<!-- contents end -->
</div>

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

<script src="${cPath }/resources/lms/assets/js/main.js"></script>

<script>
    $(function(){
        let searchUI = $("#searchUI");
        searchUI.find("[name='searchType']").val("${userVO.searchMap.searchType }");
        $("#searchBtn").on("click", function(){
        	let inputs = searchUI.find(":input[name]");
        	$(inputs).each(function(idx, input){
        		let name = $(this).attr("name");
        		let sameInput = searchForm.find("[name='"+name+"']");
        		$(sameInput).val($(this).val());
        	});
        	
        	searchForm.submit();
        });

        let listBody = $("#listBody");
        let searchForm = $("#searchForm").ajaxForm({
        	dataType : "json",
        	success : function(resp) {
        		listBody.empty();
        		let liTags = [];
        		if(resp.userList){
	        		$(resp.userList).each(function (idx, user) {
	        			let spanTag = "";
	        			if(user.dept_code == null && user.sub_code == null){
	        				spanTag = "총장";
	        			}else if(user.dept_code == null && user.sub_code != null){
	        				spanTag = user.sub_name; 
	        			}else if(user.sub_code == null && user.dept_code != null) {
	        				spanTag = user.dept_nm;
	        			}
	        		
	        			let li = $("<li>").attr("class", "list-group-item").text(user.name + " (" + user.webmail + ") - ")
	        					.prepend(
	        	        				$("<input>").attr("class", "form-check-input me-1").attr("type", "checkbox").val(user.user_no)		
	        					).append($("<span>").text(spanTag));
	        			
	        			
	        			liTags.push(li);
	        		});
        		}else {
        			liTags.push(
        				$("<li>").attr("class", "list-group-item").text("검색조건에 해당하는 결과가 없습니다.")
        			);
        		}
        		listBody.html(liTags);
        	}, error : function(xhr, resp, error) {
        		console.log(xhr);
        	}
        });
        
        searchForm.submit();
        
        $("#mailChoice").on("click", function(){
            var list = [];
            $("#mailList").find("input[type='checkbox']:checked").each(function(index, element){
                var mail = $(element).parent("li").text();
                list.push(mail.split("-")[0].trim());
            });
            $("#mailTo").val(list.join(", "));
        });
        
        $('#sendBtn').on('click', function(){
        	var summernoteContent = $('#summernote').summernote('code');
            console.log("summernoteContent : " + summernoteContent);
            
        });
        
    });
</script>