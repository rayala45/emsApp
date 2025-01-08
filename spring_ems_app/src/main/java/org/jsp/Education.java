package org.jsp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Education {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String qualification;
	private String university;
	private String yearOfStart;
	private String yearOfPassout;
	private double percentage;
	private EducationHigh highestQualify;
	
	@ManyToOne
	private Employee employee;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getYearOfStart() {
		return yearOfStart;
	}

	public void setYearOfStart(String yearOfStart) {
		this.yearOfStart = yearOfStart;
	}

	public String getYearOfPassout() {
		return yearOfPassout;
	}

	public void setYearOfPassout(String yearOfPassout) {
		this.yearOfPassout = yearOfPassout;
	}

	public double getPercentage() {
		return percentage;
	}

	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}

	

	public EducationHigh getHighestQualify() {
		return highestQualify;
	}

	public void setHighestQualify(EducationHigh highestQualify) {
		this.highestQualify = highestQualify;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	

	public Education(int id, String qualification, String university, String yearOfStart, String yearOfPassout,
			double percentage, EducationHigh highestQualify, Employee employee) {
		super();
		this.id = id;
		this.qualification = qualification;
		this.university = university;
		this.yearOfStart = yearOfStart;
		this.yearOfPassout = yearOfPassout;
		this.percentage = percentage;
		this.highestQualify = highestQualify;
		this.employee = employee;
	}

	public Education() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
