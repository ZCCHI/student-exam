function setTab(name,cursel,n){
	for(i=1;i<=n;i++){
		var menu=$("#"+name+i);
		var con=$("#con_"+name+"_"+i);		
		if(i==cursel)
		{
			$(menu).addClass("hover");
			//$(con).fadeTo("slow", 1);
			$(con).show();
		}
		else
		{
			$(menu).removeClass("hover");
			$(con).hide();
		}
	}
}
$(function () {
    //搴曢儴鍙嬫儏閾炬帴
    $(".youqin span").click(function () {
        $(this).next().slideToggle();
        $("img",this).toggleClass("act");
    });
    $(document).click(function(){
        $(this).next().slideUp();
        $("img",this).removeClass("act");
    });
    $(".youqin span").click(function(event) {
        event.stopPropagation();
    });
})


//鍐呴〉浜岀骇瀵艰埅


      //渚ц竟鏍忕偣鍑诲垏鎹㈣儗鏅�
      $(".snav li").each(function(){
            var $s1 = $(this).find('.s1');
          if ($(this).find('dl').length > 0) {
              $(this).addClass('li-add');
                $($s1).click(function(){
                    $(this).parent("li").toggleClass('li-open');
                    $(this).parent("li").siblings('li').removeClass('li-open');
                    $(this).next("dl").slideToggle("fast");
                    return false;
                })
          }else{
              $(this).removeClass('li-add')
          };
      });
    