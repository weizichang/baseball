package FSIT03_HitoBaseBall;

public class Team {
	private int teamID;
	private String name;
	private String mail;
	private String contact;
	
	public Team() {}
	
	public void setTeamId(int teamID) {
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
	
	public int getTeamId() {
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
