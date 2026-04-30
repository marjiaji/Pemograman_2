<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    if(user != null && pass != null && user.equals("ADMIN") && pass.equals("ADMIN")){

        // SESSION
        session.setAttribute("userLogin", user);

        // COOKIE
        Cookie cookieUser = new Cookie("user", user);
        cookieUser.setMaxAge(60*60);
        response.addCookie(cookieUser);

        // REDIRECT
        response.sendRedirect("home.jsp");

    } else {
%>

<html>
<head>
    <title>Login Gagal</title>
</head>
<body>

<h2>LOGIN GAGAL</h2>
<a href="index.jsp">Coba Lagi</a>

</body>
</html>

<%
    }
%>