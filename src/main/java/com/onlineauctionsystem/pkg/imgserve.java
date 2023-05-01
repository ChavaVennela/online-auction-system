package com.onlineauctionsystem.pkg;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.File;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



@WebServlet("/upload")
@MultipartConfig
public class imgserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public imgserve() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prodName = request.getParameter("prodname");
	    String brand = request.getParameter("brand");
	    String colour = request.getParameter("colour");
	    String category = request.getParameter("gridRadios");
	    String isRefurbishedStr = request.getParameter("isrefurb");
	    int basePrice = Integer.parseInt(request.getParameter("baseprice"));
	    int secretPrice = Integer.parseInt(request.getParameter("secretprice"));
	    int minIncrement = Integer.parseInt(request.getParameter("minincrement"));
	    boolean avail = true;
	    
//	    String a = request.getParameter("abcd");
//	    System.out.println("hi world");
//	    System.out.println(a);
//	    if(a == null) {
//	    	System.out.println("checked null");
//	    }
	    
	    String expiryTime = request.getParameter("exptime");
	    boolean isRefurbished = false;
	    if(isRefurbishedStr != null && isRefurbishedStr.equals("on")) {
	        isRefurbished = true;
	    }
	    
	    HttpSession session = request.getSession();
	    String username = (String) session.getAttribute("user");
	    
	    System.out.println("hello world");
	    System.out.println(isRefurbished);
	    System.out.println(basePrice);
	    System.out.println(secretPrice);
	    System.out.println(expiryTime);
	    System.out.println(username);
	    
	    ApplicationDB DBconnect = new ApplicationDB();
		Connection con = DBconnect.getConnection();
		
		try {
			
			String insert = "INSERT INTO Item(Price, username, expireTime, secretsellerprice, increment,currentbid, availability)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);
			ps.setLong(1, basePrice);
			ps.setString(2, username);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			LocalDateTime expireTime = LocalDateTime.parse(expiryTime, formatter);
			ps.setTimestamp(3, Timestamp.valueOf(expireTime));
			ps.setLong(4, secretPrice);
			ps.setLong(5, minIncrement);
			ps.setLong(6, basePrice);
			ps.setBoolean(7, avail);
			ps.executeUpdate();
			System.out.println("insert succeeded");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String filename = "";
		Part filePart = request.getPart("imgfile");
	    if(filePart != null && filePart.getSize() > 0) {
		    System.out.println(filePart);
		    String file_Name = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		    File upload = new File("/Users/rohit/eclipse-workspace/online-auction-system/src/main/webapp/product-images");
		    filename = prodName+colour+brand+".jpg";
		    File file = new File(upload, filename);
		    	
		    try (InputStream fileContent = filePart.getInputStream()) {
		    	Files.copy(fileContent, file.toPath());
		    }
	    }
		
		try {
			Statement st = con.createStatement();
			ResultSet rs;
			rs = st.executeQuery("select count(*) from Item");
			if (rs.next()) {
				int count = rs.getInt(1);
				System.out.println("Total count: " + count);
				String insert = "INSERT INTO ItemDetails(Itemid,Itemname,category, color, brand, refurbished, imgpath)"
						+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setLong(1, count);
				ps.setString(2, prodName);
				ps.setString(3, category);
				ps.setString(4, colour);
				ps.setString(5, brand);
				ps.setBoolean(6, isRefurbished);
				ps.setString(7, filename);
				ps.executeUpdate();
				System.out.println("insert succeeded");
				con.close();
				response.sendRedirect("home.jsp");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			PrintWriter out = response.getWriter();
			out.print(e);
			out.print("product add failed");
			out.print("<a href='home.jsp'>Home</a>");
		}
		
	       
	}

}
