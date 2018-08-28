package controller;

import entity.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.impl.AddressService;

import java.util.List;

@Controller
//@SessionAttributes("address")
public class AddressController {
    @Autowired
    private AddressService addressService;
    //添加地址
    @RequestMapping("/insertAddress")
    @ResponseBody
    public String insertAddress(String province,String city,String area,String deta_address,Integer postalcode,
                                String rec_name,String phone,Address address,Integer id,Model model){
        String area_address=province+" "+city+" "+area;
        address.setAreaAddress(area_address);
        address.setDetaAddress(deta_address);
        address.setPostalcode(postalcode);
        address.setRecName(rec_name);
        address.setPhone(phone);
        address.setUserId(id);
        address.setIsdefault(0);
        System.out.println(address);
        if (addressService.insert(address)>0){
            List<Address>addresses=addressService.selectAll(id);
            for (Address addr:addresses
            ) {
                System.out.println(addr);
            }
            model.addAttribute("address",addresses);
            return "ok";
        }else{
            return "error";
        }

    }
    //查询地址
    @RequestMapping("/selectAddresses")
    public String selectAll(Integer id,Model model){
        List<Address> addresses=addressService.selectAll(id);
        model.addAttribute("address",addresses);
        return "afterapp/address";
    }
    //根据id删除地址
    @RequestMapping("/deleteAddress")
    @ResponseBody
    public String deleteAddress(Integer id){
        return addressService.deleteByPrimaryKey(id) > 0 ? "ok" : "error";
    }
    //修改地址
    @RequestMapping("/editAddress")
    @ResponseBody
    public Address editAddress(Integer id,Model model){
        Address address=addressService.selectByPrimaryKey(id);
        //需要保存id,如若不保存，Id为null
        model.addAttribute("id", id);
        System.out.println("需要修改的地址" + address);
        return address;
    }
    //保持修改的地址
    @RequestMapping("/updateAddress")
    @ResponseBody
    public String updateAddress(Address address1, Model model,Integer id) {
        System.out.println("传来的对象值"+address1);
        if(addressService.updateByPrimaryKey(address1)>0){
            List<Address>addresses=addressService.selectAll(id);
            for (Address add:addresses
                 ) {
                System.out.println(add);
            }
            model.addAttribute("address",addresses);
            return "ok";
        }else{
            return "error";
        }
//		return userService.updateUsers(user) > 0 ? "ok" : "error";
    }
    //设置默认地址
    @RequestMapping("/updateDefault")
    @ResponseBody
    public String updateDefault(Integer userId,Integer addressId){
        List<Address>addresses=addressService.selectNotDefault(userId,addressId);
        for (Address address:addresses) {
            addressService.updateDefault(address.getAddressId(),0);
        }
        if (addressService.updateDefault(addressId,1)>0){
            return "ok";
        }
        return "error";
    }



}
