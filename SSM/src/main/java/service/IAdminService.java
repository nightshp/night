package service;

import entity.Admin;

import java.util.List;

public interface IAdminService {

    int deleteByPrimaryKey(Integer adminId);

    int insert(Admin admin);

    Admin selectByPrimaryKey(Integer adminId);

    List<Admin> selectAll();

    int updateByPrimaryKey(Admin admin);

    //根据用户名和密码查找admin
    Admin selectByAP(String adminName,String adminPassword);
}
