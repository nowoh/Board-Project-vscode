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
      int totalCount = 0; //총 게시글 수
      int totalPage = 0;  //총 페이지
      int perPage = 10;   //페이지당 게시글 수
      int pageCount = 10; //한 화면에 나타낼 페이지 수
      String pages = request.getParameter("pages"); //받아온 페이지 주소
      int Page = 1;         //페이지 초기화, 페이지 시작
      int startLimit = 0;   //limit문 시작 번호
      int endPage = 0;      //끝 페이지
      int startPage = 0;    //시작 페이지
       
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
              rset = stmt.executeQuery("select count(*) from gongji where title like '%" + search + "%';");
              //총 페이지 계산
              if (rset.next()) {
                if (pages == null) {
                  pages = "1";
                }

                Page = Integer.parseInt(pages);
                totalCount = Integer.parseInt(rset.getString(1));
                totalPage = totalCount / perPage;

                if (totalCount % perPage > 0) {
                  totalPage++;
                }

                if (totalPage < Page) {
                  Page = totalPage;
                }

                startPage = ((Page -1) / 10) * 10 + 1;
                endPage = startPage + pageCount -1;
                
                if (endPage > totalPage) {
                  endPage = totalPage;
                }
                startLimit = 0 + ((Page-1)*10);
                
              }
              rset.close(); 
              rset = stmt.executeQuery("select * from gongji where title like '%" + search + "%' order by id desc limit " + startLimit + "," + perPage + ";");
              
            } else if (select.equals("내용")) {
              rset = stmt.executeQuery("select count(*) from gongji where content like '%" + search + "%';");
              //총 페이지 계산
              if (rset.next()) {
                if (pages == null) {
                  pages = "1";
                }

                Page = Integer.parseInt(pages);
                totalCount = Integer.parseInt(rset.getString(1));
                totalPage = totalCount / perPage;

                if (totalCount % perPage > 0) {
                  totalPage++;
                }

                if (totalPage < Page) {
                  Page = totalPage;
                }

                startPage = ((Page -1) / 10) * 10 + 1;
                endPage = startPage + pageCount -1;
                
                if (endPage > totalPage) {
                  endPage = totalPage;
                }
                startLimit = 0 + ((Page-1)*10);
                
            }
            rset.close(); 
            rset = stmt.executeQuery("select * from gongji where content like '%" + search + "%' order by id desc limit " + startLimit + "," + perPage + ";");
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
        <br><br>
        <div id="Pages">
          <% out.println("<a href=\"?pages=" + 1 + " \">◀◀</a>");
            out.println("<a href=\"?pages=" + (Page-1) + " \">◀</a>");
        
            for (int iCount = startPage; iCount <= endPage; iCount++) { if (iCount==Page) { out.println("<b>" + iCount +
              "</b>");
              } else {
              out.println("<a href=\"?pages=" + iCount + " \">" + iCount + "</a>");
              }
              }
              out.println("<a href=\"?pages=" + (Page+1) + " \">▶</a>");
              out.println("<a href=\"?pages=" + totalPage + " \">▶▶</a>");
              %>
        </div>
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