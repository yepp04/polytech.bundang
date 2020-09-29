package domain;

public class Login {
	private String id;
	private String pass;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Login(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}

}
