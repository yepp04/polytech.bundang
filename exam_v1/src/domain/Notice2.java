package domain;


public class Notice2 {
	private int id;
	private String title;
	private String date;
	private String content;
	private int rootid;
	private int relevel;
	private int recnt;
	private int viewcnt;
	private String filename;

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

	public int getRootid() {
		return rootid;
	}

	public void setRootid(int rootid) {
		this.rootid = rootid;
	}

	public int getRelevel() {
		return relevel;
	}

	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}

	public int getRecnt() {
		return recnt;
	}

	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	

	public Notice2(String title, String date, String content, int viewcnt, String filename) {
		super();
		this.title = title;
		this.date = date;
		this.content = content;
		this.viewcnt = viewcnt;
		this.filename = filename;
	}

	public Notice2(String title, String date, String content, int rootid, int relevel, int recnt, int viewcnt,
			String filename) {
		super();
		this.title = title;
		this.date = date;
		this.content = content;
		this.rootid = rootid;
		this.relevel = relevel;
		this.recnt = recnt;
		this.viewcnt = viewcnt;
		this.filename = filename;
	}

	public Notice2(int id, String title, String content, String filename) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
	}

	public Notice2(int id, String title, String date, String content, int rootid, int relevel, int recnt, int viewcnt,
			String filename) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
		this.content = content;
		this.rootid = rootid;
		this.relevel = relevel;
		this.recnt = recnt;
		this.viewcnt = viewcnt;
		this.filename = filename;
	}

	public Notice2(int id, String title, String date, String content, int rootid, int relevel, int recnt, int viewcnt) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
		this.content = content;
		this.rootid = rootid;
		this.relevel = relevel;
		this.recnt = recnt;
		this.viewcnt = viewcnt;
	}

	public Notice2(String title, String date, String content, int viewcnt) {
		super();
		this.title = title;
		this.date = date;
		this.content = content;
		this.viewcnt = viewcnt;
	}

	public Notice2(int id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}

	public Notice2(String title, String date, String content, int rootid, int relevel, int recnt, int viewcnt) {
		super();
		this.title = title;
		this.date = date;
		this.content = content;
		this.rootid = rootid;
		this.relevel = relevel;
		this.recnt = recnt;
		this.viewcnt = viewcnt;
	}
	
	
}
