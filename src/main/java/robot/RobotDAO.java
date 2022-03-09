package robot;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import robot.Robot;


public class RobotDAO {
	
	private Connection conn;
	private ResultSet rs;

	public RobotDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/robot";
			String dbID = "root";
			String dbPassword = "pwd10404";
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT robotID FROM robot ORDER BY robotID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String robotTitle, String robotContent, String robotImageName, String robotRealImageName) {
		String SQL = "INSERT INTO robot VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, robotTitle);
			pstmt.setString(3, robotContent);
			pstmt.setString(4, getDate());
			pstmt.setString(5, robotImageName);
			pstmt.setString(6, robotRealImageName);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Robot> getList(int pageNumber) {
		String SQL = "SELECT * FROM robot WHERE robotID < ? ORDER BY robotID DESC LIMIT 5";
		ArrayList<Robot> list = new ArrayList<Robot>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 5);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Robot robot = new Robot();
				robot.setRobotID(rs.getInt(1));
				robot.setRobotTitle(rs.getString(2));
				robot.setRobotContent(rs.getString(3));
				robot.setRobotDate(rs.getString(4));
				robot.setRobotImageName(rs.getString(5));
				robot.setRobotRealImageName(rs.getString(6));
				list.add(robot);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM robot WHERE robotID < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 5);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Robot getRobot(int robotID) {
		String SQL = "SELECT * FROM robot WHERE robotID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, robotID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Robot robot = new Robot();
				robot.setRobotID(rs.getInt(1));
				robot.setRobotTitle(rs.getString(2));
				robot.setRobotContent(rs.getString(3));
				robot.setRobotDate(rs.getString(4));
				robot.setRobotImageName(rs.getString(5));
				robot.setRobotRealImageName(rs.getString(6));
				return robot;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int robotID, String robotTitle, String robotContent, String robotImageName, String robotRealImageName) {
		String SQL = "UPDATE robot SET robotTitle = ?, robotContent = ?, robotImageName = ?, robotRealImageName = ? WHERE robotID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, robotTitle);
			pstmt.setString(2, robotContent);
			pstmt.setString(3, robotImageName);
			pstmt.setString(4, robotRealImageName);
			pstmt.setInt(5, robotID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int getNewNext() {
		String SQL = "SELECT robotID FROM robot ORDER BY robotID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int robotID) {
		String SQL = "DELETE FROM robot WHERE robotID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, robotID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}	
}