package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DB;

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		DB db;
		try {
			db = new DB();
			con = db.getConnection();
			
			Map params = request.getParameterMap();
			Iterator i = params.keySet().iterator();
		    while ( i.hasNext() )
		      {
		        String key = (String) i.next();
		        String value = ((String[]) params.get( key ))[ 0 ];
		        System.out.println(key +' '+ value);
		      }
			
			//System.out.println(params);
			
			String mode = request.getParameter("mode").trim();
			System.out.println(mode);
			if(mode.equals("edit")){
				String productID = request.getParameter("productID").trim();
				//check edit or new 
				if(productID==""){ //new product
					String model = request.getParameter("model").trim();
					String category = request.getParameter("category").trim();
					String price = request.getParameter("price").trim();
					String imageUrl = request.getParameter("imageUrl").trim();
					String display = request.getParameter("display").trim();
					
					String sqlStr = "INSERT INTO product VALUES (NULL,?,?,?,?,?,current_timestamp, current_timestamp)";
				    PreparedStatement pstmt = con.prepareStatement(sqlStr);
				    
				    //pstmt.setInt(1,"");
					pstmt.setString(1,model);
					pstmt.setString(2,category);
					pstmt.setString(3,price);
					pstmt.setString(4,imageUrl);
					pstmt.setString(5,display);
					//ResultSet rs = pstmt.executeQuery();
					int idx = pstmt.executeUpdate();
					System.out.println(idx);
				}
				
				
			}
			
			
			
			
			/*String sqlStr = "select Userid, Password,UserType from login where Userid =? and Password =? and UserType=?";
		    PreparedStatement pstmt = con.prepareStatement(sqlStr);
		   
			pstmt.setString(1,userName);
			pstmt.setString(2,password);
			pstmt.setString(3,role);
			ResultSet rs = pstmt.executeQuery();  */
			response.getWriter().write("123");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
