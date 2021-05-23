import com.cl.pojo.Manager;
import com.cl.pojo.User;
import com.cl.service.ManagerServiceImpl;
import com.cl.service.UserServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MyTest {
    @Test
    public void Test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        ManagerServiceImpl service = context.getBean("ManagerServiceImpl", ManagerServiceImpl.class);
//        Manager manager = new Manager("root","123");
//        System.out.println(service.findManager(manager));
        UserServiceImpl service = context.getBean("UserServiceImpl", UserServiceImpl.class);
        System.out.println(service.checkName("小蓝"));
    }
    }
