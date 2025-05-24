package com.thick.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "TRUONG")
public class Truong {
	
	  @Id
	    @Column(name = "MaTruong")
	  private String maTruong;
	  private String diaChi;
	  private String tenTruong;
	  private Long Sdt;
	public Truong() {
		super();
	}
	public Truong(String maTruong, String diaChi, String tenTruong,Long sdt) {
		super();
		this.maTruong = maTruong;
		this.diaChi = diaChi;
		this.tenTruong=tenTruong;
		Sdt = sdt;
	}
	public String getMaTruong() {
		return maTruong;
	}
	public void setMaTruong(String maTruong) {
		this.maTruong = maTruong;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getTenTruong() {
		return tenTruong;
	}
	public void setTenTruong(String tenTruong) {
		this.tenTruong = tenTruong;
	}
	public Long getSdt() {
		return Sdt;
	}
	public void setSdt(Long sdt) {
		Sdt = sdt;
	}

	  
	  

}
