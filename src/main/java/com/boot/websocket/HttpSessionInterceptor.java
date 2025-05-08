package com.boot.websocket;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;
import org.springframework.http.server.ServletServerHttpRequest;

import javax.servlet.http.HttpSession;
import java.util.Map;

public class HttpSessionInterceptor implements HandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
								   WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
		if (request instanceof ServletServerHttpRequest servletRequest) {
			HttpSession session = servletRequest.getServletRequest().getSession(false);
			if (session != null) {
				String loginId = (String) session.getAttribute("loginId");
				if (loginId != null) {
					attributes.put("loginId", loginId);
					System.out.println("WebSocket handshake - 세션 로그인 ID: " + loginId);
				} else {
					System.out.println("WebSocket handshake - 로그인 ID 없음");
				}
			} else {
				System.out.println("WebSocket handshake - HttpSession 없음");
			}
		}
		return true;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
							   WebSocketHandler wsHandler, Exception exception) {
		// 필요 시 로그용
	}
}
