package listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import service.sitecount.SiteCountService;

/**
 * Application Lifecycle Listener implementation class SiteCountListener
 *
 */

@WebListener
public class SiteCountListener implements HttpSessionListener {
	private SiteCountService siteCountService = new SiteCountService();

    /**
     * Default constructor. 
     */
    public SiteCountListener() {
        // TODO Auto-generated constructor stub
    }

	// 세션 생성
    public void sessionCreated(HttpSessionEvent se)  { 
    	System.out.println("디버깅");
    	
    	// 현재 서버의 접속자 수: 서버 속성 이용
    	HttpSession session = se.getSession();
    	
    	try {
	    	int num = 0;
	    	if(session.getServletContext().getAttribute("currentCount") != null) {
	    		num = (int)(se.getSession().getServletContext().getAttribute("currentCount"));
	    	};
	    	session.getServletContext().setAttribute("currentCount", num+1);
	    	System.out.println("세션생성 currentCount : "+ session.getServletContext().getAttribute("currentCount"));
	    	
	    	int todayCount = siteCountService.getTodayCount();
	    	if(todayCount == 0) {	// 첫 방문자
	    		siteCountService.addCounter();
	    		System.out.println("todaycounter add");
	    	}else {
	    		siteCountService.modifyCounter();
	    		System.out.println("todaycounter modify");
	    	}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    }

    // 세션 소멸
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	int num = (int)(se.getSession().getServletContext().getAttribute("currentCount"));
    	se.getSession().getServletContext().setAttribute("currentCount", num-1);
    	System.out.println("세션소멸 currentCount : "+ se.getSession().getServletContext().getAttribute("currentCount"));
    }
	
}
