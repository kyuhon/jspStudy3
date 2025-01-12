package com.kh.edu.buatan.model;

public class CartVO {
	private int num;
	private String studentId;
	private int productNum;
	private int quantity;
	public CartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartVO(int num, String studentId, int productNum, int quantity) {
		super();
		this.num = num;
		this.studentId = studentId;
		this.productNum = productNum;
		this.quantity = quantity;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "CartVO [num=" + num + ", studentId=" + studentId + ", productNum=" + productNum + ", quantity="
				+ quantity + "]";
	}
}
