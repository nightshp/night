package dao;

import entity.User;
import java.util.List;

public interface UserMapper {

    List<User> selectAll();

    User selectById(Integer id);

    int deleteById(Integer id);

    int insertOne(User user);

    int updateById(User user);

}