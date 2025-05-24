package com.thick.contro;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
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

import com.thick.Service.GiangVienService;
import com.thick.Service.KhoaHocService;
import com.thick.Service.TruongService;
import com.thick.model.KhoaHoc;

@Controller
@RequestMapping("/khoahoc")
public class KhoaHocController {

    @Autowired
    private KhoaHocService khoaHocService;
    
    @Autowired
    private GiangVienService giangVienService;
    
    @Autowired
    private TruongService truongService;
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    
    @GetMapping
    public String listKhoaHoc(Model model) {
        model.addAttribute("khoahoc", khoaHocService.getAllKhoaHoc());
        model.addAttribute("contentPage", "/WEB-INF/Views/khoahoc/khoahoc.jsp");
        return "/layout/layout";
    }
    
    @GetMapping("/new")
    public String showNewForm(Model model) {
        model.addAttribute("khoahoc", new KhoaHoc());
        model.addAttribute("giangviens", giangVienService.getAllGiangVien());
        model.addAttribute("truongs", truongService.getAllTruongs());
        model.addAttribute("contentPage", "/WEB-INF/Views/khoahoc/create.jsp");
        return "/layout/layout";
    }
    
    @PostMapping
    public String saveKhoaHoc(@ModelAttribute("khoahoc") KhoaHoc khoaHoc, BindingResult result, Model model) {
        if(khoaHoc.getMaKH() == null || khoaHoc.getMaKH().trim().isEmpty()) {
            result.rejectValue("maKH", "error.maKH", "Mã khóa học không được để trống");
        }
        if(khoaHoc.getTenKH() == null || khoaHoc.getTenKH().trim().isEmpty()) {
            result.rejectValue("tenKH", "error.tenKH", "Tên khóa học không được để trống");
        }
        if(khoaHoc.getGiangVien() == null) {
            result.rejectValue("giangVien", "error.giangVien", "Giảng viên không được để trống");
        }
        if(khoaHoc.getTruong() == null) {
            result.rejectValue("truong", "error.truong", "Trường không được để trống");
        }
        if(khoaHoc.getThoiGian() == null || khoaHoc.getThoiGian().trim().isEmpty()) {
            result.rejectValue("thoiGian", "error.thoiGian", "Thời gian không được để trống");
        }   
        
        if(result.hasErrors()) {
            model.addAttribute("giangviens", giangVienService.getAllGiangVien());
            model.addAttribute("truongs", truongService.getAllTruongs());
            model.addAttribute("contentPage", "/WEB-INF/Views/khoahoc/create.jsp");
            return "/layout/layout";
        }
        
        khoaHocService.saveKhoaHoc(khoaHoc);
        return "redirect:/khoahoc";
    }
    
    @GetMapping("/edit/{maKH}")
    public String showEditForm(@PathVariable("maKH") String maKH, Model model) {
        KhoaHoc khoaHoc = khoaHocService.getKhoaHocById(maKH);
        if (khoaHoc == null) {
            return "redirect:/khoahoc";
        }
        model.addAttribute("khoahoc", khoaHoc);
        model.addAttribute("giangviens", giangVienService.getAllGiangVien());
        model.addAttribute("truongs", truongService.getAllTruongs());
        model.addAttribute("contentPage", "/WEB-INF/Views/khoahoc/edit.jsp");
        return "/layout/layout";
    }
    
    @PostMapping("/edit/{maKH}")
    public String updateKhoaHoc(@PathVariable("maKH") String maKH, 
                               @ModelAttribute("khoahoc") KhoaHoc khoaHoc, 
                               BindingResult result, 
                               Model model) {
        if(khoaHoc.getTenKH() == null || khoaHoc.getTenKH().trim().isEmpty()) {
            result.rejectValue("tenKH", "error.tenKH", "Tên khóa học không được để trống");
        }
        if(khoaHoc.getGiangVien() == null) {
            result.rejectValue("giangVien", "error.giangVien", "Giảng viên không được để trống");
        }
        if(khoaHoc.getTruong() == null) {
            result.rejectValue("truong", "error.truong", "Trường không được để trống");
        }
        if(khoaHoc.getThoiGian() == null || khoaHoc.getThoiGian().trim().isEmpty()) {
            result.rejectValue("thoiGian", "error.thoiGian", "Thời gian không được để trống");
        }   
        
        if(result.hasErrors()) {
            model.addAttribute("giangviens", giangVienService.getAllGiangVien());
            model.addAttribute("truongs", truongService.getAllTruongs());
            model.addAttribute("contentPage", "/WEB-INF/Views/khoahoc/edit.jsp");
            return "/layout/layout";
        }
        
        khoaHoc.setMaKH(maKH);
        khoaHocService.updateKhoaHoc(khoaHoc);
        return "redirect:/khoahoc";
    }
    
    @GetMapping("/delete/{maKH}")
    public String deleteKhoaHoc(@PathVariable("maKH") String maKH) {
        khoaHocService.deleteKhoaHoc(maKH);
        return "redirect:/khoahoc";
    }
} 