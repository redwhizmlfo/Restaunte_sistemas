<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Verificar si el usuario está logueado
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Panel de Administración - El Buen Sabor</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <style>
            /* --- Tus estilos de sidebar y navbar --- */
            .sidebar {
                position: fixed;
                top: 0;
                left: 0;
                height: 100vh;
                width: 250px;
                background: linear-gradient(135deg, #343a40, #495057);
                z-index: 1000;
                transition: all 0.3s ease;
                overflow-y: auto;
            }
            .sidebar.collapsed {
                width: 80px;
            }
            .main-content {
                margin-left: 250px;
                min-height: 100vh;
                background-color: #f8f9fa;
                transition: all 0.3s ease;
            }
            .main-content.expanded {
                margin-left: 80px;
            }
            .sidebar .nav-link {
                color: #fff;
                padding: 15px 20px;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
            }
            .sidebar .nav-link:hover {
                background-color: rgba(255,193,7,0.1);
                color: #ffc107;
            }
            .sidebar .nav-link.active {
                background-color: #ffc107;
                color: #000;
            }
            .sidebar .nav-link i {
                width: 20px;
                text-align: center;
                margin-right: 10px;
            }
            .sidebar.collapsed .nav-link span, .sidebar.collapsed .brand-text {
                display: none;
            }
            .top-navbar {
                background: #fff;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                padding: 1rem;
                position: sticky;
                top: 0;
                z-index: 999;
            }
            @media (max-width: 768px) {
                .sidebar {
                    transform: translateX(-100%);
                }
                .sidebar.show {
                    transform: translateX(0);
                }
                .main-content {
                    margin-left: 0;
                }
                .overlay {
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0,0,0,0.5);
                    z-index: 999;
                    display: none;
                }
                .overlay.show {
                    display: block;
                }
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <!-- Overlay para móvil -->
        <div class="overlay" id="overlay" onclick="toggleSidebar()"></div>

        <!-- Sidebar -->
        <nav class="sidebar" id="sidebar">
            <div class="p-3 text-center">
                <div class="brand-logo">
                    <i class="fas fa-utensils text-warning fa-2x mb-2"></i>
                    <h5 class="text-white mb-0 brand-text">El Buen Sabor</h5>
                    <small class="text-muted brand-text">Admin Panel</small>
                </div>
            </div>

            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.contains('dashboard') ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/WEB-INF/views/admin/dashboard.jsp">
                        <i class="fas fa-tachometer-alt"></i><span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.contains('reservas') ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/WEB-INF/views/admin/reservas.jsp">
                        <i class="fas fa-calendar-check"></i><span>Reservas</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.contains('menu') ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/WEB-INF/views/admin/menu.jsp">
                        <i class="fas fa-utensils"></i><span>Menú</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pageContext.request.requestURI.contains('pedidos') ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/WEB-INF/views/admin/pedidos.jsp">
                        <i class="fas fa-shopping-cart"></i><span>Pedidos</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="showComingSoon('Reportes')">
                        <i class="fas fa-chart-bar"></i><span>Reportes</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="showComingSoon('Configuración')">
                        <i class="fas fa-cog"></i><span>Configuración</span>
                    </a>
                </li>
                <li class="nav-item mt-auto">
                    <hr class="text-muted">
                    <a class="nav-link text-danger" href="#" onclick="confirmarCerrarSesion()">
                        <i class="fas fa-sign-out-alt"></i><span>Cerrar Sesión</span>
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <div class="main-content" id="mainContent">
            <!-- Top Navigation -->
            <div class="top-navbar d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <button class="btn btn-outline-secondary me-3" id="toggleSidebar" onclick="toggleSidebar()">
                        <i class="fas fa-bars"></i>
                    </button>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/WEB-INF/views/admin/dashboard.jsp">
                                    <i class="fas fa-home"></i> Inicio
                                </a>
                            </li>
                            <li class="breadcrumb-item active" id="currentPage">Dashboard</li>
                        </ol>
                    </nav>
                </div>

                <div class="d-flex align-items-center">
                    <!-- Notificaciones -->
                    <div class="dropdown me-3">
                        <button class="btn btn-outline-secondary position-relative" type="button" data-bs-toggle="dropdown">
                            <i class="fas fa-bell"></i>
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" style="width: 300px;">
                            <li><h6 class="dropdown-header">Notificaciones</h6></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-shopping-cart text-primary me-2"></i>Nuevo pedido #045<small class="text-muted d-block">Hace 2 min</small></a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-calendar-check text-warning me-2"></i>Nueva reserva<small class="text-muted d-block">Hace 5 min</small></a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-exclamation-triangle text-danger me-2"></i>Plato agotado: Ceviche<small class="text-muted d-block">Hace 15 min</small></a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-center" href="#">Ver todas</a></li>
                        </ul>
                    </div>

                    <!-- Usuario -->
                    <div class="d-flex align-items-center">
                        <span class="me-3 d-none d-md-block">Bienvenido, <strong>${sessionScope.usuario.nombre}</strong></span>
                        <div class="dropdown">
                            <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user"></i>
                                <span class="d-none d-md-inline ms-1">${sessionScope.usuario.nombre}</span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="#" onclick="showComingSoon('Perfil')"><i class="fas fa-user me-2"></i>Mi Perfil</a></li>
                                <li><a class="dropdown-item" href="#" onclick="showComingSoon('Configuración')"><i class="fas fa-cog me-2"></i>Configuración</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/index.jsp" target="_blank"><i class="fas fa-external-link-alt me-2"></i>Ver Sitio Web</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="#" onclick="confirmarCerrarSesion()"><i class="fas fa-sign-out-alt me-2"></i>Cerrar Sesión</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Contenido dinámico -->
            <div class="content-wrapper p-4">
                <h2>Bienvenido al Panel de Administración</h2>
                <p>Selecciona una opción del menú lateral para gestionar el sistema.</p>
            </div>
        </div>

        <!-- Scripts comunes -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script>
                                    function toggleSidebar() {
                                        const sidebar = document.getElementById('sidebar');
                                        const mainContent = document.getElementById('mainContent');
                                        const overlay = document.getElementById('overlay');
                                        if (window.innerWidth <= 768) {
                                            sidebar.classList.toggle('show');
                                            overlay.classList.toggle('show');
                                        } else {
                                            sidebar.classList.toggle('collapsed');
                                            mainContent.classList.toggle('expanded');
                                        }
                                    }
                                    function showComingSoon(feature) {
                                        showAlert(`${feature} estará disponible próximamente`, 'info');
                                    }
                                    function confirmarCerrarSesion() {
                                        if (confirm('¿Está seguro de que desea cerrar sesión?')) {
                                            window.location.href = '${pageContext.request.contextPath}/LoginController?action=logout';
                                        }
                                    }
                                    function showAlert(message, type = 'info') {
                                        // Mapeo de tipos a íconos
                                        const iconMap = {
                                            'success': 'check-circle',
                                            'danger': 'exclamation-triangle',
                                            'warning': 'exclamation-triangle',
                                            'info': 'info-circle'
                                        };

                                        const iconClass = iconMap[type] || 'info-circle';

                                        const alertDiv = document.createElement('div');
                                        alertDiv.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
                                        alertDiv.style.cssText = 'top: 20px; right: 20px; z-index: 10000; max-width: 400px;';
                                        alertDiv.innerHTML = `
            <i class="fas fa-${iconClass} me-2"></i>
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        `;

                                        document.body.appendChild(alertDiv);

                                        setTimeout(() => {
                                            if (alertDiv.parentNode) {
                                                alertDiv.parentNode.removeChild(alertDiv);
                                            }
                                        }, 5000);
                                    }
                                    window.addEventListener('resize', function () {
                                        const sidebar = document.getElementById('sidebar');
                                        const mainContent = document.getElementById('mainContent');
                                        const overlay = document.getElementById('overlay');
                                        if (window.innerWidth > 768) {
                                            sidebar.classList.remove('show');
                                            overlay.classList.remove('show');
                                        } else {
                                            sidebar.classList.remove('collapsed');
                                            mainContent.classList.remove('expanded');
                                        }
                                    });
                                    document.addEventListener('DOMContentLoaded', function () {
                                        const currentPath = window.location.pathname;
                                        const currentPageElement = document.getElementById('currentPage');
                                        if (currentPath.includes('reservas'))
                                            currentPageElement.textContent = 'Reservas';
                                        else if (currentPath.includes('menu'))
                                            currentPageElement.textContent = 'Menú';
                                        else if (currentPath.includes('pedidos'))
                                            currentPageElement.textContent = 'Pedidos';
                                        else
                                            currentPageElement.textContent = 'Dashboard';
                                    });
                                    setInterval(function () {
                                        const badge = document.querySelector('.badge.bg-danger');
                                        if (badge)
                                            badge.textContent = Math.floor(Math.random() * 5) + 1;
                                    }, 60000);
        </script>
    </body>
</html>
