package vo;

public class OrderGoods {
	private int orderCode;
	private int goodsCode;
	private int orderGoodsPrice;
	private int orderGoodsQuantity;
	private String orderGoodsState;
	
	public OrderGoods() {
		super();
	}
	
	public OrderGoods(int orderCode, int goodsCode, int orderGoodsPrice, int orderGoodsQuantity,
			String orderGoodsState) {
		super();
		this.orderCode = orderCode;
		this.goodsCode = goodsCode;
		this.orderGoodsPrice = orderGoodsPrice;
		this.orderGoodsQuantity = orderGoodsQuantity;
		this.orderGoodsState = orderGoodsState;
	}
	
	@Override
	public String toString() {
		return "OrderGoods [orderCode=" + orderCode + ", goodsCode=" + goodsCode + ", orderGoodsPrice="
				+ orderGoodsPrice + ", orderGoodsQuantity=" + orderGoodsQuantity + ", orderGoodsState="
				+ orderGoodsState + "]";
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
	public int getOrderGoodsPrice() {
		return orderGoodsPrice;
	}
	public void setOrderGoodsPrice(int order_goods_price) {
		this.orderGoodsPrice = order_goods_price;
	}
	public int getOrderGoodsQuantity() {
		return orderGoodsQuantity;
	}
	public void setOrderGoodsQuantity(int orderGoodsQuantity) {
		this.orderGoodsQuantity = orderGoodsQuantity;
	}
	public String getOrderGoodsState() {
		return orderGoodsState;
	}
	public void setOrderGoodsState(String orderGoodsState) {
		this.orderGoodsState = orderGoodsState;
	}
}
