package service;

import entity.Orders;

import java.util.List;

public interface IOrdersService {

    //根据id删除订单
    int deleteByPrimaryKey(Integer orderId);
    //插入订单
    int insert(Orders orders);
    //根据id查询订单
    Orders selectByPrimaryKey(Integer orderId);
    //查询所有订单
    List<Orders> selectAll(Integer userId);
    //更新订单
    int updateByPrimaryKey(Orders orders);
    //查询出所有订单
    List<Orders> selectall();
}
