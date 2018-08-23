package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Restaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.impl.RestaurantService;

import java.util.List;

@Controller
public class RestaurantController {
    @Autowired
    private RestaurantService restaurantService;

    //查询所有餐厅并进行分页
    @RequestMapping("/selectRestaurants")
    public String selectRestaurants(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,3);          //传入页码以及每页的大小
        List<Restaurant> restaurants=restaurantService.selectAll();
        PageInfo pageinfo=new PageInfo(restaurants);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo",pageinfo);
        return "afterapp/restaurants";
    }
    @RequestMapping("/selectRes")
    public String selectRes(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,3);          //传入页码以及每页的大小
        List<Restaurant> restaurants=restaurantService.selectAll();
        PageInfo pageinfo=new PageInfo(restaurants);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo",pageinfo);
        return "app/restaurants";
    }
    //根据restaurName和restaurAddress查询餐厅
    @RequestMapping("/selectByNAs")
    public String selectByNAs(String restaurName,String restaurAddress,Model model){
        List<Restaurant> restaurants=restaurantService.selectByNA(restaurName,restaurAddress);
        model.addAttribute("resatuar",restaurants);
        return "afterapp/showRestaur";
    }
    @RequestMapping("/selectByNA")
    public String selectByNA(String restaurName,String restaurAddress,Model model){
        List<Restaurant> restaurants=restaurantService.selectByNA(restaurName,restaurAddress);
        model.addAttribute("resatuar",restaurants);
        return "app/showRestaur";
    }
}
