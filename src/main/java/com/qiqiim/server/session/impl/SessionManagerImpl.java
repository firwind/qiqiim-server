/**
 ***************************************************************************************
 *  @Author     1044053532@qq.com   
 *  @License    http://www.apache.org/licenses/LICENSE-2.0
 ***************************************************************************************
 */
package com.qiqiim.server.session.impl;

import io.netty.channel.ChannelHandlerContext;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.qiqiim.server.group.ImChannelGroup;
import com.qiqiim.server.model.MessageWrapper;
import com.qiqiim.server.model.Session;
import com.qiqiim.server.model.proto.MessageProto;
import com.qiqiim.server.session.SessionManager;

public class SessionManagerImpl implements SessionManager {

    private final static Logger log = LoggerFactory.getLogger(SessionManagerImpl.class);
    
    
    /**
     * The set of currently active Sessions for this Manager, keyed by session
     * identifier.
     */
    protected Map<String, Session> sessions = new ConcurrentHashMap<String, Session>();

    public synchronized void addSession(Session session) {
        if (null == session) {
            return;
        } 
        sessions.put(session.getAccount(), session);
        ImChannelGroup.add(session.getSession());
        log.debug("put a session " + session.getAccount() + " to sessions!");
    }

    public synchronized void updateSession(String sessionId) {
        Session session = sessions.get(sessionId);
        //session.setLastAccessedTime(System.currentTimeMillis());
        session.setUpdateTime(System.currentTimeMillis());
        sessions.put(sessionId, session);
    }

    /**
     * Remove this Session from the active Sessions for this Manager.
     */
    public synchronized void removeSession(Session session) {
        if (session == null) {
            throw new IllegalArgumentException("session is null!");
        }
        removeSession(session.getAccount());
    }

    public synchronized void removeSession(String sessionId) {
    	try{
    		Session session = getSession(sessionId);
    		 if (session != null) {
    			 ImChannelGroup.remove(session.getSession());
    			 session.close();
    		 }
    	}catch(Exception e){
    		
    	}finally{
    		  sessions.remove(sessionId);
    		
    	}
        log.info("remove the session " + sessionId + " from sessions!");
    }

    public Session getSession(String sessionId) {
        return sessions.get(sessionId);
    }

    public Session[] getSessions() {
        return sessions.values().toArray(new Session[0]);
    }

    public Set<String> getSessionKeys() {
        return sessions.keySet();
    }

    public int getSessionCount() {
        return sessions.size();
    }


    @Override
    public  Session createSession(MessageWrapper wrapper, ChannelHandlerContext ctx) {
    	String sessionId = wrapper.getSessionId();
        Session session = sessions.get(sessionId);
        if (session != null) {
            log.info("session " + sessionId + " exist!");
            
            log.info("sessionIddddd " + session.getNid() +"------------------"+ ctx.channel().id().asShortText()+ "      !");
            
           
            /**
             * 如果在已经建立Connection(1)的Channel上，再建立Connection(2)
             * session.close会将ctx关闭， Connection(2)和Connection(1)的Channel都将会关闭
             * 断线之后再建立连接Connection(3)，由于Session是有一点延迟
             * Connection(3)和Connection(1/2)的Channel不是同一个
             * **/
            // 如果session已经存在则销毁session
            //从广播组清除
            ImChannelGroup.remove(session.getSession());
            session.close();
            sessions.remove(session.getAccount());
           
            
            log.info("session " + sessionId + " have been closed!");
        }
        log.info("create new session " + sessionId + ", ctx -> " + ctx.toString());

   	    MessageProto.Model model = (MessageProto.Model)wrapper.getBody();
        
       
        session = new Session(ctx.channel());
        
        session.setAccount(sessionId);
        session.setAppKey(model.getAppKey());
        session.setDeviceId(model.getDeviceId());
        session.setPlatform(model.getPlatform());
        session.setPlatformVersion(model.getPlatformVersion());
        session.setSign(model.getSign());
        session.setBindTime(System.currentTimeMillis());
        session.setUpdateTime(session.getBindTime());
        log.info("create new session " + sessionId + " successful!");

      
        return session;
    }

	@Override
	public boolean exist(String sessionId) {
        Session session = getSession(sessionId);
        return session != null ? true : false;
	}
    


  /*  protected Connection createTcpConnection(Session session, ChannelHandlerContext ctx) {
        Connection conn = new TcpConnection(ctx);
        conn.setConnectionId(session.getSessionId());
        conn.setSession(session);
        return conn;
    }*/

}
