<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả tra cứu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f7f9fa;
        }
        .container {
            max-width: 450px;
            margin: 0 auto;
            background: #fff;
            padding: 24px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .result {
            margin: 20px 0;
            padding: 14px;
            background-color: #f1f8ff;
            border-left: 4px solid #007bff;
            border-radius: 4px;
            font-size: 16px;
        }
        .not-found {
            margin: 20px 0;
            padding: 14px;
            background-color: #fff3cd;
            border-left: 4px solid #ffc107;
            border-radius: 4px;
            color: #856404;
            font-size: 16px;
        }
        a {
            display: inline-block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Kết Quả Tra Cứu</h2>

    <%
        // Thiết lập mã hóa UTF-8 cho request
        request.setCharacterEncoding("UTF-8");

        // Khởi tạo từ điển bằng Map
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển sách");
        dictionary.put("computer", "Máy tính");
        dictionary.put("student", "Học sinh / Sinh viên");
        dictionary.put("teacher", "Giáo viên");

        // Lấy từ khóa người dùng nhập từ form
        String search = request.getParameter("search");
        String result = null;

        if (search != null) {
            String word = search.trim().toLowerCase();
            result = dictionary.get(word);
        }
    %>

    <% if (result != null) { %>
        <div class="result">
            <p><strong>Từ tiếng Anh:</strong> <%= search %></p>
            <p><strong>Nghĩa tiếng Việt:</strong> <%= result %></p>
        </div>
    <% } else { %>
        <div class="not-found">
            <p>Không tìm thấy từ: "<strong><%= (search != null ? search : "") %></strong>" trong từ điển!</p>
        </div>
    <% } %>

    <a href="index.jsp">&larr; Quay lại trang tìm kiếm</a>
</div>
</body>
</html>

