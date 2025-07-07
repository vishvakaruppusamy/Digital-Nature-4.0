package App;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class applicationLauncher {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("context-config.xml");

        libManager manager = (libManager) context.getBean("libManager");
        manager.displayBook();
    }
}
