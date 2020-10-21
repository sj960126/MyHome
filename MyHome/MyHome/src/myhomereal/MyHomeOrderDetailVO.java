package myhomereal;



public class MyHomeOrderDetailVO {
	//	필드
	private Long orderCode_fk;
	private String userName;
	private String userId;
	private Long price;
	private String productName;
	private String category;
	
	//	생성자
	public MyHomeOrderDetailVO(Long orderCode_fk, String userName, String userId, Long price, String productName, String category) {
		super();
		this.orderCode_fk = orderCode_fk;
		this.userName = userName;
		this.userId = userId;
		this.price = price;
		this.productName = productName;
		this.category = category;
	}
	
	public MyHomeOrderDetailVO(String category, String productName, Long price, Long orderCode_fk) {
		super();
		this.category = category;
		this.productName = productName;
		this.price = price;
		this.orderCode_fk = orderCode_fk;
	}
	
	public MyHomeOrderDetailVO(Long orderCode_fk, String category, String productName, Long price) {		
		this.orderCode_fk = orderCode_fk;			
		this.category = category;
		this.productName = productName;		
		this.price = price;
	}
	
	//	Getters/Setters
	public Long getOrderCode_fk() {
		return orderCode_fk;
	}

	public void setOrderCode_fk(Long orderCode_fk) {
		this.orderCode_fk = orderCode_fk;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}
	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	//	출력용 오버라이드
	@Override
	public String toString() {
		return category;
	}
}
