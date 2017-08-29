package FSIT03_HitoBaseBall;

public class Player {
	private String playerID;
	private String number;
	private String name;
	private String pos;
	private String Bt;
	private String height;
	private String weight;
	private String Dob;
	private String teamID;
	private String teamname;
	
	public Player() {}
	
	public void setPlayerId(String playerID) {
		this.playerID = playerID;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public void setBt(String Bt) {
		this.Bt = Bt;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public void setDob(String Dob) {
		this.Dob = Dob;
	}
	public void setTeamId(String teamID) {
		this.teamID = teamID;
	}
	public void setTeamName(String teamname) {
		this.teamname = teamname;
	}
	
	public String getPlayerId() {return playerID;}
	public String getNumber() {return number;}
	public String getName() {return name;}
	public String getPos() {return pos;}
	public String getBt() {return Bt;}
	public String getHeight() {return height;}
	public String getWeight() {return weight;}
	public String getDob() {return Dob;}
	public String getTeamId() {return teamID;}
	public String getTeamName() {return teamname;}
}
