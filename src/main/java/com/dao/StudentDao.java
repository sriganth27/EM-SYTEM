package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entity.department;
import com.entity.event;
import com.entity.student;


public class StudentDao {

	private Connection conn;

	public StudentDao (Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean studentRegister(student d) {
		boolean f= false;
		try {
			String sql = "insert into student (fullname,email,password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getEmail());
			ps.setString(3, d.getPassword());

			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}


public student login(String email , String password) {
	  student d = null;
	  
	  try {
	  String sql = "select * from student where email=? and password=?";
	  PreparedStatement ps = conn.prepareStatement(sql);
	  ps.setString(1, email);
	  ps.setString(2, password);
	  ResultSet rs = ps.executeQuery();
	  
	  while(rs.next())
	  {
		  d = new student();
		  d.setId(rs.getInt(1));
		  d.setFullname(rs.getString(2));
		  d.setEmail(rs.getString(3));
		  d.setPassword(rs.getString(4));
		  
	  }
	
  } catch (Exception e) {
	  e.printStackTrace();
}
	  
	return d;
	  
}

public  List<student> getAllStd(){
	
	 List<student> list = new ArrayList<student>();
	 
	 student d =null;
	 try {
		 String sql = "select * from student order by id desc";
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ResultSet rs = ps.executeQuery();

		 while(rs.next())
		  {
			  d = new student();
			  d.setId(rs.getInt(1));
			  d.setFullname(rs.getString(2));
			  d.setEmail(rs.getString(3));
			  d.setPassword(rs.getString(4));
			  list.add(d);
		  }
		 
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	return list;
	 

}

public student getStdById(int id) {
	
	student d= null;
	try {
		 String sql = "select * from student where id=? ";
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ps.setInt(1, id);
		 ResultSet rs = ps.executeQuery();

		 while(rs.next())
		  {
			  d = new student();
			  d.setId(rs.getInt(1));
			  d.setFullname(rs.getString(2));
			  d.setEmail(rs.getString(3));
			  d.setPassword(rs.getString(4));
			 
		  }
	} catch (Exception e) {
		e.printStackTrace();
	}
	return d;
	
}

public boolean UpdateStd(student d) {
	boolean f= false;
	try {
		String sql = "update student set  fullname=?, email=?, password=? where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, d.getFullname());
		ps.setString(2, d.getEmail());
		ps.setString(3, d.getPassword());
		ps.setInt(4, d.getId());

		int i=ps.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
	
}

public boolean deleteStd(int id) {
	boolean f= false;
	try {
		String sql = "delete from student where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
        int i=ps.executeUpdate();
		
		if(i==1) {
			f=true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
	
}






public List<student> getAllDeptname()
{
	List<student> list= new ArrayList<student>();
	student s = null;
	try {
		String sql="select * from student ";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			s= new student();
			s.setId(rs.getInt(1));
			s.setFullname(rs.getString(2));
			list.add(s);
		}
	} catch (Exception e) {
		
	}
	
	return list;
}


}
