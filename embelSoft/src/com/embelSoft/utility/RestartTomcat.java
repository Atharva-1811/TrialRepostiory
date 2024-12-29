package com.embelSoft.utility;

import java.io.IOException;

public class RestartTomcat {

	    public static void main() throws IOException, InterruptedException {
	        // Get the path to the Tomcat bin directory
	    	
	    	try {
	        String binDir = "/usr/share/tomcat9/bin";
	    		
	    		// Run the restart script
	 	        String command = "sh " + binDir + "/shutdown.sh";
	 	        Runtime.getRuntime().exec(command);

	 	        // Wait for Tomcat to stop
	 	        Thread.sleep(1000);

	 	        // Run the start script
	 	        command = "sh " + binDir + "/startup.sh";
	 	        Runtime.getRuntime().exec(command);
	    	}catch(Exception e) {
	    		
	    		String binDir = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\bin";
	    		
	    		// Run the restart script
	 	        String command = "cmd /c " + binDir + "/shutdown.bat";
	 	        Runtime.getRuntime().exec(command);

	 	        // Wait for Tomcat to stop
	 	        Thread.sleep(1000);

	 	        // Run the start script
	 	        command = "cmd /c " + binDir + "/startup.bat";
	 	        Runtime.getRuntime().exec(command);
	    	}
	        
	        

	        
	    }
	

}
