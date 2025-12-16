package day1216;

public class RssDTO {
	private String url,title, engTitle;

	public RssDTO() {
		super();
	} 

	public RssDTO(String url, String title, String engTitle) {
		super();
		this.url = url;
		this.title = title;
		this.engTitle = engTitle;
	}

	public String getEngTitle() {
		return engTitle;
	}
	public void setEngTitle(String engTitle) {
		this.engTitle = engTitle;
	}
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "rssDTO [url=" + url + ", title=" + title + "]";
	}
	
	
}
