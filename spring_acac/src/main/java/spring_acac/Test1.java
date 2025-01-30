package spring_acac;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Test1 {
	public static void main(String[] args) {
		ApplicationContext ac=new AnnotationConfigApplicationContext(Config.class);
		Developer d = ac.getBean(Developer.class);
		System.out.println(d.getId());
		d.code();
	}

}
