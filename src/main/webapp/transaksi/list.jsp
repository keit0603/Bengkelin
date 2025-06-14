<%--
    Created by IntelliJ IDEA.
    User: USER
    Date: 25/05/2025
    Time: 20.42
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
    <title>Manajemen Transaksi - Bengkelin</title>
    
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
        .form-delete-btn {
            background: none;
            border: none;
            padding: 0;
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
                    <button class="btn btn-light d-lg-none me-3" id="sidebar-toggle-button" type="button">
                        <i class="fas fa-bars"></i>
                    </button>
                    <h4 class="mb-0 fw-bold d-none d-sm-block">Manajemen Transaksi</h4>
                </div>
                 <div class="d-flex align-items-center">
                    <div class="dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-bell fs-5 text-secondary"></i></a>
                    </div>
                    <div class="dropdown ms-3 profile">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://placehold.co/100x100/0d6efd/white?text=P" alt="Petugas" class="rounded-circle profile-pic">
                            <div class="ms-2 d-none d-md-block"><div class="fw-bold">Petugas</div></div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0">
                             <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <c:if test="${not empty param.successMessage}"><div class="alert alert-success alert-dismissible fade show" role="alert"><c:choose><c:when test="${param.successMessage == 'TransaksiBerhasilDitambahkan'}">Transaksi berhasil ditambahkan.</c:when><c:when test="${param.successMessage == 'TransaksiBerhasilDihapus'}">Transaksi berhasil dihapus.</c:when><c:otherwise>Operasi berhasil.</c:otherwise></c:choose><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div></c:if>
            <c:if test="${not empty errorMessage}"><div class="alert alert-danger alert-dismissible fade show" role="alert"><c:out value="${errorMessage}" /><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div></c:if>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-0 p-3">
                     <form action="${pageContext.request.contextPath}/transaksi" method="get">
                        <input type="hidden" name="action" value="list">
                        <div class="row g-2 align-items-center">
                            <div class="col-md">
                                <label for="startDate" class="form-label small">Tanggal Mulai</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" value="<c:out value='${startDate}'/>">
                            </div>
                            <div class="col-md">
                                <label for="endDate" class="form-label small">Tanggal Akhir</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" value="<c:out value='${endDate}'/>">
                            </div>
                            <div class="col-md-auto align-self-end">
                                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-filter me-2"></i>Filter</button>
                            </div>
                             <c:if test="${not empty startDate || not empty endDate}">
                                <div class="col-md-auto align-self-end">
                                    <a href="${pageContext.request.contextPath}/transaksi?action=list" class="btn btn-outline-secondary w-100"><i class="fas fa-times me-2"></i>Reset</a>
                                </div>
                            </c:if>
                            <div class="col-md-auto align-self-end ms-md-auto">
                                <a href="${pageContext.request.contextPath}/transaksi?action=new" class="btn btn-success w-100"><i class="fas fa-plus me-2"></i>Buat Transaksi</a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead>
                                <tr>
                                    <th class="px-3">No. Transaksi</th>
                                    <th>Pelanggan</th>
                                    <th>Tanggal</th>
                                    <th class="text-end">Total Biaya</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty transaksiList}">
                                        <c:forEach var="trx" items="${transaksiList}">
                                            <tr>
                                                <td class="px-3 fw-bold">#<c:out value="${trx.noTransaksi}" /></td>
                                                <td><c:out value="${trx.pelanggan.nama}" /></td>
                                                <td><fmt:formatDate value="${trx.tanggal}" pattern="dd-MM-yyyy HH:mm" /></td>
                                                <td class="text-end fw-bold"><fmt:formatNumber value="${trx.totalBiaya}" type="currency"/></td>
                                                <td class="text-center">
                                                     <div class="btn-group" role="group">
                                                        <a href="${pageContext.request.contextPath}/transaksi?action=detail&noTransaksi=${trx.noTransaksi}" class="btn btn-sm btn-light border" title="Lihat Detail">
                                                            <i class="fas fa-eye text-info"></i>
                                                        </a>
                                                        <form action="${pageContext.request.contextPath}/transaksi" method="post" class="d-inline">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="noTransaksi" value="${trx.noTransaksi}">
                                                            <button type="submit" class="btn btn-sm btn-light border" title="Hapus" onclick="return confirm('Hapus transaksi ${trx.noTransaksi}?');">
                                                                <i class="fas fa-trash text-danger"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr><td colspan="5" class="text-center p-5 text-muted"><i class="fas fa-file-invoice-dollar fa-2x mb-2"></i><p class="mb-0">Tidak ada data transaksi ditemukan.<c:if test="${not empty startDate && not empty endDate}"> untuk periode yang dipilih.</c:if></p></td></tr>
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
