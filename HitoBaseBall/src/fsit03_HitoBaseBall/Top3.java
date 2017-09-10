package fsit03_HitoBaseBall;

import java.util.ArrayList;
import java.util.HashMap;

public class Top3 {
	private ArrayList<HashMap<String, String>> avg;
	private ArrayList<HashMap<String, String>> hits;
	private ArrayList<HashMap<String, String>> rbi;
	private ArrayList<HashMap<String, String>> era;
	private ArrayList<HashMap<String, String>> so;
	private ArrayList<HashMap<String, String>> whip;
	
	public Top3() {}
	
	public void setAvg(ArrayList<HashMap<String, String>> avg) { this.avg = avg;}
	public void setHits(ArrayList<HashMap<String, String>> hits) {this.hits = hits;}
	public void setRbi(ArrayList<HashMap<String, String>> rbi) {this.rbi = rbi;}
	public void setEra(ArrayList<HashMap<String, String>> era) {this.era = era;}
	public void setSo(ArrayList<HashMap<String, String>> so) {this.so = so;}
	public void setWhip(ArrayList<HashMap<String, String>> whip) {this.whip = whip;}
	
	public ArrayList<HashMap<String, String>> getAvg() {return avg;}
	public ArrayList<HashMap<String, String>> getHits() {return hits;}
	public ArrayList<HashMap<String, String>> getRbi() {return rbi;}
	public ArrayList<HashMap<String, String>> getEra() {return era;}
	public ArrayList<HashMap<String, String>> getSo() {return so;}
	public ArrayList<HashMap<String, String>> getWhip() {return whip;}
}
