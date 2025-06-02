package com.thick.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thick.model.SinhVien;
import com.thick.repository.SinhVienRepository;

@Service
public class SinhVienService {
    
    @Autowired
    private SinhVienRepository sinhVienRepository;
    
    
    
    public List<SinhVien> getAllSinhVien() {
        return sinhVienRepository.findAll();
    }
    
    public SinhVien getSinhVienById(String maSV) {
        return sinhVienRepository.findById(maSV).orElse(null);
    }
    
    public SinhVien saveSinhVien(SinhVien sinhVien) {
    	
        return sinhVienRepository.save(sinhVien);
    }
    
    public void deleteSinhVien(String maSV) {
        sinhVienRepository.deleteById(maSV);
    }
    
    public SinhVien updateSinhVien(SinhVien sinhVien) {
        return sinhVienRepository.save(sinhVien);
    }
    
    public List<SinhVien> searchSinhVien(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getAllSinhVien();
        }
        return sinhVienRepository.findByMaSVContainingOrHoTenContainingOrDiaChiContaining(
            keyword.trim(), keyword.trim(), keyword.trim());
    }
    
} 