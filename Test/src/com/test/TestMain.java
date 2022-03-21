package com.test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import com.dao.EmployeeDetailsDao;
import com.model.EmployeeDetails;

public class TestMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		EmployeeDetailsDao empDao=new EmployeeDetailsDao();
		EmployeeDetails employeeDetail=null;
		boolean flag=true;
		Scanner scan=new Scanner(System.in);
		String choice1;
		do {
		System.out.println("You want 1.insert \n 2.Update \n 3.View \n 4.delete");
		int choice=scan.nextInt();
		switch(choice) {
			case 1:
				do {
			System.out.println("Enter employee Id");
			int empId=scan.nextInt();
			System.out.println("Enter Employee name");
			String empName=scan.next();
			
			System.out.println("Enter employee number");
			long empNum=scan.nextLong();
			System.out.println("Enter employee emailId");
			String emailId=scan.next();
			
			employeeDetail=new EmployeeDetails(empId, empName, empNum, emailId);
			
			 flag=empDao.insert(employeeDetail);
//			 System.out.println(flag);
			if (flag) {
				System.out.println("Employee Details added successfully");
			}
			
			else {
				System.out.println("Employee details doesn't added");
			}
			}while(flag==false);
			break;
			case 2:
				do {
				System.out.println("Enter empId you want update ");
				int updateEmpId=scan.nextInt();
				System.out.println("Enter new mailId ");
				String newMailId=scan.next();
				employeeDetail=new EmployeeDetails(updateEmpId, null, 0, newMailId);
				flag=empDao.update(employeeDetail);
				if (flag) {
					System.out.println("EmailId Updated");
				}
				else {
					System.out.println("emailId doesn't update");
				}
				}while(flag==false);
				break;
			case 3:
				
				ArrayList<EmployeeDetails> vievEmployee=empDao.view();
				Iterator itr=vievEmployee.iterator();  
				while(itr.hasNext()){  
					System.out.println(itr.next());  
					}  
//				System.out.println("Employee List is \n" + vievEmployee);
				break;
			case 4:
				do {
				System.out.println("Enter empid you want delete");
				int delete=scan.nextInt();
				employeeDetail = new EmployeeDetails(delete, null, 0, null);
				flag=empDao.delete(employeeDetail);
				if (flag) {
					System.out.println("Employee deleted Successfully");
				}
				else {
					System.out.println("Employee doesn't deleted");
				}
				}while(flag==false);
				break;
		
		}
		System.out.println("You want continue yes or no(y/n)");
		choice1=scan.next();
		}while(choice1.equals("Y")||choice1.equals("y"));
		System.out.println("Thank you");
	}

}
