package dao;

import entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {

    int deleteByPrimaryKey(Integer adminId);

    int insert(Admin admin);

    Admin selectByPrimaryKey(Integer adminId);

    List<Admin> selectAll();

    int updateByPrimaryKey(Admin admin);

    //根据用户名和密码查找admin
    Admin selectByAP(@Param(value = "adminName")String adminName,@Param(value = "adminPassword")String adminPassword);
}