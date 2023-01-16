package vo;

public class Question {
	private int questionCode;
	private int orderCode;
	private int goodsCode;
	private String category;
	private String customerId;	// 테이블엔 없지만 문의 상세보기 때문에 추가
	private String questionMemo;
	private boolean commentPresence; // 테이블엔 없지만 문의 상세보기 때문에 추가
	private String createdate;
	
	public int getQuestionCode() {
		return questionCode;
	}
	public void setQuestionCode(int questionCode) {
		this.questionCode = questionCode;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public int getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getQuestionMemo() {
		return questionMemo;
	}
	public void setQuestionMemo(String questionMemo) {
		this.questionMemo = questionMemo;
	}
	public boolean isCommentPresence() {
		return commentPresence;
	}
	public void setCommentPresence(boolean commentPresence) {
		this.commentPresence = commentPresence;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
