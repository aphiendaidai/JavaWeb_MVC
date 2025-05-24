package com.thick.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.thick.model.GiangVien;

import java.util.List;

@Repository
public interface GiangVienRepository extends JpaRepository<GiangVien, String> {
    List<GiangVien> findByMaGVContainingOrHoTenContainingOrChucVuContaining(
        String maGV, String hoTen, String chucVu);
} 