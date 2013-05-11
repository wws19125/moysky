$(function(){
	$("#send").click(function(){
		if($("#email").val()=="")return false;
		$.ajax({
			url:'/userspace/users/forget_password',
			    type:'POST',
			    data:{email:$("#email").val()},
			    success:function(rdata){
			    if(rdata.code==0)
				$(".fm div").html(rdata.data[0].html);
			},
			    error:function(){
			    alert("error");
			}
		    });
	    });
    });