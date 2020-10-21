package myhomereal;

import java.util.*;

public class MyHomeReviewVO {
	String userId;
	String userName;
	String content;
	Date sysdate;
	
	public MyHomeReviewVO(String userId, String userName, String content, Date sysdate) {
		this.userId = userId;
		this.userName = userName;
		this.content = content;
		this.sysdate = sysdate;
	}
	
	public MyHomeReviewVO(String userId,String userName, String content) {
		this.userId = userId;
		this.userName = userName;
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSysdate() {
		return sysdate;
	}

	public void setSysdate(Date sysdate) {
		this.sysdate = sysdate;
	}

	@Override
	public String toString() {
		return "BoardVO [userId=" + userId + ", userName=" + userName + ", content=" + content + ", sysdate=" + sysdate
				+ "]";
	}
	
}

