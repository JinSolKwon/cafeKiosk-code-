package com.kiosk.websocket;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class EchoHandler extends TextWebSocketHandler {

	// 세션 리스트
	private List<WebSocketSession> sessionList = new ArrayList<>();

	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		String chatMember = (String) session.getAttributes().get("user");
		
		// 클라이언트 연결
		logger.info("#afterConnectionEstablished");
		
		// 채팅방에 접속한 사용자 세션을 리스트에 저장
		sessionList.add(session);
		
		// 모든 세션에 채팅 전달
		for (int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			logger.info("{} 연결", s.getId() + " : " + chatMember);
			if(chatMember.equals("manager")) {
				s.sendMessage(new TextMessage(chatMember + "님이 입장했습니다."));
			}
		}
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String chatMember = (String) session.getAttributes().get("user");
		
		// 클라이언트가 웹 소켓 서버로 메시지를 전송했을 때
		logger.info("#handleTextMessage");
		logger.info("{}로 부터 {}받음", session.getId() + ":" + chatMember, message.getPayload());
		// 모든 유저에게 전송
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(chatMember + " : " + message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		String chatMember = (String) session.getAttributes().get("user");
		
		// 클라이언트가 연결을 종료
		logger.info("#afterConnectionClosed");
		
		// 채팅방에서 퇴장한 사용자 세션을 리스트에서 제거
		sessionList.remove(session);
		
		logger.info("{} 연결 종료", session.getId() + " : " + chatMember);
		
		// 모든 세션에 채팅 전달
		for (int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			if(chatMember.equals("manager")) {
				s.sendMessage(new TextMessage(chatMember + "님이 퇴장 했습니다."));
			}
		}
		
	}
	 
}
