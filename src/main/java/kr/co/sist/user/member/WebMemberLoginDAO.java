package kr.co.sist.user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import day1128.ParamDTO;
import kr.co.sist.dao.DbConn;

public class WebMemberLoginDAO {
	private static WebMemberLoginDAO wmlDAO;
	private String jndiName;
	
	private WebMemberLoginDAO() {
		
	}
	
	public static WebMemberLoginDAO getInstance(String jndiName) {
		if(wmlDAO == null) {
			wmlDAO = new WebMemberLoginDAO();
			wmlDAO.jndiName = jndiName;
		}
		return wmlDAO;
		
	}//getInstance
	
	public ParamDTO selectLogin(LoginDTO lDTO) throws SQLException{
		ParamDTO pDTO=null;
		//1. JNDI 사용 객체를 생성
		DbConn dbCon = DbConn.getInstance(jndiName);
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
		//2. DataSource를 얻기
		//3. DataSource에서 Connection 얻기
			con = dbCon.getConn();
			String select = " select name,birth,profile from web_member where id=? and password=? ";
			pstmt = con.prepareStatement(select);
			
			pstmt.setString(1, lDTO.getId());
			pstmt.setString(2, lDTO.getPassword());//일방향 Hash된 비번
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//조회된 결과 있음. ( 입력한 아이디오 비번이 맞음.) 
				pDTO=new ParamDTO();
				pDTO.setId(lDTO.getId());
				pDTO.setName(rs.getString("name"));//암호화 되어 있음 => 추후에 복호화 해야 된다.(Service)
				pDTO.setBirth(rs.getString("birth"));
				pDTO.setProfile(rs.getString("profile"));
			}//end if 
		//4. 쿼리문 생성 객체 얻기
		//5. 바인드 변수에 값 설정
		//6. 쿼리문 수행 결과 얻기
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		return pDTO;
	}
	
}//Class
