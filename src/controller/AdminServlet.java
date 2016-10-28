package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;

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
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String mode = request.getParameter("mode").trim();
		ArrayList<String> datalist = new ArrayList<String>();
		
		JSONObject json      = new JSONObject();
		JSONArray dataSets = new JSONArray();
		JSONObject dataSet;
		
		DB db;
		try {
			db = new DB();
			con = db.getConnection();
			
			if(mode.equals("getAllProductListing")){
				String sqlStr = "select * from product";
			    PreparedStatement pstmt = con.prepareStatement(sqlStr);
				ResultSet rs = pstmt.executeQuery();
				
				
				
				while(rs.next()){
					dataSet = new JSONObject();
					dataSet.put("id", rs.getString("id"));
					dataSet.put("model", rs.getString("model"));
					dataSet.put("brand", rs.getString("brand"));
					dataSet.put("category", rs.getString("category"));
					dataSet.put("price", rs.getString("price"));
					dataSet.put("desc", rs.getString("desc"));
					dataSet.put("imageUrl", rs.getString("imageUrl"));
					dataSet.put("display", rs.getString("display"));
					dataSet.put("create_time", rs.getString("create_time"));
					dataSet.put("update_time", rs.getString("update_time"));

					dataSets.put(dataSet);
					
		            datalist.add(rs.getString("model"));
		            datalist.add(rs.getString("brand"));
		            datalist.add(rs.getString("category"));
		            datalist.add(rs.getString("price"));
		            datalist.add(rs.getString("desc"));
		            datalist.add(rs.getString("imageUrl"));
		            datalist.add(rs.getString("display"));
		            datalist.add(rs.getString("create_time"));
		            datalist.add(rs.getString("update_time"));
		        }
				json.put("Datasets", dataSets);
				
				// Clean-up environment
		         rs.close();
		         pstmt.close();
		         con.close();
		         
		        
				
		        response.setContentType("application/json");
		        response.getWriter().write(json.toString());
		        
				//response.getWriter().println(datalist);
				//System.out.println(datalist);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
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
					String brand = request.getParameter("brand").trim();
					String category = request.getParameter("category").trim();
					String price = request.getParameter("price").trim();
					String desc = request.getParameter("desc").trim();
					String imageUrl = request.getParameter("imageUrl").trim();
					String display = request.getParameter("display").trim();
					
					String sqlStr = "INSERT INTO product VALUES (NULL,?,?,?,?,?,?,?,current_timestamp, current_timestamp)";
				    PreparedStatement pstmt = con.prepareStatement(sqlStr);
				    
				    //pstmt.setInt(1,"");
					pstmt.setString(1,model);
					pstmt.setString(2,brand);
					pstmt.setString(3,category);
					pstmt.setString(4,price);
					pstmt.setString(5,desc);
					pstmt.setString(6,imageUrl);
					pstmt.setString(7,display);
					//ResultSet rs = pstmt.executeQuery();
					int idx = pstmt.executeUpdate();
					System.out.println(idx);
				}
				
				
			}
			
			response.getWriter().println(true);;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}

}
