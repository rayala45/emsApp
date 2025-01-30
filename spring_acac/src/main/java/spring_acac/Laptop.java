package spring_acac;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
@Primary
@Component
public class Laptop implements Computer {


	@Override
	public void compile() {
		System.out.println("lap code");
		// TODO Auto-generated method stub
		
	}

}
