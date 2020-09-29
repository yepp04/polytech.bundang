package domain;

public class Notice3 {
	private int id;
	private String title;
	private String date;
	private String content;

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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Notice3(int id, String title, String date) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
	}

	public Notice3(int id, String title, String date, String content) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
		this.content = content;
	}

	public Notice3(String title, String date, String content) {
		super();
		this.title = title;
		this.date = date;
		this.content = content;
	}

	public Notice3(String title, int id, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}

}
