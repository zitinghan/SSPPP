package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import database.DB;

/**
 * Servlet implementation class HomeServlet
 */

public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public String getSpecs(String specs) throws JSONException{
    	String html = "";
    	JSONObject jsonObj = new JSONObject(specs.toString());
    	String processor = jsonObj.getString("specs_processor");
    	String ram = jsonObj.getString("specs_memory");
    	String display = jsonObj.getString("specs_sdisplay");
    	html += "<div>"+processor+"</div>";
    	html += "<div>"+ram+"</div>";
    	html += "<div>"+display+"</div>";
    	return html;
    }
    
    
    
    public String getImage(String imagesUrl, String model, int id){
    	String html = "";
    	String images[] = imagesUrl.split(",");
    	String active = "";
    	for (int i = 0; i < images.length; i++) {
    		if(i==0){
    			active = "active";
    		}else{
    			active = "";
    		}
            html += "<div class='item "+active+"'><a href='product_info.jsp?id="+id+"'><img src='"+images[i]+"' alt='"+model+"'></a></div>";
        }
    	
    	return html;
    }
    
    public String getSliderInfoImage(String imagesUrl, String model){
    	String html = "";
    	String images[] = imagesUrl.split(",");
    	String active = "";
    	for (int i = 0; i < images.length; i++) {
    		if(i==0){
    			active = "active";
    		}else{
    			active = "";
    		}
            html += "<div class='item "+active+" slide-image'><img src='"+images[i]+"' alt='"+model+"'></div>";
        }

    	return html;
    }
    
    public String getFirstImage(String imagesUrl, String model, int id){
    	String html = "";
    	if(imagesUrl!=null){
    		String images[] = imagesUrl.split(",");
        	html += "<div class='item productListingImage'><a href='product_info.jsp?id="+id+"'><img src='"+images[0]+"' alt='"+model+"'></a></div>";
    	}
    	return html;
    }
    
    public String getOthersDesc(String othersDesc){
    	String html = "";
    	String desc[] = othersDesc.split(";");
    	for (int i = 0; i < desc.length; i++) {
    		html += "<div class='item'>"+desc[i]+"</div>";
    	}
    	return html;
    }
    
    public String getReview(int id, Boolean onlyRating, Boolean onlyReview){
    	String html = "";
    	
    	Connection con;
		DB db;
		
		try{
			db = new DB();
			con = db.getConnection();
			ResultSet rs;
			PreparedStatement pstmt;
			
			String sqlStr1;
			sqlStr1= "select ROUND(AVG(review_rating)) as avg_review_rating, count(review_rating) as total_rating from `order` where model = ? and review_rating!='Null'";
			pstmt = con.prepareStatement(sqlStr1);
			pstmt.setInt(1,id);
			rs = pstmt.executeQuery();
			int avg_review_rating = 0;
			int total_rating = 0;
			
			while(rs.next()){
				avg_review_rating = rs.getInt("avg_review_rating");
				total_rating = rs.getInt("total_rating");
	        }
			
			// Clean-up environment
	         rs.close();
	         pstmt.close();
	         
	         
	         if(onlyRating==false && onlyReview==false){
	        	 if(total_rating == 1){
	            	 html += "<p class='pull-right'>"+total_rating+" Review</p>";
	             }else if(total_rating > 1){
	            	 html += "<p class='pull-right'>"+total_rating+" Reviews</p>";
	             }else{
	            	 html += "<p class='text-right'>No Review</p>";
	             }
		         
	             if(avg_review_rating>0){
	            	 html += "<p>";
	            	 html += getStarHtml(avg_review_rating);
	    	         html += "</p>";
	             }
	         }else if(onlyRating==true && onlyReview==false){
	        	 if(avg_review_rating>0){
	               	 html += "<p class='text-right'>";
        	         html += getStarHtml(avg_review_rating);
        	         html += "</p>";
	              }
	        	 
	         }else if(onlyRating==false && onlyReview==true){
	        	 
	        	String sqlStr= "select * from `order` where model = ? and review_rating!='Null'";
	 			pstmt = con.prepareStatement(sqlStr);
	 			pstmt.setInt(1,id);
	 			rs = pstmt.executeQuery();
	 			
	 			while(rs.next()){
					String userid = rs.getString("userid");
					int rating = rs.getInt("review_rating");
					String review = rs.getString("review_desc");
					
					
					html += "<div class='media'>";
		        	html += "<div class='media-left'>";
		        	html += "<img class='media-object reviewImg' src='images/blue-user-icon.png' alt='user icon'>";
		        	html += "</div>";
		        	html += "<div class='media-body'>";
		        	html += "<h4 class='media-heading'>"+userid+"</h4>" + getStarHtml(rating);;
		        	html += "<div>"+review+"</div>";
		        	html += "</div>";
		        	html += "</div>";
		        }
				
				// Clean-up environment
		         rs.close();
		         pstmt.close();
	        	 
	        	 
	         }
	         
	         
             
	         con.close();
	         
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return html;
    }
    
    public String getStarHtml(int avg_review_rating){
    	String html = "";
    	
        for(int i=0;i<avg_review_rating;i++){
        	html += "<span class='glyphicon glyphicon-star'></span>";
        }
         
        int emptyStar = 5-avg_review_rating;
        for(int j=0;j<emptyStar;j++){
        	html += "<span class='glyphicon glyphicon-star-empty'></span>";
        }
	        
    	
		return html;
    }
    
    public String getDate(int dayAfter){
    	Calendar now = Calendar.getInstance();
    	now.add(Calendar.DAY_OF_MONTH, dayAfter);
    	int dayOfMonth = now.get(Calendar.DAY_OF_MONTH);
    	
    	int month = now.get(Calendar.MONTH) + 1;
    	String dayOfMonthStr = ((dayOfMonth < 10) ? "0" : "") + month;
    	String monthStr = ((month < 10) ? "0" : "") + month;
    	
    	String date = dayOfMonth+"/"+monthStr+"/"+now.get(Calendar.YEAR);

		return date;
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection con;
		DB db;
		
		try{
			
			db = new DB();
			con = db.getConnection();
			
			ResultSet rs;
			PreparedStatement pstmt;
			PreparedStatement pstmt2;
			
			String productid = request.getParameter("id").trim();
			String userid = request.getParameter("userid").trim();
			String name = request.getParameter("name").trim();
			String price = request.getParameter("price").trim();
			String status = "Ordered";
			

			String sqlStr2 = "Select COUNT(Userid) as count from login where Userid='"+userid+"' AND Name='"+name+"'";
			pstmt2 = con.prepareStatement(sqlStr2);
			rs = pstmt2.executeQuery();
			String cntAcc="";
			while(rs.next()){
				cntAcc = rs.getString("count");
	        }
			

			if(!cntAcc.equals("0")){
				
				String sqlStr = "INSERT INTO `order` VALUES (NULL,?,?,?,?,current_timestamp,?,current_timestamp, current_timestamp, null, null)";
				pstmt = con.prepareStatement(sqlStr);
				
				pstmt.setString(1,userid);
				pstmt.setString(2,price);
				pstmt.setString(3,productid);
				pstmt.setString(4,status);
				pstmt.setString(5,null);
				
				pstmt.executeUpdate();
				pstmt.close();
				response.setContentType("application/json");
		        response.getWriter().write("true");
			}else{
				response.setContentType("application/json");
		        response.getWriter().write("false");
			}
			
		    
		    
			
			// Clean-up environment
	         rs.close();
	         pstmt2.close();
	         con.close();

	        
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}

}
