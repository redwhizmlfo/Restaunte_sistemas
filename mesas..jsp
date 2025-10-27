<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Mesas - Restaurante</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">

        <style>
            .sidebar {
                min-height: 100vh;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            }
            .nav-link {
                color: rgba(255,255,255,0.8) !important;
                border-radius: 8px;
                margin: 2px 0;
                transition: all 0.3s;
            }
            .nav-link:hover, .nav-link.active {
                color: white !important;
                background-color: rgba(255,255,255,0.1);
                transform: translateX(5px);
            }
            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
            }
            .table th {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                border: none;
            }
            .mesa-card {
                border: 2px solid #e9ecef;
                border-radius: 15px;
                transition: all 0.3s;
                cursor: pointer;
                height: 100%;
            }
            .mesa-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            }
            .mesa-libre {
                border-color: #28a745;
                background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
                color: white;
            }
            .mesa-ocupada {
                border-color: #dc3545;
                background: linear-gradient(135deg, #dc3545 0%, #fd7e14 100%);
                color: white;
            }
            .mesa-reservada {
                border-color: #ffc107;
                background: linear-gradient(135deg, #ffc107 0%, #fd7e14 100%);
                color: white;
            }
            .mesa-mantenimiento {
                border-color: #6c757d;
                background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
                color: white;
            }
            .badge-estado {
                padding: 8px 12px;
                border-radius: 20px;
                font-size: 0.8rem;
            }
            .btn-action {
                padding: 5px 10px;
                margin: 0 2px;
                border-radius: 8px;
            }
            .mesa-icon {
                font-size: 3rem;
                margin-bottom: 1rem;
            }
            .vista-toggle {
                position: absolute;
                top: 20px;
                right: 20px;
            }
            .plano-restaurante {
                background: #f8f9fa;
                border: 2px dashed #dee2e6;
                min-height: 500px;
                position: relative;
                overflow: hidden;
            }
            .mesa-plano {
                position: absolute;
                width: 80px;
                height: 80px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s;
                border: 3px solid;
            }
            .mesa-plano:hover {
                transform: scale(1.1);
            }
        </style>
    </head>
    <body>
        <!-- Verificar sesión -->
        <c:if test="${empty sessionScope.usuario}">
            <c:redirect url="../auth/login.jsp"/>
        </c:if>

        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse p-3">
                    <div class="text-center mb-4">
                        <img src="../assets/img/logo.png" alt="Logo" class="img-fluid mb-2" style="max-width: 80px;" onerror="this.style.display='none'">
                        <h4 class="text-white">RestauranteApp</h4>
                    </div>

                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp">
                                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="reservas.jsp">
                                <i class="fas fa-calendar-check me-2"></i>Reservas
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="mesas.jsp">
                                <i class="fas fa-chair me-2"></i>Mesas
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="clientes.jsp">
                                <i class="fas fa-users me-2"></i>Clientes
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="menu.jsp">
                                <i class="fas fa-utensils me-2"></i>Menú
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="reportes.jsp">
                                <i class="fas fa-chart-bar me-2"></i>Reportes
                            </a>
                        </li>
                    </ul>

                    <hr class="text-white">

                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="../LoginController?action=logout">
                                <i class="fas fa-sign-out-alt me-2"></i>Cerrar Sesión
                            </a>
                        </li>
                    </ul>
                </nav>

                <!-- Contenido Principal -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <!-- Header -->
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-chair me-2" style="color: #667eea;"></i>
                            <h4 class="ms-3 mb-0 d-inline">Gestión de Mesas</h4>
                        </div>
                        <div class="d-flex align-items-center">
                            <span class="me-3">Bienvenido, <strong>${sessionScope.usuario.nombre}</strong></span>
                            <div class="dropdown">
                                <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                    <i class="fas fa-user"></i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="perfil.jsp"><i class="fas fa-user-edit me-2"></i>Mi Perfil</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="../LoginController?action=logout"><i class="fas fa-sign-out-alt me-2"></i>Cerrar Sesión</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Botones de Vista -->
                    <div class="mb-3">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-primary active" id="vistaCards" onclick="cambiarVista('cards')">
                                <i class="fas fa-th-large me-2"></i>Vista Tarjetas
                            </button>
                            <button type="button" class="btn btn-outline-primary" id="vistaPlano" onclick="cambiarVista('plano')">
                                <i class="fas fa-map me-2"></i>Plano del Restaurante
                            </button>
                            <button type="button" class="btn btn-outline-primary" id="vistaTabla" onclick="cambiarVista('tabla')">
                                <i class="fas fa-table me-2"></i>Vista Tabla
                            </button>
                        </div>

                        <div class="float-end">
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalNuevaMesa">
                                <i class="fas fa-plus me-2"></i>Nueva Mesa
                            </button>
                            <button type="button" class="btn btn-outline-secondary ms-2" onclick="actualizarEstados()">
                                <i class="fas fa-sync-alt me-2"></i>Actualizar
                            </button>
                        </div>
                    </div>

                    <!-- Alertas -->
                    <c:if test="${not empty param.success}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="fas fa-check-circle me-2"></i>
                            <c:choose>
                                <c:when test="${param.success eq 'created'}">Mesa creada exitosamente</c:when>
                                <c:when test="${param.success eq 'updated'}">Mesa actualizada exitosamente</c:when>
                                <c:when test="${param.success eq 'deleted'}">Mesa eliminada exitosamente</c:when>
                                <c:otherwise>Operación realizada exitosamente</c:otherwise>
                            </c:choose>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <!-- Cards de Estadísticas -->
                    <div class="row mb-4">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Mesas Libres</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="mesasLibres">8</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-check-circle fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-danger shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                                Mesas Ocupadas</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="mesasOcupadas">4</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-utensils fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Reservadas</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="mesasReservadas">2</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar-check fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                Total Mesas</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="totalMesas">15</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-chair fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Vista Tarjetas -->
                    <div id="vistaCardsMesas" class="vista-mesas">
                        <div class="row">
                            <!-- Mesa 1 -->
                            <div class="col-md-4 col-lg-3 mb-4">
                                <div class="card mesa-card mesa-libre" onclick="verDetallesMesa(1)">
                                    <div class="card-body text-center">
                                        <i class="fas fa-chair mesa-icon"></i>
                                        <h5 class="card-title">Mesa 1</h5>
                                        <p class="card-text">
                                            <span class="badge bg-light text-dark">4 personas</span><br>
                                            <small>Ventana - Libre</small>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Mesa 2 -->
                            <div class="col-md-4 col-lg-3 mb-4">
                                <div class="card mesa-card mesa-ocupada" onclick="verDetallesMesa(2)">
                                    <div class="card-body text-center">
                                        <i class="fas fa-utensils mesa-icon"></i>
                                        <h5 class="card-title">Mesa 2</h5>
                                        <p class="card-text">
                                            <span class="badge bg-light text-dark">2 personas</span><br>
                                            <small>Interior - Ocupada</small>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Mesa 3 -->
                            <div class="col-md-4 col-lg-3 mb-4">
                                <div class="card mesa-card mesa-reservada" onclick="verDetallesMesa(3)">
                                    <div class="card-body text-center">
                                        <i class="fas fa-calendar-check mesa-icon"></i>
                                        <h5 class="card-title">Mesa 3</h5>
                                        <p class="card-text">
                                            <span class="badge bg-light text-dark">6 personas</span><br>
                                            <small>Terraza - Reservada</small>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Mesa 4 -->
                            <div class="col-md-4 col-lg-3 mb-4">
                                <div class="card mesa-card mesa-libre" onclick="verDetallesMesa(4)">
                                    <div class="card-body text-center">
                                        <i class="fas fa-chair mesa-icon"></i>
                                        <h5 class="card-title">Mesa 4</h5>
                                        <p class="card-text">
                                            <span class="badge bg-light text-dark">2 personas</span><br>
                                            <small>Ventana - Libre</small>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Mesa 5 -->
                            <div class="col-md-4 col-lg-3 mb-4">
                                <div class="card mesa-card mesa-mantenimiento" onclick="verDetallesMesa(5)">
                                    <div class="card-body text-center">
                                        <i class="fas fa-tools mesa-icon"></i>
                                        <h5 class="card-title">Mesa 5</h5>
                                        <p class="card-text">
                                            <span class="badge bg-light text-dark">4 personas</span><br>
                                            <small>Interior - Mantenimiento</small>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <!-- Mesa 6 -->
                            <div class="col-md-4 col-lg-3 mb-4">
                                <div class="card mesa-card mesa-libre" onclick="verDetallesMesa(6)">
                                    <div class="card-body text-center">
                                        <i class="fas fa-chair mesa-icon"></i>
                                        <h5 class="card-title">Mesa 6</h5>
                                        <p class="card-text">
                                            <span class="badge bg-light text-dark">8 personas</span><br>
                                            <small>Terraza - Libre</small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Vista Plano -->
                    <div id="vistaPlanoMesas" class="vista-mesas d-none">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">
                                    <i class="fas fa-map me-2"></i>Plano del Restaurante
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="plano-restaurante" id="planoRestaurante">
                                    <!-- Las mesas se posicionan aquí con JavaScript -->
                                </div>
                                <div class="mt-3">
                                    <span class="badge bg-success me-2">● Libre</span>
                                    <span class="badge bg-danger me-2">● Ocupada</span>
                                    <span class="badge bg-warning me-2">● Reservada</span>
                                    <span class="badge bg-secondary me-2">● Mantenimiento</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Vista Tabla -->
                    <div id="vistaTablaMesas" class="vista-mesas d-none">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">
                                    <i class="fas fa-table me-2"></i>Lista de Mesas
                                </h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="tablaMesas">
                                        <thead>
                                            <tr>
                                                <th>Mesa</th>
                                                <th>Capacidad</th>
                                                <th>Ubicación</th>
                                                <th>Estado</th>
                                                <th>Cliente</th>
                                                <th>Hora</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><strong>Mesa 1</strong></td>
                                                <td>4 personas</td>
                                                <td>Ventana</td>
                                                <td><span class="badge bg-success">Libre</span></td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>
                                                    <button class="btn btn-sm btn-info btn-action" onclick="editarMesa(1)">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-warning btn-action" onclick="cambiarEstadoMesa(1)">
                                                        <i class="fas fa-exchange-alt"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Mesa 2</strong></td>
                                                <td>2 personas</td>
                                                <td>Interior</td>
                                                <td><span class="badge bg-danger">Ocupada</span></td>
                                                <td>Juan Pérez</td>
                                                <td>19:30</td>
                                                <td>
                                                    <button class="btn btn-sm btn-info btn-action" onclick="editarMesa(2)">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-success btn-action" onclick="liberarMesa(2)">
                                                        <i class="fas fa-check"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>Mesa 3</strong></td>
                                                <td>6 personas</td>
                                                <td>Terraza</td>
                                                <td><span class="badge bg-warning">Reservada</span></td>
                                                <td>María García</td>
                                                <td>20:00</td>
                                                <td>
                                                    <button class="btn btn-sm btn-info btn-action" onclick="editarMesa(3)">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-warning btn-action" onclick="cambiarEstadoMesa(3)">
                                                        <i class="fas fa-exchange-alt"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!-- Modal Nueva Mesa -->
        <div class="modal fade" id="modalNuevaMesa" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <i class="fas fa-plus-circle me-2"></i>Nueva Mesa
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form id="formMesa" action="../MesaController" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="create">

                            <div class="mb-3">
                                <label for="numeroMesa" class="form-label">Número de Mesa *</label>
                                <input type="number" class="form-control" id="numeroMesa" name="numeroMesa" required min="1">
                            </div>

                            <div class="mb-3">
                                <label for="capacidad" class="form-label">Capacidad *</label>
                                <select class="form-select" id="capacidad" name="capacidad" required>
                                    <option value="">Seleccionar...</option>
                                    <option value="2">2 personas</option>
                                    <option value="4">4 personas</option>
                                    <option value="6">6 personas</option>
                                    <option value="8">8 personas</option>
                                    <option value="10">10 personas</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="ubicacion" class="form-label">Ubicación *</label>
                                <select class="form-select" id="ubicacion" name="ubicacion" required>
                                    <option value="">Seleccionar...</option>
                                    <option value="Interior">Interior</option>
                                    <option value="Ventana">Ventana</option>
                                    <option value="Terraza">Terraza</option>
                                    <option value="Privado">Salón Privado</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="descripcion" class="form-label">Descripción</label>
                                <textarea class="form-control" id="descripcion" name="descripcion" rows="3" placeholder="Características especiales de la mesa..."></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-save me-2"></i>Guardar Mesa
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal Detalles Mesa -->
        <div class="modal fade" id="modalDetallesMesa" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="tituloDetalles">
                            <i class="fas fa-info-circle me-2"></i>Detalles de Mesa
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body" id="contenidoDetalles">
                        <!-- Contenido se llena con JavaScript -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" id="btnEditarMesa">
                            <i class="fas fa-edit me-2"></i>Editar Mesa
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

        <script>
            function verDetallesMesa(mesaId) {
    // Datos simulados de la mesa
    const mesasData = {
        1: {numero: 1, capacidad: 4, ubicacion: 'Ventana', estado: 'Libre', cliente: null, hora: null},
        2: {numero: 2, capacidad: 2, ubicacion: 'Interior', estado: 'Ocupada', cliente: 'Juan Pérez', hora: '19:30'},
        3: {numero: 3, capacidad: 6, ubicacion: 'Terraza', estado: 'Reservada', cliente: 'María García', hora: '20:00'},
        4: {numero: 4, capacidad: 2, ubicacion: 'Ventana', estado: 'Libre', cliente: null, hora: null},
        5: {numero: 5, capacidad: 4, ubicacion: 'Interior', estado: 'Mantenimiento', cliente: null, hora: null},
        6: {numero: 6, capacidad: 8, ubicacion: 'Terraza', estado: 'Libre', cliente: null, hora: null}
    };

    const mesa = mesasData[mesaId];
    if (!mesa) return;

    // Título del modal
    document.getElementById('tituloDetalles').innerHTML = 
        '<i class="fas fa-info-circle me-2"></i>Mesa ' + mesa.numero + ' - Detalles';

    // Badge según estado
    let estadoBadge = '';
    switch(mesa.estado) {
        case 'Libre':
            estadoBadge = '<span class="badge bg-success">Libre</span>';
            break;
        case 'Ocupada':
            estadoBadge = '<span class="badge bg-danger">Ocupada</span>';
            break;
        case 'Reservada':
            estadoBadge = '<span class="badge bg-warning">Reservada</span>';
            break;
        case 'Mantenimiento':
            estadoBadge = '<span class="badge bg-secondary">Mantenimiento</span>';
            break;
    }

    // Contenido del modal
    let contenido = '<div class="row">' +
        '<div class="col-md-6">' +
        '<p><strong>Número:</strong> Mesa ' + mesa.numero + '</p>' +
        '<p><strong>Capacidad:</strong> ' + mesa.capacidad + ' personas</p>' +
        '<p><strong>Ubicación:</strong> ' + mesa.ubicacion + '</p>' +
        '<p><strong>Estado:</strong> ' + estadoBadge + '</p>' +
        '</div>' +
        '<div class="col-md-6">';

    if (mesa.cliente) {
        contenido += '<p><strong>Cliente:</strong> ' + mesa.cliente + '</p>';
    }
    if (mesa.hora) {
        contenido += '<p><strong>Hora:</strong> ' + mesa.hora + '</p>';
    }

    contenido += '<p><strong>Última actualización:</strong> ' + new Date().toLocaleString() + '</p>';
    contenido += '</div></div>';

    document.getElementById('contenidoDetalles').innerHTML = contenido;

    // Botón de editar
    document.getElementById('btnEditarMesa').onclick = function() {
        editarMesa(mesaId);
    };

    // Abrir modal
    new bootstrap.Modal(document.getElementById('modalDetallesMesa')).show();
}

function editarMesa(mesaId) {
    alert('Función de editar mesa - ID: ' + mesaId);
}

function cambiarEstadoMesa(mesaId) {
    if (confirm('¿Desea cambiar el estado de esta mesa?')) {
        alert('Función de cambiar estado mesa - ID: ' + mesaId);
    }
}

function liberarMesa(mesaId) {
    if (confirm('¿Desea liberar esta mesa?')) {
        alert('Función de liberar mesa - ID: ' + mesaId);
    }
}

function actualizarEstados() {
    location.reload();
}

        </script>
    </body>
</html>