package controller;

import com.alibaba.fastjson.JSON;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;

import java.util.List;

/**
 * @Author: qiuyunduo
 * @Description: null
 * @Date: Created in 下午7:12 18-8-13
 * @Modified: null
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/getAll",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String getAll(){
        List<User> userList = userService.selectAll();
        String userJsons = JSON.toJSONString(userList);
        return userJsons;
    }

    @RequestMapping(value = "/insertOne")
    @ResponseBody
    public String insertOne(User user){
        int rs = userService.insertOne(user);
        return rs+"";
    }

    @RequestMapping(value = "/delOne")
    @ResponseBody
    public String delOne(int id){
        int rs = userService.deleteById(id);
        return rs+"";
    }

    @RequestMapping(value = "/selectOne",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String selectOne(int id){
        User user = userService.selectById(id);
        return JSON.toJSONString(user);
    }


    @RequestMapping(value = "/updateOne")
    @ResponseBody
    public String updateOne(User user){
        System.out.println(user);
        int rs = userService.updateById(user);
        return rs+"";
    }

}
