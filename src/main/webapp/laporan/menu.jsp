<%--
    Created by IntelliJ IDEA.
    User: USER
    Date: 25/05/2025
    Time: 20.26
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="id_ID"/>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pusat Laporan - Bengkelin</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" xintegrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --sidebar-width: 260px;
            --sidebar-bg: #212529;
            --main-bg: #f4f7fa;
        }
        html,
        body {
            height: 100%;
            overflow-x: hidden;
            font-family: "Inter", sans-serif;
            background-color: var(--main-bg);
        }
        #page-container {
            display: flex;
            min-height: 100vh;
        }
        #sidebar {
            width: var(--sidebar-width);
            background-color: var(--sidebar-bg);
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            transition: transform 0.3s ease-in-out;
            z-index: 1030;
        }
        .sidebar-header {
            padding: 1.5rem;
            text-align: center;
            border-bottom: 1px solid #343a40;
        }
        .sidebar-header a {
            color: white;
            text-decoration: none;
            font-size: 1.5rem;
            font-weight: 700;
        }
        .sidebar-header i {
            color: #0d6efd;
        }
        .sidebar-nav {
            list-style: none;
            padding: 0;
            margin-top: 1rem;
        }
        .sidebar-nav .nav-item {
            border-left: 3px solid transparent;
            transition: all 0.2s ease;
        }
        .sidebar-nav .nav-link {
            color: #adb5bd;
            text-decoration: none;
            display: block;
            font-weight: 500;
            padding: 0.75rem 1.5rem;
        }
        .sidebar-nav .nav-link i {
            margin-right: 1rem;
            width: 20px;
            text-align: center;
        }
        .sidebar-nav .nav-item:hover,
        .sidebar-nav .nav-item.active {
            background-color: #343a40;
            border-left-color: #0d6efd;
        }
        .sidebar-nav .nav-item:hover .nav-link,
        .sidebar-nav .nav-item.active .nav-link {
            color: white;
        }
        #content-wrapper {
            flex-grow: 1;
            margin-left: var(--sidebar-width);
            transition: margin-left 0.3s ease-in-out;
            min-width: 0;
            display: flex;
            flex-direction: column;
        }
        #main-content {
            flex: 1;
            padding: 1.5rem;
        }
        .topbar {
            background-color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .topbar .profile .dropdown-toggle::after {
            display: none;
        }
        .topbar .profile-pic {
            width: 40px;
            height: 40px;
        }
        .app-footer {
            padding: 1.5rem;
            margin-top: auto;
            background-color: #fff;
            border-top: 1px solid #dee2e6;
        }
        .report-card {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .report-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        @media (max-width: 992px) {
            #sidebar {
                transform: translateX(calc(-1 * var(--sidebar-width)));
            }
            #content-wrapper {
                margin-left: 0;
            }
            body.sidebar-toggled #sidebar {
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>

<div id="page-container">
    <aside id="sidebar">
        <div class="sidebar-header"><a href="${pageContext.request.contextPath}/home"><i class="fas fa-tools"></i> Bengkelin</a></div>
        <ul class="sidebar-nav">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pelanggan?action=list"><i class="fas fa-users"></i> Pelanggan</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/sparepart?action=list"><i class="fas fa-cogs"></i> Spare Part</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/transaksi?action=list"><i class="fas fa-cash-register"></i> Transaksi</a></li>
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/laporan?action=menu"><i class="fas fa-chart-line"></i> Laporan</a></li>
        </ul>
    </aside>

    <div id="content-wrapper">
        <div id="main-content">
            <header class="topbar d-flex align-items-center justify-content-between mb-4">
                <div class="d-flex align-items-center">
                    <button class="btn btn-light d-lg-none me-3" id="sidebar-toggle-button" type="button"><i class="fas fa-bars"></i></button>
                    <h4 class="mb-0 fw-bold d-none d-sm-block">Pusat Laporan</h4>
                </div>
                 <div class="d-flex align-items-center">
                    <div class="dropdown"><a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-bell fs-5 text-secondary"></i></a></div>
                    <div class="dropdown ms-3 profile"><a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><img src="https://placehold.co/100x100/0d6efd/white?text=P" alt="Petugas" class="rounded-circle profile-pic"><div class="ms-2 d-none d-md-block"><div class="fw-bold">Petugas</div></div></a><ul class="dropdown-menu dropdown-menu-end shadow-lg border-0"><li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li></ul></div>
                </div>
            </header>
            
            <div class="p-4 mb-4 bg-primary-subtle border border-primary-subtle rounded-3">
                <h2 class="display-6 fw-bold">Analisis Bisnis Anda</h2>
                <p class="lead">Gunakan laporan di bawah ini untuk mendapatkan wawasan mendalam mengenai performa bengkel, tren penjualan, dan perilaku pelanggan.</p>
            </div>

            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card h-100 report-card">
                        <div class="card-body d-flex flex-column">
                            <div class="mb-3">
                                <i class="fas fa-calendar-alt fa-2x text-primary"></i>
                            </div>
                            <h4 class="card-title">Laporan Transaksi per Periode</h4>
                            <p class="card-text text-muted">Lihat daftar transaksi yang terjadi dalam rentang tanggal tertentu. Analisis tren penjualan dan layanan.</p>
                            <div class="mt-auto">
                                <a href="${pageContext.request.contextPath}/laporan?action=formPeriode" class="btn btn-primary"><i class="fas fa-file-alt me-2"></i>Buat Laporan</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100 report-card">
                        <div class="card-body d-flex flex-column">
                            <div class="mb-3">
                                <i class="fas fa-users-cog fa-2x text-primary"></i>
                            </div>
                            <h4 class="card-title">Laporan Pelanggan per Spare Part</h4>
                            <p class="card-text text-muted">Identifikasi pelanggan yang sering membeli atau menggunakan spare part tertentu. Berguna untuk strategi marketing.</p>
                             <div class="mt-auto">
                                <a href="${pageContext.request.contextPath}/laporan?action=formSparePart" class="btn btn-primary"><i class="fas fa-file-alt me-2"></i>Buat Laporan</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <footer class="app-footer">
            <p class="text-center text-muted small mb-0">&copy; <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy" /> Bengkelin - Dibuat dengan <i class="fas fa-heart text-danger"></i> untuk Tugas PBO.</p>
        </footer>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const sidebarToggleButton = document.getElementById('sidebar-toggle-button');
            if (sidebarToggleButton) {
                sidebarToggleButton.addEventListener('click', function() {
                    document.body.classList.toggle('sidebar-toggled');
                });
            }
        });
    </script>
</body>
</html>
