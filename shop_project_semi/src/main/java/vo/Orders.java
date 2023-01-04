package vo;

public class Orders {
	private int orderCode;
	private int goodsCode;
	private int addressCode;
	private String customerId;
	private int ordefQuantity;
	private int orderPrice;
	private String orderState;
	private String createdate;
	
	public Orders(int orderCode, int goodsCode, int addressCode, String customerId, int ordefQuantity, int orderPrice,
			String orderState, String createdate) {
		super();
		this.orderCode = orderCode;
		this.goodsCode = goodsCode;
		this.addressCode = addressCode;
		this.customerId = customerId;
		this.ordefQuantity = ordefQuantity;
		this.orderPrice = orderPrice;
		this.orderState = orderState;
		this.createdate = createdate;
	}

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Orders [orderCode=" + orderCode + ", goodsCode=" + goodsCode + ", addressCode=" + addressCode
				+ ", customerId=" + customerId + ", ordefQuantity=" + ordefQuantity + ", orderPrice=" + orderPrice
				+ ", orderState=" + orderState + ", createdate=" + createdate + "]";
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

	public int getAddressCode() {
		return addressCode;
	}

	public void setAddressCode(int addressCode) {
		this.addressCode = addressCode;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public int getOrdefQuantity() {
		return ordefQuantity;
	}

	public void setOrdefQuantity(int ordefQuantity) {
		this.ordefQuantity = ordefQuantity;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	
	
}
