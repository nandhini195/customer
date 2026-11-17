package com.cuspurdb;

import java.sql.*;
public class testconnection {
	
	public static void main (String [] args) {
		
		Connection con = DBConnection.getConnection();
		
		if (con != null) {
			
			System.out.println("Mysql Connection is Compeleted");
			
		}else {
			
			System.out.println("Mysql Connection is Failed!");
		}
		
	}

}
