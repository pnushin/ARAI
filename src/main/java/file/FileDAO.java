package file;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;

public class FileDAO {

	private Connection conn;
	private ResultSet rs;
	
	public FileDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/file";
			String dbID = "root";
			String dbPassword = "pwd10404";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() { 
		String SQL = "SELECT fileID FROM file ORDER BY fileID DESC";
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

	public int write(String fileName, String fileRealName, String title) {
		String SQL = "INSERT INTO file VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, fileName);
			pstmt.setString(3, fileRealName);
			pstmt.setString(4, title);
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<FileDTO> getList(int pageNumber) {
		String SQL = "SELECT * FROM file WHERE fileID < ? ORDER BY fileID DESC LIMIT 100";
		ArrayList<FileDTO> list = new ArrayList<FileDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 100);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FileDTO file = new FileDTO();
				file.setFileID(rs.getInt(1));
				file.setFileName(rs.getString(2));
				file.setFileRealName(rs.getString(3));
				file.setTitle(rs.getString(4));
				list.add(file);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM file WHERE fileID < ?";
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
	
	public FileDTO getFile(int fileID) {
		String SQL = "SELECT * FROM file WHERE fileID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, fileID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				FileDTO file = new FileDTO();
				file.setFileID(rs.getInt(1));
				file.setFileName(rs.getString(2));
				file.setFileRealName(rs.getString(3));
				file.setTitle(rs.getString(4));
				return file;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int fileID, String fileName, String fileRealName, String title) {
		String SQL = "UPDATE file SET fileName = ?, fileRealName = ?, title = ? WHERE fileID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			pstmt.setString(3, title);
			pstmt.setInt(4, fileID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}	
	
	public int getNewNext() {
		String SQL = "SELECT fileID FROM file ORDER BY fileID DESC";
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
	
	public int delete(int fileID) {
		String SQL = "DELETE FROM file WHERE fileID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, fileID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
