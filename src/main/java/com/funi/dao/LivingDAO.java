package com.funi.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.funi.domain.FurnitureDTO;

public class LivingDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	//living*************
	
	//ī�װ� ����Ʈ
	public List<FurnitureDTO> cateEImageList(HashMap<String,Object> livingMap) {
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("livingMapper.CateimageList",livingMap);
		
		return Lists;
	}
	
	//ħ�� ��ü ����Ʈ
	public List<FurnitureDTO> livingImageList() {
		
		List<FurnitureDTO> Lists = sessionTemplate.selectList("livingMapper.livingimageList");
		
		return Lists;
	}
	
	//ħ�� �̹��� �μ�Ʈ
	public void insertlivingData(FurnitureDTO dto) {
		sessionTemplate.insert("livingMapper.insertData", dto);
	}
	
	public FurnitureDTO getReadData(int imageIndex, String cateEn) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("imageIndex", imageIndex);
		params.put("cateE", cateEn);
		
		
		FurnitureDTO dto = sessionTemplate.selectOne("livingMapper.getReadData",params);
		
		/*
		 * System.out.println(dto.getImageIndex());
		 * System.out.println(dto.getSaveFileName());
		 */
		return dto;
	}
	
	

}
