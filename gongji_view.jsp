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
  <title>view</title>
  <% 
    Integer id = Integer.parseInt(request.getParameter("id")); 
  %>
  <script>
    $(document).ready(function () {
      console.log("ready!");
    });
  </script>
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

    .table {
      position: absolute;
      top: 40%;
      left: 50%;
      transform: translate(-50%, -50%);
    }

    .btt {
      float: right;
      margin: 5px 1px;
    }
  </style>
</head>

<body>
  <%
    try { 
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kopo33","root","kopo33"); 
        Statement stmt=conn.createStatement(); 
        ResultSet rset = stmt.executeQuery("select * from gongji where id=" + id + ";");
        if (rset.next()) {
          
  %>
  
    <span class="table">
      <table 1px black border=1>
        <tr>
          <td width=50>번호</td>
          <td width=500><%=id%></td>
        </tr>
        <tr>
          <td>제목</td>
          <td><%=rset.getString(2)%></td>
        </tr>
        <tr>
          <td>일자</td>
          <td><%=rset.getString(3)%></td>
        </tr>
        <tr>
          <td>내용</td>
          <td><%=rset.getString(4)%></td>
        </tr>
      </table>     
      <button type=button class="btt" value="수정" onclick="location.href='gongji_update.jsp?id=<%=id%>'">수정</button>
      <button type=button class="btt" value="목록" onclick="history.go(-1)">뒤로가기</button>
    </span>
  
  <% 
    }
    rset.close();
    stmt.close(); 
    conn.close(); 
  } catch (Exception e) { 
    out.println(e); 
  } 
  %>
</body>

</html>