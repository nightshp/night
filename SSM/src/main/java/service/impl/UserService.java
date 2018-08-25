package service.impl;

import java.util.List;

import dao.UserMapper;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.IUserService;

@Service
public class UserService  implements IUserService {
   
	@Autowired
	UserMapper userMapper;

	@Override
	public int deleteByPrimaryKey(Integer userId) {
		return userMapper.deleteByPrimaryKey(userId);
	}

	@Override
	public int insert(User user) {
		return userMapper.insert(user);
	}

	@Override
	public User selectByPrimaryKey(Integer userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	@Override
	public List<User> selectAll() {
		return userMapper.selectAll();
	}

	@Override
	public int updateByPrimaryKey(String email,String phone,String sex,Integer id) {
		return userMapper.updateByPrimaryKey(email,phone,sex,id);
	}

    @Override
    public int updateUsers(User user) {
        return userMapper.updateUsers(user);
    }

    //实现登录
	@Override
	public User selectUsername(String userName, String userPwd) {
		return userMapper.selectUsername(userName,userPwd);
	}

    @Override
    public int updatePic(Integer id, String pic) {
        return userMapper.updatePic(id,pic);
    }

    @Override
    public int updatePwd(Integer id, String pwd) {
        return userMapper.updatePwd(id, pwd);
    }

	@Override
	public int updateUserinfo(User user) {
		return userMapper.updateUserinfo(user);
	}

	@Override
	public List<User> selectByName(String userName) {
		return userMapper.selectByName(userName);
	}

}
