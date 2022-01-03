package kwonminyoung.ums.user.domain;

import java.sql.Date;

public class User {
	private int userNo;
	private String userName;
	private Date regDate;
	
	public User() {}
	
	public User(int userNo, String userName, Date regDate) {
		this.userNo = userNo;
		this.userName = userName;
		/*this.regDate = regDate;*/
	}
	
	public int getUserNo() {
		return userNo;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return String.format("%d %-6s %s", userNo, userName, regDate);
	}
}