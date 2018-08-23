package controller;

import entity.Menu;
import entity.Shopcar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.impl.MenuService;
import service.impl.ShopcarService;

import java.util.List;

@Controller
public class ShopcarController {
    @Autowired
    ShopcarService shopcarService;
    @Autowired
    MenuService menuService;
    //获取数据并插入表中
    @RequestMapping("/insertShop")
    @ResponseBody
    public  String insertShop(Integer dishId,Integer userId,Shopcar shopcar){
        Menu menu=menuService.selectByPrimaryKey(dishId);
        shopcar.setShopName(menu.getDishName());
        shopcar.setShopPic(menu.getDishPic());
        shopcar.setShopPrice(menu.getDishPric());
        shopcar.setUserId(userId);
        shopcar.setShopDescribe(menu.getDishDiscribe());
        if(shopcarService.insert(shopcar)>0){
            return "ok";
        }
        return "error";
    }
    //查询出表中所有数据
    @RequestMapping("/selectShops")
    public String selectShops(Integer userId, Model model){
       List<Shopcar>shopcars=shopcarService.selectShops(userId);
       int price=shopcarService.calcuPric(userId);
       model.addAttribute("shopcar",shopcars);
       model.addAttribute("totalPrice",price);
       return "afterapp/shopcar";
    }
    //根据id删除
    @RequestMapping("/deleteShop")
    @ResponseBody
    public String deleteShop(Integer shopcarId){
        if (shopcarService.deleteByPrimaryKey(shopcarId)>0){
            return "ok";
        }
        return "error";
    }
    //根据用户id删除购物车中所有商品
    @RequestMapping("/deleteAllShop")
    public String deleteAllShop(Integer userId){
        shopcarService.deleteAllShop(userId);
        return "afterapp/user";
    }

}
