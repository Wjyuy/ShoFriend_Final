package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdersDTO {
    private int id;
    private String partnerOrderId;
    private int customerId;
    private Timestamp orderDate;
    private String orderStatus;
    private int totalQuantity;
    private int totalPrice;
    private String deliveryAddress;
    private String deliveryZipcode;
    private String deliveryMemo;
    private String paymentMethod;
    private String paymentStatus;
    private String transactionId;
    private Integer friendOrderId; // Nullable 외래 키이므로 Integer 사용
    private Integer posted;        // Nullable 외래 키이므로 Integer 사용

    // 필요한 경우 연관된 OrderItem 리스트를 가질 수도 있습니다.
    // private List<OrderItemDTO> orderItems;
}