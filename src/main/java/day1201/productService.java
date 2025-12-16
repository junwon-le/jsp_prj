package day1201;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class productService {

	
	public List<productDTO> searchPrd(){
		List<productDTO> list= new ArrayList<productDTO>();
		
		list.add(new productDTO("img_1.jpg","음... 뭐지?","넌 아냐?",3500,new Date()));
		list.add(new productDTO("img_2.jpg","몰루?","혹시 민병조씨는 아는가?",23500,new Date(System.currentTimeMillis()-(60*60*24))));
		list.add(new productDTO("img_3.jpg","이건 못참지","오늘도 수고 하셨습니다.",500,new Date(System.currentTimeMillis()-(60*60*24*2))));
		
		return list;
	}//searchPrd
}
