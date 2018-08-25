package dao;

import entity.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersMapper {

    int deleteByPrimaryKey(Integer orderId);

    int insert(Orders orders);

    Orders selectByPrimaryKey(Integer orderId);

    //根据用户id查询出所有订单
    List<Orders> selectAll(@Param(value = "userId")Integer userId);

    int updateByPrimaryKey(Orders orders);

    //查询出所有订单
    List<Orders> selectall();
}