import dao.AddressMapper;
import dao.UserMapper;
import entity.Address;
import entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:bean.xml"})          //指定spring配置文件的位置
public class MapperTest {
    @Autowired
//    UserMapper userMapper;
    AddressMapper addressMapper;
    @Test
    public void testCRUD(){
//        System.out.println(userMapper);
//        List<User> users=userMapper.selectAll();
//        System.out.println(users);
//        int i=userMapper.insert(new User("赵六","123",null,null,null,"1.jpg"));
//        System.out.println(i);
        List<Address>addresses=addressMapper.selectAll(1);
        for (Address address:addresses
             ) {
            System.out.println(address);
        }
    }
}
