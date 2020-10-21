package myhomereal;

public class MyHomeUsersVO {
	
		//	필드
	private Long userNum_pk;
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private	String userAddr;
		
		//	생성자
	public MyHomeUsersVO(Long userNum_pk, String userId, String userPw, String userName,
			String userEmail, String userPhone, String userAddr) {
		super();
		this.userNum_pk=userNum_pk;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone=userPhone;
		this.userAddr=userAddr;
	}
	
	public MyHomeUsersVO(String userName, String userId, String userPw, String userEmail, String userAddr, String userPhone) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userAddr = userAddr;
		this.userPhone = userPhone;
	}
	
	public MyHomeUsersVO(String userName, String userId, String userPw) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
	}
	
	public MyHomeUsersVO() {
	}
	
		//	Getters/Setters
	public Long getUserNum_pk() {
		return userNum_pk;
	}

	public void setUserNum_pk(Long userNum_pk) {
		this.userNum_pk = userNum_pk;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
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
	
	

	@Override
	public String toString() {
		return "House [userNum_pk=" + userNum_pk + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail=" + userEmail +", userPhone=" + userPhone +", userAddr=" + userAddr+"]";
	}

}

