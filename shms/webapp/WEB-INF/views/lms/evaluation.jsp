<%--
* [[개정이력(Modification Information)]]
* 수정일            수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 9.      박초원        최초작성
* 2021. 6. 14.     최희수  	강의평가 조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
  <!-- contents start -->
  <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
          <li class="breadcrumb-item"><a href="${cPath }/lms/grades.do">성적관리</a></li>
          <li class="breadcrumb-item active" aria-current="page">강의평가</li>
      </ol>
  </nav>
  
  <section class="section" id="lectureList">
      <h4 class="h4Title"><i class="fas fa-minus"></i> 수강목록</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
                  <div class="table-responsive">
                      <table class="table table-bordered mb-0" style="border-color: #dfdfdf;">
                          <thead>
                              <tr>
                                  <th class="text-center">강의코드</th>
                                  <th class="text-center">강의명</th>
                                  <th class="text-center">학점</th> 
                                  <th class="text-center">이수구분</th>
                                  <th class="text-center">담당교수</th>
                                  <th class="text-center">강의평가</th>
                              </tr>
                          </thead>
                          <tbody>
                          	<c:choose>
                          		<c:when test="${not empty selectLecEvlList }">
		                          	<c:forEach items="${selectLecEvlList }" var="lecEvl" varStatus="status">
		                          		<tr class="evaluationBox" idx="${lecEvl.lec_code }">
		                          	      
		                                  <td class="text-center">
		                                  	${lecEvl.lec_code }
		                                  	<input type="hidden" name="lec_code" value="${lecEvl.lec_code }" />
		                                  </td>
		                                  <td class="text-center">${lecEvl.lec_name }</td>
		                                  <td class="text-center">${lecEvl.lec_pnt }</td>
		                                  <td class="text-center">${lecEvl.com_code_nm }</td>
		                                  <td class="text-center">${lecEvl.name }</td>
		                                  <td class="text-center">
		                                  	<c:choose>
		                                  		<c:when test="${lecEvl.status eq '완료' }">
		                                  			<button type="button" class="btn icon icon-left btn-light-secondary disabled">
														${lecEvl.status }
				                                    </button>
		                                  		</c:when>
		                                  		<c:otherwise>
		                                  			<button type="button" class="btn icon icon-left btn-primary actionBtn">
									                    ${lecEvl.status }
									                </button>
		                                  		</c:otherwise>
		                                  	</c:choose>
		                                  </td>
		                              </tr>
		                          	</c:forEach>                          		
                          		</c:when>
                          		<c:otherwise>
                          			<tr>
                          				<td class="text-center" colspan="6">데이터가 없습니다.</td>
                          			</tr>
                          		</c:otherwise>
                          	</c:choose>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
  </section>

  <section class="section" id="evalTable">
      <h4 class="h4Title"><i class="fas fa-minus"></i> 강의평가</h4>
      <div class="card inputTable">
          <div class="card-body">
              <div class="table-responsive">
                  <div class="table-responsive">
                      <form>  
                          <table class="table table-bordered mb-0" style="border-color: #dfdfdf;">
                              <thead>
                                  <tr>
                                      <th class="text-center">No.</th>
                                      <th class="text-center">설문항목</th>
                                      <th class="text-center">아주<br/>그렇다</th>
                                      <th class="text-center">조금<br/>그렇다</th>
                                      <th class="text-center">보통이다</th>
                                      <th class="text-center">그렇지<br/>않다</th>
                                      <th class="text-center">아주<br/>그렇지<br/>않다</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <th class="text-center align-middle">1</th>
                                      <td class="align-middle">
                                          교수님은 강의준비를 철저히 하셨으며, 강의시작 시 강의계획과 목표를
                                          명확히 제시하셨다.
                                      </td>
                                      <td class="text-center align-middle"><input type="radio" name="eval1" class="form-check-input" value="5" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval1" class="form-check-input" value="4" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval1" class="form-check-input" value="3" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval1" class="form-check-input" value="2" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval1" class="form-check-input" value="1" /></td>
                                  </tr>                                                     
                                  <tr>                                                      
                                      <th class="text-center align-middle">2</th>           
                                      <td class="align-middle">                             
                                          교수님은 수업내용을 명확하고 이해하기 쉽게 강의해 
                                      </td>                                                 
                                      <td class="text-center align-middle"><input type="radio" name="eval2" class="form-check-input" value="5" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval2" class="form-check-input" value="4" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval2" class="form-check-input" value="3" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval2" class="form-check-input" value="2" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval2" class="form-check-input" value="1" /></td>
                                  </tr>                                                        
                                  <tr>                                                         
                                      <th class="text-center align-middle">3</th>              
                                      <td class="align-middle">                                
                                          교수님은 정확한 발음, 충분한 음량으로 강의 하셨다.   
                                      </td>                                                    
                                      <td class="text-center align-middle"><input type="radio" name="eval3" class="form-check-input" value="5" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval3" class="form-check-input" value="4" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval3" class="form-check-input" value="3" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval3" class="form-check-input" value="2" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval3" class="form-check-input" value="1" /></td>
                                  </tr>                                                           
                                  <tr>                                                            
                                      <th class="text-center align-middle">4</th>                 
                                      <td class="align-middle">                                   
                                          수업진행 시 학생들의 관심을 유발하셨고, 질문에 성실하고  답변을 해주셨다.
                                      </td>                                                       
                                      <td class="text-center align-middle"><input type="radio" name="eval4" class="form-check-input" value="5" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval4" class="form-check-input" value="4" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval4" class="form-check-input" value="3" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval4" class="form-check-input" value="2" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval4" class="form-check-input" value="1" /></td>
                                  </tr>                                                           
                                  <tr>                                                            
                                      <th class="text-center align-middle">5</th>                 
                                      <td class="align-middle">                                   
                                          교재는 수업과 연관되게 적절히 선정되었으며, 수업에 잘 활
                                      </td>                                                       
                                      <td class="text-center align-middle"><input type="radio" name="eval5" class="form-check-input" value="5" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval5" class="form-check-input" value="4" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval5" class="form-check-input" value="3" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval5" class="form-check-input" value="2" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval5" class="form-check-input" value="1" /></td>
                                  </tr>                                                           
                                  <tr>                                                            
                                      <th class="text-center align-middle">6</th>                 
                                      <td class="align-middle">                                   
                                          수업의 시작과 마침이 제시간에 이루어졌다.               
                                      </td>                                                       
                                      <td class="text-center align-middle"><input type="radio" name="eval6" class="form-check-input" value="5" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval6" class="form-check-input" value="4" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval6" class="form-check-input" value="3" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval6" class="form-check-input" value="2" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval6" class="form-check-input" value="1" /></td>
                                  </tr>                                                             
                                  <tr>                                                              
                                      <th class="text-center align-middle">7</th>                   
                                      <td class="align-middle">                                     
                                          제출한 과제에 대한 검토 및 답변을 꼭 해주셨으며, 과제는 수하는데 도움이 되었다.
                                      </td>                                                         
                                      <td class="text-center align-middle"><input type="radio" name="eval7" class="form-check-input" value="5" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval7" class="form-check-input" value="4" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval7" class="form-check-input" value="3" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval7" class="form-check-input" value="2" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval7" class="form-check-input" value="1" /></td>
                                  </tr>                                                           
                                  <tr>                                                            
                                      <th class="text-center align-middle">8</th>                 
                                      <td class="align-middle">                                   
                                          휴강이 적었으며, 휴강 시 보강을 꼭 하였다.              
                                      </td>                                                       
                                      <td class="text-center align-middle"><input type="radio" name="eval8" class="form-check-input" value="5" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval8" class="form-check-input" value="4" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval8" class="form-check-input" value="3" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval8" class="form-check-input" value="2" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval8" class="form-check-input" value="1" /></td>
                                  </tr>                                                              
                                  <tr>                                                               
                                      <th class="text-center align-middle">9</th>                    
                                      <td class="align-middle">                                      
                                          교수님은 학생들에게 인격적으로 대해주셨다.
                                      </td>                                                          
                                      <td class="text-center align-middle"><input type="radio" name="eval9" class="form-check-input" value="5" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval9" class="form-check-input" value="4" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval9" class="form-check-input" value="3" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval9" class="form-check-input" value="2" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval9" class="form-check-input" value="1" /></td>
                                  </tr>                                                              
                                  <tr>                                                               
                                      <th class="text-center align-middle">10</th>                   
                                      <td class="align-middle">                                      
                                          교수님 강의에 대하여 만족한다.                             
                                      </td>                                                          
                                      <td class="text-center align-middle"><input type="radio" name="eval10" class="form-check-input" value="5" checked/></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval10" class="form-check-input" value="4" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval10" class="form-check-input" value="3" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval10" class="form-check-input" value="2" /></td>
                                      <td class="text-center align-middle"><input type="radio" name="eval10" class="form-check-input" value="1" /></td>
                                  </tr>
                                  <tr>
                                      <th class="text-center align-middle" colspan="7">서술</th>
                                  </tr>
                                  <tr>
                                      <th class="text-center align-middle">1</th>
                                      <td class="align-middle">
                                          이 강의에서 특별히 좋았던 점이 있다면 무엇이라고 생각하는가?
                                      </td>
                                      <td colspan="5">
                                          <textarea class="form-control" rows="3" name="eval11"></textarea>
                                      </td>
                                  </tr>
                                  <tr>
                                      <th class="text-center align-middle">2</th>
                                      <td class="align-middle">
                                          교수님의 강의내용 및 방법에 개선할 점이 있다면 구체적으로 무엇인가?
                                      </td>
                                      <td colspan="5">
                                          <textarea class="form-control" rows="3" name="eval12"></textarea>
                                      </td>
                                  </tr>
                              </tbody>
                          </table>
                          <div class="text-center m-t-15" style="margin-top: 2%;">
                              <button id="saveBtn" type="button" class="btn btn-primary" type="button">저장</button>
                          </div>  
                      </form>
                  </div>
              </div>
          </div>
      </div>
  </section>
  <!-- contents end -->
</div>

<script>
	$(function() {
		$("textarea[name='eval11']").text("전반적인 커리큘럼이 괜찮았다.");
		$("textarea[name='eval12']").text("없습니다.")
	})
    $("#lectureList").on("click", ".actionBtn", function(){
        $("#evalTable").find("form").each(function() {  
            this.reset();  
        });
        $("#evalTable").css("display", "block");
    });
    let lecCode;
    $(function() {
	    $(".actionBtn").on("click", function() {
	    	lecCode = $(this).parents(".evaluationBox").attr("idx");
	    })    	
    });
    
    let evalData = {};
    $("#saveBtn").on("click", function() {
    	evalData["lecCode"] = lecCode;
    	for(var i = 1; i < 11; i++){
    		evalData["eval" + i] = $("input[name='eval" + i +"']:checked").val();
    	}
    	evalData["eval11"] = $("textarea[name='eval11']").val();
    	evalData["eval12"] = $("textarea[name='eval12']").val();
    	$.ajax({
    		url:"${cPath}/lms/insertEvaluation.do"
    		, method: "post"
       		, contentType: "application/json; charset=UTF-8"
    		, data: JSON.stringify(evalData)
    		, success : function(resp) {
    			if(resp.res == "OK") {
    				location.href="${cPath}/lms/evaluation.do"
    			} else {
    				console.log(resp.res);
    			}
    		}
    		, error : function(xhr, error, msg) {
    			console.log(xhr);
    			console.log(error);
    			console.log(msg);
    		}     		
    	});
    });
</script>