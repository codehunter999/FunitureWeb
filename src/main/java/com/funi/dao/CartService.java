package com.funi.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funi.domain.OrderDTO;

@Service("cartService")
public class CartService {
	
	@Autowired
	OrderDAO orderDao;
	
	//장바구니 추가
	public void insert(OrderDTO dto) {
		orderDao.insertData(dto);
	}
	//장바구니 목록
	public List<OrderDTO> listCart(String email){
		return orderDao.listCart(email);
	}
	//장바구니 삭제
	public void delete(int ordernum) {
		orderDao.delete(ordernum);
	}
	//장바구니 수정
	public void orderUpdateData(OrderDTO dto) {
		orderDao.orderUpdateData(dto);
	}
	//장바구니 금액 합계
	public int sumMoney(String email) {
		return orderDao.sumMoney(email);
	}
	//장바구니 상품 확인
	public int countCart(int imageIndex, String email) {
		return orderDao.countCart(imageIndex, email);
	}
	//장바구니 상품 수량 변경
	public void updateCart(OrderDTO dto) {
		orderDao.updataeCart(dto);
	}

}
