<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../partials/header.jsp" %>

<div class="container-fluid p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-shopping-cart text-success me-2"></i>Gestión de Pedidos</h2>
        <div class="d-flex gap-2">
            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#nuevoPedidoModal">
                <i class="fas fa-plus me-2"></i>Nuevo Pedido
            </button>
            <button class="btn btn-info" onclick="actualizarPedidos()">
                <i class="fas fa-sync-alt me-2"></i>Actualizar
            </button>
        </div>
    </div>

    <!-- Estadísticas Rápidas -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card bg-warning text-dark">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-clock fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0" id="pedidos-pendientes">8</h5>
                            <small>Pedidos Pendientes</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card bg-info text-white">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-fire fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0" id="pedidos-preparacion">12</h5>
                            <small>En Preparación</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card bg-primary text-white">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-truck fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0" id="pedidos-delivery">5</h5>
                            <small>En Delivery</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-check-circle fa-2x me-3"></i>
                        <div>
                            <h5 class="mb-0" id="pedidos-completados">45</h5>
                            <small>Completados Hoy</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Filtros -->
    <div class="card mb-4">
        <div class="card-body">
            <form id="filtrosPedidosForm" class="row g-3">
                <div class="col-md-2">
                    <label for="fechaPedidoFiltro" class="form-label">Fecha</label>
                    <input type="date" class="form-control" id="fechaPedidoFiltro" name="fecha">
                </div>
                <div class="col-md-2">
                    <label for="estadoPedidoFiltro" class="form-label">Estado</label>
                    <select class="form-select" id="estadoPedidoFiltro" name="estado">
                        <option value="">Todos</option>
                        <option value="nuevo">Nuevo</option>
                        <option value="confirmado">Confirmado</option>
                        <option value="en_preparacion">En Preparación</option>
                        <option value="listo">Listo</option>
                        <option value="en_delivery">En Delivery</option>
                        <option value="entregado">Entregado</option>
                        <option value="cancelado">Cancelado</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label for="tipoPedidoFiltro" class="form-label">Tipo</label>
                    <select class="form-select" id="tipoPedidoFiltro" name="tipo">
                        <option value="">Todos</option>
                        <option value="delivery">Delivery</option>
                        <option value="recojo">Recojo</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="clientePedidoFiltro" class="form-label">Cliente</label>
                    <input type="text" class="form-control" id="clientePedidoFiltro" name="cliente" placeholder="Buscar por nombre...">
                </div>
                <div class="col-md-3 d-flex align-items-end">
                    <button type="button" class="btn btn-outline-primary me-2" onclick="aplicarFiltrosPedidos()">
                        <i class="fas fa-search me-2"></i>Buscar
                    </button>
                    <button type="reset" class="btn btn-outline-secondary">
                        <i class="fas fa-undo me-2"></i>Limpiar
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Tabla de Pedidos -->
    <div class="card">
        <div class="card-body">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Cliente</th>
                        <th>Fecha</th>
                        <th>Tipo</th>
                        <th>Total</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pedido" items="${listaPedidos}">
                        <tr>
                            <td>${pedido.id}</td>
                            <td>${pedido.cliente.nombre}</td>
                            <td><fmt:formatDate value="${pedido.fecha}" pattern="dd/MM/yyyy HH:mm"/></td>
                            <td>${pedido.tipo}</td>
                            <td>S/ <fmt:formatNumber value="${pedido.total}" type="currency" currencySymbol=""/></td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${pedido.estado == 'nuevo'}">bg-warning text-dark</c:when>
                                        <c:when test="${pedido.estado == 'en_preparacion'}">bg-info</c:when>
                                        <c:when test="${pedido.estado == 'en_delivery'}">bg-primary</c:when>
                                        <c:when test="${pedido.estado == 'entregado'}">bg-success</c:when>
                                        <c:otherwise>bg-secondary</c:otherwise>
                                    </c:choose>">
                                    ${pedido.estado}
                                </span>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary" onclick="verPedido(${pedido.id})">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <button class="btn btn-sm btn-outline-success" onclick="editarPedido(${pedido.id})">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="btn btn-sm btn-outline-danger" onclick="eliminarPedido(${pedido.id})">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Nuevo Pedido -->
<div class="modal fade" id="nuevoPedidoModal" tabindex="-1" aria-labelledby="nuevoPedidoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form id="nuevoPedidoForm" method="post" action="PedidoController">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title" id="nuevoPedidoModalLabel"><i class="fas fa-plus-circle me-2"></i>Registrar Pedido</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Cliente</label>
                        <input type="text" class="form-control" name="cliente" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Tipo de Pedido</label>
                        <select class="form-select" name="tipo" required>
                            <option value="delivery">Delivery</option>
                            <option value="recojo">Recojo</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label">Detalle</label>
                        <textarea class="form-control" name="detalle" rows="3"></textarea>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Total (S/)</label>
                        <input type="number" class="form-control" name="total" step="0.01" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Estado</label>
                        <select class="form-select" name="estado" required>
                            <option value="nuevo">Nuevo</option>
                            <option value="confirmado">Confirmado</option>
                            <option value="en_preparacion">En Preparación</option>
                            <option value="listo">Listo</option>
                            <option value="en_delivery">En Delivery</option>
                            <option value="entregado">Entregado</option>
                            <option value="cancelado">Cancelado</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success"><i class="fas fa-save me-2"></i>Guardar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times me-2"></i>Cancelar</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%@ include file="../partials/footer.jsp" %>
