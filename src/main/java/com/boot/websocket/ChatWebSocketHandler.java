package com.boot.websocket;

import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.*;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	// 사용자 세션 저장소 (1:1 채팅 위해 Map 사용)
	private final Map<String, WebSocketSession> userSessions = new HashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String userId = getUserId(session);
		userSessions.put(userId, session);
		System.out.println(userId + " connected");
	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("Message received: " + message.getPayload());

		// 메시지 파싱 예시: "receiverId:messageContent"
		String[] parts = message.getPayload().split(":", 2);
		if (parts.length != 2) return;

		String receiverId = parts[0];
		String content = parts[1];

		WebSocketSession receiverSession = userSessions.get(receiverId);
		if (receiverSession != null && receiverSession.isOpen()) {
			receiverSession.sendMessage(new TextMessage(content));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String userId = getUserId(session);
		userSessions.remove(userId);
		System.out.println(userId + " disconnected");
	}

	private String getUserId(WebSocketSession session) {
		// HttpSession에서 userId를 가져오는 방식
		Map<String, Object> attrs = session.getAttributes();
		return (String) attrs.get("loginId"); // 예: 세션에서 "loginId"라는 이름으로 저장된 값
	}
}
