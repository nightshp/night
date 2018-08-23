package service.impl;

import dao.ShopcarMapper;
import entity.Shopcar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.IShopcarService;

import java.util.List;

@Service
public class ShopcarService implements IShopcarService {
    @Autowired
    ShopcarMapper shopcarMapper;
    @Override
    public int deleteByPrimaryKey(Integer shopcarId) {
        return shopcarMapper.deleteByPrimaryKey(shopcarId);
    }

    @Override
    public int insert(Shopcar shopcar) {
        return shopcarMapper.insert(shopcar);
    }

    @Override
    public Shopcar selectByPrimaryKey(Integer shopcarId) {
        return shopcarMapper.selectByPrimaryKey(shopcarId);
    }

    @Override
    public List<Shopcar> selectAll() {
        return shopcarMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Shopcar shopcar) {
        return shopcarMapper.updateByPrimaryKey(shopcar);
    }

    @Override
    public List<Shopcar> selectShops(Integer userId) {
        return shopcarMapper.selectShops(userId);
    }

    @Override
    public int calcuPric(Integer userId) {
        return shopcarMapper.calcuPric(userId);
    }

    @Override
    public int deleteAllShop(Integer userId) {
        return shopcarMapper.deleteAllShop(userId);
    }

}
