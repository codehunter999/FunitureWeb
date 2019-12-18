package com.funi.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.funi.domain.PaymentpaySum_payType;
import com.funi.domain.PaymentDTO;


public class PaymentDAO {
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	public int getId() {
		int result= sessionTemplate.selectOne("paymentMapper.selectId");
		return result;
	}
	public List<PaymentDTO> getTotalList(String email){
		List<PaymentDTO> result=sessionTemplate.selectList("paymentMapper.getTotalList",email);
		return result;
	}
	public List<PaymentDTO> getPayList(String email){
		List<PaymentDTO> result=sessionTemplate.selectList("paymentMapper.getpaylist",email);
		return result;
	}
	public void setList(List<PaymentDTO> list) {		
		for(int i=0;i<list.size();i++) {			
			PaymentDTO dto=list.get(i);		
			dto.setPayId(getId()+1);		
			sessionTemplate.insert("paymentMapper.insertData", dto);
		}
	}
	public void setitem(PaymentDTO dto) {		
		dto.setPayId(getId()+1);	
		dto.setDeliveryMessage("잘 넣어주세요");
		sessionTemplate.insert("paymentMapper.insertData", dto);
	}
	
	public PaymentpaySum_payType search_paySum_paytype(String email) {
		PaymentpaySum_payType paymenpaySum_payType  = null;		
		try {
			paymenpaySum_payType = sessionTemplate.selectOne("paymentMapper.paySumAndpayType",email);
		} catch (Exception e) {
			System.out.println(e.toString());
		}		
		return paymenpaySum_payType;
	}
	
}
