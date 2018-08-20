package service;

import entity.User;

import java.util.List;

/**
 * @Author: qiuyunduo
 * @Description: null
 * @Date: Created in 下午7:24 18-8-13
 * @Modified: null
 */
public interface UserService {
    List<User> selectAll();

    User selectById(Integer id);

    int deleteById(Integer id);

    int insertOne(User user);

    int updateById(User record);
}
