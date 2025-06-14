<%--
    Created by IntelliJ IDEA.
    User: USER
    Date: 29/05/2025
    Time: 18.15
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terjadi Kesalahan - Bengkelin</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" xintegrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: "Inter", sans-serif;
            background-color: #f4f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 1rem;
        }
        .error-container {
            max-width: 600px;
            text-align: center;
        }
        .error-icon {
            font-size: 5rem;
            color: #dc3545;
        }
        .error-code {
            font-size: 2rem;
            font-weight: 700;
            color: #6c757d;
        }
        .error-message {
            background-color: #f8d7da;
            border-left: 5px solid #dc3545;
            padding: 1rem;
            margin-top: 1.5rem;
            text-align: left;
            border-radius: 0.25rem;
        }
    </style>
</head>
<body>

    <div class="error-container">
        <div class="error-icon mb-3">
            <i class="fas fa-exclamation-triangle"></i>
        </div>
        
        <h1 class="display-4 fw-bold">Oops! Terjadi Kesalahan</h1>
        <p class="lead text-muted">
            Sepertinya ada masalah di server atau permintaan Anda tidak dapat diproses.
        </p>
        
        <%--
            Logika untuk menampilkan pesan error yang lebih user-friendly.
            Mengecek berbagai kemungkinan atribut error dari servlet.
        --%>
        <c:set var="defaultErrorMsg" value="Terjadi kesalahan yang tidak diketahui. Silakan coba lagi nanti." />
        <c:set var="finalErrorMsg">
            <c:choose>
                <c:when test="${not empty requestScope['javax.servlet.error.message']}">
                    <c:out value="${requestScope['javax.servlet.error.message']}" />
                </c:when>
                <c:when test="${not empty errorMessage}">
                    <c:out value="${errorMessage}" />
                </c:when>
                <c:otherwise>
                    ${defaultErrorMsg}
                </c:otherwise>
            </c:choose>
        </c:set>
        
        <div class="error-message">
            <strong>Pesan Error:</strong>
            <p class="mb-0">${finalErrorMsg}</p>
        </div>
        
        <div class="mt-4">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-primary btn-lg">
                <i class="fas fa-home me-2"></i>Kembali ke Dashboard
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
