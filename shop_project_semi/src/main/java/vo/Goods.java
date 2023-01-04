package vo;

public class Goods {
	private int goodsCode;
	private String goodsName;
	private String goodsPrice;
	private boolean soldOut;
	private String empId;
	private int hit;
	private String createdate;
	private String updatedate;
	
	public Goods(int goodsCode, String goodsName, String goodsPrice, boolean soldOut, String empId, int hit,
			String createdate, String updatedate) {
		super();
		this.goodsCode = goodsCode;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.soldOut = soldOut;
		this.empId = empId;
		this.hit = hit;
		this.createdate = createdate;
		this.updatedate = updatedate;
	}

	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Goods [goodsCode=" + goodsCode + ", goodsName=" + goodsName + ", goodsPrice=" + goodsPrice
				+ ", soldOut=" + soldOut + ", empId=" + empId + ", hit=" + hit + ", createdate=" + createdate
				+ ", updatedate=" + updatedate + "]";
	}

	public int getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(String goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public boolean isSoldOut() {
		return soldOut;
	}

	public void setSoldOut(boolean soldOut) {
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
