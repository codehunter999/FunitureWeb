package com.funi.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funi.domain.OrderDTO;

@Service("cartService")
public class CartService {
	
	@Autowired
	OrderDAO orderDao;
	
	//��ٱ��� �߰�
	public void insert(OrderDTO dto) {
		orderDao.insertData(dto);
	}
	//��ٱ��� ���
	public List<OrderDTO> listCart(String email){
		return orderDao.listCart(email);
	}
	//��ٱ��� ����
	public void delete(int ordernum) {
		orderDao.delete(ordernum);
	}
	//��ٱ��� ����
	public void orderUpdateData(OrderDTO dto) {
		orderDao.orderUpdateData(dto);
	}
	//��ٱ��� �ݾ� �հ�
	public int sumMoney(String email) {
		return orderDao.sumMoney(email);
	}
	//��ٱ��� ��ǰ Ȯ��
	public int countCart(int imageIndex, String email) {
		return orderDao.countCart(imageIndex, email);
	}
	//��ٱ��� ��ǰ ���� ����
	public void updateCart(OrderDTO dto) {
		orderDao.updataeCart(dto);
	}

}
