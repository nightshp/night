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
	//修改用户信息
    int updateByPrimaryKey(String email,String phone,String sex,Integer id);
	//根据用户名和密码找用户
	User selectUsername(String userName,String userPwd);
    //更新数据库中的图片名
    int updatePic(Integer id,String pic);
	
}
