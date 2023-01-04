package vo;

public class Notice {
	private int noticeCode;
	private String noticeTitle;
	private String noticeContent;
	private String empName;
	private String createdate;
	
	public Notice(int noticeCode, String noticeTitle, String noticeContent, String empName, String createdate) {
		super();
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.empName = empName;
		this.createdate = createdate;
	}

	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	
	
}
