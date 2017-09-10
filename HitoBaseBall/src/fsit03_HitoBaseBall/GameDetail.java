package fsit03_HitoBaseBall;

import java.sql.ResultSet;
import java.util.ArrayList;

public class GameDetail {
	private ArrayList<ArrayList<String>> details, res;
	private String inning;
	private String Batter;
	private String Pitcher;
	private String pos;
	
	
	public void setDetail(ArrayList details) {
		this.details = details;
	}
	
	public void setInning () {
		
	}
	
	public ArrayList<ArrayList<String>> getRes(){
		for(ArrayList<String> detail : details) {
			for(String d : detail) {
				
			}
		}
		return res;
	}
	

}
