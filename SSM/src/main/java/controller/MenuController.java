package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.impl.MenuService;

import java.io.File;
import java.io.IOException;
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
    //后台
    //查询出所有菜肴
    @RequestMapping("/selectAllDish")
    public String selectAllDish(Integer page, Model model){
        PageHelper.startPage(page,3);          //传入页码以及每页的大小
        List<Menu> menus=menuService.selectAll();
        PageInfo pageinfo=new PageInfo(menus);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo",pageinfo);
        int[]arr=menuService.selectRestaurId();      //查询出所有餐厅id并去除重复
        model.addAttribute("arr",arr);
        return "admin/dishmanager";
    }
    //后台
    //删除菜肴
    	@RequestMapping("/deleteDish")
    	@ResponseBody
    	public String deleteDish(Integer dishId){
    		if (menuService.deleteByPrimaryKey(dishId)>0){
    			return "ok";
    		}
    		return "error";
    	}
    //响应页面点击修改的
    @RequestMapping("/editDish")
    @ResponseBody
    public Menu getMenuById(Integer id, Model model) {
        Menu menu = menuService.selectByPrimaryKey(id);
        //需要保存id,如若不保存，Id为null
        model.addAttribute("id", id);
        return menu;
    }

    //点击页面的保存修改
    @RequestMapping("/updateDish")
    @ResponseBody
    public String updateRestaur(@ModelAttribute Menu menu, @RequestParam(value = "file") MultipartFile file) throws IOException {
        //获取文件名
        String filename=file.getOriginalFilename();
        //开始上传
        file.transferTo(new File("E:/uploads/"+filename));
        menu.setDishPic(filename);
        System.out.println(menu);
        menuService.updateByPrimaryKey(menu);
        System.out.println("修改成功");
        return "<script>alert('success');window.location.href='apps/admin/index.jsp';</script>";
//		return userService.updateUsers(user) > 0 ? "ok" : "error";
    }
    //添加菜肴
    @RequestMapping("/insertDish")
    public String insertRestaur(@ModelAttribute Menu menu, @RequestParam(value = "file") MultipartFile file) throws IOException {
        //获取文件名
        String filename=file.getOriginalFilename();
        //开始上传
        file.transferTo(new File("E:/uploads/"+filename));
        menu.setDishPic(filename);
        menuService.insert(menu);
        return "success3";
    }

    //根据菜肴名字和种类查询数据
    @RequestMapping("/selectByNaCl")
    public String selectByMany(@RequestParam(value = "key")String key,Model model){
        String dishName=null;
        String diahClass=null;
        dishName=key;
        diahClass=key;
        List<Menu>menus=menuService.selectByNC(dishName,diahClass);
//        PageHelper.startPage(page,3);          //传入页码以及每页的大小
//        PageInfo pageinfo=new PageInfo(menus);        //使用pageinfo包装结果集，只需将pageinfo交给页面
//        model.addAttribute("pageinfo",pageinfo);
        model.addAttribute("menus",menus);
        return "admin/showdish";
    }

}
