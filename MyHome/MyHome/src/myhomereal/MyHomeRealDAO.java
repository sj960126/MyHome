package myhomereal;

import java.util.List;


public interface MyHomeRealDAO {
	public List<MyHomeUsersVO> getList();
	public MyHomeUsersVO get(Long userNum_pk);
	public boolean insert1(MyHomeUsersVO MyHomeUsersVO);
//	public boolean insertOrder(MyHomeUsersVO myhomeusersVO);
	public boolean delete(Long userNum_pk);
	public boolean joincheck(String userId, String userName);
	
	public List<MyHomeOrderListVO> getList1();
	public MyHomeOrderListVO get1(Long orderCode_pk);
	public boolean insert(MyHomeOrderListVO myhomeorderListVO);
	public boolean delete1(Long orderCode_pk);
	public String getCount(String category);
	
//	public List<MyHomeUsersVO> getList2();
	public MyHomeUsersVO get(String userName, String userEmail);
	public MyHomeUsersVO get2(String userId, String userEmail);
//	public boolean insert1(MyHomeUsersVO myhomejoinVO);
	public MyHomeUsersVO login(String userId, String userPw);
	
	public List<MyHomeReviewVO> getList3();
	public boolean insert(MyHomeReviewVO reviewBoardVO);
	
	public String add_select(String add);
	
	public List<MyHomeOrderDetailVO> getList4();
	public boolean insert(MyHomeOrderDetailVO reviewBasketVO);
	
	public List<MyHomeReviewVO> getList5();
	
	public boolean binsert(MyHomeBoardVO myhomeboardVO);
	public List<MyHomeBoardVO> boardList();
	
	public boolean orderList_insert(MyHomeOrderListVO orderlistvo);
	public boolean orderDetail_insert(MyHomeOrderDetailVO reviewBasketVO);

}
