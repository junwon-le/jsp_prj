package day1119;

public class CalendarDTO {
	private String paramYear,paramMonth;

	public CalendarDTO() {
		super();
	}

	public CalendarDTO(String paramYear, String paramMonth) {
		super();
		this.paramYear = paramYear;
		this.paramMonth = paramMonth;
	}

	public String getParamYear() {
		return paramYear;
	}

	public void setParamYear(String paramYear) {
		this.paramYear = paramYear;
	}

	public String getParamMonth() {
		return paramMonth;
	}

	public void setParamMonth(String paramMonth) {
		this.paramMonth = paramMonth;
	}

	@Override
	public String toString() {
		return "ParamDTO [paramYear=" + paramYear + ", paramMonth=" + paramMonth + "]";
	}
	
	
}
