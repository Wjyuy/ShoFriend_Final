package com.boot.service;

import java.util.List;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.OrdersDAO;
import com.boot.dto.OrdersDTO;

@Service("OrdersService")
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<OrdersDTO> getOrdersByCustomer(HashMap<String, String> param) {
        OrdersDAO dao = sqlSession.getMapper(OrdersDAO.class);
        return dao.getOrdersByCustomer(param);
    }
}
