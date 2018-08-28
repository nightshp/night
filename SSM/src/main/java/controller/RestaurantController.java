package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Restaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.impl.RestaurantService;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class RestaurantController {
    @Autowired
    private RestaurantService restaurantService;

    //查询所有餐厅并进行分页
    @RequestMapping("/selectRestaurants")
    public String selectRestaurants(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        selectR(pn, model);
        return "afterapp/restaurants";
    }

    private void selectR(Integer pn, Model model) {
        PageHelper.startPage(pn, 3);          //传入页码以及每页的大小
        List<Restaurant> restaurants = restaurantService.selectAll();
        PageInfo pageinfo = new PageInfo(restaurants);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo", pageinfo);
    }

    @RequestMapping("/selectRes")
    public String selectRes(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        selectR(pn, model);
        return "app/restaurants";
    }
    //根据restaurName和restaurAddress查询餐厅
    @RequestMapping("/selectByNAs")
    public String selectByNAs(String restaurName,String restaurAddress,Model model){
        selectByna(restaurName, restaurAddress, model);
        return "afterapp/showRestaur";
    }
    @RequestMapping("/selectByNA")
    public String selectByNA(String restaurName,String restaurAddress,Model model){
        selectByna(restaurName, restaurAddress, model);
        return "app/showRestaur";
    }

    private void selectByna(String restaurName, String restaurAddress, Model model) {
        List<Restaurant> restaurants = restaurantService.selectByNA(restaurName, restaurAddress);
        model.addAttribute("resatuar", restaurants);
    }
    //后台餐厅查询并分页
    @RequestMapping("/restaurManager")
    public String restaurManager(Integer page, Model model){
        PageHelper.startPage(page, 3);          //传入页码以及每页的大小
        List<Restaurant> restaurants = restaurantService.selectAll();
        PageInfo pageinfo = new PageInfo(restaurants);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo", pageinfo);
        return "admin/restaurmanager";
    }
    //响应页面点击修改的
    @RequestMapping("/editRestaur")
    @ResponseBody
    public Restaurant getRestaurById(Integer id, Model model) {
        Restaurant restaurant = restaurantService.selectByPrimaryKey(id);
        //需要保存id,如若不保存，Id为null
        model.addAttribute("id", id);
        System.out.println("需要修改的餐厅！！！" + restaurant);
        return restaurant;
    }

    //点击页面的保存修改
    @RequestMapping("/updateRestaur")
    @ResponseBody
    public String updateRestaur(@ModelAttribute Restaurant restaurant, @RequestParam(value = "file") MultipartFile file) throws IOException {
        //获取文件名
        String filename=file.getOriginalFilename();
        //开始上传
        file.transferTo(new File("E:/uploads/"+filename));
        restaurant.setRestaurPic(filename);
        System.out.println(restaurant);
        restaurantService.updateByPrimaryKey(restaurant);
        System.out.println("修改成功");
//        return "<script>alert('success');window.location.href='./restaurManager';</script>";
//		return userService.updateUsers(user) > 0 ? "ok" : "error";
//        return "forward:/restaurManager";
        return "<script>alert('success');window.location.href='apps/admin/index.jsp';</script>";
    }
    //根据id删除
    @RequestMapping("/deleteRestaur")
    @ResponseBody
    public String deleteRestaur(Integer restaurId){
        if (restaurantService.deleteByPrimaryKey(restaurId)>0){
            return "ok";
        }
        return "error";
    }
    //添加餐厅
    @RequestMapping("/insertRestaur")
    public String insertRestaur(@ModelAttribute Restaurant restaurant, @RequestParam(value = "file") MultipartFile file) throws IOException {
        //获取文件名
        String filename=file.getOriginalFilename();
        //开始上传
        file.transferTo(new File("E:/uploads/"+filename));
        restaurant.setRestaurPic(filename);
        restaurantService.insert(restaurant);
        return "success3";
    }
    //根据多字段查询数据
    @RequestMapping("/selectByMany")
    public String selectByMany(@RequestParam(value = "key")String key,Model model){
        String name=null;
        String address=null;
        address=key;
        name=key;
        List<Restaurant>restaurants=restaurantService.selectByMany(name,address);
        model.addAttribute("restaurants",restaurants);
        return "admin/showRestaur";
    }

}
