<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if ("admin".equals(username) && "admin".equals(password)) {
        session.setAttribute("username", username);
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("login.jsp?error=true");
    }
%>