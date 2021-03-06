<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* 2021. 6. 9.	   박초원        ckeditor 적용
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<c:choose>
				<c:when test="${not empty student }">
					<li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
				</c:when>
				<c:otherwise>
					<li class="breadcrumb-item"><a href="${cPath }/lms/main.do">HOME</a></li>
				</c:otherwise>
			</c:choose>
			<li class="breadcrumb-item"><a href="${cPath }/lms/composeForm.do">웹메일</a></li>
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
					<form id="mailForm" action="${cPath}/lms/compose.do" method="post" enctype="multipart/form-data">
						<c:choose>
							<c:when test="${not empty staff }">
								<input type="hidden" name="sender" value="${staff.staff_no }" />
							</c:when>
							<c:otherwise>
								<input type="hidden" name="sender" value="${student.stdnt_no }" />
							</c:otherwise>
						</c:choose>
						<div class="form-group">
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1">
									<i class="bi bi-search"></i>
								</span>
								<input id="mailTo"  type="text" class="form-control bg-transparent" placeholder=" 수신자"  disabled readonly>
								<input type="hidden" name="receiver" />
								<!-- Button trigger for scrolling content modal -->
								<button type="button" class="btn btn-outline-primary mailBtn"
									data-bs-toggle="modal" data-bs-target="#exampleModalScrollable"
									id="mailToBtn" style="border: 1px solid #dce7f1;">
									검색</button>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1">
									<i class="bi bi-search"></i>
								</span>
								<input id="mailCc" type="text"  idx="" class="form-control bg-transparent" placeholder=" 참조자" disabled readonly>
								<input type="hidden" name="receiverCC" />
								<!-- Button trigger for scrolling content modal -->
								<button type="button" class="btn btn-outline-primary mailBtn"
									data-bs-toggle="modal" data-bs-target="#exampleModalScrollable"
									id="mailCcBtn" style="border: 1px solid #dce7f1;">
									검색</button>
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control bg-transparent"
								placeholder=" 제목" name="title">
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="5" cols="100" name="cont" id="cont"></textarea>
						</div>
						<h6 class="m-b-20">
							<i class="fa fa-paperclip m-r-5 f-s-18"></i> 첨부파일
						</h6>
						<div class="form-inline fileArea row">
							<p class="fileBox col-lg-6">
								<input class="form-control" type="file" name="common_files">
								<span class="plusBtn btn btn-secondary">+</span>
							</p>
						</div>
						<div class="text-center m-t-15">
							<a href="${cPath }/lms/index.do"
								class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"><i
								class="ti-close m-r-5 f-s-12"></i> 취소</a>
							<button
								class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
								type="submit" id="sendBtn">
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
									<option value="sub_code">학과</option>
									<option value="dept_code">부서</option>
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
<script src="${cPath }/resources/lms/assets/js/main.js"></script>
<script type="text/javascript" src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>
<script>
    CKEDITOR.replace("cont", {
		filebrowserUploadUrl : '${cPath}/lms/mailFiles.do'
	});
</script>

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
        
        let curBtn = "";
        $(".mailBtn").on("click", function(){
        	curBtn = $(this).attr("id");
        });
        
        $("#mailChoice").on("click", function(){
            var list = [];
            var userList = [];
            $("#mailList").find("input[type='checkbox']:checked").each(function(index, element){
                var mail = $(element).parent("li").text();
                var userNo = $(element).parent("li").children("input").val();
                list.push(mail.split("-")[0].trim());
                userList.push(userNo);
            });
            if(curBtn == "mailToBtn"){
	            $("#mailTo").val(list.join(", "));
	            $("input[name='receiver']").val(userList.join(", "));
            }else if(curBtn == "mailCcBtn"){
	            $("#mailCc").val(list.join(", "));
	            $("input[name='receiverCC']").val(userList.join(", "));
	            console.log(userList.join(", "));
            }
            
            $("#mailList").find("input[type='checkbox']").attr("checked", false);
        });
        
//         let mailForm = $("#mailForm");
//         $("#sendBtn").on("click", function(){
//         	var sHTML = $(".note-editable").text();
//         	$("input[name='cont']").val(sHTML);
//         	mailForm.submit();
//         });
        
   		var source = '<p class="fileBox col-lg-6">'
					+ '<input class="form-control" type="file" name="common_files">'
					+ '<span class="plusBtn btn btn-secondary">+</span>'
					+ '<span class="delBtn btn btn-danger">-</span>'
				    + '</p>';
	    
        $(".fileArea").on("click", ".plusBtn" ,function(){
    		$(this).parents(".fileArea:first").append(source);
    	});
        
        $(".fileArea").on("click", ".delBtn", function(){
        	$(this).parent("p").remove();
        });
    });
</script>