package service.impl;

import dao.MenuMapper;
import entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.IMenuService;

import java.util.List;

@Service
public class MenuService implements IMenuService {
    @Autowired
    MenuMapper menuMapper;
    @Override
    public int deleteByPrimaryKey(Integer dishId) {
        return menuMapper.deleteByPrimaryKey(dishId);
    }

    @Override
    public int insert(Menu menu) {
        return menuMapper.insert(menu);
    }

    @Override
    public Menu selectByPrimaryKey(Integer dishId) {
        return menuMapper.selectByPrimaryKey(dishId);
    }

    @Override
    public List<Menu> selectAll() {
        return menuMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Menu menu) {
        return menuMapper.updateByPrimaryKey(menu);
    }

    @Override
    public List<Menu> selectMenus(Integer restaurId) {
        return menuMapper.selectMenus(restaurId);
    }

    @Override
    public int[] selectRestaurId() {
        return menuMapper.selectRestaurId();
    }

    @Override
    public List<Menu> selectByNC(String dishName, String dishClass) {
        return menuMapper.selectByNC(dishName,dishClass);
    }
}
