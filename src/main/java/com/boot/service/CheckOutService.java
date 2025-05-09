package com.boot.service;

public interface CheckOutService {
	public String kakaoPayReady();
	public String kakaoPayApprove(String pgToken);
}
