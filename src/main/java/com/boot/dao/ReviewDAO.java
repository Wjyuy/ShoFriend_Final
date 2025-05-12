package com.boot.dao;

import java.util.List;
import java.util.Map;

import com.boot.dto.ReviewDTO;

public interface ReviewDAO {
	void insertReview(ReviewDTO dto);
	List<ReviewDTO> getReviews(int productId);
//	Map<Integer, Integer> getRatingCounts(int productId);	//selectOne 처럼 작동하면 안됨
	List<Map<String, Object>> getRatingCounts(int productId);
	Double getAverageRating(int productId);	
}
