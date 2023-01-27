package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class BootListener
 *
 */
@WebListener
public class BootListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public BootListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	
    	// TOMCAT Booting
    	try {
    		Class.forName("org.mariadb.jdbc.Driver");
    		System.out.println("DB Driver Loading Complete!");
    	} catch(Exception e) {
    		System.out.println("Listener Exception : Class.forName()");
    		e.printStackTrace();
    	}
    }
	
}
