package com.cuspurdb;

import java.sql.*; //It helps Java maintain communication with MySQL

/*public - Accessible from other classes
class - Used to create a class
DBConnection - Class name
*/
public class DBConnection {
//Connection method
	/*
	  public – Other classes can access this method.
       static – We can call this method using the class name without creating an object. 
	   Connection – Return type. This method returns a database connection. 
	   getConnection() – Method name.
	 */
	public static Connection getConnection() {
		
		/*
		 * Connection – Data type.
		 * con – Variable name.
		 * null – Initially, it does not contain any connection.
		 */
		Connection con = null; //Holds the database connection
		
		//The try block contains code that might produce an error.
		try {
			
			/*
			 * Class.forName() – Loads a Java class at runtime. 
			 * com.mysql.cj.jdbc.Driver - MySQL JDBC driver class.
			 */
			
			Class.forName("com.mysql.cj.jdbc.Driver"); //Loads the MySQL JDBC driver
		
			//This is the actual database connection statement.
			con = DriverManager.getConnection( //Establishes the database connection
					"jdbc:mysql://localhost:3306/purchase_db?useSSL=false&serverTimezone=Asia/Kolkata",
				    "Retail",
				    "Salem@2k22");
			System.out.println("DB Connection Compeleted");
				    
			//The catch block handles errors that occur inside the try block.
		} catch(Exception e) {
			e.printStackTrace(); //Print error details
		}
		//Return connection
		return con;
	}
}


