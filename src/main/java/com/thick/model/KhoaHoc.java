package com.thick.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "KHOA_HOC")
public class KhoaHoc {
    
    @Id
    @Column(name = "MaKH")
    private String maKH;
    
    @Column(name = "TenKH")
    private String tenKH;
    
    @ManyToOne
    @JoinColumn(name = "MaGV")
    private GiangVien giangVien;
    
    @Column(name = "ThoiGian")
    private String thoiGian;
    
    @ManyToOne
    @JoinColumn(name = "MaTruong")
    private Truong truong;
    
    public KhoaHoc() {
        super();
    }
    
    public KhoaHoc(String maKH, String tenKH, GiangVien giangVien, String thoiGian, Truong truong) {
        super();
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.giangVien = giangVien;
        this.thoiGian = thoiGian;
        this.truong = truong;
    }
    
    public String getMaKH() {
        return maKH;
    }
    
    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }
    
    public String getTenKH() {
        return tenKH;
    }
    
    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }
    
    public GiangVien getGiangVien() {
        return giangVien;
    }
    
    public void setGiangVien(GiangVien giangVien) {
        this.giangVien = giangVien;
    }
    
    public String getThoiGian() {
        return thoiGian;
    }
    
    public void setThoiGian(String thoiGian) {
        this.thoiGian = thoiGian;
    }
    
    public Truong getTruong() {
        return truong;
    }
    
    public void setTruong(Truong truong) {
        this.truong = truong;
    }
} 