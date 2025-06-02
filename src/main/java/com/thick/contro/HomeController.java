package com.thick.contro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.thick.Service.DangKyService;
import com.thick.Service.GiangVienService;
import com.thick.Service.KhoaHocService;
import com.thick.Service.SinhVienService;
import com.thick.Service.TruongService;
import com.thick.Service.UserService;

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
   
   @Autowired
   private UserService userService;

   @GetMapping("/")
   public String welcome() {
       return "welcome";
   }

   @GetMapping("/welcome")
   public String welcomePage() {
       return "welcome";
   }



   @GetMapping("/home")
   public String home(Model model) {
       Authentication auth = SecurityContextHolder.getContext().getAuthentication();
       
       // Kiểm tra xem người dùng đã đăng nhập chưa
       if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getName())) {
           model.addAttribute("username", auth.getName());
           model.addAttribute("isAdmin", auth.getAuthorities().stream()
                   .anyMatch(a -> a.getAuthority().equals("ROLE_USER")));
           
           // Thêm dữ liệu thống kê
           model.addAttribute("totalTruong", truongService.getAllTruongs().size());
           model.addAttribute("totalGiangVien", giangVienService.getAllGiangVien().size());
           model.addAttribute("totalSinhVien", sinhVienService.getAllSinhVien().size());
           model.addAttribute("totalKhoaHoc", khoaHocService.getAllKhoaHoc().size());
           model.addAttribute("totalDangKy", dangKyService.getAllDangKy().size());
           
           // Thêm dữ liệu mới nhất
           model.addAttribute("latestTruong", truongService.getAllTruongs().subList(0, Math.min(5, truongService.getAllTruongs().size())));
           model.addAttribute("latestGiangVien", giangVienService.getAllGiangVien().subList(0, Math.min(5, giangVienService.getAllGiangVien().size())));
           model.addAttribute("latestSinhVien", sinhVienService.getAllSinhVien().subList(0, Math.min(5, sinhVienService.getAllSinhVien().size())));
           model.addAttribute("latestKhoaHoc", khoaHocService.getAllKhoaHoc().subList(0, Math.min(5, khoaHocService.getAllKhoaHoc().size())));
           
       } else {
           return "redirect:/welcome";
       }
       
       model.addAttribute("contentPage", "/WEB-INF/Views/home/home.jsp");
       return "/layout/layout";
   }
}