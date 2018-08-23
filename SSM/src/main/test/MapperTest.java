import dao.MenuMapper;
import dao.RestaurantMapper;
import dao.ShopcarMapper;
import entity.Menu;
import entity.Restaurant;
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
//    AddressMapper addressMapper;
//      RestaurantMapper restaurantMapper;
//    MenuMapper menuMapper;
    ShopcarMapper shopcarMapper;
    @Test
    public void testCRUD(){
//        System.out.println(userMapper);
//        List<User> users=userMapper.selectAll();
//        System.out.println(users);
//        int i=userMapper.insert(new User("赵六","123",null,null,null,"1.jpg"));
//        System.out.println(i);
//        List<Menu>menus=menuMapper.selectAll();
//        for (Menu menu:menus
//             ) {
//            System.out.println(menu);
//        }
        System.out.println(shopcarMapper.calcuPric(1));
    }
}
