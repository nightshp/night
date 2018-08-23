package service.impl;

import dao.AddressMapper;
import entity.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.IAddressService;

import java.util.List;

@Service
public class AddressService implements IAddressService {
    @Autowired
    AddressMapper addressMapper;
    @Override
    public int deleteByPrimaryKey(Integer addressId) {
        return addressMapper.deleteByPrimaryKey(addressId);
    }

    @Override
    public int insert(Address address) {
        return addressMapper.insert(address);
    }

    @Override
    public Address selectByPrimaryKey(Integer addressId) {
        return addressMapper.selectByPrimaryKey(addressId);
    }

    @Override
    public List<Address> selectAll(Integer userId) {
        return addressMapper.selectAll(userId);
    }

    @Override
    public int updateByPrimaryKey(Address address) {
        return addressMapper.updateByPrimaryKey(address);
    }

    @Override
    public int updateDefault(Integer addressId,Integer isdefault) {
        return addressMapper.updateDefault(addressId,isdefault);
    }

    @Override
    public List<Address> selectNotDefault(Integer userId, Integer addressId) {
        return addressMapper.selectNotDefault(userId,addressId);
    }

    @Override
    public Address selectDefU(Integer isdefault, Integer userId) {
        return addressMapper.selectDefU(isdefault,userId);
    }
}
