<%--
    Created by IntelliJ IDEA.
    User: USER
    Date: 25/05/2025
    Time: 20.27
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
    <title>Laporan Periode ${startDate} - ${endDate} - Bengkelin</title>
    
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

        @media print {
            body,
            #page-container,
            #content-wrapper {
                display: block;
                margin: 0;
                padding: 0;
            }
            #sidebar,
            .topbar,
            .app-footer,
            .breadcrumb,
            .btn {
                display: none !important;
            }
            #main-content {
                padding: 0;
            }
            .card {
                box-shadow: none !important;
                border: 1px solid #dee2e6 !important;
            }
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
                    <h4 class="mb-0 fw-bold d-none d-sm-block">Hasil Laporan Transaksi</h4>
                </div>
                 <div class="d-flex align-items-center">
                    <a href="${pageContext.request.contextPath}/laporan?action=formPeriode" class="btn btn-outline-secondary me-2"><i class="fas fa-edit me-2"></i>Ubah Periode</a>
                    <button class="btn btn-primary" onclick="window.print();"><i class="fas fa-print me-2"></i>Cetak</button>
                </div>
            </header>

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/laporan?action=menu">Pusat Laporan</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/laporan?action=formPeriode">Laporan per Periode</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Hasil</li>
                </ol>
            </nav>

            <div class="alert alert-info" role="alert">
              Menampilkan laporan untuk periode <strong><c:out value="${startDate}"/></strong> sampai <strong><c:out value="${endDate}"/></strong>.
            </div>

            <div class="row g-4 mb-4">
                <div class="col-lg-3 col-md-6"><div class="card shadow-sm h-100"><div class="card-body text-center d-flex flex-column justify-content-center"><h6 class="text-muted card-title">Total Transaksi</h6><h3 class="fw-bold"><c:out value="${transaksiList.size()}" default="0"/></h3></div></div></div>
                <div class="col-lg-3 col-md-6"><div class="card shadow-sm h-100"><div class="card-body text-center d-flex flex-column justify-content-center"><h6 class="text-muted card-title">Total Pendapatan</h6><h3 class="fw-bold"><fmt:formatNumber value="${totalPendapatan}" type="currency"/></h3></div></div></div>
                <div class="col-lg-3 col-md-6"><div class="card shadow-sm h-100"><div class="card-body text-center d-flex flex-column justify-content-center"><h6 class="text-muted card-title">Rata-rata/Transaksi</h6><h3 class="fw-bold"><fmt:formatNumber value="${rataRataPendapatan}" type="currency"/></h3></div></div></div>
                <div class="col-lg-3 col-md-6"><div class="card shadow-sm h-100"><div class="card-body text-center d-flex flex-column justify-content-center"><h6 class="text-muted card-title">Pelanggan Teraktif</h6><c:if test="${not empty topCustomer}"><h4 class="fw-bold mb-0">${topCustomer.nama}</h4><small class="text-muted">(${topCustomer.transactionCount}x)</small></c:if><c:if test="${empty topCustomer}"><p class="mb-0 mt-2">-</p></c:if></div></div></div>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-0 p-3"><h5 class="card-title mb-0">Rincian Transaksi</h5></div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th class="px-3">No. Transaksi</th>
                                    <th>Tanggal</th>
                                    <th>Pelanggan</th>
                                    <th class="text-center">Jml. Item</th>
                                    <th class="text-end">Total Biaya</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty transaksiList}">
                                        <c:forEach var="trx" items="${transaksiList}">
                                            <tr>
                                                <td class="px-3 fw-bold"><a href="${pageContext.request.contextPath}/transaksi?action=detail&noTransaksi=${trx.noTransaksi}">#<c:out value="${trx.noTransaksi}" /></a></td>
                                                <td><fmt:formatDate value="${trx.tanggal}" pattern="dd-MM-yyyy"/></td>
                                                <td><c:out value="${trx.pelanggan.nama}" default="N/A"/></td>
                                                <td class="text-center"><c:out value="${trx.jumlahItemSparePart}" default="0"/></td>
                                                <td class="text-end"><fmt:formatNumber value="${trx.totalBiaya}" type="currency"/></td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr><td colspan="5" class="text-center p-5 text-muted"><i class="fas fa-file-excel fa-2x mb-2"></i><p class="mb-0">Tidak ada transaksi pada periode yang dipilih.</p></td></tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
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
