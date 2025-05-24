package com.thick.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thick.model.DangKy;
import com.thick.repository.DangKyRepository;

@Service
public class DangKyService {
    
    @Autowired
    private DangKyRepository dangKyRepository;
    
    public DangKyService(DangKyRepository dangKyRepository) {
		super();
		this.dangKyRepository = dangKyRepository;
	}

	public List<DangKy> getAllDangKy() {
        return dangKyRepository.findAll();
    }
    
    public DangKy getDangKyById(String maDK) {
        return dangKyRepository.findById(maDK).orElse(null);
    }
    
    public DangKy saveDangKy(DangKy dangKy) {
        return dangKyRepository.save(dangKy);
    }
    
    public void deleteDangKy(String maDK) {
        dangKyRepository.deleteById(maDK);
    }
    
    public DangKy updateDangKy(DangKy dangKy) {
        return dangKyRepository.save(dangKy);
    }
    
    
} 