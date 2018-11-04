   function resetPass(){
            	$("#exampleModal1").modal("show");
            }
           	
           	function dosubmit(){
           		var old_password = $("#old_password")
           		var new_password = $("#new_password")
           		if($.trim(old_password.val()) == ""){
    	    		//alert("用户名不能为空"); 
    	    		layer.msg("旧密码不能为空", {time:1000, icon:5, shift:6}, function(){
    	    			old_password.val("");
    	    			old_password.focus();
    	    		});    		
    	    		return false;
    	    	}
    	    	if($.trim(new_password.val()) == ""){     
    	    		layer.msg("新密码不能为空", {time:1000, icon:5, shift:6}, function(){
    	    			new_password.val("");
    	    			new_password.focus();
    	    		});
    	    		
    	    		return false;
    	    	}
    	    	$.ajax({
    	    		url:"${APP_PATH}/resetManagerPass.do",
    	    		type:"POST",
    	    		data:{
    	    			old_password:$.trim(old_password.val()),
    	    			new_password:$.trim(new_password.val()),
    	    		},
    	    		success : function(res){
    	    			alert(res.message)
    	    			if(res.success){
    	    				$("#exampleModal1").modal("hide");
    	    			}
    	    		}
    	    	})
           	}