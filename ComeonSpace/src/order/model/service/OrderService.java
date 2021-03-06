package order.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import common.pageInfo.model.vo.PageInfo;
import order.model.dao.OrderDAO;
import order.model.vo.Order;

public class OrderService {
	public int insertOrder(Order order) {
		Connection conn = getConnection();
		OrderDAO dao = new OrderDAO();
		
		int result = dao.insertOrder(conn, order);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Order> selectSalesHistory(int userNum, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Order> list = new OrderDAO().selectSalesHistory(conn, userNum, pi);
		
		close(conn);
		return list;
	}

	public Order selectDetail(int no) {
		Connection conn = getConnection();
		Order order = new OrderDAO().selctDetail(conn, no);
		close(conn);
		return order;
	}

	public int getHostListCount(int userNum) {
		Connection conn = getConnection();
		int result = new OrderDAO().getHostListCount(conn, userNum);
		
		close(conn);
		return result;
	}

	public ArrayList<Order> selectList(String userName, PageInfo pi) {
		
			Connection conn = getConnection();
			
			ArrayList<Order> list = new OrderDAO().selectList(conn, userName, pi);
			
			close(conn);
			
			return list;
		}

	public Order selectOrderDetail(int no) {
		
		Connection conn = getConnection();
		Order order = new OrderDAO().selctOrderDetail(conn, no);
		close(conn);
		return order;
		
	}

	public int getGuestListCount(String userName) {
		Connection conn = getConnection();
		int result = new OrderDAO().getGuestListCount(conn, userName);
		
		close(conn);
		return result;
	}

	public int[] getTop3() {
		Connection conn = getConnection();
		int[] result = new OrderDAO().getTop3(conn);
		close(conn);
		return result;
	}

}
