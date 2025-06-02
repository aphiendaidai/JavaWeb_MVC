package com.thick.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "SINHVIEN")
public class SinhVien {
    
    @Id
    @Column(name = "MaSV")
    private String maSV;
    
    @Column(name = "HoTen")
    private String hoTen;
    
    @Column(name = "NgaySinh")
    private Date ngaySinh;
    
    @Column(name = "DiaChi")
    private String diaChi;
    
    @ManyToOne
    @JoinColumn(name = "MaTruong")
    private Truong truong;
    
    @Column(name = "SoDT")
    private Long soDT;

    @ManyToOne
    @JoinColumn(name = "UserId")
    private User user;
    
    
    public SinhVien() {
		super();
	}
    

	public SinhVien(String maSV, String hoTen, Date ngaySinh, String diaChi, Truong truong, Long soDT, Long userId,
			User user) {
		super();
		this.maSV = maSV;
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
		this.truong = truong;
		this.soDT = soDT;
		this.user = user;
	}


	public String getMaSV() {
        return maSV;
    }
    
    public void setMaSV(String maSV) {
        this.maSV = maSV;
    }
    
    public String getHoTen() {
        return hoTen;
    }
    
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    
    public Date getNgaySinh() {
        return ngaySinh;
    }
    
    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }
    
    public String getDiaChi() {
        return diaChi;
    }
    
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    
    public Truong getTruong() {
        return truong;
    }
    
    public void setTruong(Truong truong) {
        this.truong = truong;
    }
    
    public Long getSoDT() {
        return soDT;
    }
    
    public void setSoDT(Long soDT) {
        this.soDT = soDT;
    }
    

    
    public User getUser() {
        return user;
    }
    
    public void setUser(User user) {
        this.user = user;
        
    }
    
} 