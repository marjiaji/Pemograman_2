<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // CEK SESSION
    String user = (String) session.getAttribute("userLogin");

    if(user == null){
        response.sendRedirect("index.jsp");
    }

    // AMBIL COOKIE
    Cookie[] cookies = request.getCookies();
    String userCookie = "";

    if(cookies != null){
        for(Cookie c : cookies){
            if(c.getName().equals("user")){
                userCookie = c.getValue();
            }
        }
    }
%>

<html>
<head>
    <title>Home</title>
</head>
<body>

<h2>HALAMAN HOME</h2>

<p>Selamat datang (Session): <%= user %></p>
<p>Dari Cookie: <%= userCookie %></p>

<br>
<a href="logout.jsp">Logout</a>

</body>
</html>