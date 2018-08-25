package dao;

import entity.Restaurant;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RestaurantMapper {
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
    List<Restaurant> selectByNA(@Param(value = "restaurName") String restaurName, @Param(value = "restaurAddress") String restaurAddress);
    //根据多字段进行模糊查询
    List<Restaurant> selectByMany(@Param(value = "restaurName") String restaurName, @Param(value = "restaurAddress") String restaurAddress);
}