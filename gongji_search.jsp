<meta http-equiv="Content-Type" content="text/html; charset=utf-8" language="java" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Search</title>
  <style>
    table,
    tr,
    td {
      border: 1px solid black;
      border-collapse: collapse;
    }
  
    td {
      padding: 4px;
    }
  
    .numbering {
      text-align: center;
    }
  
    span {
      position: absolute;
      top: 40%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
  
    #button {
      float: right;
      margin: 5px 0px;
      border: 1px solid black;
      font-size: medium;
    }
  
    button:hover {
      cursor: pointer;
    }
  </style>
  <% 
    String search = request.getParameter("search");
    String select = request.getParameter("select");
  %>
</head>
<body>
  <% 
    try { 
      Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo33","root","kopo33"); 
      Statement stmt = conn.createStatement(); 
      ResultSet rset = null;
  %>
    <form method="post" name="form">
      <span>
        <table border=1 black 1px>
          <tr align="center">
            <td class="numbering" width=50>번호</td>
            <td width=500>제목</td>
            <td width=100>등록일</td>
          </tr>
          <% 
            if (select.equals("제목")) {
              rset = stmt.executeQuery("select * from gongji where title like '%" + search + "%' order by id desc;"); 
              
            } else if (select.equals("내용")) {
              rset = stmt.executeQuery("select * from gongji where content like '%" + search + "%' order by id desc;");
            }
            while(rset.next()) {
              out.println("<tr><td class='numbering'>"
                  + Integer.toString(rset.getInt(1)) + "</td>"
                  + "<td><a href='gongji_view.jsp?id=" + rset.getInt(1) + "'>"+ rset.getString(2) + "</a></td>"
                  + "<td class='numbering'>" + rset.getString(3) + "</td></tr>");
            }
            rset.close();
            
          %>
        </table>
        <button type=button id="button" onclick="location.href='gongji_list.jsp'">뒤로가기</button>
      </span>
    </form>
    <% 
      stmt.close(); 
      conn.close(); 
    } catch (Exception e) { 
      out.println(e);
      out.println("테이블이 존재하지 않습니다."); 
    } 
    %>
</body>
</html>