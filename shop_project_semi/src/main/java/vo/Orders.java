package vo;

public class Orders {
	private int orderCode;
	private String customerId;
	private String orderName;
	private String address;
	private int orderPrice;
	private String createdate;
	
	public Orders() {
		super();
	}
	
	public Orders(int orderCode, String customerId, String orderName, String address, int orderPrice,
			String createdate) {
		super();
		this.orderCode = orderCode;
		this.customerId = customerId;
		this.orderName = orderName;
		this.address = address;
		this.orderPrice = orderPrice;
		this.createdate = createdate;
	}
	
	@Override
	public String toString() {
		return "Orders [orderCode=" + orderCode + ", customerId=" + customerId + ", orderName=" + orderName
				+ ", address=" + address + ", orderPrice=" + orderPrice + ", createdate=" + createdate + "]";
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
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
