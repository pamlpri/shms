/**
 * <pre>
 * 
 * </pre>
 * @author 박초원
 * @since 2021. 5. 14.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일      			  수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 5. 14.      박초원       최초작성
 * Copyright (c) ${year} by DDIT All right reserved
 * </pre>
 */ 

$(function(){
    var vis = true;
    
    $(".sideMain > .navy > span").text("-").css("color", "white");
    
    $(".sideMain > a").click(function(){
        vis = $(this).next(".sideSub").is(":visible");
        
        if(vis){
            $(".sideMain > a").removeClass("navy");
            $(".sideSub").slideUp();
            $(".sideMain").find("span").text("+").css("color","#1a1a37");
            vis = false;
        }else{
            $(".sideMain > a").removeClass("navy");
            $(".sideSub").slideUp();
            $(".sideMain").find("span").text("+");
            $(".sideMain").find("span").text("+").css("color","#1a1a37");
            $(this).addClass("navy");
            $(this).next(".sideSub").slideDown();
            $(this).find("span").text("-").css("color", "white");
            vis = true;
        }
    });
});
