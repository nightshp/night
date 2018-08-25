package service;

import entity.Restaurant;

import java.util.List;

public interface IRestaurantService {
    //根据id删除餐厅
    int deleteByPrimaryKey(Integer restaurId);
    //插入餐厅
    int insert(Restaurant restaurant);
    //根据id查询餐厅
    Restaurant selectByPrimaryKey(Integer restaurId);
    //查询所有餐厅
    List<Restaurant> selectAll();
    //更新餐厅
    int updateByPrimaryKey(Restaurant restaurant);
    //根据restaurName和restaurAddress查询餐厅
    List<Restaurant> selectByNA(String restaurName,String restaurAddress);
    List<Restaurant> selectByMany(String restaurName,String restaurAddress);
}
