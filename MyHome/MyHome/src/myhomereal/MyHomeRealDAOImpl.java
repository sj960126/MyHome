package myhomereal; 

import java.sql.*;

import java.util.ArrayList;
import java.util.List;


public class MyHomeRealDAOImpl implements MyHomeRealDAO {
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(dburl, "myhome", "0000");
		} catch (ClassNotFoundException e) {
			System.err.println("JDBC 드라이버 로드 실패!");
		}
		return conn;
	}
	
	@Override
	public List<MyHomeUsersVO> getList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//	데이터 전송을 위한 리스트
		List<MyHomeUsersVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT userNum_pk, userId, userPw, userName, " 
				+ "userEmail, userPhone, userAddr "
				+ "FROM users";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyHomeUsersVO myhomeusersVO = new MyHomeUsersVO(
						rs.getLong(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						);
				list.add(myhomeusersVO);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return list;
	}

	@Override
	public MyHomeUsersVO get(Long userNum_pk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MyHomeUsersVO myhomeusersVO = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT userNum_pk, " +
					"userId, userPw, userName, userEmail, userPhone, userAddr " +
					"FROM users " +
					"WHERE userNum_pk= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, userNum_pk);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				myhomeusersVO = new MyHomeUsersVO(
						rs.getLong(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return myhomeusersVO;
	}

	@Override
	public boolean insert1(MyHomeUsersVO myhomeusersVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO users " + 
			"VALUES(seq_users_code.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myhomeusersVO.getUserName());
			pstmt.setString(2, myhomeusersVO.getUserId());
			pstmt.setString(3, myhomeusersVO.getUserPw());
			pstmt.setString(4, myhomeusersVO.getUserEmail());
			pstmt.setString(5, myhomeusersVO.getUserPhone());
			pstmt.setString(6, myhomeusersVO.getUserAddr());
			
			insertedCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return insertedCount == 1;
	}
	
//	@Override
//	public boolean insertOrder(MyHomeUsersVO myhomeusersVO) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		int insertedCount = 0;
//		
//		try {
//			conn = getConnection();
//			String sql = "INSERT INTO users " + 
//			"VALUES(userNum_pk.nextval, ?, ?, ?, ?, ?, ?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, myhomeusersVO.getUserId());
//			pstmt.setString(2, myhomeusersVO.getUserPw());
//			pstmt.setString(3, myhomeusersVO.getUserName());
//			pstmt.setString(4, myhomeusersVO.getUserEmail());
//			pstmt.setString(5, myhomeusersVO.getUserPhone());
//			pstmt.setString(6, myhomeusersVO.getUserAddr());
//			
//			insertedCount = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.err.println("ERROR:" + e.getMessage());
//		} finally {
//			try {
//				if (pstmt != null) pstmt.close();
//				if (conn != null) conn.close();
//			} catch (Exception e) {
//				System.err.println("ERROR:" + e.getMessage());
//			}
//		}
//		return insertedCount == 1;
//	}

	@Override
	public boolean delete(Long userNum_pk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int deletedCount = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM users WHERE userNum_pk=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, userNum_pk);
			
			deletedCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return deletedCount == 1;
	}
	
	@Override
	public List<MyHomeOrderListVO> getList1() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//	데이터 전송을 위한 리스트
		List<MyHomeOrderListVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT orderCode_pk, userName, userId, userEmail, userPhone, userAddr " +
						"FROM orderList " ;
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyHomeOrderListVO myhomeorderListVO = new MyHomeOrderListVO(
						rs.getLong(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)
						);
				list.add(myhomeorderListVO);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return list;
	}

	@Override
	public MyHomeOrderListVO get1(Long orderCode_pk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MyHomeOrderListVO myhomeorderListVO = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT orderCode_pk, userName, " +
					"userId, userEmail, userPhone, userAddr FROM orderList " +
					"WHERE orderCode_pk = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, orderCode_pk);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				myhomeorderListVO = new MyHomeOrderListVO(
						rs.getLong(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6)
						);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return myhomeorderListVO;
	}

	@Override
	public boolean insert(MyHomeOrderListVO myhomeorderListVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO orderList " +
					"VALUES(seq_order_code.nextval, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myhomeorderListVO.getUserName());
			pstmt.setString(2, myhomeorderListVO.getUserId());
			pstmt.setString(3, myhomeorderListVO.getUserEmail());
			pstmt.setString(4, myhomeorderListVO.getUserPhone());
			pstmt.setString(5, myhomeorderListVO.getUserAddr());
			
			insertedCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return insertedCount == 1;
	}

	@Override
	public boolean delete1(Long orderCode_pk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int deletedCount = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM orderList WHERE orderCode_pk= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, orderCode_pk);
			
			deletedCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return deletedCount == 1;
	}
	
	@Override
	public String getCount(String category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String x="";
		
		try {
			conn = getConnection();
			String sql = "SELECT count(*)" +
					" FROM orderDetail" +
					" WHERE category = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getString(1);
			}
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return x;
	}
	
//	@Override
//	public List<MyHomeUsersVO> getList2() {
//		Connection conn = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		
//		//	데이터 전송을 위한 리스트
//		List<MyHomeUsersVO> list = new ArrayList<>();
//		
//		try {
//			conn = getConnection();
//			stmt = conn.createStatement();
//			String sql = "SELECT u.userNum_pk, u.userId, u.userPw, u.userName, " 
//				+ "u.userEmail, u.userPhone, u.userAddr, u.orderCode_fk "
//				+ "FROM users u, orderList o "
//				+ "WHERE u.orderCode_fk = o.orderCode_pk ";
//			
//			rs = stmt.executeQuery(sql);
//			
//			while(rs.next()) {
//				MyHomeUsersVO myhomefindVO = new MyHomeUsersVO(
//						rs.getLong(1),
//						rs.getString(2),
//						rs.getString(3),
//						rs.getString(4),
//						rs.getString(5),
//						rs.getString(6),
//						rs.getString(7),
//						rs.getLong(8)
//						);
//				list.add(myhomefindVO);
//			}
//		} catch (SQLException e) {
//			System.err.println("ERROR:" + e.getMessage());
//		}
//		
//		return list;
//	}

	@Override
	public MyHomeUsersVO get(String userName, String userEmail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MyHomeUsersVO myhomefindVO = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT userId " +
					"FROM users " +
					"WHERE userName= ? " +
					"AND userEmail = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				myhomefindVO = new MyHomeUsersVO();
				myhomefindVO.setUserId(rs.getString(1));
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return myhomefindVO;
	}
	
	@Override
	public MyHomeUsersVO get2(String userId, String userEmail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MyHomeUsersVO myhomepwfindVO = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT userPw " +
					"FROM users " +
					"WHERE userId= ? " +
					"AND userEmail = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userEmail);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				myhomepwfindVO = new MyHomeUsersVO();
				myhomepwfindVO.setUserPw(rs.getString(1));
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return myhomepwfindVO;
	}
	
	@Override
	public boolean joincheck(String userName, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT * " +
					"FROM users " +
					"WHERE userName= ? " +
					"AND userId = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userName);
			pstmt.setString(2, userId);
			
			
			insertedCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return insertedCount == 1;
	}
	
//	@Override
//	public boolean insert1(MyHomeUsersVO myhomejoinVO) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		int insertedCount = 0;
//		
//		try {
//			conn = getConnection();
//			String sql = "INSERT INTO users " +
//					"VALUES(seq_users_code.nextval, ?, ?, ?, ?, ?, ?, 0)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, myhomejoinVO.getUserName());
//			pstmt.setString(2, myhomejoinVO.getUserId());
//			pstmt.setString(3, myhomejoinVO.getUserPw());
//			pstmt.setString(4, myhomejoinVO.getUserEmail());
//			pstmt.setString(5, myhomejoinVO.getUserAddr());
//			pstmt.setString(6, myhomejoinVO.getUserPhone());
//			
//			insertedCount = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			System.err.println("ERROR:" + e.getMessage());
//		} finally {
//			try {
//				if (pstmt != null) pstmt.close();
//				if (conn != null) conn.close();
//			} catch (Exception e) {
//				System.err.println("ERROR:" + e.getMessage());
//			}
//		}
//		return insertedCount == 1;
//	}
	
	@Override
	public MyHomeUsersVO login(String userId, String userPw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MyHomeUsersVO myhomeloginVO = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT userName, userId, userPw"
					+ " FROM users"
					+ " WHERE userId = ? AND userPw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				myhomeloginVO = new MyHomeUsersVO(						
						rs.getString(1),
						rs.getString(2),
						rs.getString(3)
						);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return myhomeloginVO;
	}
	
	public List<MyHomeReviewVO> getList3(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//	데이터 전송을 위한 리스트
		List<MyHomeReviewVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "select userId, userName, Bcontent, Bday from review";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyHomeReviewVO myhomeorderListVO = new MyHomeReviewVO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getDate(4)						
						);
				list.add(myhomeorderListVO);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return list;
	}
	
	public boolean insert(MyHomeReviewVO reviewBoardVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;
		
		try {
			conn = getConnection();
	         String query = "insert into review values (?, ?, ?, sysdate)";
	         pstmt = conn.prepareStatement(query);
	         
	         pstmt.setString(1, reviewBoardVO.getUserId());
	         pstmt.setString(2, reviewBoardVO.getUserName());
	         pstmt.setString(3, reviewBoardVO.getContent());
	         
	         insertedCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return insertedCount == 1;
	}
	
	@Override
	   public String add_select(String add) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String  x ="";
	      
	      try {
	         conn = getConnection();
	         String sql = "SELECT count(*) " +
	               "FROM users " +
	               "where useraddr LIKE ? ";
	         pstmt = conn.prepareStatement(sql);
	         add = add+"%";
	         pstmt.setString(1,add);
	         
	         rs = pstmt.executeQuery();
	         
	         if (rs.next()) {
	                x = rs.getString(1);
	             }
	      } catch (SQLException e) {
	         System.err.println("ERROR:" + e.getMessage());
	      } finally {
	         try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	         } catch (Exception e) {
	            System.err.println("ERROR:" + e.getMessage());
	         }
	      }
	      return x;
	   }
	
	public List<MyHomeOrderDetailVO> getList4(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//	데이터 전송을 위한 리스트
		List<MyHomeOrderDetailVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "select category, productName, price, orderCode_pk from orderDetail order by orderCode_pk";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyHomeOrderDetailVO BasketVO = new MyHomeOrderDetailVO(
						rs.getString(1),
						rs.getString(2),
						rs.getLong(3),
						rs.getLong(4)
						);
				list.add(BasketVO);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return list;
	}
	
	public boolean insert(MyHomeOrderDetailVO reviewBasketVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;
		
		try {
			conn = getConnection();
			String query = "insert into orderDetail values (seq_order_code.nextval, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query);
			
			//수정
			pstmt.setString(1, reviewBasketVO.getUserName());
			pstmt.setString(2, reviewBasketVO.getUserId());
			pstmt.setLong(3, reviewBasketVO.getPrice());
			pstmt.setString(4, reviewBasketVO.getProductName());
			pstmt.setString(5, reviewBasketVO.getCategory());
			
			insertedCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return insertedCount == 1;
	}
	
	public List<MyHomeReviewVO> getList5(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//	데이터 전송을 위한 리스트
		List<MyHomeReviewVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "select userNum, userName, Bcontent, Bday from review order by Bday";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyHomeReviewVO myhomeorderListVO = new MyHomeReviewVO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getDate(4)						
						);
				list.add(myhomeorderListVO);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return list;
	}
	
	public boolean binsert(MyHomeBoardVO myhomeboardVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;
		
		try {
			conn = getConnection();
	         String query = "insert into board values (?, ?, ?)";
	         pstmt = conn.prepareStatement(query);
	         
	         pstmt.setString(1, myhomeboardVO.getUserName());
	         pstmt.setString(2, myhomeboardVO.getTitle());
	         pstmt.setString(3, myhomeboardVO.getContent());
	         
	         insertedCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return insertedCount == 1;
	}
	
	public List<MyHomeBoardVO> boardList(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//	데이터 전송을 위한 리스트
		List<MyHomeBoardVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "select content, title, userName from board ";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyHomeBoardVO myhomeboardVO = new MyHomeBoardVO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3)					
						);
				list.add(myhomeboardVO);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return list;
	}
	
	public boolean orderList_insert(MyHomeOrderListVO orderlistvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;		
		try {
			conn = getConnection();
			String query = "insert into orderlist values (?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setLong(1, orderlistvo.getOrderCode_pk());			
			pstmt.setString(2, orderlistvo.getUserName());			
			pstmt.setString(3, orderlistvo.getUserId());
			pstmt.setString(4, orderlistvo.getUserEmail());
			pstmt.setString(5, orderlistvo.getUserPhone());
			pstmt.setString(6, orderlistvo.getUserAddr());
			
			insertedCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return insertedCount == 1;
	}
	
	public boolean orderDetail_insert(MyHomeOrderDetailVO reviewBasketVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;
		
		try {
			conn = getConnection();
			String query = "insert into orderdetail values (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setLong(1, reviewBasketVO.getOrderCode_fk());			
			pstmt.setLong(2, reviewBasketVO.getPrice());			
			pstmt.setString(3, reviewBasketVO.getProductName());
			System.out.println(reviewBasketVO.getCategory());
			pstmt.setString(4, reviewBasketVO.getCategory());
			
			insertedCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return insertedCount == 1;
	}
	
	
}
