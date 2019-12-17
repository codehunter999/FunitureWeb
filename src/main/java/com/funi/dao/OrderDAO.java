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
	
	//장바구니 추가
	public void insertData(OrderDTO dto) {		
		sessionTemplate.insert("orderMapper.insertData", dto);		
	}
	
	//장바구니 목록
	
	public List<OrderDTO> listCart(String email){
		return sessionTemplate.selectList("orderMapper.listCart",email);		
	}
	
	//장바구니 삭제
	public void delete(int ordernum) {		
		sessionTemplate.delete("orderMaper.deleteData",ordernum);		
	}
	
	//장바구니 수정
	public void orderUpdateData(OrderDTO dto) {
		sessionTemplate.update("orderMaper.OrderUpdateData",dto);		
	}
	
	//장바구니 금액 합계
	public int sumMoney(String email) {
		sessionTemplate.selectOne("orderMaper.sumMoney",email);
		return sessionTemplate.selectOne("orderMaper.sumMoney",email);		
	}
	
	//장바구니 동일한 상품 레코드 확인
	public int countCart(int imageIndex, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imageIndex", imageIndex);
		map.put("email", email);
		return sessionTemplate.selectOne("orderMaper.countCart",map);		
	}
	
	//장바구니 수량 변경
	public void updataeCart(OrderDTO dto) {
		sessionTemplate.update("orderMaper.sumCart",dto);		
	}

}
