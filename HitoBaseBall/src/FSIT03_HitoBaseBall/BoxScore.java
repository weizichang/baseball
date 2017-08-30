package FSIT03_HitoBaseBall;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoxScore")
public class BoxScore extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	private HashMap<String, ArrayList<String>>  setBox() {
		/*
		away team batter:
		SELECT name,
				sum(ab) as AB,
				sum(h) as H,
			    sum(rbi) as RBI,
			    sum(bb) as BB,
			    sum(so) as SO,
			    sum(sb) as sb,
			    format((sum(h) / sum(ab)),2) as AVG
					FROM game_detail as g, players as p
					WHERE g.playerID=p.playerID AND iid=1 AND (inning%2!=0)
			        GROUP BY g.playerID
		    
		   away pitcher:
		   SELECT name, 
				format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1) as IP,
				sum(h) as H,
			    sum(score) as R,
			    sum(bb) as BB,
			    sum(so) as SO,
			    sum(hr) as HR,
			    format(sum(score)*9/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as ERA,
			    format((sum(h)+sum(bb))/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as WHIP
			    FROM game_detail as g, players as p
				WHERE g.pitcherID=p.playerID AND iid<=1 AND (inning%2=0)   
			    GROUP BY g.pitcherID, name
		    
		    home team batter:
		    SELECT name,
				sum(ab) as AB,
				sum(h) as H,
			    sum(rbi) as RBI,
			    sum(bb) as BB,
			    sum(so) as SO,
			    sum(sb) as sb,
			    format((sum(h) / sum(ab)),2) as AVG
					FROM game_detail as g, players as p
					WHERE g.playerID=p.playerID AND iid=1 AND (inning%2=0)
			        GROUP BY g.playerID
		        
		     home pitcher:
			 SELECT name, 
				format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1) as IP,
				sum(h) as H,
			    sum(score) as R,
			    sum(bb) as BB,
			    sum(so) as SO,
			    sum(hr) as HR,
			    format(sum(score)*9/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as ERA,
			    format((sum(h)+sum(bb))/format(((((sum(ao) + sum(go) + sum(so) + sum(gidp)) - ((sum(ao) + sum(go) + sum(so) + sum(gidp))%3)))/3 + (sum(ao) + sum(go) + sum(so) + sum(gidp))%3 *0.1),1),2) as WHIP
			    FROM game_detail as g, players as p
				WHERE g.pitcherID=p.playerID AND iid<=1 AND (inning%2!=0)   
			    GROUP BY g.pitcherID, name
		*/
		return null;
	}
}
