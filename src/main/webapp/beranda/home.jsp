<%--
    Created by IntelliJ IDEA.
    User: USER
    Date: 25/05/2025
    Time: 20.23
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
    <title>Dashboard - Bengkelin</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" xintegrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --sidebar-width: 260px;
            --sidebar-bg: #212529;
            --main-bg: #f4f7fa;
            --card-hover-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
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
            margin-bottom: 1.5rem;
        }
        
        .topbar .profile .dropdown-toggle::after {
            display: none;
        }
        .topbar .profile-pic {
            width: 40px;
            height: 40px;
        }

        .stat-card {
            border: none;
            border-radius: 0.75rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            overflow: hidden;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--card-hover-shadow);
        }
        .stat-card .card-body {
            position: relative;
            z-index: 1;
        }
        .stat-card .icon-bg {
            position: absolute;
            right: -20px;
            bottom: -20px;
            font-size: 6rem;
            color: rgba(255, 255, 255, 0.15);
            transform: rotate(-15deg);
            z-index: 0;
            transition: transform 0.3s ease;
        }
        .stat-card:hover .icon-bg {
            transform: rotate(-5deg) scale(1.1);
        }
        .main-card {
            border: none;
            border-radius: 0.75rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        .app-footer {
            padding-top: 1.5rem;
            margin-top: 2rem;
            border-top: 1px solid #dee2e6;
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
        <div class="sidebar-header">
            <a href="${pageContext.request.contextPath}/home"><i class="fas fa-tools"></i> Bengkelin</a>
        </div>
        <ul class="sidebar-nav">
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/home"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pelanggan?action=list"><i class="fas fa-users"></i> Pelanggan</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/sparepart?action=list"><i class="fas fa-cogs"></i> Spare Part</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/transaksi?action=list"><i class="fas fa-cash-register"></i> Transaksi</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/laporan?action=menu"><i class="fas fa-chart-line"></i> Laporan</a></li>
        </ul>
    </aside>

    <div id="content-wrapper">
        <div id="main-content">
            <header class="topbar d-flex align-items-center justify-content-between">
                <div class="d-flex align-items-center">
                    <button class="btn btn-light d-lg-none me-3" id="sidebar-toggle-button" type="button">
                        <i class="fas fa-bars"></i>
                    </button>
                    <h4 class="mb-0 d-none d-sm-block">Dashboard Ringkasan</h4>
                </div>
                
                <div class="d-flex align-items-center">
                    <div class="dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-bell fs-5 text-secondary"></i>
                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0" aria-labelledby="notificationDropdown">
                           <li><h6 class="dropdown-header">Notifikasi</h6></li>
                           <li><a class="dropdown-item d-flex align-items-center" href="#"><i class="fas fa-exclamation-triangle text-warning me-2"></i> Stok Aki Motor menipis!</a></li>
                           <li><hr class="dropdown-divider"></li>
                           <li><a class="dropdown-item text-center small text-muted" href="#">Lihat semua notifikasi</a></li>
                       </ul>
                    </div>
                    <div class="dropdown ms-3 profile">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://placehold.co/100x100/0d6efd/white?text=P" alt="Petugas" class="rounded-circle profile-pic">
                            <div class="ms-2 d-none d-md-block">
                                <div class="fw-bold">Petugas</div>
                                <small class="text-muted">Online</small>
                            </div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0" aria-labelledby="profileDropdown">
                             <li><a class="dropdown-item" href="#"><i class="fas fa-user-circle me-2"></i>Profil</a></li>
                             <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Pengaturan</a></li>
                             <li><hr class="dropdown-divider"></li>
                             <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <main class="mt-4">
                <div class="row g-4 mb-4">
                    <div class="col-xl-3 col-md-6"><a href="${pageContext.request.contextPath}/pelanggan?action=list" class="text-decoration-none"><div class="card stat-card bg-primary text-white h-100"><div class="card-body"><h5 class="card-title text-uppercase small">Total Pelanggan</h5><h2 class="display-5 fw-bold"><c:out value="${totalPelanggan}" default="0"/></h2><div class="icon-bg"><i class="fas fa-users"></i></div></div></div></a></div>
                    <div class="col-xl-3 col-md-6"><a href="${pageContext.request.contextPath}/transaksi?action=list" class="text-decoration-none"><div class="card stat-card bg-success text-white h-100"><div class="card-body"><h5 class="card-title text-uppercase small">Transaksi Hari Ini</h5><h2 class="display-5 fw-bold"><c:out value="${transaksiHariIni}" default="0"/></h2><div class="icon-bg"><i class="fas fa-calendar-check"></i></div></div></div></a></div>
                    <div class="col-xl-3 col-md-6"><a href="${pageContext.request.contextPath}/sparepart?action=list" class="text-decoration-none"><div class="card stat-card bg-info text-white h-100"><div class="card-body"><h5 class="card-title text-uppercase small">Jenis Spare Part</h5><h2 class="display-5 fw-bold"><c:out value="${totalSparePart}" default="0"/></h2><div class="icon-bg"><i class="fas fa-sitemap"></i></div></div></div></a></div>
                    <div class="col-xl-3 col-md-6"><a href="${pageContext.request.contextPath}/laporan?action=menu" class="text-decoration-none"><div class="card stat-card bg-warning text-dark h-100"><div class="card-body"><h5 class="card-title text-uppercase small">Pendapatan Bulan Ini</h5><h3 class="fw-bold"><fmt:formatNumber value="${pendapatanBulanIni}" type="currency"/></h3><div class="icon-bg"><i class="fas fa-wallet"></i></div></div></div></a></div>
                </div>
                <div class="row g-4">
                    <div class="col-lg-8"><div class="card main-card h-100"><div class="card-header bg-transparent border-0 py-3"><h5 class="mb-0 fw-bold"><i class="fas fa-history me-2 text-primary"></i>5 Transaksi Terkini</h5></div><div class="card-body p-0"><div class="table-responsive"><table class="table table-hover mb-0 align-middle"><tbody><c:choose><c:when test="${not empty recentTransactions}"><c:forEach var="trx" items="${recentTransactions}"><tr><td class="px-3"><a href="${pageContext.request.contextPath}/transaksi?action=detail&noTransaksi=${trx.noTransaksi}" class="fw-bold text-decoration-none">#<c:out value="${trx.noTransaksi}"/></a></td><td><c:out value="${trx.pelanggan.nama}" default="N/A"/></td>
                                                        <td class="text-muted"><fmt:formatDate value="${trx.tanggal}" pattern="dd-MM-yyyy"/></td>
                                                        <td class="text-end px-3 fw-bold"><fmt:formatNumber value="${trx.totalBiaya}" type="currency"/></td></tr></c:forEach></c:when><c:otherwise><tr><td colspan="4" class="text-center p-5 text-muted">Tidak ada transaksi terkini.</td></tr></c:otherwise></c:choose></tbody></table></div></div></div></div>
                    <div class="col-lg-4"><div class="card main-card h-100"><div class="card-header bg-transparent border-0 py-3"><h5 class="mb-0 fw-bold"><i class="fas fa-exclamation-triangle me-2 text-danger"></i>Stok Menipis</h5></div><div class="card-body p-0"><div class="list-group list-group-flush"><c:choose><c:when test="${not empty lowStockItems}"><c:forEach var="item" items="${lowStockItems}"><a href="${pageContext.request.contextPath}/sparepart?action=edit&kodePart=${item.kodePart}" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center"><div><div class="fw-bold"><c:out value="${item.nama}"/></div><small class="text-muted">Kode: <c:out value="${item.kodePart}"/></small></div><span class="badge bg-danger rounded-pill fs-6"><c:out value="${item.stok}"/></span></a></c:forEach></c:when><c:otherwise><div class="text-center p-5 text-muted"><i class="fas fa-check-circle fa-2x mb-2 text-success"></i><p>Semua stok aman!</p></div></c:otherwise></c:choose></div></div></div></div>
                </div>
            </main>
        </div>
        
        <footer class="app-footer p-3 bg-white mt-auto">
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
