package kr.co.sist.map;

import java.io.IOException;
import java.lang.annotation.Retention;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.borad.BoardDTO;
import kr.co.sist.dao.DbConn;

public class RestaurantDAO {
	private static RestaurantDAO rDAO;
	
	private RestaurantDAO() {
		
	}
	
	public static RestaurantDAO getInstance() {
		if(rDAO==null) {
			rDAO = new RestaurantDAO();
		}
		return rDAO;
	}
	
	public List<restaurantDTO> selectAllRestaurant(String id)throws SQLException, IOException{
		List<restaurantDTO> list = new ArrayList<restaurantDTO>();

		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			//1.JNDI객체 생성
			con = dbCon.getConn();
			//2.DataSource 어기
			//3.Connection얻기
			//4.쿼리문 생성 객체 얻기
			StringBuilder selectRestaurant = new StringBuilder();
			selectRestaurant
			.append("	select rest_num, rest_name menu, lat, lng, input_data	")
			.append("	from restaurant_web where id ==? ");
			
			//5.바인등 변수 값 설정
			pstmt = con.prepareStatement(selectRestaurant.toString());
			pstmt.setString(1, id);
			//6.조회결과 얻기
			
			restaurantDTO rDTO = null;
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rDTO = new restaurantDTO();
				rDTO.setRest_num(rs.getInt("rest_num"));
				
				list.add(rDTO);
			}//end while
		}finally {
			//7.연결 끊기 
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		
		return list;
	}//selectAllRestaurant
	
	public void insertRestaurant(restaurantDTO rDTO) throws SQLException{
		
	}//insertRestaurant
	
}
