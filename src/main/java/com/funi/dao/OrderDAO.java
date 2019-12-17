package com.funi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.funi.domain.OrderDTO;

@Repository
public class OrderDAO {
	

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	//��ٱ��� �߰�
	public void insertData(OrderDTO dto) {		
		sessionTemplate.insert("orderMapper.insertData", dto);		
	}
	
	//��ٱ��� ���
	
	public List<OrderDTO> listCart(String email){
		return sessionTemplate.selectList("orderMapper.listCart",email);		
	}
	
	//��ٱ��� ����
	public void delete(int ordernum) {		
		sessionTemplate.delete("orderMaper.deleteData",ordernum);		
	}
	
	//��ٱ��� ����
	public void orderUpdateData(OrderDTO dto) {
		sessionTemplate.update("orderMaper.OrderUpdateData",dto);		
	}
	
	//��ٱ��� �ݾ� �հ�
	public int sumMoney(String email) {
		sessionTemplate.selectOne("orderMaper.sumMoney",email);
		return sessionTemplate.selectOne("orderMaper.sumMoney",email);		
	}
	
	//��ٱ��� ������ ��ǰ ���ڵ� Ȯ��
	public int countCart(int imageIndex, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imageIndex", imageIndex);
		map.put("email", email);
		return sessionTemplate.selectOne("orderMaper.countCart",map);		
	}
	
	//��ٱ��� ���� ����
	public void updataeCart(OrderDTO dto) {
		sessionTemplate.update("orderMaper.sumCart",dto);		
	}

}
