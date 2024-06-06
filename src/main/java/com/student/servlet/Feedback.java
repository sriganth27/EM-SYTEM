package com.student.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Properties;
import java.util.Properties;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.EventDao;
import com.db.DBconnect;
import com.entity.event;
@MultipartConfig
@WebServlet("/feedback")
public class Feedback extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

			String name = req.getParameter("name");
			String regNumber = req.getParameter("regnumber");
			String deptName = req.getParameter("deptname");
			
		    String eventDate = req.getParameter("edate");
			String eventTopic = req.getParameter("etopic");
			String  eventTime = req.getParameter("rpname");
		    String comments = req.getParameter("description");
		    String sentiment = analyzeSentiment(comments);
		    req.setAttribute("sentiment", sentiment);
		    resp.sendRedirect("student/feedback_result.jsp");
			 

		    System.out.println("succes");
		    // Store feedback data into the database
	        storeFeedback(name, regNumber, deptName, eventDate, eventTime, eventTopic, comments, sentiment);
	        
	       
	}
    
    private String analyzeSentiment(String comments) {
        // Simple sentiment analysis
        String[] positiveWords = {"good", "excellent", "great","Well-done" ,"Outstanding", "Impressive", "Exceptional","Admirable" ,"Wonderful",
        		"Fantastic",
        		"Terrific",
        		"Impressive",
        		"Amazing",
        		"Great",
        		"Superb  ","positive" };
        
        String[] negativeWords = {"bad", "poor", "terrible", "worst",
        		"Poor",
        		"not good",
        		"Unsatisfactory",
        		"Disappointing",
        		"Subpar",
        		"Mediocre",
        		"Lackluster",
        		"Inadequate",
        		"Below expectations",
        		"Unimpressive",
        		"Frustrating",		
                "negative"};
        
        comments = comments.toLowerCase();
        
        int positiveCount = 0;
        int negativeCount = 0;
        
        for (String word : positiveWords) {
            if (comments.contains(word)) {
                positiveCount++;
            }
        }
        
        for (String word : negativeWords) {
            if (comments.contains(word)) {
                negativeCount++;
            }
        }
        
        if (positiveCount > negativeCount) {
            return "Positive";
        } else if (negativeCount > positiveCount) {
            return "Negative";
        } else {
            return "Neutral";
        }
    }
        private void storeFeedback(String name, String regNumber, String deptName, String eventDate, String eventTime, String eventTopic, String comments, String sentiment) {
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/ems";
            String user = "root";
            String password = "srivkp@2003";
            try {
            Connection connection = DriverManager.getConnection(url, user, password);
                String sql = "INSERT INTO Feedback (name, reg_number, dept_name, event_date, event_time, event_topic, comments, sentiment) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql); 
                    statement.setString(1, name);
                    statement.setString(2, regNumber);
                    statement.setString(3, deptName);
                    statement.setString(4, eventDate);
                    statement.setString(5, eventTime);
                    statement.setString(6, eventTopic);
                    statement.setString(7, comments);
                    statement.setString(8, sentiment);
                    statement.executeUpdate();
                }
           catch (SQLException e) {
                e.printStackTrace();
            }
        }	
			
		
	}

