package com.thick.Service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thick.model.GiangVien;
import com.thick.repository.GiangVienRepository;

@Service
public class GiangVienService {
    
    @Autowired
    private GiangVienRepository giangVienRepository;
    
    public List<GiangVien> getAllGiangVien() {
        return giangVienRepository.findAll();
    }
    
    public GiangVien getGiangVienById(String maGV) {
        return giangVienRepository.findById(maGV).orElse(null);
    }
    
    public GiangVien saveGiangVien(GiangVien giangVien) {
        return giangVienRepository.save(giangVien);
    }
    
    public void deleteGiangVien(String maGV) {
        giangVienRepository.deleteById(maGV);
    }
    
    public GiangVien updateGiangVien(GiangVien giangVien) {
        return giangVienRepository.save(giangVien);
    }
    
    public List<GiangVien> searchGiangVien(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getAllGiangVien();
        }
        return giangVienRepository.findByMaGVContainingOrHoTenContainingOrChucVuContaining(
            keyword.trim(), keyword.trim(), keyword.trim());
    }
} 