package com.embelSoft.utility;



import java.io.File;
import java.io.IOException;

import org.slf4j.LoggerFactory;

public class MyJob{
	File backup = null;
	 public void execute() {
	    try { 

	    	String to="embelmessanger@gmail.com";
	    	String to1="embelbackup@gmail.com";
		
			//for fertlizer
	
			//for database backup
			try{
			AutoDatabaseBackupJob data = new AutoDatabaseBackupJob();
			backup = data.mailDatabaseBackup();
			
			}
			catch(IOException e){
				
				
				
				
				e.printStackTrace();
			}
		    
		    try{
		    	com.embelSoft.utility.Mailer.sendFile(to,backup);
		    	com.embelSoft.utility.Mailer.sendFile(to1,backup);
		  
		    }
		    catch(Exception e){
		    	e.printStackTrace();
		    	
		    }
		    System.out.println("mail sent...");
			
	    } catch (Exception ex) {
	      LoggerFactory.getLogger(getClass()).error(ex.getMessage());
	    }
	  }
}



