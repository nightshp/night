package service;

import entity.Shopcar;

import java.util.List;

public interface IShopcarService {
    //根据id删除商品
    int deleteByPrimaryKey(Integer shopcarId);
    //插入商品
    int insert(Shopcar shopcar);
    //根据id查询商品
    Shopcar selectByPrimaryKey(Integer shopcarId);
    //查询所有商品
    List<Shopcar> selectAll();
    //修改商品
    int updateByPrimaryKey(Shopcar shopcar);
    //根据用户id查出购物车信息
    List<Shopcar> selectShops(Integer userId);
    //计算总价格
    int calcuPric(Integer userId);
    //根据用户id删除购物车中所有商品
    int deleteAllShop(Integer userId);
}
