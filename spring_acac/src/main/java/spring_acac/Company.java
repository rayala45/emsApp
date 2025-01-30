package spring_acac;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class Company {
	@Autowired
	private Developer d;
	
	public static void main(String[] args) {
		ApplicationContext ac=new AnnotationConfigApplicationContext(Config.class);
		Company c = ac.getBean(Company.class);
		c.d.code();
	}

}
