package kr.co.sist.user.member;

import java.sql.SQLException;

import org.apache.jasper.tagplugins.jstl.core.Param;

import day1128.ParamDTO;
import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.chipher.DataEncryption;
import siteproperty.SiteProperty;

public class WebMemberService {
	
	private static WebMemberService wmService;
	
	private WebMemberService() {
		
	}//WebMemberService
	
	public static WebMemberService getInstance() {
		if( wmService==null) {
			wmService= new WebMemberService();
		}
		return wmService;
	}//getInstance
	
	public boolean searchId(String id) {
		boolean flag = false;
		
		WebMemberDAO wmDAO = WebMemberDAO.getInstance();
		try {
			flag = wmDAO.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return flag;
		
	}//searchId
	
	public boolean addMember(ParamDTO pDTO, String key) {
		//회원 정보 1개
		boolean flag = false;
		WebMemberDAO wmDAO = WebMemberDAO.getInstance();
		
		if(pDTO.getPass() != null && !"".equals(pDTO.getPass())) {
			try {
				pDTO.setPass(DataEncryption.messageDigest("SHA-1", pDTO.getPass()));
			} catch (Exception e) {
				e.printStackTrace();
			}//end catch
		}//end if
		
		//저장될 데이터의 중요도에 따라 일방향 해시, 암호화 처리.
		//null이나 ""는 일방향해시, 암호화 시 error 발생
		//String key="a123456789012345"; // 16글자
		DataEncryption de = new DataEncryption(key);
		   if (pDTO.getName() != null && !"".equals(pDTO.getName())) {

		         try {
		            pDTO.setName(de.encrypt(pDTO.getName()));
		         } catch (Exception e) {
		            e.printStackTrace();
		         } // end catch

		      } // end if
		      
		      if (pDTO.getEmail() != null && !"".equals(pDTO.getEmail())) {
		         
		         try {
		            pDTO.setEmail(de.encrypt(pDTO.getEmail()));
		         } catch (Exception e) {
		            e.printStackTrace();
		         } // end catch
		         
		      } // end if
		
		
		
		try {
			wmDAO.insertMember(pDTO);
			flag=true;
			//회원 언어 n개
			String[] lang = pDTO.getLanguage();
			if(lang != null) {//선택한 언어가 있다면
				for(String tempLang : lang) {
					wmDAO.insertMemberLang(pDTO.getId(), tempLang);
				}
				
			}//end if
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public ParamDTO searchMember(String id) {
		ParamDTO pDTO = null;
		String key = SiteProperty.spVO.getKey();
		WebMemberDAO wmDAO = WebMemberDAO.getInstance();
			try {
				pDTO = wmDAO.selectMember(id);
				if(pDTO !=null) {
					DataDecryption dd = new DataDecryption(key);
					pDTO.setName(dd.decrypt(pDTO.getName()));
					pDTO.setEmail(dd.decrypt(pDTO.getEmail()));
					
				}//end if
			} catch (SQLException e) {
				e.printStackTrace();
			}catch (Exception e) {
				e.printStackTrace();
			}
		return pDTO;
	}//searchMember
	
	
	public boolean modifyMember(ParamDTO pDTO) {
		//회원 정보 1개
		boolean flag = false;
		WebMemberDAO wmDAO = WebMemberDAO.getInstance();
		String key = SiteProperty.spVO.getKey();
		//저장될 데이터의 중요도에 따라 일방향 해시, 암호화 처리.
		//null이나 ""는 일방향해시, 암호화 시 error 발생
		//String key="a123456789012345"; // 16글자
		DataEncryption de = new DataEncryption(key);
		   if (pDTO.getName() != null && !"".equals(pDTO.getName())) {

		         try {
		            pDTO.setName(de.encrypt(pDTO.getName()));
		         } catch (Exception e) {
		            e.printStackTrace();
		         } // end catch

		      } // end if
		      
		      if (pDTO.getEmail() != null && !"".equals(pDTO.getEmail())) {
		         
		         try {
		            pDTO.setEmail(de.encrypt(pDTO.getEmail()));
		         } catch (Exception e) {
		            e.printStackTrace();
		         } // end catch
		         
		      } // end if
		try {
			flag = wmDAO.updateMember(pDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}//
