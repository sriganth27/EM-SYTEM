package com.entity;

public class event {
 
	private int id;
	private int Deptid;
	private String Deptname;
	private String EventCategory;
	private String EventDate;
	private String EventTopic;
	private String ResourcePersonName;
	private String ResourcedPersonDetails;
	 
	private byte[] Broucher;
	private byte[] Image1;
	private  byte[] Image2;
	private String Description;
	
	
	
	public event() {
		super();
		// TODO Auto-generated constructor stub
	}



	public event(int id, int deptid, String deptname, String eventCategory, String eventDate, String eventTopic,
			String resourcePersonName, String resourcedPersonDetails, byte[] broucher, byte[] image1, byte[] image2,
			String description) {
		super();
		this.id = id;
		Deptid = deptid;
		Deptname = deptname;
		EventCategory = eventCategory;
		EventDate = eventDate;
		EventTopic = eventTopic;
		ResourcePersonName = resourcePersonName;
		ResourcedPersonDetails = resourcedPersonDetails;
		Broucher = broucher;
		Image1 = image1;
		Image2 = image2;
		Description = description;
	}



	public event(int deptid, String deptname, String eventCategory, String eventDate, String eventTopic,
			String resourcePersonName, String resourcedPersonDetails, byte[] broucher, byte[] image1, byte[] image2,
			String description) {
		super();
		Deptid = deptid;
		Deptname = deptname;
		EventCategory = eventCategory;
		EventDate = eventDate;
		EventTopic = eventTopic;
		ResourcePersonName = resourcePersonName;
		ResourcedPersonDetails = resourcedPersonDetails;
		Broucher = broucher;
		Image1 = image1;
		Image2 = image2;
		Description = description;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getDeptid() {
		return Deptid;
	}



	public void setDeptid(int deptid) {
		Deptid = deptid;
	}



	public String getDeptname() {
		return Deptname;
	}



	public void setDeptname(String deptname) {
		Deptname = deptname;
	}



	public String getEventCategory() {
		return EventCategory;
	}



	public void setEventCategory(String eventCategory) {
		EventCategory = eventCategory;
	}



	public String getEventDate() {
		return EventDate;
	}



	public void setEventDate(String eventDate) {
		EventDate = eventDate;
	}



	public String getEventTopic() {
		return EventTopic;
	}



	public void setEventTopic(String eventTopic) {
		EventTopic = eventTopic;
	}



	public String getResourcePersonName() {
		return ResourcePersonName;
	}



	public void setResourcePersonName(String resourcePersonName) {
		ResourcePersonName = resourcePersonName;
	}



	public String getResourcedPersonDetails() {
		return ResourcedPersonDetails;
	}



	public void setResourcedPersonDetails(String resourcedPersonDetails) {
		ResourcedPersonDetails = resourcedPersonDetails;
	}



	public byte[] getBroucher() {
		return Broucher;
	}



	public void setBroucher(byte[] broucher) {
		Broucher = broucher;
	}



	public byte[] getImage1() {
		return Image1;
	}



	public void setImage1(byte[] image1) {
		Image1 = image1;
	}



	public byte[] getImage2() {
		return Image2;
	}



	public void setImage2(byte[] image2) {
		Image2 = image2;
	}



	public String getDescription() {
		return Description;
	}



	public void setDescription(String description) {
		Description = description;
	}

   

	

	

	
	
	
	
	
	
	
	
	
	
}
