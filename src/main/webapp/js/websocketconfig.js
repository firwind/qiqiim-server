var websocketurl="ws://127.0.0.1:2048/ws";   //ws://{ip}:{端口}/{java后端websocket配置的上下文}
var reconnectflag = false;//避免重复连接
var socket;

function createWebSocket(url,callbak) {
   try { 
      if (!window.WebSocket) {
  	      window.WebSocket = window.MozWebSocket; 
  	  }  
  	  if (window.WebSocket) {
  		socket = new WebSocket(url);
        socket.binaryType = "arraybuffer"; 
        callbak();
  	  } else {
          layer.msg("你的浏览器不支持websocket！");
      }  
    } catch (e) { 
       reconnect(url,callbak);
    }     
}
 

function reconnect(url,callbak) {
    if(reconnectflag) return;
    reconnectflag = true;
    //没连接上会一直重连，设置延迟避免请求过多
    setTimeout(function () {
        createWebSocket(url,callbak);
        reconnectflag = false;
    }, 2000);
}


 

