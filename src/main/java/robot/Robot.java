package robot;

public class Robot {

	private int robotID;
	private String robotTitle;
	private String robotContent;
	private String robotDate;
	private String robotImageName;
	private String robotRealImageName;
	
	
	

	public void setRobotImageName(String robotImageName) {
		this.robotImageName = robotImageName;
	}

	public String getRobotRealImageName() {
		return robotRealImageName;
	}

	public void setRobotRealImageName(String robotRealImageName) {
		this.robotRealImageName = robotRealImageName;
	}

	public void setRobotTitle(String robotTitle) {
		this.robotTitle = robotTitle;
	}
	public String getRobotContent() {
		return robotContent;
	}
	public void setRobotContent(String robotContent) {
		this.robotContent = robotContent;
	}
	public String getRobotDate() {
		return robotDate;
	}
	public void setRobotDate(String robotDate) {
		this.robotDate = robotDate;
	}
	public int getRobotID() {
		return robotID;
	}
	public void setRobotID(int robotID) {
		this.robotID = robotID;
	}
	public String getRobotTitle() {
		return robotTitle;
	}
	public String getRobotImageName() {
		return robotImageName;
	}
	
}
