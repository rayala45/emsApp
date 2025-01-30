package spring_acac;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Developer {
	private int id;
	private String name;
	@Autowired
	@Qualifier("desktop")
	private Computer c;
	void code() {
		c.compile();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Computer getC() {
		return c;
	}

	public void setC(Computer c) {
		this.c = c;
	}
	

}
