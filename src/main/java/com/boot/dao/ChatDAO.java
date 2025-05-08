package com.boot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.ChatDTO;

//25.05.08 권준우
@Mapper
public interface ChatDAO {
	void insertMessage(ChatDTO dto);
	List<ChatDTO> getMessageBetween(String userA, String userB);
}
