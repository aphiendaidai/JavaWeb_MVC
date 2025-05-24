package com.thick.contro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.thick.Service.DangKyService;
import com.thick.Service.GiangVienService;
import com.thick.Service.KhoaHocService;
import com.thick.Service.SinhVienService;
import com.thick.Service.TruongService;

@Controller
public class HomeController {

    @Autowired
    private TruongService truongService;
    
    @Autowired
    private GiangVienService giangVienService;
    
    @Autowired
    private SinhVienService sinhVienService;
    
    @Autowired
    private KhoaHocService khoaHocService;
    
    @Autowired
    private DangKyService dangKyService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("totalTruong", truongService.getAllTruongs().size());
        model.addAttribute("totalGiangVien", giangVienService.getAllGiangVien().size());
        model.addAttribute("totalSinhVien", sinhVienService.getAllSinhVien().size());
        model.addAttribute("totalKhoaHoc", khoaHocService.getAllKhoaHoc().size());
        model.addAttribute("totalDangKy", dangKyService.getAllDangKy().size());
        
        model.addAttribute("latestTruong", truongService.getAllTruongs().subList(0, Math.min(5, truongService.getAllTruongs().size()))); //min trả về số nhỏ giữa 2 số
        model.addAttribute("latestGiangVien", giangVienService.getAllGiangVien().subList(0, Math.min(5, giangVienService.getAllGiangVien().size())));
        model.addAttribute("latestSinhVien", sinhVienService.getAllSinhVien().subList(0, Math.min(5, sinhVienService.getAllSinhVien().size())));
        model.addAttribute("latestKhoaHoc", khoaHocService.getAllKhoaHoc().subList(0, Math.min(5, khoaHocService.getAllKhoaHoc().size())));
        
        model.addAttribute("contentPage", "/WEB-INF/Views/home/home.jsp");
        return "/layout/layout";
    }
} 