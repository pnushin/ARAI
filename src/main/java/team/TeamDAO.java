package team;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import file.FileDTO;

public class TeamDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public TeamDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/team";
			String dbID = "root";
			String dbPassword = "pwd10404";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() { 
		String SQL = "SELECT teamID FROM team ORDER BY teamID DESC";
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
	
	
	public int write(String memberName, String memberIntro, String IDPhotoName, String IDPhotoRealName) {
		String SQL = "INSERT INTO team VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, memberName);
			pstmt.setString(3, memberIntro);
			pstmt.setString(4, IDPhotoName);
			pstmt.setString(5, IDPhotoRealName);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Team> getList(int pageNumber) {
		String SQL = "SELECT * FROM team WHERE teamID < ? ORDER BY teamID LIMIT 100";
		ArrayList<Team> list = new ArrayList<Team>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 100);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Team team = new Team();
				team.setTeamID(rs.getInt(1));
				team.setMemberName(rs.getString(2));
				team.setMemberIntro(rs.getString(3));
				team.setIDPhotoName(rs.getString(4));
				team.setIDPhotoRealName(rs.getString(5));
				list.add(team);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM team WHERE teamID < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 100);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Team getTeam(int teamID) {
		String SQL = "SELECT * FROM team WHERE teamID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, teamID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Team team = new Team();
				team.setTeamID(rs.getInt(1));
				team.setMemberName(rs.getString(2));
				team.setMemberIntro(rs.getString(3));
				team.setIDPhotoName(rs.getString(4));
				team.setIDPhotoRealName(rs.getString(5));
				return team;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int teamID, String memberName, String memberIntro, String IDPhotoName, String IDPhotoRealName) {
		String SQL = "UPDATE team SET memberName = ?, memberIntro = ?, IDPhotoName = ?,  IDPhotoRealName = ? WHERE teamID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberIntro);
			pstmt.setString(3, IDPhotoName);
			pstmt.setString(4, IDPhotoRealName);
			pstmt.setInt(5, teamID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}	
	public int getNewNext() {
		String SQL = "SELECT teamID FROM team ORDER BY teamID DESC";
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
	
	public int delete(int teamID) {
		String SQL = "DELETE FROM team WHERE teamID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, teamID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
