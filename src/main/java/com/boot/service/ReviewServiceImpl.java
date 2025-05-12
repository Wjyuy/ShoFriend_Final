package com.boot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.ReviewDAO;
import com.boot.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public void saveReview(ReviewDTO dto) {
		reviewDAO.insertReview(dto);
	}
	
	@Override
	public List<ReviewDTO> getReviews(int productId) {
		return reviewDAO.getReviews(productId);
	}

	@Override
	public Map<Integer, Integer> getRatingCounts(int productId) {
		List<Map<String, Object>> rawList = reviewDAO.getRatingCounts(productId);
		Map<Integer, Integer> result = new HashMap<>();
		for (Map<String, Object> row : rawList) {
			Integer rating = (Integer) row.get("rating");
			Long count = (Long) row.get("count"); // MySQL COUNT는 Long으로 맵핑됨
			result.put(rating, count.intValue());
		}
		return result;
	}


	@Override
	public Double getAverageRating(int productId) {
		return reviewDAO.getAverageRating(productId);
	}
}
