package org.jsp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

@Controller
public class EmployeeController {
	
	static EntityManager em=Persistence.createEntityManagerFactory("dev").createEntityManager();
	//creating the employee
	@RequestMapping("/createEmp")
	public ModelAndView create(@RequestParam String firstname,
			@RequestParam String lastname,
			@RequestParam String email,
			@RequestParam long phone,
			@RequestParam String department,
			@RequestParam double salary,
			@RequestParam String password,
			@RequestParam String status,
			@RequestParam String experience
			
			) {
		ModelAndView mv=new ModelAndView();
		Employee e = new Employee(0, firstname, lastname, email, phone, null, department, salary, password, EmployeeStatus.valueOf(status.toUpperCase()), EmployeeExperience.valueOf(experience.toUpperCase()), null, null);
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(e);
		et.commit();
		String msg="created successfully";
		mv.addObject("msg", msg);
		mv.setViewName("index.jsp");
		return mv;
	}
	
	//view the employee
	//@RequestMapping("/viewEmployees")
	public ModelAndView viewEmployee() {
		ModelAndView mv=new ModelAndView();
		List<Employee> rl = em.createQuery("from Employee").getResultList();
		mv.addObject("rl", rl);
		mv.setViewName("viewEmployee.jsp");
		return mv;
	}
	
	//view education details
	@RequestMapping("/viewEducation")
	public ModelAndView viewEducation(@RequestParam int id) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, id);
		List<Education> el = e.getEducation();
		int eid=id;
		mv.addObject("eid", eid);
		mv.addObject("el", el);
		mv.setViewName("viewEducation.jsp");
		return mv;
	}
	
	//view address details
	@RequestMapping("/viewAddress")
	public ModelAndView viewAddress(@RequestParam int id) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, id);
		int eid=id;
		mv.addObject("eid", eid);
		List<Address> al = e.getAddress();
		mv.addObject("al", al);
		mv.setViewName("viewAddress.jsp");
		return mv;
	}
	
	//navigating to add address
	@RequestMapping("/addAddr")
	public ModelAndView addAddress(@RequestParam int id) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("addAddress.jsp");
		return mv;
	}
	
	//creating the address
	@RequestMapping("/addAddress")
	public ModelAndView createAddress(@RequestParam int id,
			@RequestParam int doorNo,
			@RequestParam String streetName,
			@RequestParam String place,
			@RequestParam String city,
			@RequestParam long pincode,
			@RequestParam String state,
			@RequestParam String country,
			@RequestParam String type
			) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, id);
		if(e.getAddress()==null) {
			Address ad=new Address(0, doorNo, streetName, place, city, pincode, state, country, AddressType.valueOf(type.toUpperCase()), e);
			List<Address> al=new ArrayList();
			al.add(ad);
			e.setAddress(al);
			EntityTransaction et = em.getTransaction();
			et.begin();
			em.persist(ad);
			em.merge(e);
			et.commit();
			String msg="added successfully";
			mv.addObject("msg", msg);
			mv.setViewName("/viewAddress");
			return mv;
		}
		else {
			Address ad=new Address(0, doorNo, streetName, place, city, pincode, state, country, AddressType.valueOf(type.toUpperCase()), e);
			List<Address> al = e.getAddress();
			al.add(ad);
			EntityTransaction et = em.getTransaction();
			et.begin();
			em.persist(ad);
			em.merge(e);
			et.commit();
			String msg="added successfully";
			mv.addObject("msg", msg);
			mv.setViewName("/viewAddress");
			return mv;
		}
	}
	
	//navigating to add education
	@RequestMapping("/addEdu")
	public ModelAndView addEdu(@RequestParam int id) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("addEducation.jsp");
		return mv;
	}
	
	//creating the education details
	@RequestMapping("/addEducation")
	public ModelAndView addEducation(@RequestParam int id,
			@RequestParam String qualification,
			@RequestParam String university,
			@RequestParam String yearOfStart,
			@RequestParam String yearOfPassout,
			@RequestParam double percentage,
			@RequestParam String highestQualify
			) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, id);
		if(e.getEducation()==null) {
			List<Education> el=new ArrayList<Education>();
			Education edu=new Education(0, qualification, university, yearOfStart, yearOfPassout, percentage, EducationHigh.valueOf(highestQualify.toUpperCase()), e);
			EntityTransaction et = em.getTransaction();
			el.add(edu);
			e.setEducation(el);
			et.begin();
			em.persist(edu);
			em.merge(e);
			et.commit();
			String msg="Education added Successfully";
			mv.addObject("msg", msg);
			Employee emp = em.find(Employee.class, id);
			List<Education> esl = emp.getEducation();
			int eid=id;
			mv.addObject("eid", eid);
			mv.addObject("el", esl);
			mv.setViewName("viewEducation.jsp");
			return mv;
		}
		else {
			List<Education> el = e.getEducation();
			Education edu=new Education(0, qualification, university, yearOfStart, yearOfPassout, percentage, EducationHigh.valueOf(highestQualify.toUpperCase()), e);
			el.add(edu);
			e.setEducation(el);
			EntityTransaction et = em.getTransaction();
			et.begin();
			em.persist(edu);
			em.merge(e);
			et.commit();
			String msg="Education added Successfully";
			mv.addObject("msg", msg);
			Employee emp = em.find(Employee.class, id);
			List<Education> esl = emp.getEducation();
			int eid=id;
			mv.addObject("eid", eid);
			mv.addObject("el", esl);
			mv.setViewName("viewEducation.jsp");
			return mv;
		}
	}
	
	//delete address
	@RequestMapping("/deleteAddr")
	public ModelAndView deleteAddress(@RequestParam int id,@RequestParam int eid) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, eid);
		List<Address> adl = e.getAddress();
		for(Address ad:adl) {
			if(ad.getId()==id) {
				EntityTransaction et = em.getTransaction();
				adl.remove(ad);
				et.begin();
				em.merge(e);
				em.remove(ad);
				et.commit();
				String msg="deleted the address successfully";
				mv.addObject("msg", msg);
				Employee emp = em.find(Employee.class, eid);
				List<Address> Addres = emp.getAddress();
				mv.addObject("al", Addres);
				mv.addObject("eid", eid);
				mv.setViewName("viewAddress.jsp");
				return mv;
			}
		}
		String msg="something went wrong";
		mv.addObject("msg", msg);
		Employee emp = em.find(Employee.class, eid);
		List<Address> Addres = emp.getAddress();
		mv.addObject("al", Addres);
		mv.addObject("eid", eid);
		mv.setViewName("viewAddress.jsp");
		return mv;
	}
	
	//Edit address
	@RequestMapping("/editAddr")
	public ModelAndView editAddr(@RequestParam int id,@RequestParam int eid) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, eid);
		List<Address> adl = e.getAddress();
		for(Address ad:adl) {
			if(ad.getId()==id) {
				mv.addObject("eid", eid);
				mv.addObject("ad", ad);
				mv.setViewName("updateAddress.jsp");
				return mv;
			}
		}
		String msg="something went wrong";
		mv.addObject("msg", msg);
		Employee emp = em.find(Employee.class, eid);
		List<Address> Addres = emp.getAddress();
		mv.addObject("al", Addres);
		mv.addObject("eid", eid);
		mv.setViewName("viewAddress.jsp");
		return mv;
	}
	
	//update the address
	@RequestMapping("/updateAddress")
	public ModelAndView updatedAddress(@RequestParam int id,
			@RequestParam int doorNo,
			@RequestParam String streetName,
			@RequestParam String place,
			@RequestParam String city,
			@RequestParam long pincode,
			@RequestParam String state,
			@RequestParam String country,
			@RequestParam String type,
			@RequestParam int eid
			) {
		ModelAndView mv= new ModelAndView();
		Employee e = em.find(Employee.class, eid);
		List<Address> address = e.getAddress();
		for(Address ad:address) {
			if(ad.getId()==id) {
				Address add=new Address(id, doorNo, streetName, place, city, pincode, state, country, AddressType.valueOf(type), e);
				EntityTransaction et = em.getTransaction();
				et.begin();
				em.merge(add);
				et.commit();
				String msg="updated successful";
				mv.addObject("msg", msg);
				Employee emp = em.find(Employee.class, eid);
				List<Address> Addres = emp.getAddress();
				mv.addObject("al", Addres);
				mv.addObject("eid", eid);
				mv.setViewName("viewAddress.jsp");
				return mv;
				
			}
		}
		String msg="something went wrong";
		mv.addObject("msg", msg);
		Employee emp = em.find(Employee.class, eid);
		List<Address> Addres = emp.getAddress();
		mv.addObject("al", Addres);
		mv.addObject("eid", eid);
		mv.setViewName("viewAddress.jsp");
		return mv;
	}
	
	//delete Education
	@RequestMapping("/deleteEdu")
	public ModelAndView deleteEducation(@RequestParam int id,@RequestParam int eid) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, eid);
		List<Education> education = e.getEducation();
		for(Education ed:education) {
			if(ed.getId()==id) {
				EntityTransaction et = em.getTransaction();
				education.remove(ed);
				et.begin();
				em.merge(e);
				em.remove(ed);
				et.commit();
				String msg="deleted the education successfully";
				mv.addObject("msg", msg);
				Employee emp = em.find(Employee.class, eid);
				List<Education> el = emp.getEducation();
				mv.addObject("eid", eid);
				mv.addObject("el", el);
				mv.setViewName("viewEducation.jsp");
				return mv;
				
			}
		}
		String msg="something went wrong";
		mv.addObject("msg", msg);
		Employee emp = em.find(Employee.class, eid);
		List<Education> el = emp.getEducation();
		mv.addObject("eid", eid);
		mv.addObject("el", el);
		mv.setViewName("viewEducation.jsp");
		return mv;
	}
	
	//Edit education
	@RequestMapping("/editEdu")
	public ModelAndView editEdu(@RequestParam int id,@RequestParam int eid) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, eid);
		List<Education> education = e.getEducation();
		for(Education ed:education) {
			if(ed.getId()==id) {
				mv.addObject("eid", eid);
				mv.addObject("ed", ed);
				mv.setViewName("updateEducation.jsp");
				return mv;
			}
		}
		String msg="something went wrong";
		mv.addObject("msg", msg);
		Employee emp = em.find(Employee.class, eid);
		List<Education> el = emp.getEducation();
		mv.addObject("eid", eid);
		mv.addObject("el", el);
		mv.setViewName("viewEducation.jsp");
		return mv;
	}
	
	//update the education
	@RequestMapping("/updateEducation")
	public ModelAndView updateEducation(@RequestParam int id,
			@RequestParam String qualification,
			@RequestParam String university,
			@RequestParam String yearOfStart,
			@RequestParam String yearOfPassout,
			@RequestParam double percentage,
			@RequestParam String highestQualify,
			@RequestParam int eid
			) {
		
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, eid);
		List<Education> education = e.getEducation();
		for(Education ed:education) {
			if(ed.getId()==id) {
				Education edu=new Education(id, qualification, university, yearOfStart, yearOfPassout, percentage, EducationHigh.valueOf(highestQualify), e);
				EntityTransaction et = em.getTransaction();
				et.begin();
				em.merge(edu);
				et.commit();
				String msg="updated successful";
				mv.addObject("msg", msg);
				Employee emp = em.find(Employee.class, eid);
				List<Education> el = emp.getEducation();
				mv.addObject("eid", eid);
				mv.addObject("el", el);
				mv.setViewName("viewEducation.jsp");
				return mv;
			}
		}
		
		String msg="something went wrong";
		mv.addObject("msg", msg);
		Employee emp = em.find(Employee.class, eid);
		List<Education> el = emp.getEducation();
		mv.addObject("eid", eid);
		mv.addObject("el", el);
		mv.setViewName("viewEducation.jsp");
		return mv;
	}
	
	//update Employee
	@RequestMapping("/updateEmp")
	public ModelAndView updateEmp(@RequestParam int id) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, id);
		mv.addObject("e", e);
		mv.setViewName("updateEmployee.jsp");
		return mv;
	}
	
	//update the employee
	@RequestMapping("/updateEmployee")
	public ModelAndView updateEmployee(@RequestParam String firstName,
			@RequestParam String lastName,
			@RequestParam String email,
			@RequestParam long phone,
			@RequestParam String department,
			@RequestParam double salary,
			@RequestParam String password,
			@RequestParam String status,
			@RequestParam String experience,
			@RequestParam int id
			) {
		
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, id);
		e.setFirstName(firstName);
		e.setLastName(lastName);
		e.setEmail(email);
		e.setDepartment(department);
		e.setExperience(EmployeeExperience.valueOf(experience.toUpperCase()));
		e.setStatus(EmployeeStatus.valueOf(status.toUpperCase()));
		e.setPassword(password);
		e.setSalary(salary);
		e.setPhone(phone);
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(e);
		et.commit();
		String msg="updated successful";
		mv.addObject("msg", msg);
		List<Employee> rls = em.createQuery("from Employee").getResultList();
		List<Employee> rl=new ArrayList<Employee>();
		for(Employee el:rls) {
			if(el.getStatus().equals(EmployeeStatus.valueOf("ACTIVE"))) {
				rl.add(el);
			}
		}
		mv.addObject("rl", rl);
		mv.setViewName("viewEmployee.jsp");
		
		return mv;
	}
	
	
	
	//update by Employee id
	@RequestMapping("/updateEmployeeById")
	public ModelAndView updateEmployeeById(@RequestParam int employeeId) {
		ModelAndView mv=new ModelAndView();
		Employee e = em.find(Employee.class, employeeId);
		if(e!=null) {
			mv.addObject("e", e);
			mv.setViewName("updateEmployee.jsp");
			return mv;
		}
		else {
			String msg="invalid id...";
			mv.addObject("msg", msg);
			mv.setViewName("index.jsp");
			return mv;
		}
	}
	
	
		
		@RequestMapping("/deleteEmployeeById")
		public ModelAndView deleteEmployeeById(int id) {
			ModelAndView mv=new ModelAndView();
			Employee e = em.find(Employee.class, id);
			if(e==null) {
				mv.addObject("msg", "something went wrong");
				mv.setViewName("index.jsp");
				return mv;
			}
			else {
				EntityTransaction et = em.getTransaction();
				et.begin();
				em.remove(e);
				et.commit();
				mv.setViewName("viewEmployees");
				mv.addObject("msg", "deleted successfully");
				return mv;
			}
		}
		
		//viewMore
		@RequestMapping("/viewMore")
		public ModelAndView viewMore(@RequestParam int id) {
			ModelAndView mv=new ModelAndView();
			Employee e = em.find(Employee.class, id);
			mv.addObject("e", e);
			mv.setViewName("viewMore.jsp");
			return mv;
		}
		
		//delete Employee
				@RequestMapping("/deleteEmp")
				public ModelAndView deleteEmpl(@RequestParam int id) {
					ModelAndView mv=new ModelAndView();
					Employee e = em.find(Employee.class, id);
					if(e==null) {
						mv.addObject("msg", "something went wrong");
						mv.setViewName("index.jsp");
						return mv;
					}
					else {
						EntityTransaction et = em.getTransaction();
						et.begin();
						em.remove(e);
						et.commit();
						mv.setViewName("viewEmployees");
						mv.addObject("msg", "deleted successfully");
						return mv;
					}
				}
				
				
				
				
				//viewEmployee by status
				@RequestMapping("/viewEmployees")
				public ModelAndView activeEmployees() {
					ModelAndView mv=new ModelAndView();
					
					List<Employee> rls = em.createQuery("from Employee").getResultList();
					List<Employee> rl=new ArrayList<Employee>();
					for(Employee e:rls) {
						if(e.getStatus().equals(EmployeeStatus.valueOf("ACTIVE"))) {
							rl.add(e);
						}
					}
					mv.addObject("rl", rl);
					mv.setViewName("viewEmployee.jsp");
					return mv;
					
				}
				
				//view Inactive
				@RequestMapping("/viewInactive")
				public ModelAndView viewInactive() {
					ModelAndView mv=new ModelAndView();
					List<Employee> rls = em.createQuery("from Employee").getResultList();
					List<Employee> rl=new ArrayList<Employee>();
					for(Employee e:rls) {
						if(e.getStatus().equals(EmployeeStatus.valueOf("INACTIVE"))) {
							rl.add(e);
						}
					}
					mv.addObject("rl", rl);
					mv.setViewName("viewEmployeeIA.jsp");
					
					return mv;
				}
				
				//change the Status
				@RequestMapping("StatusEmp")
				public ModelAndView changeStatus(@RequestParam int id,@RequestParam String Status) {
					ModelAndView mv=new ModelAndView();
					Employee e = em.find(Employee.class, id);
					if(Status.equals(EmployeeStatus.ACTIVE.toString())) {
						e.setStatus(EmployeeStatus.INACTIVE);
						EntityTransaction et = em.getTransaction();
						et.begin();
						em.merge(e);
						et.commit();
						
						return viewMore(id);
					}
					else {
						e.setStatus(EmployeeStatus.ACTIVE);
						EntityTransaction et = em.getTransaction();
						et.begin();
						em.merge(e);
						et.commit();
						
						return viewMore(id);
					}
					
				}
		//login page
		@RequestMapping("login")
		public ModelAndView login(@RequestParam String email,@RequestParam String password) {
			ModelAndView mv=new ModelAndView();
			Query q = em.createQuery("from Employee");
			List<Employee> rl = q.getResultList();
			for(Employee e:rl) {
				if(e.getEmail().equalsIgnoreCase(email)&&e.getPassword().equals(password)) {
					mv.setViewName("index.jsp");
					mv.addObject("msg", "login successful");
					return mv;
				}
			}
				mv.setViewName("login.jsp");
				mv.addObject("msg", "invalid credentials");
				return mv;
			
		}
		
}
