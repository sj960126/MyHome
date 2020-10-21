package myhomereal;



public class MyHomeOrderListVO {
	//	필드
	private Long orderCode_pk;
	private String userName;
	private String userId;
	private String userEmail;
	private String userPhone;
	private String userAddr;
	
	//	생성자
	public MyHomeOrderListVO(Long orderCode_pk, String userName, String userId, String userEmail, String userPhone, String userAddr) {
		super();
		this.orderCode_pk = orderCode_pk;
		this.userName = userName;
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userAddr = userAddr;
	}
	
	public MyHomeOrderListVO(String userName, String userPhone, String userEmail, String userAddr) {		
		this. userName = userName;			
		this. userPhone = userPhone;
		this. userEmail = userEmail;		
		this. userAddr = userAddr;
	}
	
	
	

	//	Getters/Setters
	public Long getOrderCode_pk() {
		return orderCode_pk;
	}

	public void setOrderCode_pk(Long orderCode_pk) {
		this.orderCode_pk = orderCode_pk;
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
	
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	public String getUserPhone() {
		return userPhone;
	}
	
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	
	public String getUserAddr() {
		return userAddr;
	}

	//	출력용 오버라이드
	@Override
	public String toString() {
		return "";
	}
}
