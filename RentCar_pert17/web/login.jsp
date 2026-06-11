<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Rent Car</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #1f3a5f, #2c5364);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            width: 400px;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.25);
        }

        .login-card h2 {
            text-align: center;
            color: #1f3a5f;
            margin-bottom: 8px;
        }

        .login-card p {
            text-align: center;
            color: #777;
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 7px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
        }

        input:focus {
            border-color: #1f3a5f;
        }

        button {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: #1f3a5f;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #162c49;
        }

        .alert {
            background: #ffe0e0;
            color: #b00000;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 15px;
        }

        .info {
            text-align: center;
            margin-top: 18px;
            font-size: 13px;
            color: #666;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h2>Aplikasi Rent Car</h2>
        <p>Login Admin untuk masuk ke sistem</p>

        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <div class="alert">Username atau password salah!</div>
        <%
            }
        %>

        <form action="cek_login.jsp" method="post">
            <label>Username</label>
            <input type="text" name="username" placeholder="Masukkan username" required>

            <label>Password</label>
            <input type="password" name="password" placeholder="Masukkan password" required>

            <button type="submit">Login</button>
        </form>

        <div class="info">
            Username: <b>admin</b> | Password: <b>admin</b>
        </div>
    </div>

</body>
</html>