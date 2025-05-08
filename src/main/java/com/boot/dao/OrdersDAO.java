package com.boot.dao;

import java.util.HashMap;
import java.util.List;

import com.boot.dto.OrdersDTO;

public interface OrdersDAO {
    public List<OrdersDTO> getOrdersByCustomer(HashMap<String, String> param);
    
}
