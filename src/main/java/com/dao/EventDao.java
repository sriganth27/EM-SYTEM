package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.event;

public class EventDao {
 
	private Connection conn;

	public EventDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean eddEvent(event e) {
		boolean f= false;
		
		try {
			String sql = "insert into event_details(dept_id,dept_name,event_category,event_date,event_topic,event_time,resource_person_details,broucher,image1,image2,description) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setInt(1, e.getDeptid());;
			ps.setString(2, e.getDeptname());
			ps.setString(3, e.getEventCategory());
			ps.setString(4, e.getEventDate());
			ps.setString(5, e.getEventTopic());
			ps.setString(6, e.getResourcePersonName());
			ps.setString(7, e.getResourcedPersonDetails());
			ps.setBytes(8, e.getBroucher() );
			ps.setBytes(9, e.getImage1());
			ps.setBytes(10, e.getImage2());
			ps.setString(11, e.getDescription());
		
           int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		return f;
	}
	
	public boolean updateEvent(event e) {
		boolean f= false;
		
		try {
			String sql = "update event_details set dept_id=?, dept_name=?, event_category=?, event_date=?, event_topic=?, event_time=?, resource_person_details=?, broucher=?, image1=?, image2=?, description=? where id=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setInt(1, e.getDeptid());
			ps.setString(2, e.getDeptname());
			ps.setString(3, e.getEventCategory());
			ps.setString(4, e.getEventDate());
			ps.setString(5, e.getEventTopic());
			ps.setString(6, e.getResourcePersonName());
			ps.setString(7, e.getResourcedPersonDetails());
			ps.setBytes(8, e.getBroucher() );
			ps.setBytes(9, e.getImage1());
			ps.setBytes(10, e.getImage2());
			ps.setString(11, e.getDescription());
		    ps.setInt(12, e.getId());
           int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		return f;
	}
	
	public boolean  deleteEvent(int id) {
		  boolean f =false;
		  
		  try {
			 String sql = "delete from event_details where id=?";
			 PreparedStatement ps = conn.prepareStatement(sql);
			 ps.setInt(1,id);
			 
			 int i = ps.executeUpdate();
			 if(i==1) {
				 f = true;
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		  
	  }
	
	public List<event> getAllEventByLoginDept(int Deptid){
		
		
		List<event> list = new ArrayList<event>();
		event e = null;
		try {
			String sql ="select * from event_details where dept_id=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Deptid);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				e=new event();
			
				e.setId(rs.getInt(1));
				e.setDeptid(rs.getInt(2));
				e.setDeptname(rs.getString(3));
				e.setEventCategory(rs.getString(4));
				e.setEventDate(rs.getString(5));
				e.setEventTopic(rs.getString(6));
				e.setResourcePersonName(rs.getString(7));
				e.setResourcedPersonDetails(rs.getString(8));
				e.setBroucher(rs.getBytes(9));
				e.setImage1(rs.getBytes(10));
				e.setImage2(rs.getBytes(11));
				e.setDescription(rs.getString(12));
				list.add(e);
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		return list;
		
	}
public event getEventById2(int id){
		
		
		
		event e = null;
		try {
			String sql ="select * from event_details where dept_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				e=new event();
			
				e.setId(rs.getInt(1));
				e.setDeptid(rs.getInt(2));
				e.setDeptname(rs.getString(3));
				e.setEventCategory(rs.getString(4));
				e.setEventDate(rs.getString(5));
				e.setEventTopic(rs.getString(6));
				e.setResourcePersonName(rs.getString(7));
				e.setResourcedPersonDetails(rs.getString(8));
				e.setBroucher(rs.getBytes(9));
				e.setImage1(rs.getBytes(10));
				e.setImage2(rs.getBytes(11));
				e.setDescription(rs.getString(12));
				
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		return e;
		
	}
	
public event getEventById(int id){
		
		
		
		event e = null;
		try {
			String sql ="select * from event_details where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				e=new event();
			
				e.setId(rs.getInt(1));
				e.setDeptid(rs.getInt(2));
				e.setDeptname(rs.getString(3));
				e.setEventCategory(rs.getString(4));
				e.setEventDate(rs.getString(5));
				e.setEventTopic(rs.getString(6));
				e.setResourcePersonName(rs.getString(7));
				e.setResourcedPersonDetails(rs.getString(8));
				e.setBroucher(rs.getBytes(9));
				e.setImage1(rs.getBytes(10));
				e.setImage2(rs.getBytes(11));
				e.setDescription(rs.getString(12));
				
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		return e;
		
	}
	
public List<event> getAllEvent(){
		
		
		List<event> list = new ArrayList<event>();
		event e = null;
		try {
			String sql ="select * from event_details order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
		
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				e=new event();
				e.setId(rs.getInt(1));
				e.setDeptid(rs.getInt(2));
				e.setDeptname(rs.getString(3));
				e.setEventCategory(rs.getString(4));
				e.setEventDate(rs.getString(5));
				e.setEventTopic(rs.getString(6));
				e.setResourcePersonName(rs.getString(7));
				e.setResourcedPersonDetails(rs.getString(8));
				e.setBroucher(rs.getBytes(9));
				e.setImage1(rs.getBytes(10));
				e.setImage2(rs.getBytes(11));
				e.setDescription(rs.getString(12));
				list.add(e);
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
