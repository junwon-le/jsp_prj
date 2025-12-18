package kr.co.sist.map;

import java.util.Date;

public class RestaurantDTO {	


	private int rest_num; //식당 식별 번호
	private String id,rest_name,menu,info; // 회원 아이디 , 식당명, 메뉴, 정보
	private double lat,	lng; //위도, 경도
	private Date input_data; //입력일
	public RestaurantDTO() {
		super();
	}
	public RestaurantDTO(int rest_num, String id, String rest_name, String menu, String info, double lat, double lng,
			Date input_data) {
		super();
		this.rest_num = rest_num;
		this.id = id;
		this.rest_name = rest_name;
		this.menu = menu;
		this.info = info;
		this.lat = lat;
		this.lng = lng;
		this.input_data = input_data;
	}
	public int getRest_num() {
		return rest_num;
	}
	public void setRest_num(int rest_num) {
		this.rest_num = rest_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRest_name() {
		return rest_name;
	}
	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public Date getInput_data() {
		return input_data;
	}
	public void setInput_data(Date input_data) {
		this.input_data = input_data;
	}
	@Override
	public String toString() {
		return "restaurantDTO [rest_num=" + rest_num + ", id=" + id + ", rest_name=" + rest_name + ", menu=" + menu
				+ ", info=" + info + ", lat=" + lat + ", lng=" + lng + ", input_data=" + input_data + "]";
	}
	
	
	
}
