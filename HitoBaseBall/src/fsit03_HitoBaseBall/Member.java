package fsit03_HitoBaseBall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class Member {
	private String regisAcc, regisPass, hashregisPass, memberName, loginAcc, loginPass, forgetAcc, forgetPass, hashforgetPass;
	private Connection conn;
	private PreparedStatement ps;
	
	public Member() throws Exception {
			//1.Driver Import
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("Driver OK!!!");		
			
			//2.Build Connection
			Properties prop = new Properties();
			prop.setProperty("user", "root");
			prop.setProperty("password", "root");
			
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/hitobaseball", prop);
			//System.out.println("Connection OK!");
	}
	
	public void setAccount(String regisAcc) { this.regisAcc = regisAcc; }
	public void setPassword(String regisPass) { this.regisPass = regisPass; }
	public void setName(String memberName) { this.memberName = memberName; }
	public void setLoginAcc(String loginAcc) { this.loginAcc = loginAcc; }
	public void setLoginPass(String loginPass) { this.loginPass = loginPass; }
	public void setForgetAcc(String forgetAcc) { this.forgetAcc = forgetAcc; }
	public void setForgetPass(String forgetPass) { this.forgetPass = forgetPass; }
	
	public String getAccount() { return regisAcc;  }
	public String getPassword() { return hashregisPass; }
	public String getName() { return memberName; }
	public String getLoginAcc() { return loginAcc; }
	public String getLoginPass() { return loginPass; }
	public String getForgetAcc() { return forgetAcc; }
	public String getForgetPass() { return forgetPass; }
	
	//new Registration
	public int newRegistration() throws Exception {
		String salt = BCrypt.gensalt(12);
		hashregisPass = BCrypt.hashpw(regisPass, salt);
		
		ps = conn.prepareStatement("insert into member(password, mail, mname) values(?, ?, ?)");
		ps.setString(1, hashregisPass);
		ps.setString(2, regisAcc);
		ps.setString(3, memberName);
		
		int n = ps.executeUpdate();
		return n;
	}
	
	//Login
	public boolean Login() throws Exception {
		String sql = "select * from member where mail = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, loginAcc);
		
		ResultSet rs = ps.executeQuery();
		boolean isloginOK = false;
		if(rs.next()) {
			String passwd = rs.getString("password");
			if(passwd == null || !passwd.startsWith("$2a$")) {
				isloginOK = false;
			}else {
				isloginOK = BCrypt.checkpw(loginPass, passwd);
			}
		}
		return isloginOK;
		
	}
	
	//Forget Password
	public int ForgetPass() throws Exception {
		String salt = BCrypt.gensalt(12);
		hashforgetPass = BCrypt.hashpw(forgetPass, salt);
		
		ps = conn.prepareStatement("update member set password = ? where mail = ?");
		ps.setString(1, hashforgetPass);
		ps.setString(2, forgetAcc);
		
		int n = ps.executeUpdate();
		return n;
	}
	
	
	

}
