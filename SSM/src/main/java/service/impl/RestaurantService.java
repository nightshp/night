package service.impl;

import dao.RestaurantMapper;
import entity.Restaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.IRestaurantService;

import java.util.List;

@Service
public class RestaurantService implements IRestaurantService {
    @Autowired
    RestaurantMapper restaurantMapper;
    @Override
    public int deleteByPrimaryKey(Integer restaurId) {
        return restaurantMapper.deleteByPrimaryKey(restaurId);
    }

    @Override
    public int insert(Restaurant restaurant) {
        return restaurantMapper.insert(restaurant);
    }

    @Override
    public Restaurant selectByPrimaryKey(Integer restaurId) {
        return restaurantMapper.selectByPrimaryKey(restaurId);
    }

    @Override
    public List<Restaurant> selectAll() {
        return restaurantMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Restaurant restaurant) {
        return restaurantMapper.updateByPrimaryKey(restaurant);
    }

    @Override
    public List<Restaurant> selectByNA(String restaurName, String restaurAddress) {
        return restaurantMapper.selectByNA(restaurName,restaurAddress);
    }

    @Override
    public List<Restaurant> selectByMany(String restaurName, String restaurAddress) {
        return restaurantMapper.selectByMany(restaurName,restaurAddress);
    }
}
