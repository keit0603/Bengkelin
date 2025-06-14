<%--
    Created by IntelliJ IDEA.
    User: USER
    Date: 25/05/2025
    Time: 20.41
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
    <title>Detail Transaksi #${transaksi.noTransaksi} - Bengkelin</title>
    
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
                display: block !important;
                margin: 0 !important;
                padding: 0 !important;
                background-color: #fff !important;
            }
            #sidebar,
            .topbar,
            .app-footer,
            .breadcrumb,
            .btn {
                display: none !important;
            }
            #main-content {
                padding: 0 !important;
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
            <li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/transaksi?action=list"><i class="fas fa-cash-register"></i> Transaksi</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/laporan?action=menu"><i class="fas fa-chart-line"></i> Laporan</a></li>
        </ul>
    </aside>

    <div id="content-wrapper">
        <div id="main-content">
            <header class="topbar d-flex align-items-center justify-content-between mb-4">
                <div class="d-flex align-items-center">
                    <button class="btn btn-light d-lg-none me-3" id="sidebar-toggle-button" type="button"><i class="fas fa-bars"></i></button>
                    <h4 class="mb-0 fw-bold d-none d-sm-block">Detail Transaksi</h4>
                </div>
                 <div class="d-flex align-items-center">
                    <a href="${pageContext.request.contextPath}/transaksi?action=list" class="btn btn-outline-secondary me-2"><i class="fas fa-arrow-left me-2"></i>Kembali</a>
                    <button class="btn btn-primary" onclick="window.print();"><i class="fas fa-print me-2"></i>Cetak</button>
                </div>
            </header>

            <c:if test="${not empty errorMessage}"><div class="alert alert-danger" role="alert"><strong>Error:</strong> <c:out value="${errorMessage}" /></div></c:if>
            <c:if test="${empty transaksi && empty errorMessage}"><div class="alert alert-warning" role="alert">Data transaksi tidak ditemukan.</div></c:if>

            <c:if test="${not empty transaksi}">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-white p-4">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <h3 class="mb-0">Invoice #${transaksi.noTransaksi}</h3>
                                <p class="text-muted mb-0">Tanggal: <fmt:formatDate value="${transaksi.tanggal}" pattern="EEEE, dd MMMM yyyy HH:mm" /></p>
                            </div>
                            <div class="col-md-6 text-md-end mt-3 mt-md-0">
                                <h5>Ditagihkan Kepada:</h5>
                                <p class="fw-bold mb-0">${transaksi.pelanggan.nama}</p>
                                <p class="text-muted mb-0">${transaksi.pelanggan.noTelepon}</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <h5 class="mb-3">Detail Layanan & Spare Part</h5>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Deskripsi</th>
                                        <th class="text-center">Jumlah</th>
                                        <th class="text-end">Harga Satuan</th>
                                        <th class="text-end">Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Biaya Jasa Service</td>
                                        <td class="text-center">1</td>
                                        <td class="text-end"><fmt:formatNumber value="${transaksi.biayaService}" type="currency"/></td>
                                        <td class="text-end"><fmt:formatNumber value="${transaksi.biayaService}" type="currency"/></td>
                                    </tr>
                                    <c:forEach var="sp" items="${transaksi.spareParts}">
                                        <tr>
                                            <td><c:out value="${sp.nama}" /> <small class="text-muted">(#<c:out value="${sp.kodePart}" />)</small></td>
                                            <td class="text-center"><c:out value="${sp.jumlahDigunakan}" /></td>
                                            <td class="text-end"><fmt:formatNumber value="${sp.harga}" type="currency"/></td>
                                            <td class="text-end"><fmt:formatNumber value="${sp.harga * sp.jumlahDigunakan}" type="currency"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <hr>
                        <div class="row justify-content-end">
                            <div class="col-md-5">
                                <dl class="row">
                                    <c:set var="totalHargaSparePart" value="0" />
                                    <c:forEach var="sp" items="${transaksi.spareParts}"><c:set var="totalHargaSparePart" value="${totalHargaSparePart + (sp.harga * sp.jumlahDigunakan)}" /></c:forEach>
                                    <c:set var="subtotal" value="${transaksi.biayaService + totalHargaSparePart}" />

                                    <dt class="col-sm-6">Subtotal</dt>
                                    <dd class="col-sm-6 text-end"><fmt:formatNumber value="${subtotal}" type="currency"/></dd>

                                    <c:if test="${transaksi.pelanggan.isMember()}">
                                        <c:set var="diskon" value="${subtotal * 0.10}" />
                                        <dt class="col-sm-6 text-success">Diskon Member (10%)</dt>
                                        <dd class="col-sm-6 text-end text-success">- <fmt:formatNumber value="${diskon}" type="currency"/></dd>
                                    </c:if>
                                </dl>
                                <hr>
                                <dl class="row fs-5">
                                    <dt class="col-sm-6 fw-bold">Total Akhir</dt>
                                    <dd class="col-sm-6 text-end fw-bold"><fmt:formatNumber value="${transaksi.totalBiaya}" type="currency"/></dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
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
