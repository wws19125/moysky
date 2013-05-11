$(function(){
	//return;
	//实现登录框特效
	//$("#logF").hide();
	//$("#logon").mouseover(function(){$("#logF").show();}).mouseleave(function(){$("#logF").fadeOut(400);});
	//$("#logF").mouseover(function(e){ $(this).stop().css("opacity","1");}).click(function(e){
	//if ( e && e.stopPropagation )
		    //因此它支持W3C的stopPropagation()方法
	//	    e.stopPropagation(); 
	//	else
		    //否则，我们需要使用IE的方式来取消事件冒泡 
	//	    window.event.cancelBubble = true;
	//	return false;
	//  });
	//$("body").click(function(e){ $("#logF").hide(); } );
	//登录
	$("#logonBtn").click(function(){
		$.ajax({
			url:'/userspace/users/logon',
			type:'post',
			data:{"dname":$("#dname").val(),"password":$("#password").val()},
			success:function(data){
			    if(data.code==1)
				{
				    alert("我觉得这里该直接跳转到登录页面去");
				    return false;
				}
			    //刷新
			    window.location.reload();//href=window.location.href;
			    //$("#logon").html("注销").attr("href","/userspace/users/logout").attr("id","logout").unbind();
			},
			error:function(){
			    alert("服务端他丫的又出问题了");
			}
		    });
	    });
    });