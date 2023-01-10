package vo;

public class Orders {
	private int orderCode;
	private String customerId;
	private String orderName;
	private String address;
	private int orderPrice;
	private String orderState;
	private String createdate;
	
	public Orders(int orderCode, String customerId, String orderName, String address, int orderPrice,
			String orderState, String createdate) {
		super();
		this.orderCode = orderCode;
		this.customerId = customerId;
		this.orderName = orderName;
		this.address = address;
		this.orderPrice = orderPrice;
		this.orderState = orderState;
		this.createdate = createdate;
	}

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
