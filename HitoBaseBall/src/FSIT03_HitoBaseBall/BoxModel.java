package FSIT03_HitoBaseBall;

import java.util.ArrayList;
import java.util.HashMap;

public class BoxModel {
	private ScoreBoardModel board;
	private ArrayList<HashMap<String, String>> awayBatter, homeBatter, awayPitcher, homePitcher;
	
	public void setBoard(ScoreBoardModel board) {
		this.board = board;
	}
	public void setAwayBatter(ArrayList list) {
		this.awayBatter = list;
	}
	public void setHomeBatter(ArrayList list) {
		this.homeBatter = list;
	}
	public void setAwayPitcher(ArrayList list) {
		this.awayPitcher = list;
	}
	public void setHomePitcher(ArrayList list) {
		this.homePitcher = list;
	}
	
	public ScoreBoardModel getBoard() {return board;}
	public ArrayList<HashMap<String, String>> getAwayBatter (){return awayBatter;}
	public ArrayList<HashMap<String, String>> getHomeBatter (){return homeBatter;}
	public ArrayList<HashMap<String, String>> getAwayPitcher (){return awayPitcher;}
	public ArrayList<HashMap<String, String>> getHomePitcher (){return homePitcher;}
	public HashMap<String, String[]> getTotal (String str) { return null;}
	

}
