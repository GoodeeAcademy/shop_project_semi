package vo;

public class GoodsImg {
	private int goodsCode;
	private String fileName;
	private String originName;
	private String contentType;
	private String createdate;
	private String updatedate;
	
	public GoodsImg(int goodsCode, String fileName, String originName, String contentType, String createdate,
			String updatedate) {
		super();
		this.goodsCode = goodsCode;
		this.fileName = fileName;
		this.originName = originName;
		this.contentType = contentType;
		this.createdate = createdate;
		this.updatedate = updatedate;
	}
	
	public GoodsImg() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "GoodsImg [goodsCode=" + goodsCode + ", fileName=" + fileName + ", originName=" + originName
				+ ", contentType=" + contentType + ", createdate=" + createdate + ", updatedate=" + updatedate + "]";
	}

	public int getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
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
