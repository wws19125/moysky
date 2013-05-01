$(function(){
	$("#msgbox").delegate("a","click",function(){alert($(this).parent("div:last").attr("id"));});
	$("a").tooltip({title:'tooltip'});
	//ajax submit
	document.forms[0].onsubmit = function(){
	    if($("#weibo_body").val()=="")return false;
	    $.ajax({
		    url:$(this).prop("action"),
		    data:$(this).serialize(),
		    type:'POST',
		    success:function(data){
			$("#msgbox").prepend(data);
			$("div .hero-unit:first").hide(0,function(){$(this).slideDown(1500);});
			$("#weibo_body").val(null);
			
		    },
		    error:function(){
			alert("error");
		    }
		});
	    return false;
	}
    });