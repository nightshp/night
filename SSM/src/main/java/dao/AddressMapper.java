package dao;

import entity.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AddressMapper {
    //根据id删除地址
    int deleteByPrimaryKey(Integer addressId);
    //插入地址
    int insert(Address address);
    //根据id查询地址
    Address selectByPrimaryKey(Integer addressId);
    //根据用户id查询所有地址
    List<Address> selectAll(Integer userId);
    //更新地址
    int updateByPrimaryKey(Address address);
    //根据isdefault设置默认地址：1为默认
    int updateDefault(@Param(value = "addressId") Integer addressId,@Param(value ="isdefault") Integer isdefault);
    //查出除默认地址外其他地址
    List<Address> selectNotDefault(@Param(value = "userId") Integer userId,@Param(value = "addressId") Integer addressId);
    //根据isdefault和userid查出地址信息
    Address selectDefU(@Param(value = "isdefault")Integer isdefault,@Param(value = "userId")Integer userId);
}