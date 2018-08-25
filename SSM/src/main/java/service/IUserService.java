package service;

import entity.User;


import java.util.List;


public interface IUserService {

	//根据id删除用户
	int deleteByPrimaryKey(Integer userId);
	//插入用户信息
	int insert(User user);
	//根据id查找用户信息
	User selectByPrimaryKey(Integer userId);
	//查询所有用户信息
	List<User> selectAll();
	//根据id修改用户信息
    int updateByPrimaryKey(String email,String phone,String sex,Integer id);
    //修改用户信息
    int updateUsers(User user);
	//根据用户名和密码找用户
	User selectUsername(String userName,String userPwd);
    //更新数据库中的图片名
    int updatePic(Integer id,String pic);
    //根据id修改密码
    int updatePwd(Integer id, String pwd);
	//修改信息包括图片上传
	int updateUserinfo(User user);
	//根据用户名实现搜索功能
	List<User> selectByName(String userName);
	
}
