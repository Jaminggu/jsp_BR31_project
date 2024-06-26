<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%	
		String filePathStr = application.getRealPath("/baskinrobbins/pages/custom/images/uploadFile/");
		System.out.println(filePathStr);	
		
		File uploadDir = new File(filePathStr);
		
		if (!uploadDir.exists()) {
		    uploadDir.mkdirs();
		}
		
 		int maxPostSize= 1024*1024*10;
		String encoding="UTF-8";	    		
		MultipartRequest mr = new MultipartRequest(request, filePathStr, maxPostSize,encoding, new DefaultFileRenamePolicy());
		
		Enumeration<?> fileList= mr.getFileNames();	 

		String item = "";
		String ofileName = "";
		String reFileName = "";
		
		while(fileList.hasMoreElements()){				
			
			item = (String) fileList.nextElement();
		    ofileName = mr.getOriginalFileName(item);
		   	reFileName = mr.getFilesystemName(item);
	   		
	    } 
		String customName = mr.getParameter("customName");
		String customDescription = mr.getParameter("customDescription");
		String log = mr.getParameter("log");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String[] customIceCrem = new String[3];
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
  			String dbId = "root";
  			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
  			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPw);
  			
  			String sql = "insert into customList(custom_name,custom_imageFileName,custom_description,custom_userId,custom_regDate)"
  						+ "values(?,?,?,?,curDate())";
  			pstmt = conn.prepareStatement(sql);
  			pstmt.setString(1,customName);
  			pstmt.setString(2,reFileName);
  			pstmt.setString(3,customDescription);
  			pstmt.setString(4,log);
  			
  			pstmt.executeUpdate();
  	
			
		}catch(Exception e){
			
			e.printStackTrace();
			
		}finally{
			
			if(conn != null){
				conn.close();			
			}
			if(pstmt != null){
				pstmt.close();	
			}
			if(rs != null){
				rs.close();
			}
  				
			
		}
	
	
	
	
	%>
	
	
	
	
	
</body>
</html>