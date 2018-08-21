package dao;

import entity.Restaurant;

import java.util.List;

public interface RestaurantMapper {

    int deleteByPrimaryKey(Integer restaurId);

    int insert(Restaurant record);

    Restaurant selectByPrimaryKey(Integer restaurId);

    List<Restaurant> selectAll();

    int updateByPrimaryKey(Restaurant record);
}