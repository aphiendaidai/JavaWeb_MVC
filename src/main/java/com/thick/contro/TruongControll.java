package com.thick.contro;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thick.Service.TruongService;
import com.thick.model.Truong;

@Controller
@RequestMapping("/truong")
public class TruongControll {
	private TruongService truongService;

	public TruongControll(TruongService truongService) {
		super();
		this.truongService = truongService;
	}
	
	
	@GetMapping
	public String listTruong(Model model) {
		model.addAttribute("truong", truongService.getAllTruongs());
		model.addAttribute("contentPage", "/WEB-INF/Views/truong/truong.jsp");
		return "/layout/layout";
	}
	
	@GetMapping("/new")
	public String createTruongForm(Model model) {
		Truong truong = new Truong();
		model.addAttribute("truongs", truong);
		model.addAttribute("contentPage", "/WEB-INF/Views/truong/create.jsp");
		return "/layout/layout";
	}
	
	@PostMapping
	public String saveTruong(@ModelAttribute("truongs") Truong truong, BindingResult result, Model model) {
		if (truong.getMaTruong() == null || truong.getMaTruong().trim().isEmpty()) {
			result.rejectValue("tenTruong", "error.tenTruong", "Tên trường không được để trống");
		}
		if (truong.getTenTruong() == null || truong.getTenTruong().trim().isEmpty()) {
			result.rejectValue("tenTruong", "error.tenTruong", "Tên trường không được để trống");
		}
		if (truong.getDiaChi() == null || truong.getDiaChi().trim().isEmpty()) {
			result.rejectValue("diaChi", "error.diaChi", "Địa chỉ không được để trống");
		}
		if (truong.getSdt() == null) {
			result.rejectValue("sdt", "error.sdt", "Số điện thoại không được để trống");
		}
		
		if (result.hasErrors()) {
			model.addAttribute("contentPage", "/WEB-INF/Views/truong/create.jsp");
			return "/layout/layout";
		}
		
		truongService.saveTruong(truong);
		return "redirect:/truong";
	}
	
	@GetMapping("/edit/{maTruong}")
	public String editTruongForm(@PathVariable("maTruong") String maTruong, Model model) {
		Truong truong = truongService.getTruongById(maTruong);
		if (truong == null) {
			return "redirect:/truong";
		}
		model.addAttribute("truong", truong);
		model.addAttribute("contentPage", "/WEB-INF/Views/truong/edit.jsp");
		return "/layout/layout";
	}
	
	@PostMapping("/edit/{maTruong}")
	public String updateTruong(@PathVariable("maTruong") String maTruong, 
							 @ModelAttribute("truong") Truong truong,
							 BindingResult result,
							 Model model) {
		// Validation
		if (truong.getTenTruong() == null || truong.getTenTruong().trim().isEmpty()) {
			result.rejectValue("tenTruong", "error.tenTruong", "Tên trường không được để trống");
		}
		if (truong.getDiaChi() == null || truong.getDiaChi().trim().isEmpty()) {
			result.rejectValue("diaChi", "error.diaChi", "Địa chỉ không được để trống");
		}
		if (truong.getSdt() == null) {
			result.rejectValue("sdt", "error.sdt", "Số điện thoại không được để trống");
		}
		
		if (result.hasErrors()) {
			model.addAttribute("contentPage", "/WEB-INF/Views/truong/edit.jsp");
			return "/layout/layout";
		}
		
		truong.setMaTruong(maTruong);
		truongService.saveTruong(truong);
		return "redirect:/truong";
	}
	
	@GetMapping("/delete/{maTruong}")
	public String deleteTruong(@PathVariable("maTruong") String maTruong) {
		truongService.deleteTruongById(maTruong);
		return "redirect:/truong";
	}
	

}
