$(function(){
	//ajax submit
	document.forms[0].onsubmit = function(){
	    if($("#weibo_body").val()=="")return false;
	    $.ajax({
		    url:$(this).prop("action"),
		    data:$(this).serialize(),
		    type:'POST',
		    success:function(data){
			$("hr:first").after(data);
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