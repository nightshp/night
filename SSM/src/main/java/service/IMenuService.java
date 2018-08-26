package service;

import entity.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IMenuService {
    //根据id删除菜肴
    int deleteByPrimaryKey(Integer dishId);
    //插入菜肴
    int insert(Menu menu);
    //根据id查询菜肴
    Menu selectByPrimaryKey(Integer dishId);
    //查询出所有的菜肴
    List<Menu> selectAll();
    //更新菜单
    int updateByPrimaryKey(Menu menu);
    //根据restaur_id查出某个餐厅的所有菜肴
    List<Menu> selectMenus(Integer restaurId);
    //查询出所有restaurant的id
    int[] selectRestaurId();
    //根据菜名和种类实现模糊查询
    List<Menu> selectByNC(String dishName, String dishClass);
}
