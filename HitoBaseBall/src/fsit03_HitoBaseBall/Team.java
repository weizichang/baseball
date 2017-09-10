package fsit03_HitoBaseBall;

public class Team {
	private String teamID;
	private String name;
	private String mail;
	private String contact;
	
	public Team() {}
	
	public void setTeamId(String teamID) {
		this.teamID = teamID;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public String getTeamId() {
		return teamID;
	}
	
	public String getName() {
		return name;
	}
	
	public String getMail() {
		return mail;
	}
	
	public String getContact() {
		return contact;
	}
}
