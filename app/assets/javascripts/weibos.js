$(function(){
	
	$("#msgbox").delegate("a","click",function(){
		var item = $(this).attr("id");
		var id = $(this).parent("div:last").attr("id");
		switch(item)
		    {
		    case "del":
			del(id,$(this).parents("#msg"));
			break;
		    case "share":
			del(id);
			break;
		    case "commit":
			del(id);
			break;
		    case "thumb":
			thumb(id);
			break;
		    default:
			break;
		    }
	    });
	function init_ToolTip(){
	    $("a[id^='del']").tooltip({title:'删除'});
	    $("a[id^='share']").tooltip({title:'转发'});
	    $("a[id^='commit']").tooltip({title:'评论'});
	    $("a[id^='thumb']").tooltip({title:'赞一个'});
	}
	function del(id,item)
	{
	    if(!confirm("你确定要删除么"))
	    	return;
	    $.ajax({
		    url:'/weibos/'+id,
		    type:'delete',
		    success:function(data){			
			show_notice("额，好吧，成功删除了～");
			item.fadeOut(500);
		    },
		    error:function(){
			show_notice("额,出事了,删除失败了！");
		    }
		});
	}
	//显示信息
	function show_notice(notice)
	{
	    $("#weibo_notice span").html(notice);
	    $("#weibo_notice").fadeIn(2500,function(){$(this).fadeOut(7000);});
	}
	//ajax submit
	document.forms[0].onsubmit = function(){
	    if($("#weibo_body").val()=="")return false;
	    $.ajax({
		    url:$(this).prop("action"),
		    data:$(this).serialize(),
		    type:'POST',
		    success:function(data){
			$("#msgbox").prepend(data);
			$("div #msg:first").hide(0,function(){$(this).fadeIn(500);});
			$("#weibo_body").val(null);
			init_ToolTip();
			show_notice("发布微博成功～");
		    },
		    error:function(){
			alert("error");
		    }
		});
	    return false;
	}
	//init
	init_ToolTip();
	$("#weibo_notice").hide(0);
    });