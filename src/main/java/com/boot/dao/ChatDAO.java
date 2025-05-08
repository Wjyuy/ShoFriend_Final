package com.boot.dao;

import java.util.List;

import com.boot.dto.ChatDTO;

//25.05.08 권준우
public interface ChatDAO {
	void insertMessage(ChatDTO dto);
	List<ChatDTO> getMessageBetween(String userA, String userB);

}
