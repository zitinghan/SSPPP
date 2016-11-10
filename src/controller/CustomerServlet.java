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
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import database.DB;

/**
 * Servlet implementation class CustomerServlet
 */

public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con;
		DB db;
		
		HttpSession session=request.getSession(); 
		
		try{
			
			db = new DB();
			con = db.getConnection();
			
			JSONObject json      = new JSONObject();
			JSONArray dataSets = new JSONArray();
			JSONObject dataSet;
			String userID = (String) session.getAttribute("username");
			
			
			String sqlStr = "";
			
			sqlStr += "SELECT `order`.id, `order`.userid, `order`.price, product.model, product.category,`order`.status, `order`.date, product.brand, `order`.collected_date,";
			sqlStr += " `order`.review_rating, `order`.review_desc, product.imageUrl";
			sqlStr += " FROM `order` LEFT JOIN product on `order`.model = product.id";
			sqlStr += " Where `order`.userid = ? order by `order`.create_time desc";
			
		    PreparedStatement pstmt = con.prepareStatement(sqlStr);
		    pstmt.setString(1,userID);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				dataSet = new JSONObject();
				dataSet.put("id", rs.getString("id"));
				dataSet.put("userid", rs.getString("userid"));
				dataSet.put("price", rs.getString("price"));
				dataSet.put("model", rs.getString("model"));
				dataSet.put("category", rs.getString("category"));
				dataSet.put("status", rs.getString("status"));
				dataSet.put("date", rs.getString("date"));
				dataSet.put("brand", rs.getString("brand"));
				dataSet.put("review_rating", rs.getString("review_rating"));
				dataSet.put("review_desc", rs.getString("review_desc"));
				dataSet.put("imageUrl", rs.getString("imageUrl"));
				//dataSet.put("collected_date", rs.getString("collected_date"));
				dataSets.put(dataSet);
	        }
			
			json.put("Datasets", dataSets);
			
			// Clean-up environment
	         rs.close();
	         pstmt.close();
	         con.close();

	        response.setContentType("application/json");
	        response.getWriter().write(json.toString());

	        
			
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
		
		Connection con;
		DB db;
		try {
			db = new DB();
			con = db.getConnection();
			
			String orderID = request.getParameter("id").trim();
			String review = request.getParameter("review").trim();
			String review_rating = request.getParameter("review_rating").trim();
			
			String sqlStr = "UPDATE `order` SET review_rating=?, review_desc=?, update_time=current_timestamp where id=?";


		    PreparedStatement pstmt = con.prepareStatement(sqlStr);
		    
		    pstmt.setString(1,review_rating);
			pstmt.setString(2,review);
			pstmt.setString(3,orderID);

			pstmt.executeUpdate();
			response.getWriter().println(true);
			
			pstmt.close();
	        con.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
