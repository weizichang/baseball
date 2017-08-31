package FSIT03_HitoBaseBall;

import java.util.ArrayList;

public class ScoreBoardModel {
	private String iid,homeTeam, awayTeam, date;
	private ArrayList<String> homeInningScore, awayInningScore;
	private String[] homeRHE, awayRHE;
	
	public void setIid(String name) {
		this.iid = name;
	}
	public void setHomeTeam(String name) {
		this.homeTeam = name;
	}
	public void setAwayTeam(String name) {
		this.awayTeam = name;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setHomeInningScore(ArrayList<String> list) {
		this.homeInningScore = list;
	}
	public void setAwayInningScore(ArrayList<String> list) {
		this.awayInningScore = list;
	}
	public void setHomeRHE(String[] str) {
		this.homeRHE = str;
	}
	public void setAwayRHE(String[] str) {
		this.awayRHE = str;
	}
	
	public String getIid() {return iid;}
	public String getHomeTeam () {return homeTeam;}
	public String getAwayTeam () {return awayTeam;}
	public String getDate () {return date;}
	public ArrayList<String> getHomeInningScore() {return homeInningScore;}
	public ArrayList<String> getAwayInningScore() {return awayInningScore;}
	public String[] getHomeRHE () {return homeRHE;}
	public String[] getAwayRHE () {return awayRHE;}
}
