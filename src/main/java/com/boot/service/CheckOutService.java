package com.boot.service;

import java.util.Map;

public interface CheckOutService {
	Map<String, String> prepareKakaoPay(String partnerOrderId, String partnerUserId, String itemName, int quantity, int totalAmount, int taxFreeAmount, String approvalUrl, String cancelUrl, String failUrl) throws Exception;
	Map<String, String> approveKakaoPay(String cid, String tid, String partnerOrderId, String partnerUserId, String pgToken) throws Exception;
    Map<String, String> cancelKakaoPay(String cid, String tid, int cancelAmount, int cancelTaxFreeAmount) throws Exception;
}
