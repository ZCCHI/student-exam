$(function () {
    
    $("#banner").banner();
});

;(function ($) {
    
    $.fn.banner = function (){
        if ($(this).size() <= 0) return;
        var sUl = $('ul', this);
        var sLi = $('ul li', this);
        var sImg = $('ul li img', this);
        var iNow = 0, timer = null, speed = 5000;
        var image = [], is_load = [],iWidth = 1920;;
        var arrHeight = [];
        var aFont = [];
        var _self = $(this);
        
        var reSize = function () {
            var veiwWidth = $(window).width();
            if (veiwWidth > 1000) {
                for (var i = 0; i < sImg.size(); i++) {
                    sImg.eq(i).css({left: -(iWidth - veiwWidth) / 2});
                }
            }
        };

        reSize();
        $(window).resize(reSize);
        
        $("li:not(:first-child)", sUl).hide();
        
        var string = $('<div/>', {'class': 'loader-bg'}).css({
            display: 'none', width: 48, height: 48, position: 'absolute', top: '50%', left: '48%',
            zIndex: 9999, background: 'url(images/loading.gif) no-repeat'
        });

        $(this).prepend(string);

        $(".loader-bg").css('left', ($(this).outerWidth() - $(".loader-bg").outerWidth(true)) / 2);
        
        $('li img', sUl).each(function (index) {
            image[index] = $(this).data('src');
            is_load[index] = false;
            aFont[index] = $(this).attr('alt');
        });
        
        
        var oImage = new Image();
        var load = function (index, flag) {
            $('.loader-bg').show();
            sLi.eq(index).find('img').attr('src', image[index]).one('load', function () {
                $('.loader-bg').hide();
                is_load[index] = true;
                oImage.src = $(this).attr('src');
                var iWidth = oImage.width;
                var iHeight = oImage.height;
                var veiwWidth = $(window).width();
                $(this).css({left: -(iWidth - veiwWidth) / 2, height: iHeight});
                arrHeight.push(iHeight);
                if (!flag) {
                    sLi.eq(index).fadeIn(800);
                } else {
                    fade(index);
                }
            }).each(function () {
                if (this.complete) {
                    $(this).load();
                }
            });
        };

        load(0, false);
        
        $(".banner-pageing a:first").addClass("active");
        var fade = function (index) {
            $(".banner-pageing a").removeClass("active").eq(index).addClass("active");
            $("li", sUl).filter(":visible").fadeOut(500).parent().children().eq(index).fadeIn(600);
        };

        var checkLoad = function (index) {
            iNow = index;
            if (is_load[index]) {
                fade(index);
            } else {
                load(index, true);
            }
        };

        var move = function () {
            if (iNow == sLi.size() - 1) {
                iNow = 0;
            } else {
                iNow++;
            }
            checkLoad(iNow);
        };
        
        $('.arrow-l').click(function (){
            if(iNow <= 0){
                iNow = sLi.size() -1;
            }else{
                iNow--;
            }
            checkLoad(iNow);
        });

        $('.arrow-r').click(function (){
            if(iNow == sLi.size() -1){
                iNow = 0;
            }else{
                iNow++;
            }
            checkLoad(iNow);
        });
        
        $(".banner-pageing a").each(function (index){
            $(this).on("click",function (){
                if($(sLi).eq(index).is(":visible")){
                        return ;
                }
                checkLoad(index);
            });
        });
        
        timer = setInterval(move, speed);
        $(this).on({
            mouseover: function () {
                $('.slider-btn').show();
                clearInterval(timer);
            },
            mouseout: function () {
                $('.slider-btn').hide();
                timer = setInterval(move, speed);
            }
        });
    };

})(jQuery);




	$(document).ready(function() {
		$('.inactive').click(function(){
			if($(this).siblings('ul').css('display')=='none'){
				$(this).parent('li').siblings('li').removeClass('inactives');
				$(this).addClass('inactives');
				$(this).siblings('ul').slideDown(100).children('li');
				if($(this).parents('li').siblings('li').children('ul').css('display')=='block'){
					$(this).parents('li').siblings('li').children('ul').parent('li').children('a').removeClass('inactives');
					$(this).parents('li').siblings('li').children('ul').slideUp(100);

				}
			}else{
				//鎺у埗鑷韩鍙樻垚+鍙�
				$(this).removeClass('inactives');
				//鎺у埗鑷韩鑿滃崟涓嬪瓙鑿滃崟闅愯棌
				$(this).siblings('ul').slideUp(100);
				//鎺у埗鑷韩瀛愯彍鍗曞彉鎴�+鍙�
				$(this).siblings('ul').children('li').children('ul').parent('li').children('a').addClass('inactives');
				//鎺у埗鑷韩鑿滃崟涓嬪瓙鑿滃崟闅愯棌
				$(this).siblings('ul').children('li').children('ul').slideUp(100);

				//鎺у埗鍚岀骇鑿滃崟鍙繚鎸佷竴涓槸灞曞紑鐨勶紙-鍙锋樉绀猴級
				$(this).siblings('ul').children('li').children('a').removeClass('inactives');
			}
		})
	});

