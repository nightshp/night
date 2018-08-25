package service.impl;

import dao.AdminMapper;
import entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.IAdminService;

import java.util.List;

@Service
public class AdminService implements IAdminService {
    @Autowired
    AdminMapper adminMapper;
    @Override
    public int deleteByPrimaryKey(Integer adminId) {
        return adminMapper.deleteByPrimaryKey(adminId);
    }

    @Override
    public int insert(Admin admin) {
        return adminMapper.insert(admin);
    }

    @Override
    public Admin selectByPrimaryKey(Integer adminId) {
        return adminMapper.selectByPrimaryKey(adminId);
    }

    @Override
    public List<Admin> selectAll() {
        return adminMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Admin admin) {
        return adminMapper.updateByPrimaryKey(admin);
    }

    @Override
    public Admin selectByAP(String adminName, String adminPassword) {
        return adminMapper.selectByAP(adminName,adminPassword);
    }
}
