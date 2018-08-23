package controller;

import entity.Address;
import entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.impl.AddressService;
import service.impl.OrdersService;

import java.util.List;

@Controller
public class OrdersController {
    @Autowired
    OrdersService ordersService;
    @Autowired
    AddressService addressService;
    //插入订单
    @RequestMapping("/insertOrder")
    @ResponseBody
    public String insertOrder(Integer userId, Orders orders){
        Address address=addressService.selectDefU(1,userId);
        String send_addr=address.getAreaAddress()+" "+address.getDetaAddress();
        orders.setUserId(userId);
        orders.setSendAddr(send_addr);
//        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        orders.setOrderStatus(1);
        if(ordersService.insert(orders)>0){
            return "ok";
        }else{
            return "error";
        }
    }
    //查询出用户的所有订单
    @RequestMapping("/selectOrders")
    public String selectOrders(Integer userId, Model model){
        List<Orders> orders=ordersService.selectAll(userId);
        model.addAttribute("orders",orders);
        return "afterapp/book";
    }
    //删除订单
    @RequestMapping("/deleteOrder")
    @ResponseBody
    public String deleteOrder(Integer orderId){
        return ordersService.deleteByPrimaryKey(orderId)> 0 ? "ok" : "error";
    }


}
