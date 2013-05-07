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
		    case "comment":
			if($(this).parent().next("div").length<1)
			    comment(id,$(this).parent().parent());
			else
			    $(this).parent().next("div").remove();
			break;
		    case "thumb":
			thumb(id);
			break;
		    case "reComment":
			reComment($(this));
			break;
		    case "rBtn":
			reCommentAJAX($(this));
			break;
		    default:
			break;
		    }
	    });
	//ajax 处理评论提交
	$("#msgbox").delegate("form","submit",function(){
		var body = $(this).find("textarea");
		var nxt = $(this).next("#comment_box");
		$.ajax({
			url:$(this).attr("action"),
			type:'post',
			data:$(this).serialize(),
		        success:function(data){
			    nxt.prepend(data);
			    show_notice("嗯哼，评论成功了啊～");
			    body.val("");
			},
			error:function(){
			    show_notice("额，这货不知道怎么了，这次没成功啊,等下再试试吧~");
			}
		    });
		return false;
	    });

	//评论,依旧采用AJAX
	function comment(id,item)
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
	//回复评论,显示文本框
	function reComment(btn)
	{
	    if(btn.next("div").length>0)
		{
		    btn.next("div").remove();
		    return;
		}
	    var body = "<div style='padding:4px;'><textarea rows='1' id='body' name='body' style='width:80%;'/><p style='text-align:right;padding-right:20%;'><a type='button' class='btn' id='rBtn'>评论</a></p></div>";
	    btn.after(body);
	}
	//回复操作
	function reCommentAJAX(rBtn)
	{
	    var body = rBtn.parent().prev("textarea").val();
	    if(body=="")return;
	    var id = rBtn.parent().parent().parent().attr("id");
	    $.ajax({
		    url:'comments/create',
		    type:'post',
		    data:{"comment_id":id,"comment[body]":body},
		    success:function(data){
			rBtn.parents("#comment_box").prepend(data);
			rBtn.parent().parent().remove();
		    },
		    error:function(){
			show_notice("额，这货出问题了，桑不起，没成功");
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
	    $("#weibo_notice").fadeIn(1500) //,function(){$(this).fadeOut(7000);});
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