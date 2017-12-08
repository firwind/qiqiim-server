<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/message.js"></script>  
<script type="text/javascript" src="js/messagebody.js"></script>  
<!--[if (IE 6)|(IE 7)|(IE 8)|(IE 9)]>    <![endif]-->

 <script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='/dwr/interface/Imwebserver.js'></script>
 <script type='text/javascript' src='dwr/util.js'></script>
 
	 <script type="text/javascript">
	    
	   function addOnBeforeUnload(e) {
		    var ev = e || event;
		    ev ;//&& (ev.returnValue = '你确定要离开？'); */
		    
		   Imwebserver.closeconnect();
		}
		 
		if(window.attachEvent){
		    window.attachEvent('onbeforeunload',addOnBeforeUnload );
		} else {
		    window.addEventListener('beforeunload', addOnBeforeUnload, false);
		}  
	  
	    dwr.engine.setActiveReverseAjax(true);
	    dwr.engine.setNotifyServerOnPageUnload(true);
	    dwr.engine.setErrorHandler(function(){
	    	
	    	
	    });
	    dwr.engine._errorHandler = function(message, ex) {
	       //alert("服务器出现错误");
	       //dwr.engine._debug("Error: " + ex.name + ", " + ex.message, true);
	    };
	    Imwebserver.serverconnect();
	    function showMessage(data) {  
	    	 
	    	var user = eval("("+data.user+")");
	    	var content = eval("("+data.content+")");
	    	
	    	alert(content.content)
	    	/* 
	    	以下代码只适合ie10以上浏览器  无法兼容低版本浏览器
	    	var  msgmodel =  proto.Model.deserializeBinary(data);  
	    	var  msgbody = proto.MessageBody.deserializeBinary(msgmodel.getContent()); 
	    	alert(msgbody.getContent())
	    	*/
		 }
	    
	</script>

</head>
<body>
test


</body>
</html>