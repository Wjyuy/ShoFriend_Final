package com.boot.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.CartDAO;
import com.boot.dao.OrdersDAO;
import com.boot.dto.CartDTO;
import com.boot.dto.OrdersDTO;

@Service("CartService")
public class CartServiceImpl implements CartService {

    @Autowired
    private SqlSession sqlSession;



	@Override
	public void addToCart(HashMap<String, Object> param) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
//		dao.insertCartItem(param);
		CartDTO existing = dao.findItem(param);
		if (existing != null) {
			int existingQty = existing.getQuantity();
			int newQty = existingQty+ Integer.parseInt(param.get("quantity").toString());
			param.put("quantity", newQty);
			dao.updateQuantity(param);
		} else {
			dao.insertCartItem(param);
		}
		
	}

	@Override
	public List<CartDTO> getCartItems(HashMap<String, String> param) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		return dao.getCartItems(param);
	}

	@Override
	public CartDTO findItem(HashMap<String, Object> param) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		return dao.findItem(param);
	}

	@Override
	public void updateQuantity(HashMap<String, Object> param) {
		CartDAO dao = sqlSession.getMapper(CartDAO.class);
		dao.updateQuantity(param);
	}
}
