package com.thick.contro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thick.Service.DangKyService;
import com.thick.Service.KhoaHocService;
import com.thick.Service.SinhVienService;
import com.thick.model.DangKy;

@Controller
@RequestMapping("/dangky")
public class DangKyController {

    @Autowired
    private DangKyService dangKyService;
    
    @Autowired
    private SinhVienService sinhVienService;
    
    @Autowired
    private KhoaHocService khoaHocService;
    
    @GetMapping
    public String listDangKy(Model model) {
        model.addAttribute("dangky", dangKyService.getAllDangKy());
        model.addAttribute("contentPage", "/WEB-INF/Views/dangky/dangky.jsp");
        return "/layout/layout";
    }
    
    @GetMapping("/new")
    public String showNewForm(Model model) {
        model.addAttribute("dangky", new DangKy());
        model.addAttribute("sinhviens", sinhVienService.getAllSinhVien());
        model.addAttribute("khoahocs", khoaHocService.getAllKhoaHoc());
        model.addAttribute("contentPage", "/WEB-INF/Views/dangky/create.jsp");
        return "/layout/layout";
    }
    
    @PostMapping
    public String saveDangKy(@ModelAttribute("dangky") DangKy dangKy, BindingResult result, Model model) {
        if(dangKy.getMaDK() == null || dangKy.getMaDK().trim().isEmpty()) {
            result.rejectValue("maDK", "error.maDK", "Mã đăng ký không được để trống");
        }
        if(dangKy.getSinhVien() == null) {
            result.rejectValue("sinhVien", "error.sinhVien", "Sinh viên không được để trống");
        }
        if(dangKy.getKhoaHoc() == null) {
            result.rejectValue("khoaHoc", "error.khoaHoc", "Khóa học không được để trống");
        }
        
        if(result.hasErrors()) {
            model.addAttribute("sinhviens", sinhVienService.getAllSinhVien());
            model.addAttribute("khoahocs", khoaHocService.getAllKhoaHoc());
            model.addAttribute("contentPage", "/WEB-INF/Views/dangky/create.jsp");
            return "/layout/layout";
        }
        
        dangKyService.saveDangKy(dangKy);
        return "redirect:/dangky";
    }
    
    @GetMapping("/edit/{maDK}")
    public String showEditForm(@PathVariable("maDK") String maDK, Model model) {
        DangKy dangKy = dangKyService.getDangKyById(maDK);
        if (dangKy == null) {
            return "redirect:/dangky";
        }
        model.addAttribute("dangky", dangKy);
        model.addAttribute("sinhviens", sinhVienService.getAllSinhVien());
        model.addAttribute("khoahocs", khoaHocService.getAllKhoaHoc());
        model.addAttribute("contentPage", "/WEB-INF/Views/dangky/edit.jsp");
        return "/layout/layout";
    }
    
    @PostMapping("/edit/{maDK}")
    public String updateDangKy(@PathVariable("maDK") String maDK, 
                             @ModelAttribute("dangky") DangKy dangKy, 
                             BindingResult result, 
                             Model model) {
        if(dangKy.getSinhVien() == null) {
            result.rejectValue("sinhVien", "error.sinhVien", "Sinh viên không được để trống");
        }
        if(dangKy.getKhoaHoc() == null) {
            result.rejectValue("khoaHoc", "error.khoaHoc", "Khóa học không được để trống");
        }
        
        if(result.hasErrors()) {
            model.addAttribute("sinhviens", sinhVienService.getAllSinhVien());
            model.addAttribute("khoahocs", khoaHocService.getAllKhoaHoc());
            model.addAttribute("contentPage", "/WEB-INF/Views/dangky/edit.jsp");
            return "/layout/layout";
        }
        
        dangKy.setMaDK(maDK);
        dangKyService.updateDangKy(dangKy);
        return "redirect:/dangky";
    }
    
    @GetMapping("/delete/{maDK}")
    public String deleteDangKy(@PathVariable("maDK") String maDK) {
        dangKyService.deleteDangKy(maDK);
        return "redirect:/dangky";
    }
} 