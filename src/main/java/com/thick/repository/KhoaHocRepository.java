package com.thick.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.thick.model.KhoaHoc;

import java.util.List;

@Repository
public interface KhoaHocRepository extends JpaRepository<KhoaHoc, String> {
    List<KhoaHoc> findByMaKHContainingOrTenKHContainingOrThoiGianContaining(
        String maKH, String tenKH, String thoiGian);
} 