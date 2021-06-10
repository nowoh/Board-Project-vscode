<meta http-equiv="Content-Type" content="text/html; charset=utf-8" language="java" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <% 
    String title = request.getParameter("title"); 
    String content = request.getParameter("content");
    String number = request.getParameter("number");
  %>
  <title>Write</title>
</head>
<body>
  <% 
    try { 
      Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo33","root","kopo33"); 
      Statement stmt = conn.createStatement(); 

      
      
      if (number == null || number == "") {
        stmt.execute( "insert into gongji (title, date, content)" 
        + "values ('" + title +"', date(now()), '" + content + "');" ); 
        stmt.close(); 
      } else {
        stmt.execute( "update gongji set "
        + "title ='" + title
        + "', content ='" + content 
        + "' where id = " + Integer.parseInt(number) + ";" );
        stmt.close(); 
      }
      

      
      conn.close(); 
    } catch (Exception e) { 
      out.println(e); 
    } 
  %>
  <script>
    $(function() {
      alert("게시글이 등록되었습니다.");
      document.location.href="gongji_list.jsp";
    });
  </script>
</body>
</html>