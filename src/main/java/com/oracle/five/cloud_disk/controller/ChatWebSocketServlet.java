package com.oracle.five.cloud_disk.controller;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.catalina.websocket.WsOutbound;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.oracle.five.cloud_disk.beans.User;
import com.oracle.five.cloud_disk.biz.FileService;
import com.oracle.five.cloud_disk.mapper.UserMapper;


public class ChatWebSocketServlet extends WebSocketServlet {
	private ObjectMapper objectMapper;
	private final Map<Integer, List<WsOutbound>> map = new HashMap();
	private static final long serialVersionUID = -1058445282919079067L;
	
	@Override
	protected StreamInbound createWebSocketInbound(String arg0,
			HttpServletRequest request) {
		ApplicationContext ac=WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		objectMapper=(ObjectMapper) ac.getBean("objectMapper");
		return new ChatMessageInbound().setLoginedUserId(((User)(request.getSession().getAttribute("loginUser"))).getUserId());
	}

	class ChatMessageInbound extends MessageInbound {
		private Integer loginedUserId;
		private WsOutbound outbound;
		public ChatMessageInbound setLoginedUserId(Integer loginedUserId) {
			this.loginedUserId = loginedUserId;
			return this;
		}
		@Override
		protected void onBinaryMessage(ByteBuffer arg0) throws IOException {}

		@Override
		protected void onTextMessage(CharBuffer arg0) throws IOException {
			JsonNode rootNode = objectMapper.readTree(arg0.toString());
			Integer targetId = rootNode.get("targetId").asInt();
			String content = rootNode.get("content").asText();
			if (map.containsKey(targetId)) {
				List<WsOutbound> bounds = map.get(targetId);
				try {
					for (WsOutbound b : bounds) {
						CharBuffer buffer = CharBuffer.wrap(content);
						b.writeTextMessage(buffer);
						b.flush();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("该用户还没登录");
			}
			System.out.println("ChatMessageInbound\tonTextMessage-->buffer:\t"
					+ arg0.toString());

		}

		@Override
		protected void onOpen(WsOutbound outbound) {
			System.out.println("onOpen");
			this.outbound=outbound;
			List<WsOutbound> bounds;
			if (map.containsKey(loginedUserId)) {
				bounds = map.get(loginedUserId);
				bounds.add(outbound);
			} else {
				bounds = new ArrayList<>();
				bounds.add(outbound);
				map.put(loginedUserId, bounds);
			}
			super.onOpen(outbound);
		}

		@Override
		protected void onClose(int status) {
			List<WsOutbound> bounds=map.get(loginedUserId);
			if(bounds!=null){
				if(bounds.size()<=1){
					map.remove(loginedUserId);
				}else{
					bounds.remove(outbound);
				}
			}
			super.onClose(status);
		}
	}

}
