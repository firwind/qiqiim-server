package com.qiqiim.webserver.dwrmanage;

import java.util.Collection;

import org.directwebremoting.Browser;
import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;

public class DwrUtil {
    /**
     * 调用页面javascript函数
     * @param functionName
     * @param args
     */
   /* public void invokeJavascriptFunction (String _funcName, List _args){
        final String funcName = _funcName;
        final List args = _args;
        Browser.withAllSessions(new Runnable(){ 
            private ScriptBuffer script = new ScriptBuffer(); 
            public void run(){ 
                //拼接javascript
                script = script.appendScript(funcName+"(");
                for(int i=0; i<args.size(); i++){
                    if(i != 0){
                        script = script.appendScript(",");
                    }
                    script = script.appendData(args.get(i));
                }
                script.appendScript(")"); 
                //System.out.println(script.toString());   
                 
                Collection<ScriptSession> sessions = Browser.getTargetSessions(); 
                for (ScriptSession scriptSession : sessions){ 
                    scriptSession.addScript(script); 
                } 
            } 
        });
    }*/
    
    public static void sendMessageAuto(String userid, String message) {  
    	  
        final String userId = userid;  
  
        final String autoMessage = message;  
        final String OP_ID = "userId";  
          
        Browser.withAllSessionsFiltered(new ScriptSessionFilter() {  
  
            public boolean match(ScriptSession session) {  
                if (session.getAttribute(OP_ID) == null)  
                    return false;  
                else {  
                    boolean f = session.getAttribute(OP_ID).equals(userId);  
                    return f;  
                }  
            }  
  
        }, new Runnable() {  
  
            private ScriptBuffer script = new ScriptBuffer();  
  
            public void run() {  
  
                script.appendCall("showMessage", autoMessage);  
                Collection<ScriptSession> sessions = Browser.getTargetSessions();  
                for (ScriptSession scriptSession : sessions) {  
                    scriptSession.addScript(script);  
                }  
  
            }  
  
        });  
  
    }  
    
}