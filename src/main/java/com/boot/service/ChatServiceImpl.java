package com.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.boot.dao.ChatDAO;
import com.boot.dto.ChatDTO;

//25.05.08 권준우
@Service
public class ChatServiceImpl implements ChatService {

	private ChatDAO chatDAO;
	
	@Override
	public void saveMessage(ChatDTO dto) {
		chatDAO.insertMessage(dto);
	}

	@Override
	public List<ChatDTO> getMessage(String userA, String userB) {
		return chatDAO.getMessageBetween(userA, userB);
	}
	
	
}
