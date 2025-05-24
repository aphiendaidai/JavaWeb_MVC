package com.thick.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "DANGKY")
public class DangKy {
    
    @Id
    @Column(name = "MaDK")
    private String maDK;
    
    @ManyToOne
    @JoinColumn(name = "MaSV")
    private SinhVien sinhVien;
    
    @ManyToOne
    @JoinColumn(name = "MaKH")
    private KhoaHoc khoaHoc;
    
    public DangKy() {
        super();
    }
    
    public DangKy(String maDK, SinhVien sinhVien, KhoaHoc khoaHoc) {
        super();
        this.maDK = maDK;
        this.sinhVien = sinhVien;
        this.khoaHoc = khoaHoc;
    }
    
    public String getMaDK() {
        return maDK;
    }
    
    public void setMaDK(String maDK) {
        this.maDK = maDK;
    }
    
    public SinhVien getSinhVien() {
        return sinhVien;
    }
    
    public void setSinhVien(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }
    
    public KhoaHoc getKhoaHoc() {
        return khoaHoc;
    }
    
    public void setKhoaHoc(KhoaHoc khoaHoc) {
        this.khoaHoc = khoaHoc;
    }
} 