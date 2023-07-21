package com.maturski.dbUtility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtility 
{
	public static Connection getConnection()
    { 
    	String connectionUrl = "jdbc:mysql://localhost:3306/maturski?allowPublicKeyRetrieval=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
    			+ "&rewriteBatchedStatements=true"; 
    	
    	String user="root";
    	String passw="eloo123";
        Connection con=null;         
        try
        {  
            Class.forName("com.mysql.cj.jdbc.Driver");  
            con=DriverManager.getConnection(connectionUrl,user,passw);  
        }
        
        catch(Exception e)
        {
        	System.out.println(e);
        }  
        
        return con;  
    }  
  
}
