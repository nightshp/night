package controller;

import entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import service.IAdminService;


@Controller
@SessionAttributes("admin")
public class AdminController {
    @Autowired
    private IAdminService adminService;
    @RequestMapping("/loginAdmin")
    @ResponseBody
    public  String loginAdmin(@RequestParam(value = "adminName") String adminName, @RequestParam(value = "adminPassword") String adminPassword, Model model){
        Admin admin= adminService.selectByAP(adminName,adminPassword);
        model.addAttribute("admin",admin);
        if(admin!=null){
            return "ok";
        }
        return "error";
    }
    @RequestMapping("/logoutAdmin")
    public String logout(SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "admin/login";
    }
}
