<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración - El Buen Sabor</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <style>
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
            color: #ffffff;
            padding: 15px 20px;
            border-radius: 0;
            transition: all 0.3s ease;
        }
        .sidebar .nav-link:hover {
            background-color: rgba(255, 193, 7, 0.1);
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
        .sidebar.collapsed .nav-link span {
            display: none;
        }
        .top-navbar {
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 1rem;
        }
        .stats-card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .stats-card:hover {
            transform: translateY(-5px);
        }
        .stats-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
        }
        .chart-container {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <nav class="sidebar" id="sidebar">
        <div class="p-3">
            <div class="text-center mb-4">
                <i class="fas fa-utensils text-warning fa-2x mb-2"></i>
                <h5 class="text-white mb-0" id="brand-text">El Buen Sabor</h5>
                <small class="text-muted" id="brand-subtitle">Admin Panel</small>
            </div>
        </div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="#" data-section="dashboard">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-section="reservas">
                    <i class="fas fa-calendar-check"></i>
                    <span>Reservas</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-section="menu">
                    <i class="fas fa-utensils"></i>
                    <span>Menú</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-section="pedidos">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Pedidos</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-section="mesas">
                    <i class="fas fa-table"></i>
                    <span>Mesas</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-section="clientes">
                    <i class="fas fa-users"></i>
                    <span>Clientes</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-section="reportes">
                    <i class="fas fa-chart-bar"></i>
                    <span>Reportes</span>
                </a>
            </li>
            <li class="nav-item mt-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/LoginController?action=logout">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Cerrar Sesión</span>
                </a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="main-content" id="mainContent">
        <!-- Top Navigation -->
        <div class="top-navbar d-flex justify-content-between align-items-center">
            <div>
                <button class="btn btn-outline-secondary" id="toggleSidebar">
                    <i class="fas fa-bars"></i>
                </button>
                <h4 class="ms-3 mb-0 d-inline">Dashboard</h4>
            </div>
            <div class="d-flex align-items-center">
                <span class="me-3">Bienvenido, <strong>${sessionScope.usuario.nombre}</strong></span>
                <div class="dropdown">
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user"></i>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>Perfil</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Configuración</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/LoginController?action=logout">
                            <i class="fas fa-sign-out-alt me-2"></i>Cerrar Sesión</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Dashboard Content -->
        <div class="p-4">
            <!-- Stats Cards -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="stats-card">
                        <div class="d-flex align-items-center">
                            <div class="stats-icon bg-primary me-3">
                                <i class="fas fa-calendar-check"></i>
                            </div>
                            <div>
                                <h5 class="mb-0" id="total-reservas">24</h5>
                                <small class="text-muted">Reservas Hoy</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="stats-card">
                        <div class="d-flex align-items-center">
                            <div class="stats-icon bg-success me-3">
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                            <div>
                                <h5 class="mb-0" id="total-pedidos">157</h5>
                                <small class="text-muted">Pedidos Hoy</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="stats-card">
                        <div class="d-flex align-items-center">
                            <div class="stats-icon bg-warning me-3">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                            <div>
                                <h5 class="mb-0" id="ventas-hoy">S/. 2,450</h5>
                                <small class="text-muted">Ventas Hoy</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="stats-card">
                        <div class="d-flex align-items-center">
                            <div class="stats-icon bg-info me-3">
                                <i class="fas fa-utensils"></i>
                            </div>
                            <div>
                                <h5 class="mb-0" id="platos-menu">32</h5>
                                <small class="text-muted">Platos en Menú</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Additional Stats Row -->
            <div class="row mb-4">
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="stats-card">
                        <div class="d-flex align-items-center">
                            <div class="stats-icon bg-secondary me-3">
                                <i class="fas fa-table"></i>
                            </div>
                            <div>
                                <h5 class="mb-0" id="mesas-ocupadas">12/20</h5>
                                <small class="text-muted">Mesas Ocupadas</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="stats-card">
                        <div class="d-flex align-items-center">
                            <div class="stats-icon bg-dark me-3">
                                <i class="fas fa-users"></i>
                            </div>
                            <div>
                                <h5 class="mb-0" id="total-clientes">1,245</h5>
                                <small class="text-muted">Clientes Registrados</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="stats-card">
                        <div class="d-flex align-items-center">
                            <div class="stats-icon bg-danger me-3">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div>
                                <h5 class="mb-0" id="tiempo-promedio">18 min</h5>
                                <small class="text-muted">Tiempo Promedio</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="stats-card">
                        <div class="d-flex align-items-center">
                            <div class="stats-icon bg-purple me-3" style="background-color: #6f42c1;">
                                <i class="fas fa-star"></i>
                            </div>
                            <div>
                                <h5 class="mb-0" id="rating-promedio">4.8</h5>
                                <small class="text-muted">Rating Promedio</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts and Tables -->
            <div class="row">
                <div class="col-lg-8 mb-4">
                    <div class="chart-container">
                        <h5 class="mb-3">Ventas de la Semana</h5>
                        <canvas id="ventasChart" height="100"></canvas>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="chart-container">
                        <h5 class="mb-3">Platos Más Vendidos</h5>
                        <canvas id="platosChart" height="200"></canvas>
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="chart-container">
                        <h5 class="mb-3">Reservas Recientes</h5>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Cliente</th>
                                        <th>Fecha</th>
                                        <th>Personas</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody id="reservas-recientes">
                                    <tr>
                                        <td>Juan Pérez</td>
                                        <td>Hoy 19:30</td>
                                        <td>4</td>
                                        <td><span class="badge bg-success">Confirmada</span></td>
                                    </tr>
                                    <tr>
                                        <td>María García</td>
                                        <td>Hoy 20:00</td>
                                        <td>2</td>
                                        <td><span class="badge bg-warning">Pendiente</span></td>
                                    </tr>
                                    <tr>
                                        <td>Carlos López</td>
                                        <td>Mañana 13:00</td>
                                        <td>6</td>
                                        <td><span class="badge bg-success">Confirmada</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="chart-container">
                        <h5 class="mb-3">Pedidos Recientes</h5>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Cliente</th>
                                        <th>Total</th>
                                        <th>Tipo</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody id="pedidos-recientes">
                                    <tr>
                                        <td>Ana Silva</td>
                                        <td>S/. 85.00</td>
                                        <td>Delivery</td>
                                        <td><span class="badge bg-info">En preparación</span></td>
                                    </tr>
                                    <tr>
                                        <td>Luis Mendoza</td>
                                        <td>S/. 45.00</td>
                                        <td>Recojo</td>
                                        <td><span class="badge bg-success">Listo</span></td>
                                    </tr>
                                    <tr>
                                        <td>Rosa Quispe</td>
                                        <td>S/. 120.00</td>
                                        <td>Delivery</td>
                                        <td><span class="badge bg-warning">Nuevo</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <script>
        // Toggle Sidebar
        document.getElementById('toggleSidebar').addEventListener('click', function() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('mainContent');
            const brandText = document.getElementById('brand-text');
            const brandSubtitle = document.getElementById('brand-subtitle');
            
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
            
            if (sidebar.classList.contains('collapsed')) {
                brandText.style.display = 'none';
                brandSubtitle.style.display = 'none';
            } else {
                brandText.style.display = 'block';
                brandSubtitle.style.display = 'block';
            }
        });

        // Navigation
        document.querySelectorAll('.sidebar .nav-link[data-section]').forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                
                // Remove active class from all links
                document.querySelectorAll('.sidebar .nav-link').forEach(l => l.classList.remove('active'));
                
                // Add active class to clicked link
                this.classList.add('active');
                
                // Update page title
                const section = this.dataset.section;
                const title = this.textContent.trim();
                document.querySelector('.top-navbar h4').textContent = title;
                
                // Load section content
                loadSection(section);
            });
        });

        function loadSection(section) {
            // Load content via AJAX or redirect to appropriate JSP
            switch(section) {
                case 'reservas':
                    window.location.href = 'reservas.jsp';
                    break;
                case 'menu':
                    window.location.href = 'menu.jsp';
                    break;
                case 'pedidos':
                    window.location.href = 'pedidos.jsp';
                    break;
                case 'mesas':
                    window.location.href = 'mesas.jsp';
                    break;
                case 'clientes':
                    window.location.href = 'clientes.jsp';
                    break;
                case 'reportes':
                    window.location.href = 'reportes.jsp';
                    break;
                case 'dashboard':
                default:
                    // Stay on dashboard
                    break;
            }
        }

        // Initialize Charts
        const ctx1 = document.getElementById('ventasChart').getContext('2d');
        new Chart(ctx1, {
            type: 'line',
            data: {
                labels: ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'],
                datasets: [{
                    label: 'Ventas (S/.)',
                    data: [1200, 1900, 3000, 2500, 2200, 3200, 2800],
                    borderColor: '#ffc107',
                    backgroundColor: 'rgba(255, 193, 7, 0.1)',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        const ctx2 = document.getElementById('platosChart').getContext('2d');
        new Chart(ctx2, {
            type: 'doughnut',
            data: {
                labels: ['Lomo Saltado', 'Ceviche', 'Ají de Gallina', 'Anticuchos'],
                datasets: [{
                    data: [30, 25, 20, 15],
                    backgroundColor: ['#007bff', '#28a745', '#ffc107', '#dc3545']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });

        // Load stats via AJAX (simulate)
        function loadStats() {
            // This would typically be an AJAX call to get real data
            setTimeout(() => {
                document.getElementById('total-reservas').textContent = Math.floor(Math.random() * 30) + 20;
                document.getElementById('total-pedidos').textContent = Math.floor(Math.random() * 50) + 100;
                document.getElementById('ventas-hoy').textContent = 'S/. ' + (Math.floor(Math.random() * 1000) + 2000).toLocaleString();
                document.getElementById('mesas-ocupadas').textContent = Math.floor(Math.random() * 15) + 8 + '/20';
                document.getElementById('total-clientes').textContent = (Math.floor(Math.random() * 200) + 1200).toLocaleString();
            }, 1000);
        }

        // Load stats on page load
        loadStats();

        // Refresh stats every 5 minutes
        setInterval(loadStats, 300000);
    </script>
</body>
</html>