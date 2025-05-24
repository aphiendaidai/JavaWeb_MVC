package com.thick.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.thick.model.DangKy;

@Repository
public interface DangKyRepository extends JpaRepository<DangKy, String> {
} 