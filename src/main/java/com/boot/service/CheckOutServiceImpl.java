package com.boot.service;

import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service("CheckOutService")
public class CheckOutServiceImpl implements CheckOutService{
	
    private static final String HOST = "https://kapi.kakao.com";
    private static final String ADMIN_KEY = "KakaoAK DEVB555FE82A57082D36F7FB718D583EFCD59D29";
    private String tid;
    
    @Override
    public String kakaoPayReady() {

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", ADMIN_KEY);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", "TC0ONETIME"); // 테스트 CID
        params.add("partner_order_id", "order1234");
        params.add("partner_user_id", "user1234");
        params.add("item_name", "티셔츠");
        params.add("quantity", "1");
        params.add("total_amount", "1000");
        params.add("vat_amount", "100");
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8485/pay/success");
        params.add("cancel_url", "http://localhost:8485/pay/cancel");
        params.add("fail_url", "http://localhost:8485/pay/fail");

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);

        try {
            ResponseEntity<Map> response = restTemplate.postForEntity(
                HOST + "/v1/payment/ready", body, Map.class);
            
            this.tid = (String) response.getBody().get("tid");

            return (String) response.getBody().get("next_redirect_pc_url");

        } catch (Exception e) {
            e.printStackTrace();
            return "/pay/fail";
        }
    }
    @Override
    public String kakaoPayApprove(String pgToken) {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", ADMIN_KEY);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", tid); // 결제 준비 단계에서 받은 tid
        params.add("partner_order_id", "order1234");
        params.add("partner_user_id", "user1234");
        params.add("pg_token", pgToken);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);

        try {
            ResponseEntity<String> response = restTemplate.postForEntity(
                HOST + "/v1/payment/approve", body, String.class);

            return "success";

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
