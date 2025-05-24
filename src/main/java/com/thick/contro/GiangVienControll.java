package com.thick.contro;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thick.Service.GiangVienService;
import com.thick.Service.TruongService;
import com.thick.model.GiangVien;

@Controller
@RequestMapping("/giangvien")
public class GiangVienControll {
    private GiangVienService giangVienService;
    private TruongService truongService;

    
    public GiangVienControll(GiangVienService giangVienService, TruongService truongService) {
		super();
		this.giangVienService = giangVienService;
		this.truongService = truongService;
	}

	@GetMapping
    public String listGiangVien(Model model) {
        model.addAttribute("giangvien", giangVienService.getAllGiangVien());
        model.addAttribute("contentPage", "/WEB-INF/Views/giangvien/giangvien.jsp");
        return "/layout/layout";
    }
    
    @GetMapping("/new")
    public String createGiangVienForm(Model model) {
        GiangVien giangVien = new GiangVien();
        model.addAttribute("giangviens", giangVien);
        model.addAttribute("truong",truongService.getAllTruongs() );
        model.addAttribute("contentPage", "/WEB-INF/Views/giangvien/create.jsp");
        return "/layout/layout";
    }
    
    @PostMapping
    public String saveGiangVien(@ModelAttribute("giangviens") GiangVien giangVien, 
                               BindingResult result, 
                               Model model) {
        if (giangVien.getMaGV() == null || giangVien.getMaGV().trim().isEmpty()) {
            result.rejectValue("maGV", "error.maGV", "Mã giảng viên không được để trống");
        }
        if (giangVien.getHoTen() == null || giangVien.getHoTen().trim().isEmpty()) {
            result.rejectValue("hoTen", "error.hoTen", "Họ tên không được để trống");
        }
        if (giangVien.getChucVu() == null || giangVien.getChucVu().trim().isEmpty()) {
            result.rejectValue("chucVu", "error.chucVu", "Chức vụ không được để trống");
        }
        if (giangVien.getSoDT() == null) {
            result.rejectValue("soDT", "error.soDT", "Số điện thoại không được để trống");
        }
        
        if (result.hasErrors()) {
            model.addAttribute("contentPage", "/WEB-INF/Views/giangvien/create.jsp");
            return "/layout/layout";
        }
        
        giangVienService.updateGiangVien(giangVien);
        return "redirect:/giangvien";
    }
    
    @GetMapping("/edit/{maGV}")
    public String editGiangVienForm(@PathVariable("maGV") String maGV, Model model) {
        GiangVien giangVien = giangVienService.getGiangVienById(maGV);
        if (giangVien == null) {
            return "redirect:/giangvien";
        }
        model.addAttribute("giangvien", giangVien);
        model.addAttribute("truong",truongService.getAllTruongs() );

        model.addAttribute("contentPage", "/WEB-INF/Views/giangvien/edit.jsp");
        return "/layout/layout";
    }
    
    @PostMapping("/edit/{maGV}")
    public String updateGiangVien(@PathVariable("maGV") String maGV,
                                @ModelAttribute("giangvien") GiangVien giangVien,
                                BindingResult result,
                                Model model) {
        if (giangVien.getHoTen() == null || giangVien.getHoTen().trim().isEmpty()) {
            result.rejectValue("hoTen", "error.hoTen", "Họ tên không được để trống");
        }
        if (giangVien.getChucVu() == null || giangVien.getChucVu().trim().isEmpty()) {
            result.rejectValue("chucVu", "error.chucVu", "Chức vụ không được để trống");
        }
        if (giangVien.getSoDT() == null) {
            result.rejectValue("soDT", "error.soDT", "Số điện thoại không được để trống");
        }
        
        if (result.hasErrors()) {
            model.addAttribute("contentPage", "/WEB-INF/Views/giangvien/edit.jsp");
            return "/layout/layout";
        }
        
        giangVien.setMaGV(maGV);
        giangVienService.saveGiangVien(giangVien);
        return "redirect:/giangvien";
    }
    
    @GetMapping("/delete/{maGV}")
    public String deleteGiangVien(@PathVariable("maGV") String maGV) {
        giangVienService.deleteGiangVien(maGV);
        return "redirect:/giangvien";
    }
} 