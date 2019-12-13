package com.funi.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

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
	public List<PaymentDTO> getList(String email){
		List<PaymentDTO> result=sessionTemplate.selectList("paymentMapper.getlist", email);
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
		
		dto.setDeliveryMessage("�� �־��ּ���");
		
		sessionTemplate.insert("paymentMapper.insertData", dto);

	}
}