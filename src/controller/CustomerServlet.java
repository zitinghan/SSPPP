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

import org.json.JSONObject;
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
		
		try{
			
			db = new DB();
			con = db.getConnection();
			
			JSONObject dataSet;
			String id = request.getParameter("id").trim();
			dataSet = new JSONObject();
			
			String sqlStr = "";
			
			sqlStr += "SELECT `order`.id, `order`.userid, `order`.price, product.model, product.category,`order`.status, `order`.date, product.brand, `order`.collected_date";
			sqlStr += " FROM `order` LEFT JOIN product on `order`.model = product.id";
			
		    PreparedStatement pstmt = con.prepareStatement(sqlStr);
		    pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				dataSet.put("id", rs.getString("id"));
				dataSet.put("userid", rs.getString("userid"));
				dataSet.put("price", rs.getString("price"));
				dataSet.put("model", rs.getString("model"));
				dataSet.put("category", rs.getString("category"));
				dataSet.put("status", rs.getString("status"));
				dataSet.put("date", rs.getString("date"));
				dataSet.put("brand", rs.getString("brand"));
				dataSet.put("collected_date", rs.getString("collected_date"));
	        }
			
			// Clean-up environment
	         rs.close();
	         pstmt.close();
	         con.close();

	        response.setContentType("application/json");
	        response.getWriter().write(dataSet.toString());

	        
			
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
		doGet(request, response);
	}

}
