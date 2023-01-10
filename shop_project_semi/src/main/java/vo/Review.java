package vo;

public class Review {
	private int orderCode;
	private int goodsCode;
	private String reviewMemo;
	private int star;
	private String createdate;
	
	public Review() {
		super();
	}

	public Review(int orderCode, int goodsCode, String reviewMemo, int star, String createdate) {
		super();
		this.orderCode = orderCode;
		this.goodsCode = goodsCode;
		this.reviewMemo = reviewMemo;
		this.star = star;
		this.createdate = createdate;
	}
	
	@Override
	public String toString() {
		return "Review [orderCode=" + orderCode + ", goodsCode=" + goodsCode + ", reviewMemo=" + reviewMemo + ", star="
				+ star + ", createdate=" + createdate + "]";
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
	public String getReviewMemo() {
		return reviewMemo;
	}
	public void setReviewMemo(String reviewMemo) {
		this.reviewMemo = reviewMemo;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
