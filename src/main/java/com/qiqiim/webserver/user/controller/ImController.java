package com.qiqiim.webserver.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qiqiim.server.session.SessionManager;
import com.qiqiim.webserver.base.controller.BaseController;
@Controller
public class ImController extends BaseController{
	@Autowired
	private SessionManager sessionManager;
	/**
	 * 单聊
	 */
	@RequestMapping("/chat")
	public String chat(@RequestParam Map<String, Object> params,HttpServletRequest request){
		request.setAttribute("allsession", sessionManager.getSessions());
		return "chat";
	}
	/**
	 * 群聊
	 */
	@RequestMapping("/groupchat")
	public String group(@RequestParam Map<String, Object> params,HttpServletRequest request){
		request.setAttribute("allsession", sessionManager.getSessions());
		return "groupchat";
	}
	/**
	 * 机器人
	 */
	@RequestMapping("/bot")
	public String list(@RequestParam Map<String, Object> params,HttpServletRequest request){
		request.setAttribute("allsession", sessionManager.getSessions());
		return "bot";
	}
}
