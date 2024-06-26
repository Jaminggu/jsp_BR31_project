<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String filePathStr = application.getRealPath("/baskinrobbins/pages/board/uploadFile");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
 %>

<%

 	int boardRef = 1;

  try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

		String sql = " SELECT MAX(board_number) FROM board ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		if(rs.next()){
			boardRef = rs.getInt(1);
		}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){ conn.close();	}
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close();	}
		}

%>


<%

  try{

		int maxPostSize= 1024*1024*10;
		String encoding="UTF-8";
		MultipartRequest mr = new MultipartRequest(request, filePathStr, maxPostSize, encoding, new DefaultFileRenamePolicy());


		String 	boardWriterList 	=  mr.getParameter("writer");
		String 	boardSubjectList 	=  mr.getParameter("subject");
		String 	boardContentList 	=  mr.getParameter("content");

		try{
			String jdbcUrl 	= "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
			String dbId 		= "root";
			String dbPw 		= "root";

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

			String sql = " INSERT INTO board (board_number, board_writer, board_subject, board_content) ";
			sql +=	" VALUES(0, ?, ?, ?) ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,boardWriterList);
			pstmt.setString(2,boardSubjectList);
			pstmt.setString(3,boardContentList);

			pstmt.executeUpdate();


		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){ conn.close();	}
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close();	}
		}

		int boardNumber = 1;

		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/project_baskin_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

			String sql = " SELECT max(board_number) from board ";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if(rs.next()){
				boardNumber = rs.getInt(1);
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){ conn.close();	}
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close();	}
		}

	}
	catch(Exception e){
		e.printStackTrace();
	}
%>