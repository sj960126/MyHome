package myhomereal;



public class MyHomeBoardVO {
	String userName;
	String title;
	String content;
	
	public MyHomeBoardVO(String userName, String title, String content) {
		this.userName = userName;
		this.title = title;
		this.content = content;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	@Override
	public String toString() {
		return "BoadVO [ userName=" + userName + ", title=" + title + ", content=" + content+"]";
	}
	
}

