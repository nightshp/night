package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.impl.MenuService;

import java.util.List;

@Controller
public class MenuController {
    @Autowired
    MenuService menuService;
    //查询出所有菜单并使用PageHelper分页
    @RequestMapping("/selectMenus")
    public String selectMenus(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,3);          //传入页码以及每页的大小
        List<Menu> menus=menuService.selectAll();
        PageInfo pageinfo=new PageInfo(menus);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo",pageinfo);
        return "afterapp/index";
    }
    //根据restaur_id查出某个餐厅的所有菜肴
    @RequestMapping("/selectByRestaurId")
    public String selectByRestaurId(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Integer restaurId,Model model){
        PageHelper.startPage(pn,5);          //传入页码以及每页的大小
        model.addAttribute("restaurId",restaurId);
        List<Menu>menus=menuService.selectMenus(restaurId);
        PageInfo pageinfo=new PageInfo(menus);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo",pageinfo);
        return "afterapp/orders";
    }
    @RequestMapping("/selectAllMenu")
    public String selectAllMenu(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,3);          //传入页码以及每页的大小
        List<Menu> menus=menuService.selectAll();
        PageInfo pageinfo=new PageInfo(menus);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo",pageinfo);
        return "app/index";
    }
    @RequestMapping("/selectByResId")
    public String selectByResId(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Integer restaurId,Model model){
        PageHelper.startPage(pn,5);          //传入页码以及每页的大小
        model.addAttribute("restaurId",restaurId);
        List<Menu>menus=menuService.selectMenus(restaurId);
        PageInfo pageinfo=new PageInfo(menus);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo",pageinfo);
        return "app/orders";
    }

}
