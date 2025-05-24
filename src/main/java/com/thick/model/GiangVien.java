package com.thick.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "GIANGVIEN")
public class GiangVien {
    
    @Id
    @Column(name = "MaGV")
    private String maGV;
    
    @Column(name = "HoTen")
    private String hoTen;
    
    @Column(name = "ChucVu")
    private String chucVu;
    
    @Column(name = "SoDT")
    private Long soDT;
    
    @ManyToOne
    @JoinColumn(name = "MaTruong")
    private Truong truong;
    
    public GiangVien() {
        super();
    }
    
    public GiangVien(String maGV, String hoTen, String chucVu, Long soDT, Truong truong) {
        super();
        this.maGV = maGV;
        this.hoTen = hoTen;
        this.chucVu = chucVu;
        this.soDT = soDT;
        this.truong = truong;
    }
    
    public String getMaGV() {
        return maGV;
    }
    
    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }
    
    public String getHoTen() {
        return hoTen;
    }
    
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    
    public String getChucVu() {
        return chucVu;
    }
    
    public void setChucVu(String chucVu) {
        this.chucVu = chucVu;
    }
    
    public Long getSoDT() {
        return soDT;
    }
    
    public void setSoDT(Long soDT) {
        this.soDT = soDT;
    }
    
    public Truong getTruong() {
        return truong;
    }
    
    public void setTruong(Truong truong) {
        this.truong = truong;
    }
} 