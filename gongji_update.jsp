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
  <title>update</title>
  <% 
    Integer id = Integer.parseInt(request.getParameter("id")); 
  %>
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

    .input {
      border: 1px solid black;
    }

    .index {
      text-align: center;
    }

    #content {
      overflow-y: scroll;
      resize: none;
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
  <script>
    $(document).ready(function () {
      console.log("ready!");
    });
  </script>
</head>

<body>
  <% 
    try { 
      Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/kopo33","root","kopo33"); 
      Statement stmt=conn.createStatement(); 
      ResultSet rset=stmt.executeQuery("select * from gongji where id=" + id + " ;");
      if (rset.next()) { 
  %>
  <form method="post" name="form">
  <span class="table">
    <table 1px black border=1>
      <tr>
        <td class="index" width=50>번호</td>
        <td width=500>
          <input type="number" name="number" class="input" maxlength="70" readonly value="<%=id%>" style="width:400px;">
        </td>
      </tr>
      <tr>
        <td class="index">제목</td>
        <td>
          <input type="text" class="input" name="title" class="input" maxlength="70" value="<%=rset.getString(2)%>" style="width:400px;">
        </td>
      </tr>
      <tr>
        <td class="index">일자</td>
        <td><%=rset.getString(3)%></td>
      </tr>
      <tr>
        <td class="index">내용</td>
        <td><textarea name="content" id="content" class="input" cols="60" rows="15"><%=rset.getString(4)%></textarea></td>
      </tr>
    </table>
    <input type=submit class="btt" value="삭제" onclick="javascript: form.action='gongji_delete.jsp';">
    <input type=submit class="btt" value="쓰기" onclick="javascript: form.action='gongji_write.jsp';">
    <input type=button class="btt" value="취소" onclick="location.href='gongji_list.jsp'">

  </span>
  </form>
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