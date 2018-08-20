package dao;

import entity.Menu;

import java.util.List;

public interface MenuMapper {

    int deleteByPrimaryKey(Integer dishId);

    int insert(Menu record);

    Menu selectByPrimaryKey(Integer dishId);

    List<Menu> selectAll();

    int updateByPrimaryKey(Menu record);
}