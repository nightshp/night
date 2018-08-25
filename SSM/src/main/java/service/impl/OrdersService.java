package service.impl;

import dao.OrdersMapper;
import entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.IOrdersService;

import java.util.List;

@Service
public class OrdersService implements IOrdersService {
    @Autowired
    OrdersMapper ordersMapper;
    @Override
    public int deleteByPrimaryKey(Integer orderId) {
        return ordersMapper.deleteByPrimaryKey(orderId);
    }

    @Override
    public int insert(Orders orders) {
        return ordersMapper.insert(orders);
    }

    @Override
    public Orders selectByPrimaryKey(Integer orderId) {
        return ordersMapper.selectByPrimaryKey(orderId);
    }

    @Override
    public List<Orders> selectAll(Integer userId) {
        return ordersMapper.selectAll(userId);
    }

    @Override
    public int updateByPrimaryKey(Orders orders) {
        return ordersMapper.updateByPrimaryKey(orders);
    }

    @Override
    public List<Orders> selectall() {
        return ordersMapper.selectall();
    }
}
