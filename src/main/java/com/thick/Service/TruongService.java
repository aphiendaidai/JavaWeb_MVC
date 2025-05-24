package com.thick.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thick.model.Truong;
import com.thick.repository.TruongRepository;

@Service
public class TruongService {
	
	@Autowired
	private TruongRepository truongRepository;
	
	public TruongService() {
	}

	public TruongService(TruongRepository truongRepository) {
		super();
		this.truongRepository = truongRepository;
	}
	
	public List<Truong> getAllTruongs() {
		return truongRepository.findAll();
	}
	
	public Truong getTruongById(String maTruong) {
		return truongRepository.findById(maTruong).orElse(null);
	}
	
	public Truong saveTruong(Truong truong) {
		return truongRepository.save(truong);
	}
	
	public void deleteTruongById(String maTruong) {
		truongRepository.deleteById(maTruong);
	}
	
	public Truong getByMaTruong(String maTruong) {
		return truongRepository.findByMaTruong(maTruong);
	}
	
	public Truong updateTruong(Truong truong) {
		return truongRepository.save(truong);
	}
	
	public List<Truong> searchTruong(String keyword) {
		if (keyword == null || keyword.trim().isEmpty()) {
			return getAllTruongs();
		}
		return truongRepository.findByMaTruongContainingOrTenTruongContainingOrDiaChiContaining(
			keyword.trim(), keyword.trim(), keyword.trim());
	}
}
