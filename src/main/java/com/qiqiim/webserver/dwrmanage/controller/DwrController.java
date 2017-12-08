package com.qiqiim.webserver.dwrmanage.controller;

import org.directwebremoting.ScriptSession;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.qiqiim.constant.Constants;
import com.qiqiim.webserver.dwrmanage.connertor.DwrConnertor;

@Controller  
@RemoteProxy(name = "Imwebserver")  
public class DwrController {
	@Autowired
	private DwrConnertor dwrConnertorImpl;
	/**
	 * 创建连接
	 * @param id
	 */
    @RemoteMethod  
    public void serverconnect() {  
    	  WebContext wct = WebContextFactory.get();
    	  ScriptSession   session  = wct.getScriptSession();
    	  dwrConnertorImpl.connect(session, (String)session.getAttribute(Constants.SessionConfig.SESSION_KEY));
    	  
    	 // getDwrConnertor().connect(scriptSession, userId);
    }
    
    /**
	 * 关闭连接
	 * @param id
	 */
    @RemoteMethod  
    public void closeconnect() {  
    	  WebContext wct = WebContextFactory.get();
    	  ScriptSession   session  = wct.getScriptSession();
    	  dwrConnertorImpl.close(session); 
    }
}
