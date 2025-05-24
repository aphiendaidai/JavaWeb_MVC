package com.thick.contro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thick.Service.DangKyService;
import com.thick.Service.GiangVienService;
import com.thick.Service.KhoaHocService;
import com.thick.Service.SinhVienService;
import com.thick.Service.TruongService;

@Controller
@RequestMapping("/search")
public class SearchController {

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

    @GetMapping
    public String search(@RequestParam("keyword") String keyword,
                        @RequestParam(value = "type", defaultValue = "all") String type,
                        Model model) {
        
        // Thực hiện tìm kiếm dựa trên loại được chọn
        switch (type.toLowerCase()) {
            case "truong":
                model.addAttribute("truong", truongService.searchTruong(keyword));
                model.addAttribute("contentPage", "/WEB-INF/Views/truong/truong.jsp");
                break;
                
            case "giangvien":
                model.addAttribute("giangvien", giangVienService.searchGiangVien(keyword));
                model.addAttribute("contentPage", "/WEB-INF/Views/giangvien/giangvien.jsp");
                break;
                
            case "sinhvien":
                model.addAttribute("sinhvien", sinhVienService.searchSinhVien(keyword));
                model.addAttribute("contentPage", "/WEB-INF/Views/sinhvien/sinhvien.jsp");
                break;
                
            case "khoahoc":
                model.addAttribute("khoahoc", khoaHocService.searchKhoaHoc(keyword));
                model.addAttribute("contentPage", "/WEB-INF/Views/khoahoc/khoahoc.jsp");
                break;
                
            default:
                // Tìm kiếm tất cả
                model.addAttribute("truong", truongService.searchTruong(keyword));
                model.addAttribute("giangvien", giangVienService.searchGiangVien(keyword));
                model.addAttribute("sinhvien", sinhVienService.searchSinhVien(keyword));
                model.addAttribute("khoahoc", khoaHocService.searchKhoaHoc(keyword));
                model.addAttribute("contentPage", "/WEB-INF/Views/search/results.jsp");
                break;
        }
        
        return "/layout/layout";
    }
} 