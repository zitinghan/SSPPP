package controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DB;

public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	Connection con;
	
	public LoginServlet() throws Exception {
		try {
			DB db = new DB();
			con = db.getConnection();
			
			String selectStatement = "select * " + "from login";
			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			ResultSet rs = prepStmt.executeQuery();

			System.out.println("Exception in BookDBAO: " + rs);
			
		} catch (Exception ex) {
			System.out.println("Exception in BookDBAO: " + ex);
			throw new Exception("Couldn't open connection to database: "
					+ ex.getMessage());
		}
	}
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int x = 0;
		
		String userName = request.getParameter("userName").trim();
		String password = request.getParameter("password").trim();
		String role = request.getParameter("role").trim();
		if(userName == null || "".equals(userName)){
			userName = "Guest";
		}
		
		try {
			
			
			
			DB db = new DB();
			con = db.getConnection();
			
			String sqlStr = "select Userid, Password,UserType from login where Userid =? and Password =? and UserType=?";
		    PreparedStatement pstmt = con.prepareStatement(sqlStr);
		   
			pstmt.setString(1,userName);
			pstmt.setString(2,password);
			pstmt.setString(3,role);
			ResultSet rs = pstmt.executeQuery();  
			
			
			  while (rs.next()) {
				  
			      if (rs.getString(1).equals(userName) && rs.getString(2).equals(password) && rs.getString(3).equals("Administrator")  ) {
			          x = 1;
			          System.out.println(x); }
			          else if (rs.getString(1).equals(userName) && rs.getString(2).equals(password) && rs.getString(3).equals("Student")  ) {
			              x = 2;
			              System.out.println(x);  }
			              else if (rs.getString(1).equals(userName) && rs.getString(2).equals(password) && rs.getString(3).equals("Staff")  ) {
			                  x = 2;
			                  System.out.println(x); }   
			              else if (rs.getString(1).equals(userName) && rs.getString(2).equals(password) && rs.getString(3).equals("Supplier")  ) {
			                      x = 3;
			                      System.out.println(x);        
			          
			      } else {
			          x = 4;
			      }
			  }

		} catch (Exception ex) {
			System.out.println("Exception in BookDBAO: " + ex);
			
		}

		response.setContentType("text/plain");
		if(x == 0){
			response.getWriter().write("fail");
		}else{
			response.getWriter().write("success");
		}
		
		
	}



	
}
