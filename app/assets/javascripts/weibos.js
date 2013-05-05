$(function(){
	
	$("#msgbox").delegate("a","click",function(){
		var item = $(this).parents("#msg");
		var id = $(this).parent("div:last").attr("id");
		switch($(this).attr("id"))
		    {
		    case "del":
			del(id,item);
			break;
		    case "share":
			alert("ff");
			break;
		    case "commit":
			if($(this).parent().next("div").length<1)
			    commit(id,$(this).parent().parent());
			else
			    $(this).parent().next("div").remove();
			break;
		    case "thumb":
			thumb(id);
			break;
		    case "sbCommit":
			alert("ddd");
			break;
		    default:
			break;
		    }
	    });
	//ajax 处理评论提交
	$("#msgbox").delegate("form","submit",function(){
		$.ajax({
			url:$(this).attr("action"),
			type:'post',
			data:$(this).serialize(),
		        success:function(data){
			    
			    show_notice("嗯哼，评论成功了啊～");
			},
			error:function(){
			    show_notice("额，这货不知道怎么了，这次没成功啊,等下再试试吧~");
			}
		    });
		return false;
	    });
	//评论,依旧采用AJAX
	function commit(id,item)
	{
	    $.ajax({
		    url:'/comments/new',
		    type:'get',
		    data:{'id':id},
		    success:function(data){
			item.append(data);
		    },
		    error:function(){
			show_notice("哎呀,我也不知道怎么回事，等下评论吧");
		    }
		});
	}
	//删除微博
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
	//提示
	function init_ToolTip(){
	    $("a[id^='del']").tooltip({title:'删除'});
	    $("a[id^='share']").tooltip({title:'转发'});
	    $("a[id^='commit']").tooltip({title:'评论'});
	    $("a[id^='thumb']").tooltip({title:'赞一个'});
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