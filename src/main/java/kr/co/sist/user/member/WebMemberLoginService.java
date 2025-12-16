package kr.co.sist.user.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import day1128.ParamDTO;
import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.chipher.DataEncryption;

public class WebMemberLoginService {
	private static WebMemberLoginService wmls;
	
	private WebMemberLoginService() {
		
	}//WebMemberLoginService
	
	public static WebMemberLoginService getInstance() {
		if(wmls ==null) {
			wmls= new WebMemberLoginService();
		}//end if
		return wmls;
	}// getInstance
	
	public ParamDTO searchLogin( LoginDTO lDTO , String key) {
		ParamDTO pDTO = null;
		
		//비밀번호는 일방향 해시
		if(lDTO.getPassword()!=null && !lDTO.getPassword().isEmpty()) {
			try {
				lDTO.setPassword(DataEncryption.messageDigest("SHA-1", lDTO.getPassword()));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}//end catch
		}//end if
		
		WebMemberLoginDAO wmlDAO = WebMemberLoginDAO.getInstance("jdbc/dbcp");
		try {
			pDTO = wmlDAO.selectLogin(lDTO);
			//pDTO에는 id, name(암호화 => 복호화), birth 가 할당
			DataDecryption dd = new DataDecryption(key); //대칭키 : 암호화 키와 복호와 키가 같아야 한다.
			try {
				pDTO.setName(dd.decrypt(pDTO.getName()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return pDTO;
	}
}//class
