package com.funi.domain;

public class FurnitureDTO {
	
	private int imageIndex;
	private String productName;
	private String cateEn;
	private String cate;
	private String price;
	private String saveFileName;
	

	public int getImageIndex() {
		return imageIndex;
	}
	public void setImageIndex(int imageIndex) {
		this.imageIndex = imageIndex;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCateEn() {
		return cateEn;
	}
	public void setCateEn(String cateEn) {
		this.cateEn = cateEn;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
}
