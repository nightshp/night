import com.github.pagehelper.PageInfo;
import entity.User;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:bean.xml","classpath:springmvc.xml"})
public class MVCTest {
    //传入springMVC的IOC
    @Autowired
    WebApplicationContext context;
    //虚拟MVC请求，获取到处理结果
    MockMvc mockMvc;
    @Before
    public void initMokcMvc(){
        mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void testPage() throws Exception {
        //模拟请求拿到返回值
        MvcResult result=mockMvc.perform(MockMvcRequestBuilders.get("/getAll").param("pn","1")).andReturn();
        //请求成功后，请求域中会有pageinfo，可以取出pageinfo进行验证
        MockHttpServletRequest request=result.getRequest();
        PageInfo p=(PageInfo)request.getAttribute("pageinfo");
        System.out.println("当前页码："+p.getPageNum());
        System.out.println("总页码："+p.getPages());
        System.out.println("总记录数："+p.getTotal());
        System.out.println("在页面需要连续显示的页码");
       int[]nums=p.getNavigatepageNums();
        for (int i:nums
             ) {
            System.out.print(" "+i);
        }
        //获取数据
        List<User>users=p.getList();
        for (User user:users
             ) {
            System.out.print("id:"+user.getUserId()+"name"+user.getUserName());
        }
    }
}
