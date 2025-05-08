package com.boot.service;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("CheckOutService")
public class CheckOutServiceImpl implements CheckOutService{

	private static final String KAKAO_PAY_READY_URL = "https://kapi.kakao.com/v1/payment/ready";
    private static final String KAKAO_PAY_APPROVE_URL = "https://kapi.kakao.com/v1/payment/approve";
    private static final String KAKAO_PAY_CANCEL_URL = "https://kapi.kakao.com/v1/payment/cancel";
    private static final String KAKAO_PAY_ADMIN_KEY = "YOUR_ADMIN_KEY"; // 발급받은 Admin Key

	@Override
	public Map<String, String> prepareKakaoPay(String partnerOrderId, String partnerUserId, String itemName, int quantity, int totalAmount, int taxFreeAmount, String approvalUrl, String cancelUrl, String failUrl) throws Exception {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(KAKAO_PAY_READY_URL);
        httpPost.addHeader("Authorization", "KakaoAK " + KAKAO_PAY_ADMIN_KEY);
        httpPost.addHeader("Content-Type", "application/json");

        Map<String, Object> params = new HashMap<>();
        params.put("cid", "TC0ONETIME"); // 테스트 CID
        params.put("partner_order_id", partnerOrderId);
        params.put("partner_user_id", partnerUserId);
        params.put("item_name", itemName);
        params.put("quantity", quantity);
        params.put("total_amount", totalAmount);
        params.put("tax_free_amount", taxFreeAmount);
        params.put("approval_url", approvalUrl);
        params.put("cancel_url", cancelUrl);
        params.put("fail_url", failUrl);

        ObjectMapper objectMapper = new ObjectMapper();
        String jsonParams = objectMapper.writeValueAsString(params);
        httpPost.setEntity(new StringEntity(jsonParams, "UTF-8"));

        return httpClient.execute(httpPost, response -> {
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode == 200) {
                String responseString = EntityUtils.toString(response.getEntity(), "UTF-8");
                return objectMapper.readValue(responseString, Map.class);
            } else {
                throw new Exception("카카오페이 결제 준비 실패: " + statusCode);
                
            }
        });
    }

	@Override
	public Map<String, String> approveKakaoPay(String cid, String tid, String partnerOrderId, String partnerUserId, String pgToken) throws Exception {
	    CloseableHttpClient httpClient = HttpClients.createDefault();
	    HttpPost httpPost = new HttpPost(KAKAO_PAY_APPROVE_URL);
	    httpPost.addHeader("Authorization", "KakaoAK " + KAKAO_PAY_ADMIN_KEY);
	    httpPost.addHeader("Content-Type", "application/json");

	    Map<String, Object> params = new HashMap<>();
	    params.put("cid", cid);
	    params.put("tid", tid);
	    params.put("partner_order_id", partnerOrderId);
	    params.put("partner_user_id", partnerUserId);
	    params.put("pg_token", pgToken);

	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonParams = objectMapper.writeValueAsString(params);
	    httpPost.setEntity(new StringEntity(jsonParams, "UTF-8"));

	    return httpClient.execute(httpPost, response -> {
	        int statusCode = response.getStatusLine().getStatusCode();
	        if (statusCode == 200) {
	            String responseString = EntityUtils.toString(response.getEntity(), "UTF-8");
	            return objectMapper.readValue(responseString, Map.class);
	        } else {
	            throw new Exception("카카오페이 결제 승인 실패: " + statusCode);
	        }
	    });
	}

	@Override
	public Map<String, String> cancelKakaoPay(String cid, String tid, int cancelAmount, int cancelTaxFreeAmount) throws Exception {
	    CloseableHttpClient httpClient = HttpClients.createDefault();
	    HttpPost httpPost = new HttpPost(KAKAO_PAY_CANCEL_URL);
	    httpPost.addHeader("Authorization", "KakaoAK " + KAKAO_PAY_ADMIN_KEY);
	    httpPost.addHeader("Content-Type", "application/json");

	    Map<String, Object> params = new HashMap<>();
	    params.put("cid", cid);
	    params.put("tid", tid);
	    params.put("cancel_amount", cancelAmount);
	    params.put("cancel_tax_free_amount", cancelTaxFreeAmount);

	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonParams = objectMapper.writeValueAsString(params);
	    httpPost.setEntity(new StringEntity(jsonParams, "UTF-8"));

	    return httpClient.execute(httpPost, response -> {
	        int statusCode = response.getStatusLine().getStatusCode();
	        if (statusCode == 200) {
	            String responseString = EntityUtils.toString(response.getEntity(), "UTF-8");
	            return objectMapper.readValue(responseString, Map.class);
	        } else {
	            throw new Exception("카카오페이 결제 취소 실패: " + statusCode);
	        }
	    });
	}

}
