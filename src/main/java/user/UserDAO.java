package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "pwd10404";
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?"; // �Է� ���� userID�� ?�� �Է¹޾Ƽ� USER DB�� �ִ��� Ȯ��
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery(); // ���� ����� rs�� �Է� 
			if (rs.next()) { // DB�� ���̵� ����
				if(rs.getString(1).equals(userPassword)) // ��й�ȣ�� DB�� �Ͱ� ��ġ
					return 1; // �α��� ���� 
				else 
					return 0; // ��й�ȣ ����ġ 	
			}
			return -1; // ���̵� ����
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}
	
	public int join(User user) { // ȸ������ 
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)"; // 4���� ���� DB�� �Է�
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate(); // ���� �� return 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ���� 
	}
}
