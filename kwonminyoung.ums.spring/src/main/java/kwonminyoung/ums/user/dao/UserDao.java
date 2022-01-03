package kwonminyoung.ums.user.dao;

import java.util.List;

import kwonminyoung.ums.user.domain.User;

public interface UserDao {
	List<User> getUsers();			//사용자 정보 목록
	User getUser(int userNo);		//사용자 정보 한명
	int addUser(String userName);	//사용자 정보 추가
	int updateUser(User user);		//사용자 정보 수정
	int delUser(int userNo);		//사용자 정보 삭제
}
