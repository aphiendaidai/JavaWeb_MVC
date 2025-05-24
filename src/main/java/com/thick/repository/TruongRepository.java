package com.thick.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.thick.model.Truong;

import java.util.List;

@Repository
public interface TruongRepository extends JpaRepository<Truong, String>{
    Truong findByMaTruong(String maTruong);

    List<Truong> findByMaTruongContainingOrTenTruongContainingOrDiaChiContaining(
        String maTruong, String tenTruong, String diaChi);
}
