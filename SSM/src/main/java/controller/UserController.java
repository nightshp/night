package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Menu;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import service.IUserService;
import service.impl.MenuService;

@Controller
@SessionAttributes({"logUser"})
public class UserController {

	@Autowired
	private IUserService userService;
	@Autowired
	private MenuService menuService;
	@RequestMapping("/list")
	public String getUsers(Model model) {
		List<User> users = userService.selectAll();
		model.addAttribute("list", users);
		return "userlist";
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
	@ResponseBody
	public String login(@RequestParam(value = "username") String name, @RequestParam(value = "password") String pwd, Model model) {
		System.out.println(name);
		System.out.println("sdsdsdsdd");
		User user=userService.selectUsername(name,pwd);//根据用户名和密码查询出来的数据存在对象中
		if(user!=null) {                                  //如果对象中有数据则返回到界面
			model.addAttribute("logUser",user);
			return "ok";
		}

		return "error";
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
    public String logout(SessionStatus sessionStatus,@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
	    sessionStatus.setComplete();
		PageHelper.startPage(pn,3);          //传入页码以及每页的大小
		List<Menu> menus=menuService.selectAll();
		PageInfo pageinfo=new PageInfo(menus);        //使用pageinfo包装结果集，只需将pageinfo交给页面
		model.addAttribute("pageinfo",pageinfo);
//	    return "app/index";
		return "forward:/selectAllMenu";
//		return "<script>window.location.href='../selectAllMenu';</script>";
    }

    //完善用户信息
    @RequestMapping("/updateById")
    public String updateById(String email,String sex,String phone,Integer id){
	    userService.updateByPrimaryKey(email,phone,sex,id);
	    return "success";
    }
    //查询所有用户并进行分页，
    @RequestMapping("/getAll")
    public String getAll(Integer page,Model model){
        PageHelper.startPage(page,3);          //传入页码以及每页的大小
        List<User>users=userService.selectAll();      //查询结果集
        PageInfo pageInfo=new PageInfo(users);        //使用pageinfo包装结果集，只需将pageinfo交给页面
        model.addAttribute("pageinfo",pageInfo);
        return "admin/usermanager";
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
	//后台
    //删除用户
	@RequestMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(Integer userId){
		if (userService.deleteByPrimaryKey(userId)>0){
			return "ok";
		}
		return "error";
	}
	//后台
	//修改用户包括图片的上传
	@RequestMapping("/updateUser")
	@ResponseBody
	public String updateUser(@ModelAttribute User user,@RequestParam(value = "file") MultipartFile file) throws IOException {
		upload(user, file);
		userService.updateUserinfo(user);
		System.out.println("修改成功");
		return "<script>alert('success');window.location.href='apps/admin/index.jsp';</script>";
//		return "forward:/getAll";
	}

	private void upload(@ModelAttribute User user, @RequestParam("file") MultipartFile file) throws IOException {
		//获取文件名
		String filename = file.getOriginalFilename();
		//开始上传
		file.transferTo(new File("E:/uploads/" + filename));
		user.setPic(filename);
	}

	//后台
	//添加用户
	@RequestMapping("/insertUser")
	@ResponseBody
	public String insertUser(@ModelAttribute User user,@RequestParam(value = "file") MultipartFile file) throws IOException{
		upload(user, file);
		userService.insert(user);
		System.out.println("添加成功");
		return "<script>alert('success');window.location.href='apps/admin/index.jsp';</script>";
	}
	//后台
	//查询
	@RequestMapping("/selectByKey")
	public String selectByKey(String userName,Model model){
		List<User>users=userService.selectByName(userName);
		model.addAttribute("user",users);
		return "admin/showuser";
	}

}
