<meta http-equiv="Content-Type" content="text/html; charset=utf-8" language="java" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>delete</title>
  <% 
    Integer number = Integer.parseInt(request.getParameter("number")); 
    %>
</head>
<body>
  <% 
    try { 
      Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo33","root","kopo33"); 
      Statement stmt = conn.createStatement(); 
      stmt.execute("delete from gongji where id=" + number +";");
	
      stmt.close();
      conn.close();
    } catch (Exception e) {
	    out.println("테이블이 존재하지 않습니다.");
    }
  %>
  <script>
    $(function () {
      alert("게시글이 삭제되었습니다.");
      document.location.href = "gongji_list.jsp";
    });
  </script>
</body>
</html>