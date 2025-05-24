package com.thick.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.thick.model.SinhVien;

import java.util.List;

@Repository
public interface SinhVienRepository extends JpaRepository<SinhVien, String> {
    List<SinhVien> findByMaSVContainingOrHoTenContainingOrDiaChiContaining(
        String maSV, String hoTen, String diaChi);
} 