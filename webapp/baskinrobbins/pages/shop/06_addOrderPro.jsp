<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String log = request.getParameter("log");
String buyer = request.getParameter("buyer");
String tel = request.getParameter("tel");
String addr = request.getParameter("addr");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
%>

<%
int[] cartIceCreamNumberList = new int[1000];
String[] cartBuyerList = new String[1000];
int[] cartSelectSizeList = new int[1000];
int[] cartBuyCountList = new int[1000];

int cartSize = 0;

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "select * from cart where cart_buyer = ?";
	ps = con.prepareStatement(sql);
	ps.setString(1, log);
	rs = ps.executeQuery();
	
	int i = 0;
	while(rs.next()) {
		cartBuyerList[i] = rs.getString(2);
		cartSelectSizeList[i] = rs.getInt(3);
		cartBuyCountList[i] = rs.getInt(4);
		cartIceCreamNumberList[i] = rs.getInt(5);
		
		i += 1;
	}
	cartSize = i;
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}
%>

<%
try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "insert into delivery values(0, ?, ?, ?)";
	ps = con.prepareStatement(sql);
	ps.setString(1, buyer);
	ps.setString(2, addr);
	ps.setString(3, tel);
	ps.executeUpdate();
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}

int delivery_number = 1;

try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "select max(delivery_number) from delivery";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	if(rs.next()) {
		delivery_number = rs.getInt(1);
	}
	
	
} catch(Exception e){
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}

%>

<%
for(int i=0; i<cartSize; i++) {
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		String sql = "insert into ordermenu values(0, ?, ?, ?, ?, ?)";
		ps = con.prepareStatement(sql);
		ps.setInt(1, delivery_number);
		ps.setInt(2, cartIceCreamNumberList[i]);
		ps.setInt(3, cartSelectSizeList[i]);
		ps.setInt(4, cartBuyCountList[i]);
		ps.setString(5, log);
		
		ps.executeUpdate();
		
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		if(con != null) con.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}
	
	
}

%>

<%
try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/Project_Baskin_mysql?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
	
	String sql = "delete from cart where cart_buyer = ?";
	ps = con.prepareStatement(sql);
	ps.setString(1, log);
	ps.executeUpdate();
	
} catch(Exception e) {
	e.printStackTrace();
} finally {
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}

%>




