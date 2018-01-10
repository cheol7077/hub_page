package board.vo;

public class BoardVO {
	private int id;
	private String title;
	private String content;
	private String date_posted;
	private String link;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate_posted() {
		return date_posted;
	}
	public void setDate_posted(String date_posted) {
		this.date_posted = date_posted;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
}
