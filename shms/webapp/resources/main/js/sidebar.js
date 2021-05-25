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
