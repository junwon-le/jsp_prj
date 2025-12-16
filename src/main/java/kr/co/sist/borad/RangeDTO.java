package kr.co.sist.borad;

public class RangeDTO {
	private int startNum, endNum;
	private String field, keyword;// 검색 필드 1-,2,3 , 검색 값
	private String fieldStr; //검색 필드값에 대응되는 컬럼명의 문자열
	private String url;
	private int currentPage=1; //이동할 URL, 현재 페이지
	private int totalPage=0; //총 페이지
	//= {"title", "content", "id"} ; 

	
	
	public int getStartNum() {
		return startNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFieldStr() {
		String[] fieldTitle = {"title", "content", "id"};
		int tempField = Integer.parseInt(field);
		if(!(tempField >0 && tempField<4)) {
			tempField = 1;
		}
		fieldStr = fieldTitle[tempField-1];
		return fieldStr;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	@Override
	public String toString() {
		return "RangeDTO [startNum=" + startNum + ", endNum=" + endNum + ", field=" + field + ", keyword=" + keyword
				+ ", fieldStr=" + fieldStr + ", url=" + url + ", currentPage=" + currentPage + "]";
	}

	
}
