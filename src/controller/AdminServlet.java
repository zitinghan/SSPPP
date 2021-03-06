package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		JSONObject json      = new JSONObject();
		JSONArray dataSets = new JSONArray();
		JSONObject dataSet;
		
		HttpSession session = request.getSession(false);
		
		DB db;
		try {
			db = new DB();
			con = db.getConnection();
			
			if(mode.equals("getAllProductListing")){
				String userbrand = null;
				userbrand = (String) session.getAttribute("userbrand");
				String sqlStr = "";
				
				ResultSet rs;
				PreparedStatement pstmt;

				if(userbrand != null){
					sqlStr = "select * from product where brand=?";
					pstmt = con.prepareStatement(sqlStr);
				    pstmt.setString(1,userbrand);
				    rs = pstmt.executeQuery();
				}else{
					sqlStr = "select * from product";
					pstmt = con.prepareStatement(sqlStr);
					rs = pstmt.executeQuery();
				}

				while(rs.next()){
					dataSet = new JSONObject();
					dataSet.put("id", rs.getString("id"));
					dataSet.put("model", rs.getString("model"));
					dataSet.put("brand", rs.getString("brand"));
					dataSet.put("category", rs.getString("category"));
					dataSet.put("price", rs.getString("price"));
					dataSet.put("product_desc", rs.getString("product_desc"));
					dataSet.put("imageUrl", rs.getString("imageUrl"));
					dataSet.put("display", rs.getString("display"));
					dataSet.put("featured", rs.getString("featured"));
					dataSet.put("create_time", rs.getString("create_time"));
					dataSet.put("update_time", rs.getString("update_time"));

					dataSets.put(dataSet);
		        }
				json.put("Datasets", dataSets);
				
				// Clean-up environment
		         rs.close();
		         pstmt.close();
		         con.close();

		        response.setContentType("application/json");
		        response.getWriter().write(json.toString());

				//System.out.println(datalist);
			}
			else if(mode.equals("getSelectedProductDetails")){
				String id = request.getParameter("id").trim();
				dataSet = new JSONObject();
				
				String sqlStr = "select * from product where id=?";
			    PreparedStatement pstmt = con.prepareStatement(sqlStr);
			    pstmt.setString(1,id);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					dataSet.put("id", rs.getString("id"));
					dataSet.put("model", rs.getString("model"));
					dataSet.put("brand", rs.getString("brand"));
					dataSet.put("category", rs.getString("category"));
					dataSet.put("price", rs.getString("price"));
					dataSet.put("product_desc", rs.getString("product_desc"));
					dataSet.put("imageUrl", rs.getString("imageUrl"));
					dataSet.put("display", rs.getString("display"));
					dataSet.put("specs", rs.getString("specs"));
					dataSet.put("others_desc", rs.getString("others_desc"));
					dataSet.put("featured", rs.getString("featured"));
					dataSet.put("create_time", rs.getString("create_time"));
					dataSet.put("update_time", rs.getString("update_time"));
		        }
				
				// Clean-up environment
		         rs.close();
		         pstmt.close();
		         con.close();

		        response.setContentType("application/json");
		        response.getWriter().write(dataSet.toString());
			}
			else if(mode.equals("getOrderListing")){
				String userbrand = (String) session.getAttribute("userbrand");
				String sqlStr = "";
				
				ResultSet rs;
				PreparedStatement pstmt;
				
				if(userbrand != null){
					sqlStr = "SELECT * FROM `order` LEFT JOIN product on `order`.model = product.id where product.brand=?";
					pstmt = con.prepareStatement(sqlStr);
				    pstmt.setString(1,userbrand);
				    rs = pstmt.executeQuery();
				}else{
					sqlStr += "SELECT `order`.id, `order`.userid, `order`.price, product.model, product.category,`order`.status, `order`.date ";
					sqlStr += "FROM `order` LEFT JOIN product on `order`.model = product.id";
					pstmt = con.prepareStatement(sqlStr);
					rs = pstmt.executeQuery();
				}

				while(rs.next()){
					dataSet = new JSONObject();
					dataSet.put("id", rs.getString("id"));
					dataSet.put("userid", rs.getString("userid"));
					dataSet.put("price", rs.getString("price"));
					dataSet.put("model", rs.getString("model"));
					dataSet.put("date", rs.getString("date"));
					dataSet.put("category", rs.getString("category"));
					dataSet.put("status", rs.getString("status"));
					dataSets.put(dataSet);
		        }
				json.put("Datasets", dataSets);
				
				// Clean-up environment
		         rs.close();
		         pstmt.close();
		         con.close();

		        response.setContentType("application/json");
		        response.getWriter().write(json.toString());
			
			}
			else if(mode.equals("getSelectedOrderDetails")){
			
				String id = request.getParameter("id").trim();
				dataSet = new JSONObject();
				
				String sqlStr = "";
				
				sqlStr += "SELECT `order`.id, `order`.userid, `order`.price, product.model, product.category,`order`.status, `order`.date, product.brand, `order`.collected_date";
				sqlStr += " FROM `order` LEFT JOIN product on `order`.model = product.id";
				sqlStr += " Where `order`.id = ?";
				
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
					//dataSet.put("collected_date", rs.getString("collected_date"));
		        }
				
				// Clean-up environment
		         rs.close();
		         pstmt.close();
		         con.close();

		        response.setContentType("application/json");
		        response.getWriter().write(dataSet.toString());
			}
			else if(mode.equals("getTotalSellProductByBrand")){
				
				String userbrand = (String) session.getAttribute("userbrand");
				String sqlStr = "";
				
				ResultSet rs;
				PreparedStatement pstmt;
				
				if(userbrand != null){
					sqlStr += "SELECT product.brand, count(product.brand) as total_brand FROM `order` LEFT JOIN product on `order`.model = product.id ";
					sqlStr += "where `order`.status in ('Collect', 'Deliver') AND product.brand =?";
					sqlStr += "Group By product.brand";
					pstmt = con.prepareStatement(sqlStr);
				    pstmt.setString(1,userbrand);
				    rs = pstmt.executeQuery();
				}else{
					sqlStr += "SELECT product.brand, count(product.brand) as total_brand FROM `order` LEFT JOIN product on `order`.model = product.id ";
					sqlStr += "where `order`.status in ('Collect', 'Deliver')";
					sqlStr += "Group By product.brand";
							
					pstmt = con.prepareStatement(sqlStr);
					rs = pstmt.executeQuery();
				}

				while(rs.next()){
					dataSet = new JSONObject();
					dataSet.put("label", rs.getString("brand"));
					dataSet.put("data", rs.getString("total_brand"));
					dataSets.put(dataSet);
		        }
				json.put("Datasets", dataSets);
				
				// Clean-up environment
		         rs.close();
		         pstmt.close();
		         con.close();

		        response.setContentType("application/json");
		        response.getWriter().write(json.toString());
			}
			else if(mode.equals("getTotalSellProductByProduct")){
				
				String userbrand = (String) session.getAttribute("userbrand");
				String sqlStr = "";
				
				ResultSet rs;
				PreparedStatement pstmt;
				
				if(userbrand != null){
					sqlStr += "SELECT product.model,count(product.model) as total_model FROM `order` LEFT JOIN product on `order`.model = product.id ";
					sqlStr += "where `order`.status in ('Collect', 'Deliver') AND product.brand =?";
					sqlStr += "Group By product.model";
					pstmt = con.prepareStatement(sqlStr);
				    pstmt.setString(1,userbrand);
				    rs = pstmt.executeQuery();
				}else{
					sqlStr += "SELECT product.model,count(product.model) as total_model FROM `order` LEFT JOIN product on `order`.model = product.id ";
					sqlStr += "where `order`.status in ('Collect', 'Deliver') ";
					sqlStr += "Group By product.model";
							
					pstmt = con.prepareStatement(sqlStr);
					rs = pstmt.executeQuery();
				}

				while(rs.next()){
					dataSet = new JSONObject();
					dataSet.put("label", rs.getString("model"));
					dataSet.put("data", rs.getString("total_model"));
					dataSets.put(dataSet);
		        }
				json.put("Datasets", dataSets);
				
				// Clean-up environment
		         rs.close();
		         pstmt.close();
		         con.close();

		        response.setContentType("application/json");
		        response.getWriter().write(json.toString());
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
		        //System.out.println(key +' '+ value);
		      }
			
			//System.out.println(params);
			
			String mode = request.getParameter("mode").trim();
			//System.out.println(mode);
			if(mode.equals("orderEdit")){
				String orderID = request.getParameter("orderID").trim();
				String orderStatus = request.getParameter("orderStatus").trim();
				
				String sqlStr;
				if(orderStatus.equals("Collect") || orderStatus.equals("Deliver")){
					sqlStr = "UPDATE `order` SET status=?, collected_date=current_timestamp, update_time=current_timestamp where id=?";
				}else{
					sqlStr = "UPDATE `order` SET status=?, update_time=current_timestamp where id=?";
				}

			    PreparedStatement pstmt = con.prepareStatement(sqlStr);
			    
			    pstmt.setString(1,orderStatus);
				pstmt.setString(2,orderID);

				pstmt.executeUpdate();
				response.getWriter().println(true);
			}
			else if(mode.equals("edit")){
				String productID = request.getParameter("productID").trim();
				//check edit or new 
				if(productID==""){ //new product
					String model = request.getParameter("model").trim();
					String brand = request.getParameter("brand").trim();
					String category = request.getParameter("category").trim();
					String price = request.getParameter("price").trim();
					String product_desc = request.getParameter("product_desc").trim();
					String[] imageUrl = request.getParameterValues("imageUrl");
					String display = request.getParameter("display").trim();
					String others_desc = request.getParameter("others_desc").trim();
					String featured = null;
					if (request.getParameterMap().containsKey("featured")) {
						featured = request.getParameter("featured").trim();
			        }
					
					// get multiple image
					int cnt = 0;
					String longImage = "";
					for(String value : imageUrl) {
						if(value!=null || value!=""){
							if(cnt==0){
								longImage += value;
							}else{
								longImage += ","+value;
							}
							cnt++;
						}
				    }
					
					// specs detials
					String processor = request.getParameter("processor").trim();
					String chipset = request.getParameter("chipset").trim();
					String memory = request.getParameter("memory").trim();
					String harddiskdrive = request.getParameter("harddiskdrive").trim();
					String sdisplay = request.getParameter("sdisplay").trim();
					String graphics = request.getParameter("graphics").trim();
					String communication = request.getParameter("communication").trim();
					String opticaldrive = request.getParameter("opticaldrive").trim();
					String iointerface = request.getParameter("iointerface").trim();
					String audio = request.getParameter("audio").trim();
					String operatingsystem = request.getParameter("operatingsystem").trim();
					String additionalsoftware = request.getParameter("additionalsoftware").trim();
					String mousepointer = request.getParameter("mousepointer").trim();
					String other = request.getParameter("other").trim();
					String warranty = request.getParameter("warranty").trim();
					String weightbattery = request.getParameter("weightbattery").trim();
					String supplier = request.getParameter("supplier").trim();
					
					JSONObject specs = new JSONObject();
				
					specs.put("specs_processor", processor);
					specs.put("specs_chipset", chipset);
					specs.put("specs_memory", memory);
					specs.put("specs_harddiskdrive", harddiskdrive);
					specs.put("specs_sdisplay", sdisplay);
					specs.put("specs_graphics", graphics);
					specs.put("specs_communication", communication);
					specs.put("specs_opticaldrive", opticaldrive);
					specs.put("specs_iointerface", iointerface);
					specs.put("specs_audio", audio);
					specs.put("specs_operatingsystem", operatingsystem);
					specs.put("specs_additionalsoftware", additionalsoftware);
					specs.put("specs_mousepointer", mousepointer);
					specs.put("specs_other", other);
					specs.put("specs_warranty", warranty);
					specs.put("specs_weightbattery", weightbattery);
					specs.put("specs_supplier", supplier);
					
					
					
					String sqlStr = "INSERT INTO product VALUES (NULL,?,?,?,?,?,?,?,?,?,?,current_timestamp, current_timestamp)";
				    PreparedStatement pstmt = con.prepareStatement(sqlStr);
				    
				    //pstmt.setInt(1,"");
					pstmt.setString(1,model);
					pstmt.setString(2,brand);
					pstmt.setString(3,category);
					pstmt.setString(4,price);
					pstmt.setString(5,product_desc);
					pstmt.setString(6,longImage);
					pstmt.setString(7,display);
					pstmt.setString(8, specs.toString());
					pstmt.setString(9, others_desc);
					pstmt.setString(10, featured);
					//ResultSet rs = pstmt.executeQuery();
					int idx = pstmt.executeUpdate();
					//System.out.println(idx);
					response.getWriter().println(true);
				}
				else{
					
					
					String id = request.getParameter("productID").trim();
					String model = request.getParameter("model").trim();
					String brand = request.getParameter("brand").trim();
					String category = request.getParameter("category").trim();
					String price = request.getParameter("price").trim();
					String product_desc = request.getParameter("product_desc").trim();
					String[] imageUrl = request.getParameterValues("imageUrl");
					
					String display = request.getParameter("display").trim();
					String others_desc = request.getParameter("others_desc").trim();
					String featured = null;
					if (request.getParameterMap().containsKey("featured")) {
						featured = request.getParameter("featured").trim();
			        }
					
					int cnt = 0;
					String longImage = "";
					for(String value : imageUrl) {
						if(value!=null || value!=""){
							if(cnt==0){
								longImage += value;
							}else{
								longImage += ","+value;
							}
							cnt++;
						}
						
				    }
					//System.out.println(longImage);
					
					// specs detials
					String processor = request.getParameter("processor").trim();
					String chipset = request.getParameter("chipset").trim();
					String memory = request.getParameter("memory").trim();
					String harddiskdrive = request.getParameter("harddiskdrive").trim();
					String sdisplay = request.getParameter("sdisplay").trim();
					String graphics = request.getParameter("graphics").trim();
					String communication = request.getParameter("communication").trim();
					String opticaldrive = request.getParameter("opticaldrive").trim();
					String iointerface = request.getParameter("iointerface").trim();
					String audio = request.getParameter("audio").trim();
					String operatingsystem = request.getParameter("operatingsystem").trim();
					String additionalsoftware = request.getParameter("additionalsoftware").trim();
					String mousepointer = request.getParameter("mousepointer").trim();
					String other = request.getParameter("other").trim();
					String warranty = request.getParameter("warranty").trim();
					String weightbattery = request.getParameter("weightbattery").trim();
					String supplier = request.getParameter("supplier").trim();

					JSONObject specs = new JSONObject();
				
					specs.put("specs_processor", processor);
					specs.put("specs_chipset", chipset);
					specs.put("specs_memory", memory);
					specs.put("specs_harddiskdrive", harddiskdrive);
					specs.put("specs_sdisplay", sdisplay);
					specs.put("specs_graphics", graphics);
					specs.put("specs_communication", communication);
					specs.put("specs_opticaldrive", opticaldrive);
					specs.put("specs_iointerface", iointerface);
					specs.put("specs_audio", audio);
					specs.put("specs_operatingsystem", operatingsystem);
					specs.put("specs_additionalsoftware", additionalsoftware);
					specs.put("specs_mousepointer", mousepointer);
					specs.put("specs_other", other);
					specs.put("specs_warranty", warranty);
					specs.put("specs_weightbattery", weightbattery);
					specs.put("specs_supplier", supplier);
					
					
					String sqlStr = "UPDATE product SET model=?, brand=?, category=?, price=?, product_desc=?, imageUrl=?, display=?, specs=?, others_desc=?, featured=?, update_time=current_timestamp where id=?";
				    PreparedStatement pstmt = con.prepareStatement(sqlStr);
				    
				    //pstmt.setInt(1,"");
					pstmt.setString(1,model);
					pstmt.setString(2,brand);
					pstmt.setString(3,category);
					pstmt.setString(4,price);
					pstmt.setString(5,product_desc);
					pstmt.setString(6,longImage);
					pstmt.setString(7,display);
					pstmt.setString(8, specs.toString());
					pstmt.setString(9, others_desc);
					pstmt.setString(10, featured);
					pstmt.setString(11,id);
					//ResultSet rs = pstmt.executeQuery();
					//System.out.println(pstmt);
					pstmt.executeUpdate();
					
				}
				
			}
			
			response.getWriter().println(true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}

}
