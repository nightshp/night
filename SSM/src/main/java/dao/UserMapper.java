package dao;

import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    //根据id删除用户
    int deleteByPrimaryKey(Integer userId);
    //插入用户信息
    int insert(User user);
    //根据id查找用户信息
    User selectByPrimaryKey(Integer userId);
    //查询所有用户信息
    List<User> selectAll();
    //根据id修改用户信息
    int updateByPrimaryKey(@Param("email") String email,@Param("phone") String phone,@Param("sex") String sex,@Param("userId") Integer id);
    //修改用户信息
    int updateUsers(User user);
    //根据用户名和密码实现登录
    User selectUsername(@Param("userName") String userName,@Param("userPwd") String userPwd);
    //更新数据库中的图片名
    int updatePic(@Param("userId")Integer id,@Param("pic")String pic);
    //根据id修改密码
    int updatePwd(@Param("userId")Integer id,@Param("userPwd")String pwd);
    //修改信息包括图片上传
    int updateUserinfo(User user);
    //根据用户名实现搜索功能
    List<User> selectByName(@Param("userName")String userName);

}