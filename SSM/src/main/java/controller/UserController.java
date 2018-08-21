package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import service.IUserService;

@Controller
@SessionAttributes({"logUser"})
public class UserController {

    private  User logUser = null;

	@Autowired
	private IUserService userService;

	@RequestMapping("/list")
	public String getUsers(Model model) {
		List<User> users = userService.selectAll();
		model.addAttribute("list", users);
		return "userlist";
	}

	/**
	 * 如果是启动项目，则转发到list请求
	 * 如果是项目，默认到首页的请求
	 *
	 * @return
	 */
	@RequestMapping("/")
	public String index() {
		return "forward:/list";
	}

	//响应页面的删除
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteUserById(Integer id) {
		/*if(userService.deleteUserById(id)>0){
			return "ok";
		}else{
			return "error";
		}*/
		return userService.deleteByPrimaryKey(id) > 0 ? "ok" : "error";
		//return "OK";
	}

	//响应页面点击修改的
	@RequestMapping("/edit")
	@ResponseBody
	public User getUserById(Integer id, Model model) {
		User user = userService.selectByPrimaryKey(id);
		//需要保存id,如若不保存，Id为null
		model.addAttribute("id", id);
		System.out.println("需要修改的用户！！！" + user);
		return user;
	}

	//点击页面的保存修改
	@RequestMapping("/update")
	@ResponseBody
	public String updateUser(@ModelAttribute User user,Model model) {
		if(userService.updateUsers(user)>0){
			System.out.println("修改用户成功");
            System.out.println(user);
            user=getUserById(user.getUserId(),model);
			model.addAttribute("logUser",user);
			return "ok";
		}else{
			return "error";
		}
//		return userService.updateUsers(user) > 0 ? "ok" : "error";
	}
    //登录
	@RequestMapping("/login")
	public String login(@RequestParam(value = "username") String name, @RequestParam(value = "password") String pwd, Model model) {
		User user=userService.selectUsername(name,pwd);//根据用户名和密码查询出来的数据存在对象中
		if(user!=null) {                                  //如果对象中有数据则返回到界面
			model.addAttribute("logUser",user);
			return "afterapp/index";
		}
		return "app/index";
	}
	//注册
    @RequestMapping("/register")
    public String register(@RequestParam(value = "username") String name, @RequestParam(value = "password") String pwd,User user){
	    user.setUserName(name);
	    user.setUserPwd(pwd);
	    int i=userService.insert(user);
	    if (i>0){
	        return "success";

        }
        return "error";
    }
    //注销用户
    @RequestMapping("/logout")
    public String logout(SessionStatus sessionStatus){
	    sessionStatus.setComplete();
	    return "app/index";
    }

    //完善用户信息
    @RequestMapping("/updateById")
    public String updateById(String email,String sex,String phone,Integer id){
	    userService.updateByPrimaryKey(email,phone,sex,id);
	    return "success";
    }
    //查询所有用户并进行分页，
    @RequestMapping("/getAll")
    public String getAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){
        PageHelper.startPage(pn,3);          //传入页码以及每页的大小
        List<User>users=userService.selectAll();      //查询结果集
        PageInfo pageInfo=new PageInfo(users);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo",pageInfo);
        return "lisr";
    }
    //图片上传
    @RequestMapping("/upload")
    public String upload(MultipartFile file, Model model,Integer id,User user) throws IOException {
        //获取文件名
        String filename=file.getOriginalFilename();
        //开始上传
        file.transferTo(new File("E:/uploads/"+filename));
        //更新数据库中的图片名
        userService.updatePic(id,filename);
        user=userService.selectByPrimaryKey(id);
        //更新logUser
        model.addAttribute("logUser",user);
        return "success1";
    }
    //根据id修改密码
    @RequestMapping("/editPwd")
    @ResponseBody
    public String editPwd(Integer id,String pwd,Model model,User user){
        if(userService.updatePwd(id, pwd)>0){
            System.out.println("修改密码成功");
            user=getUserById(id,model);
            model.addAttribute("logUser",user);
            return "ok";
        }else{
            return "error";
        }
    }

}
