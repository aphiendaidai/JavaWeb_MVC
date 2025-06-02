package com.thick.contro;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thick.Service.SinhVienService;
import com.thick.Service.TruongService;
import com.thick.Service.UserService;
import com.thick.model.SinhVien;
import com.thick.model.User;

@Controller
@RequestMapping("/sinhvien")
public class SinhVienController {
    private SinhVienService sinhVienService;
    private TruongService truongService;
    private UserService userService;
    
    public SinhVienController(SinhVienService sinhVienService, TruongService truongService, UserService userService) {
        this.sinhVienService = sinhVienService;
        this.truongService = truongService;
        this.userService = userService;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping
    public String listSinhVien(Model model) {
        model.addAttribute("sinhvien", sinhVienService.getAllSinhVien());
        model.addAttribute("contentPage", "/WEB-INF/Views/sinhvien/sinhvien.jsp");
        return "/layout/layout";
    }
    
    @GetMapping("/new")
    public String createSinhVienForm(Model model) {
        SinhVien sinhVien = new SinhVien();
        model.addAttribute("sinhviens", sinhVien);
        model.addAttribute("truong", truongService.getAllTruongs());
        model.addAttribute("contentPage", "/WEB-INF/Views/sinhvien/create.jsp");
        return "/layout/layout";
    }
    
    @PostMapping
    public String saveSinhVien(@ModelAttribute("sinhviens") SinhVien sinhVien, 
                             BindingResult result, 
                             Model model,
                             Authentication authentication) {
        if (sinhVien.getMaSV() == null || sinhVien.getMaSV().trim().isEmpty()) {
            result.rejectValue("maSV", "error.maSV", "Mã sinh viên không được để trống");
        }
        if (sinhVien.getHoTen() == null || sinhVien.getHoTen().trim().isEmpty()) {
            result.rejectValue("hoTen", "error.hoTen", "Họ tên không được để trống");
        }
        if (sinhVien.getNgaySinh() == null) {
            result.rejectValue("ngaySinh", "error.ngaySinh", "Ngày sinh không được để trống");
        }
        if (sinhVien.getDiaChi() == null || sinhVien.getDiaChi().trim().isEmpty()) {
            result.rejectValue("diaChi", "error.diaChi", "Địa chỉ không được để trống");
        }
        if (sinhVien.getSoDT() == null) {
            result.rejectValue("soDT", "error.soDT", "Số điện thoại không được để trống");
        }
        
        if (result.hasErrors()) {
            model.addAttribute("truong", truongService.getAllTruongs());
            model.addAttribute("contentPage", "/WEB-INF/Views/sinhvien/create.jsp");
            return "/layout/layout";
        }
        
        // Lấy thông tin user đang đăng nhập
        User currentUser = userService.findByUsername(authentication.getName())
            .orElseThrow(() -> new RuntimeException("User not found"));
        sinhVien.setUser(currentUser);
        
        sinhVienService.saveSinhVien(sinhVien);
        
        return "redirect:/sinhvien";
    }
    
    @GetMapping("/edit/{maSV}")
    public String editSinhVienForm(@PathVariable("maSV") String maSV, Model model) {
        SinhVien sinhVien = sinhVienService.getSinhVienById(maSV);
        if (sinhVien == null) {
            return "redirect:/sinhvien";
        }
        model.addAttribute("sinhvien", sinhVien);
        model.addAttribute("truong", truongService.getAllTruongs());
        model.addAttribute("contentPage", "/WEB-INF/Views/sinhvien/edit.jsp");
        return "/layout/layout";
    }
    
    @PostMapping("/edit/{maSV}")
    public String updateSinhVien(@PathVariable("maSV") String maSV,
                              @ModelAttribute("sinhvien") SinhVien sinhVien,
                              BindingResult result,
                              Model model) {
        if (sinhVien.getMaSV() == null || sinhVien.getMaSV().trim().isEmpty()) {
            result.rejectValue("hoTen", "error.hoTen", "Mã sinh viên không được để trống");
        }
        if (sinhVien.getHoTen() == null || sinhVien.getHoTen().trim().isEmpty()) {
            result.rejectValue("hoTen", "error.hoTen", "Họ tên không được để trống");
        }
        if (sinhVien.getNgaySinh() == null) {
            result.rejectValue("ngaySinh", "error.ngaySinh", "Ngày sinh không được để trống");
        }
        if (sinhVien.getDiaChi() == null || sinhVien.getDiaChi().trim().isEmpty()) {
            result.rejectValue("diaChi", "error.diaChi", "Địa chỉ không được để trống");
        }
        if (sinhVien.getSoDT() == null) {
            result.rejectValue("soDT", "error.soDT", "Số điện thoại không được để trống");
        }
        
        if (result.hasErrors()) {
            model.addAttribute("truong", truongService.getAllTruongs());
            model.addAttribute("contentPage", "/WEB-INF/Views/sinhvien/edit.jsp");
            return "/layout/layout";
        }
        
        sinhVien.setMaSV(maSV);
        sinhVienService.saveSinhVien(sinhVien);
        return "redirect:/sinhvien";
    }
    
    @GetMapping("/delete/{maSV}")
    public String deleteSinhVien(@PathVariable("maSV") String maSV) {
        sinhVienService.deleteSinhVien(maSV);
        return "redirect:/sinhvien";
    }
} 