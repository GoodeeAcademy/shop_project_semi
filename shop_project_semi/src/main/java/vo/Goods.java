package vo;

public class Goods {
	private int goodsCode;
	private int categoryCode;
	private String goodsName;
	private int goodsPrice;
	private String soldOut;
	private String empId;
	private int hit;
	private String createdate;
	private String updatedate;
	
	public Goods() {
		super();
	}
	
	public Goods(int goodsCode, int categoryCode, String goodsName, int goodsPrice, String soldOut, String empId,
			int hit, String createdate, String updatedate) {
		super();
		this.goodsCode = goodsCode;
		this.categoryCode = categoryCode;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.soldOut = soldOut;
		this.empId = empId;
		this.hit = hit;
		this.createdate = createdate;
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "Goods [goodsCode=" + goodsCode + ", categoryCode=" + categoryCode + ", goodsName=" + goodsName
				+ ", goodsPrice=" + goodsPrice + ", soldOut=" + soldOut + ", empId=" + empId + ", hit=" + hit
				+ ", createdate=" + createdate + ", updatedate=" + updatedate + "]";
	}
	
	public int getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}
	public int getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getSoldOut() {
		return soldOut;
	}
	public void setSoldOut(String soldOut) {
		this.soldOut = soldOut;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
}
