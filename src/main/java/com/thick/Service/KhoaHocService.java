package com.thick.Service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thick.model.KhoaHoc;
import com.thick.repository.KhoaHocRepository;

@Service
public class KhoaHocService {
    
    @Autowired
    private KhoaHocRepository khoaHocRepository;
    
    public List<KhoaHoc> getAllKhoaHoc() {
        return khoaHocRepository.findAll();
    }
    
    public KhoaHoc getKhoaHocById(String maKH) {
        return khoaHocRepository.findById(maKH).orElse(null);
    }
    
    public KhoaHoc saveKhoaHoc(KhoaHoc khoaHoc) {
        return khoaHocRepository.save(khoaHoc);
    }
    
    public void deleteKhoaHoc(String maKH) {
        khoaHocRepository.deleteById(maKH);
    }
    
    public KhoaHoc updateKhoaHoc(KhoaHoc khoaHoc) {
        return khoaHocRepository.save(khoaHoc);
    }
    
    public List<KhoaHoc> searchKhoaHoc(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getAllKhoaHoc();
        }
        return khoaHocRepository.findByMaKHContainingOrTenKHContainingOrThoiGianContaining(
            keyword.trim(), keyword.trim(), keyword.trim());
    }
} 