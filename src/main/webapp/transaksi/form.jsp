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
    <title>Buat Transaksi Baru - Bengkelin</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" xintegrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />

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
        .select2-container .select2-selection--single {
            height: calc(1.5em + 0.75rem + 2px);
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
                    <button class="btn btn-light d-lg-none me-3" id="sidebar-toggle-button" type="button">
                        <i class="fas fa-bars"></i>
                    </button>
                    <h4 class="mb-0 fw-bold d-none d-sm-block">Buat Transaksi Baru</h4>
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
            
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/transaksi?action=list">Transaksi</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Buat Baru</li>
                </ol>
            </nav>

            <c:if test="${not empty errorMessage}"><div class="alert alert-danger alert-dismissible fade show" role="alert"><c:out value="${errorMessage}" /><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div></c:if>

            <form action="${pageContext.request.contextPath}/transaksi?action=create" method="post" id="formTransaksi">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card shadow-sm border-0 mb-4">
                            <div class="card-header bg-white p-3"><h5 class="mb-0"><i class="fas fa-receipt me-2 text-primary"></i>Detail Transaksi</h5></div>
                            <div class="card-body p-4">
                                <div class="row">
                                    <div class="col-md-6 mb-3"><label for="noTransaksi" class="form-label">Nomor Transaksi</label><input type="text" class="form-control" id="noTransaksi" name="noTransaksi" placeholder="Contoh: TRX001" required></div>
                                    <div class="col-md-6 mb-3"><label for="tanggal" class="form-label">Tanggal</label><input type="date" class="form-control" id="tanggal" name="tanggal" value="${todayDate}" required></div>
                                </div>
                                <div class="mb-3"><label for="pelanggan" class="form-label">Pelanggan</label><select id="pelanggan" name="pelanggan" class="form-select" required><option></option><c:forEach var="p" items="${pelangganList}"><option value="${p.idPelanggan}">${p.nama} (${p.idPelanggan}) <c:if test="${p.isMember()}">(Member)</c:if></option></c:forEach></select></div>
                                <div class="mb-3"><label for="jenisService" class="form-label">Jenis Service Utama</label><select id="jenisService" name="jenisService" class="form-select" required><option value="">-- Pilih Jenis Service --</option><c:forEach var="type" items="${serviceTypes}"><option value="${type.name()}">${type.toString().replace("_", " ")}</option></c:forEach></select></div>
                            </div>
                        </div>
                        <div class="card shadow-sm border-0">
                             <div class="card-header bg-white p-3"><h5 class="mb-0"><i class="fas fa-cogs me-2 text-primary"></i>Spare Part Digunakan</h5></div>
                             <div class="card-body p-4">
                                <div id="spareparts-container">
                                </div>
                                <button type="button" id="add-sparepart-btn" class="btn btn-outline-primary mt-2"><i class="fas fa-plus me-2"></i>Tambah Spare Part</button>
                             </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card shadow-sm border-0 sticky-top" style="top: 1.5rem;">
                             <div class="card-header bg-white p-3"><h5 class="mb-0"><i class="fas fa-file-invoice-dollar me-2 text-primary"></i>Ringkasan & Aksi</h5></div>
                             <div class="card-body p-4">
                                <button type="submit" class="btn btn-success w-100 btn-lg"><i class="fas fa-save me-2"></i>Simpan Transaksi</button>
                                <a href="${pageContext.request.contextPath}/transaksi?action=list" class="btn btn-secondary w-100 mt-2">Batal</a>
                             </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <footer class="app-footer"><p class="text-center text-muted small mb-0">&copy; <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy" /> Bengkelin - Dibuat dengan <i class="fas fa-heart text-danger"></i> untuk Tugas PBO.</p></footer>
    </div>
</div>

<template id="sparepart-template">
    <div class="row g-2 align-items-center sparepart-item mb-3">
        <div class="col-sm-7"><select name="spareParts" class="form-select select2-sparepart" required><option></option><c:forEach var="sp" items="${sparePartList}"><option value="${sp.kodePart}" data-stok="${sp.stok}">${sp.nama} (Stok: ${sp.stok})</option></c:forEach></select></div>
        <div class="col-sm-3"><input type="number" name="quantities" class="form-control" min="1" value="1" placeholder="Jumlah" required></div>
        <div class="col-sm-2"><button type="button" class="btn btn-outline-danger w-100 remove-sparepart-btn"><i class="fas fa-trash"></i></button></div>
    </div>
</template>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    $(document).ready(function () {
        $('#pelanggan').select2({
            placeholder: "-- Cari dan Pilih Pelanggan --",
            theme: "bootstrap-5",
            allowClear: true
        });

        function initializeSelect2ForSpareparts(element) {
            $(element).select2({
                placeholder: "-- Pilih Spare Part --",
                theme: "bootstrap-5",
                allowClear: false
            }).on('select2:select', function (e) {
                var data = e.params.data;
                var stok = $(data.element).data('stok');
                var quantityInput = $(this).closest('.sparepart-item').find('input[name="quantities"]');
                if (stok !== undefined) {
                    quantityInput.attr('max', stok);
                }
            });
        }

        $('#add-sparepart-btn').on('click', function () {
            var template = document.getElementById('sparepart-template').innerHTML;
            var container = $('#spareparts-container');
            var newItem = $(template);
            container.append(newItem);
            initializeSelect2ForSpareparts(newItem.find('.select2-sparepart'));
        });

        $('#spareparts-container').on('click', '.remove-sparepart-btn', function () {
            $(this).closest('.sparepart-item').remove();
        });
    });
</script>
</body>
</html>
