/**
 ***************************************************************************************
 *  @Author     1044053532@qq.com   
 *  @License    http://www.apache.org/licenses/LICENSE-2.0
 ***************************************************************************************
 */
package com.qiqiim.constant;

import io.netty.util.AttributeKey;

public class Constants {

	public static interface WebSite{
		public static final int SUCCESS = 0;
		public static final int ERROR = -1;
	}
	
	public static interface ViewTemplateConfig{
		public static String template = "pctemplate/";
		public static String mobiletemplate = "mobiletemplate/";
	}
	
	public static interface NotifyConfig{
		public static final int NOTIFY_SUCCESS = 1;
	    public static final int NOTIFY_FAILURE = 0;
	    public static final int NOTIFY_NO_SESSION = 2;
	}
   
    
    
    public static interface ImserverConfig{
    	//连接空闲时间
      	public static final int READ_IDLE_TIME = 120;//秒
      	//连接空闲时间
      	public static final int WRITE_IDLE_TIME = 100;//秒
        //心跳响应 超时时间
      	public static final int PING_TIME_OUT = 30; //秒
      	
        // 最大协议包长度
        public static final int MAX_FRAME_LENGTH = 1024 * 10; // 10k
        //
        public static final int MAX_AGGREGATED_CONTENT_LENGTH = 65536;
        
        public static final String REBOT_SESSIONID="0";//机器人SessionID
    }
    
    public static interface SessionConfig{
    	 public static final String SESSION_KEY= "account" ;
    	 public static final AttributeKey<String> SERVER_SESSION_ID = AttributeKey.valueOf(SESSION_KEY);
    	 public static final AttributeKey SERVER_SESSION_HEARBEAT = AttributeKey.valueOf("heartbeat");
    }
    
    public static interface ProtobufType{
    	 byte SEND = 1; //请求
    	 byte RECEIVE = 2; //接收
    	 byte NOTIFY = 3; //通知
    	 byte REPLY = 4; //回复
	}
   
    public static interface CmdType{
	   	 byte BIND = 1; //绑定  
	   	 byte HEARTBEAT = 2; //心跳 
	   	 byte ONLINE = 3; //上线
	   	 byte OFFLINE = 4; //下线 
	   	 byte MESSAGE = 5; //消息
	}
    
    //聊天状态
    public enum ChatStatusEnum{
		WAITING(0),//等待
		CHATTING(1),//聊天中
		END(2);//结束
		private Integer status;
		ChatStatusEnum(Integer status){
			this.status=status;
		}
		public void setStatus(Integer status){
			this.status=status;
		}
		public Integer getStatus(){
			return this.status;
		}
		
		public String toString(){
			return super.toString().toLowerCase();
		}
	}
    
    //渠道
    public enum ChannelTypeEnum{
    	WEBIM,
    	WEXIN,
    	WEIBO,
    	VIDEO,
    	EMAIL;
    	public String toString(){
    		return super.toString().toLowerCase();
    	}
    }
    
    //消息类型
    public enum MessageTypeEnum{
    	TEXT,IMAGE,VOICE,FILE;
		public String toString(){
			return super.toString().toLowerCase() ;
		}
    }
    
    //消息状态
    public enum MessageStatusEnum{
    	UNREAD,READED;
    	public String toString(){
    		return super.toString().toLowerCase();
    	}
    }
    
    //聊天类型
    public enum ChatTypeEnum{
    	SINGLE,TRIPARTITE,CONFERENCE;
    	public String toString(){
    		return super.toString();
    	}
    }
  
}

































































