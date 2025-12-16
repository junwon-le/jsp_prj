package day1119;

import java.util.ArrayList;
import java.util.List;

public class dataDAO {

	public List<ImgDTO> selectImg(){
		List<ImgDTO> list = new ArrayList<ImgDTO>();
		
		list.add(new ImgDTO("daum.png","http://daum.net"));
		list.add(new ImgDTO("google.png","http://google.net"));
		list.add(new ImgDTO("naver.png","http://naver.net"));
		
		return list;
	}
}
