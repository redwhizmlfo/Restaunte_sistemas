<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurante El Buen Sabor</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#home">
                <i class="fas fa-utensils me-2"></i>El Buen Sabor
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#home">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="#menu">Menú</a></li>
                    <li class="nav-item"><a class="nav-link" href="#reservas">Reservas</a></li>
                    <li class="nav-item"><a class="nav-link" href="#pedidos">Pedidos</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contacto">Contacto</a></li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-warning ms-2" href="auth/login.jsp">
                            <i class="fas fa-user me-1"></i>Admin
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="home" class="hero-section">
        <div class="container">
            <div class="row align-items-center min-vh-100">
                <div class="col-lg-6">
                    <h1 class="display-4 fw-bold mb-4">Bienvenido a<br><span class="text-warning">El Buen Sabor</span></h1>
                    <p class="lead mb-4">Disfruta de la mejor gastronomía peruana en un ambiente acogedor y familiar. Sabores auténticos que conquistan tu paladar.</p>
                    <div class="d-flex gap-3">
                        <a href="#menu" class="btn btn-warning btn-lg">Ver Menú</a>
                        <a href="#reservas" class="btn btn-outline-light btn-lg">Hacer Reserva</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1414235077428-338989a2e8c0?auto=format&fit=crop&w=1000&q=80" 
                         alt="Restaurante" class="img-fluid rounded-3 shadow-lg">
                </div>
            </div>
        </div>
    </section>

    <!-- Banners/Portada Section -->
    <section id="banners" class="py-5 bg-dark text-light">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card bg-secondary text-light h-100">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-award fa-3x text-warning mb-3"></i>
                            <h4 class="card-title">Calidad Premium</h4>
                            <p class="card-text">Ingredientes frescos y de la más alta calidad en cada platillo</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-secondary text-light h-100">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-clock fa-3x text-warning mb-3"></i>
                            <h4 class="card-title">Servicio Rápido</h4>
                            <p class="card-text">Atención eficiente sin comprometer la calidad de nuestros platos</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-secondary text-light h-100">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-heart fa-3x text-warning mb-3"></i>
                            <h4 class="card-title">Pasión Culinaria</h4>
                            <p class="card-text">Cada plato preparado con amor y dedicación por nuestro equipo</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Historia Culinaria Section -->
    <section id="historia" class="py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=800&q=80" 
                         alt="Historia del Restaurante" class="img-fluid rounded-3 shadow-lg">
                </div>
                <div class="col-lg-6">
                    <h2 class="display-5 fw-bold mb-4">Nuestra <span class="text-warning">Trayectoria</span></h2>
                    <p class="lead mb-3">Desde 1995, El Buen Sabor ha sido sinónimo de excelencia en la gastronomía peruana.</p>
                    <p class="mb-3">Comenzamos como un pequeño restaurante familiar en el corazón de Puno, con el sueño de compartir los auténticos sabores de nuestra tierra. A lo largo de los años, hemos crecido, pero nunca hemos olvidado nuestras raíces.</p>
                    <p class="mb-4">Hoy, somos reconocidos por mantener las recetas tradicionales transmitidas de generación en generación, combinándolas con técnicas culinarias modernas para ofrecer una experiencia gastronómica única e inolvidable.</p>
                    <div class="row g-3">
                        <div class="col-6">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-check-circle text-warning fa-2x me-3"></i>
                                <div>
                                    <h5 class="mb-0">29 años</h5>
                                    <small class="text-muted">de experiencia</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-users text-warning fa-2x me-3"></i>
                                <div>
                                    <h5 class="mb-0">50,000+</h5>
                                    <small class="text-muted">clientes satisfechos</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Chef Section -->
    <section id="chef" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold">Nuestro <span class="text-warning">Chef</span></h2>
                <p class="lead">El maestro detrás de cada sabor</p>
            </div>
            <div class="row align-items-center">
                <div class="col-lg-5 mb-4 mb-lg-0 text-center">
                    <img src="https://images.unsplash.com/photo-1583394293214-28ded15ee548?auto=format&fit=crop&w=600&q=80" 
                         alt="Chef Principal" class="img-fluid rounded-circle shadow-lg" style="width: 350px; height: 350px; object-fit: cover;">
                </div>
                <div class="col-lg-7">
                    <h3 class="fw-bold mb-3">Chef Carlos Mendoza</h3>
                    <p class="text-warning mb-3"><em>Chef Ejecutivo y Fundador</em></p>
                    <p class="mb-3">Con más de 30 años de experiencia en la alta cocina peruana, el Chef Carlos Mendoza es el alma de El Buen Sabor. Formado en las mejores escuelas culinarias de Lima y con experiencia internacional en restaurantes de Europa y América Latina.</p>
                    <p class="mb-3">Su filosofía culinaria se basa en respetar los ingredientes locales, honrar las tradiciones ancestrales y crear experiencias memorables en cada plato. Ha sido galardonado con múltiples reconocimientos nacionales e internacionales por su contribución a la gastronomía peruana.</p>
                    <div class="mt-4">
                        <h5 class="fw-bold mb-3">Especialidades:</h5>
                        <div class="row g-2">
                            <div class="col-md-6">
                                <i class="fas fa-star text-warning me-2"></i>Cocina Tradicional Peruana
                            </div>
                            <div class="col-md-6">
                                <i class="fas fa-star text-warning me-2"></i>Fusión Andina Contemporánea
                            </div>
                            <div class="col-md-6">
                                <i class="fas fa-star text-warning me-2"></i>Ceviches y Mariscos
                            </div>
                            <div class="col-md-6">
                                <i class="fas fa-star text-warning me-2"></i>Platos de la Región Altiplánica
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonios Section -->
    <section id="testimonios" class="py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold">Lo que dicen <span class="text-warning">nuestros clientes</span></h2>
                <p class="lead">Experiencias que nos motivan a seguir mejorando</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100 shadow">
                        <div class="card-body p-4">
                            <div class="mb-3">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                            </div>
                            <p class="card-text mb-3">"La mejor comida peruana que he probado en Puno. El ceviche es espectacular y el servicio es excepcional. Definitivamente volveré."</p>
                            <div class="d-flex align-items-center">
                                <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=100&q=80" 
                                     alt="Cliente" class="rounded-circle me-3" style="width: 50px; height: 50px; object-fit: cover;">
                                <div>
                                    <h6 class="mb-0">María González</h6>
                                    <small class="text-muted">Cliente Frecuente</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 shadow">
                        <div class="card-body p-4">
                            <div class="mb-3">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                            </div>
                            <p class="card-text mb-3">"Ambiente acogedor, platos deliciosos y precios justos. El lomo saltado es mi favorito. Excelente atención del personal."</p>
                            <div class="d-flex align-items-center">
                                <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80" 
                                     alt="Cliente" class="rounded-circle me-3" style="width: 50px; height: 50px; object-fit: cover;">
                                <div>
                                    <h6 class="mb-0">Roberto Flores</h6>
                                    <small class="text-muted">Turista</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 shadow">
                        <div class="card-body p-4">
                            <div class="mb-3">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                            </div>
                            <p class="card-text mb-3">"Un lugar que recomiendo al 100%. La comida es auténtica y deliciosa. Perfecto para ir en familia o con amigos."</p>
                            <div class="d-flex align-items-center">
                                <img src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=100&q=80" 
                                     alt="Cliente" class="rounded-circle me-3" style="width: 50px; height: 50px; object-fit: cover;">
                                <div>
                                    <h6 class="mb-0">Ana Quispe</h6>
                                    <small class="text-muted">Local</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Menú Section -->
<section id="menu" class="py-4 bg-light">
    <div class="container">
        <div class="text-center mb-4">
            <h2 class="display-6 fw-bold">Nuestro <span class="text-warning">Menú</span></h2>
            <p class="lead mb-0">Descubre los sabores auténticos de la cocina peruana</p>
        </div>

        <!-- Entradas -->
        <div class="mb-4">
            <h3 class="fw-bold mb-3 text-center"><i class="fas fa-leaf text-warning me-2"></i>Entradas</h3>
            <div class="row g-3">
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1564671165093-20688ff1fffa?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Ceviche">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Ceviche Clásico</h5>
                            <p class="card-text small mb-2">Pescado fresco marinado en limón con cebolla, ají y camote</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 28.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Causa">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Causa Limeña</h5>
                            <p class="card-text small mb-2">Papa amarilla con pollo, palta y mayonesa</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 18.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1625937286074-9ca519d5d9df?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Anticuchos">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Anticuchos</h5>
                            <p class="card-text small mb-2">Brochetas de corazón de res marinadas con especias</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 22.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Platos Principales -->
        <div class="mb-4">
            <h3 class="fw-bold mb-3 text-center"><i class="fas fa-drumstick-bite text-warning me-2"></i>Platos Principales</h3>
            <div class="row g-3">
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Lomo Saltado">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Lomo Saltado</h5>
                            <p class="card-text small mb-2">Carne salteada con cebolla, tomate y papas fritas</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 32.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1555939594-58d7cb561ad1?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Ají de Gallina">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Ají de Gallina</h5>
                            <p class="card-text small mb-2">Pollo deshilachado en crema de ají amarillo</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 28.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1598866594230-a7c12756260f?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Arroz con Mariscos">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Arroz con Mariscos</h5>
                            <p class="card-text small mb-2">Arroz con variedad de mariscos frescos</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 35.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Trucha Frita">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Trucha Frita del Titicaca</h5>
                            <p class="card-text small mb-2">Trucha fresca del lago con ensalada y papas</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 30.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1559847844-5315695dadae?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Seco de Cordero">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Seco de Cordero</h5>
                            <p class="card-text small mb-2">Guiso de cordero con frijoles y arroz</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 38.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Pachamanca">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Pachamanca</h5>
                            <p class="card-text small mb-2">Carnes y papas cocidas bajo tierra al estilo andino</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 40.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Postres -->
        <div class="mb-4">
            <h3 class="fw-bold mb-3 text-center"><i class="fas fa-ice-cream text-warning me-2"></i>Postres</h3>
            <div class="row g-3">
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1488477181946-6428a0291777?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Suspiro Limeño">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Suspiro a la Limeña</h5>
                            <p class="card-text small mb-2">Dulce de leche con merengue y canela</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 12.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1551024506-0bccd828d307?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Mazamorra Morada">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Mazamorra Morada</h5>
                            <p class="card-text small mb-2">Postre tradicional de maíz morado con frutas</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 8.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Picarones">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Picarones</h5>
                            <p class="card-text small mb-2">Buñuelos de zapallo con miel de chancaca</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 10.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bebidas -->
        <div class="mb-4">
            <h3 class="fw-bold mb-3 text-center"><i class="fas fa-glass-cheers text-warning me-2"></i>Bebidas</h3>
            <div class="row g-3">
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1622597467836-f3285f2131b8?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Chicha Morada">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Chicha Morada</h5>
                            <p class="card-text small mb-2">Bebida refrescante de maíz morado</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 5.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1546173159-315724a31696?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Inca Kola">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Inca Kola</h5>
                            <p class="card-text small mb-2">Gaseosa peruana 500ml</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 4.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Pisco Sour">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Pisco Sour</h5>
                            <p class="card-text small mb-2">Cóctel clásico peruano</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 18.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100 shadow-sm">
                        <img src="https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?auto=format&fit=crop&w=400&h=250&q=80" class="card-img-top" alt="Emoliente">
                        <div class="card-body p-3">
                            <h5 class="card-title fw-bold mb-1">Emoliente</h5>
                            <p class="card-text small mb-2">Bebida caliente de hierbas</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h6 mb-0 text-warning">S/ 3.00</span>
                                <button class="btn btn-warning btn-sm">Ordenar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Reservas Section -->
    <section id="reservas" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold">Hacer una <span class="text-warning">Reserva</span></h2>
                <p class="lead">Reserva tu mesa y disfruta de una experiencia única</p>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card shadow-lg">
                        <div class="card-body p-5">
                            <form id="reservaForm" action="ReservaController" method="POST">
                                <input type="hidden" name="action" value="create">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="nombre" class="form-label">Nombre completo *</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="telefono" class="form-label">Teléfono *</label>
                                        <input type="tel" class="form-control" id="telefono" name="telefono" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="personas" class="form-label">Número de personas *</label>
                                        <select class="form-select" id="personas" name="personas" required>
                                            <option value="">Seleccionar...</option>
                                            <c:forEach var="i" begin="1" end="10">
                                                <option value="${i}">${i} ${i==1 ? "persona" : "personas"}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="fecha" class="form-label">Fecha *</label>
                                        <input type="date" class="form-control" id="fecha" name="fecha" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="hora" class="form-label">Hora *</label>
                                        <select class="form-select" id="hora" name="hora" required>
                                            <option value="">Seleccionar...</option>
                                            <option value="12:00">12:00 PM</option>
                                            <option value="12:30">12:30 PM</option>
                                            <option value="13:00">1:00 PM</option>
                                            <option value="13:30">1:30 PM</option>
                                            <option value="14:00">2:00 PM</option>
                                            <option value="14:30">2:30 PM</option>
                                            <option value="15:00">3:00 PM</option>
                                            <option value="18:00">6:00 PM</option>
                                            <option value="18:30">6:30 PM</option>
                                            <option value="19:00">7:00 PM</option>
                                            <option value="19:30">7:30 PM</option>
                                            <option value="20:00">8:00 PM</option>
                                            <option value="20:30">8:30 PM</option>
                                            <option value="21:00">9:00 PM</option>
                                            <option value="21:30">9:30 PM</option>
                                            <option value="22:00">10:00 PM</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="comentarios" class="form-label">Comentarios especiales</label>
                                    <textarea class="form-control" id="comentarios" name="comentarios" rows="3" placeholder="Ocasión especial, restricciones alimentarias, etc."></textarea>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-warning btn-lg">
                                        <i class="fas fa-calendar-check me-2"></i>Confirmar Reserva
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Pedidos Section -->
    <section id="pedidos" class="py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold">Hacer un <span class="text-warning">Pedido</span></h2>
                <p class="lead">Ordena tus platos favoritos para delivery o recojo</p>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card shadow-lg">
                        <div class="card-body p-5">
                            <form id="pedidoForm" action="PedidoController" method="POST">
                                <input type="hidden" name="action" value="create">
                                
                                <!-- Datos del Cliente -->
                                <h4 class="fw-bold mb-4"><i class="fas fa-user text-warning me-2"></i>Datos del Cliente</h4>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="pedido_nombre" class="form-label">Nombre completo *</label>
                                        <input type="text" class="form-control" id="pedido_nombre" name="nombre" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="pedido_telefono" class="form-label">Teléfono *</label>
                                        <input type="tel" class="form-control" id="pedido_telefono" name="telefono" required>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-md-6">
                                        <label for="pedido_email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="pedido_email" name="email">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="tipo_entrega" class="form-label">Tipo de entrega *</label>
                                        <select class="form-select" id="tipo_entrega" name="tipo_entrega" required>
                                            <option value="">Seleccionar...</option>
                                            <option value="delivery">Delivery a domicilio</option>
                                            <option value="recojo">Recojo en tienda</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Dirección (solo para delivery) -->
                                <div id="direccion_section" style="display:none;">
                                    <h4 class="fw-bold mb-4"><i class="fas fa-map-marker-alt text-warning me-2"></i>Dirección de Entrega</h4>
                                    <div class="row mb-4">
                                        <div class="col-md-8">
                                            <label for="direccion" class="form-label">Dirección completa *</label>
                                            <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Calle, número, distrito">
                                        </div>
                                        <div class="col-md-4">
                                            <label for="referencia" class="form-label">Referencia</label>
                                            <input type="text" class="form-control" id="referencia" name="referencia" placeholder="Cerca de...">
                                        </div>
                                    </div>
                                </div>

                                <!-- Pedido -->
                                <h4 class="fw-bold mb-4"><i class="fas fa-shopping-cart text-warning me-2"></i>Tu Pedido</h4>
                                <div id="items_pedido">
                                    <div class="row mb-3 item-pedido">
                                        <div class="col-md-6">
                                            <label class="form-label">Plato *</label>
                                            <select class="form-select" name="platos[]" required>
                                                <option value="">Seleccionar plato...</option>
                                                <optgroup label="Entradas">
                                                    <option value="Ceviche Clásico|28.00">Ceviche Clásico - S/ 28.00</option>
                                                    <option value="Causa Limeña|18.00">Causa Limeña - S/ 18.00</option>
                                                    <option value="Anticuchos|22.00">Anticuchos - S/ 22.00</option>
                                                </optgroup>
                                                <optgroup label="Platos Principales">
                                                    <option value="Lomo Saltado|32.00">Lomo Saltado - S/ 32.00</option>
                                                    <option value="Ají de Gallina|28.00">Ají de Gallina - S/ 28.00</option>
                                                    <option value="Arroz con Mariscos|35.00">Arroz con Mariscos - S/ 35.00</option>
                                                    <option value="Trucha Frita del Titicaca|30.00">Trucha Frita del Titicaca - S/ 30.00</option>
                                                    <option value="Seco de Cordero|38.00">Seco de Cordero - S/ 38.00</option>
                                                    <option value="Pachamanca|40.00">Pachamanca - S/ 40.00</option>
                                                </optgroup>
                                                <optgroup label="Postres">
                                                    <option value="Suspiro a la Limeña|12.00">Suspiro a la Limeña - S/ 12.00</option>
                                                    <option value="Mazamorra Morada|8.00">Mazamorra Morada - S/ 8.00</option>
                                                    <option value="Picarones|10.00">Picarones - S/ 10.00</option>
                                                </optgroup>
                                                <optgroup label="Bebidas">
                                                    <option value="Chicha Morada|5.00">Chicha Morada - S/ 5.00</option>
                                                    <option value="Inca Kola|4.00">Inca Kola - S/ 4.00</option>
                                                    <option value="Pisco Sour|18.00">Pisco Sour - S/ 18.00</option>
                                                    <option value="Emoliente|3.00">Emoliente - S/ 3.00</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">Cantidad *</label>
                                            <input type="number" class="form-control" name="cantidades[]" min="1" value="1" required>
                                        </div>
                                        <div class="col-md-3 d-flex align-items-end">
                                            <button type="button" class="btn btn-danger w-100" onclick="eliminarItem(this)">
                                                <i class="fas fa-trash"></i> Eliminar
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-outline-warning mb-4" onclick="agregarItem()">
                                    <i class="fas fa-plus me-2"></i>Agregar otro plato
                                </button>

                                <!-- Observaciones -->
                                <div class="mb-4">
                                    <label for="observaciones" class="form-label">Observaciones</label>
                                    <textarea class="form-control" id="observaciones" name="observaciones" rows="3" placeholder="Indicaciones especiales para tu pedido..."></textarea>
                                </div>

                                <!-- Resumen -->
                                <div class="alert alert-warning">
                                    <h5 class="fw-bold mb-2"><i class="fas fa-info-circle me-2"></i>Información Importante</h5>
                                    <ul class="mb-0">
                                        <li>Tiempo de preparación: 30-45 minutos</li>
                                        <li>Delivery disponible en el centro de Puno</li>
                                        <li>Costo de delivery: S/ 5.00 (Gratis en compras mayores a S/ 50)</li>
                                        <li>Horario de atención: Lunes a Domingo 12:00 PM - 10:00 PM</li>
                                    </ul>
                                </div>

                                <div class="d-grid">
                                    <button type="submit" class="btn btn-warning btn-lg">
                                        <i class="fas fa-check-circle me-2"></i>Confirmar Pedido
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Mapa Section -->
    <section id="mapa" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold">Encuéntranos en <span class="text-warning">Puno</span></h2>
                <p class="lead">Visítanos y disfruta de una experiencia gastronómica inolvidable</p>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card shadow">
                        <div class="card-body p-0">
                            <iframe 
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3872.742964774758!2d-70.02486892393967!3d-15.840179085007806!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x915d699a4b4d07d1%3A0x40c1330c85d49af5!2sJr.%20Tacna%2C%20Puno!5e0!3m2!1ses!2spe!4v1698284751234!5m2!1ses!2spe" 
                                width="100%" 
                                height="450" 
                                style="border:0;" 
                                allowfullscreen="" 
                                loading="lazy" 
                                referrerpolicy="no-referrer-when-downgrade">
                            </iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contacto Section -->
    <section id="contacto" class="py-5 bg-dark text-light">
        <div class="container text-center">
            <h2 class="display-5 fw-bold mb-4">¿Tienes alguna <span class="text-warning">pregunta?</span></h2>
            <p class="lead mb-4">Estamos aquí para ayudarte. Contáctanos y te responderemos lo más pronto posible.</p>
            <a href="tel:+51999888777" class="btn btn-warning btn-lg me-2">
                <i class="fas fa-phone me-2"></i>Llamar Ahora
            </a>
            <a href="mailto:contacto@elbuensabor.com" class="btn btn-outline-light btn-lg">
                <i class="fas fa-envelope me-2"></i>Enviar Email
            </a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-light py-5 border-top border-secondary">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <h5 class="fw-bold mb-3 text-warning">Restaurante El Buen Sabor</h5>
                    <p>Disfruta de la mejor gastronomía peruana en un ambiente acogedor y familiar desde 1995.</p>
                    <div class="mt-3">
                        <a href="#" class="btn btn-outline-warning btn-sm me-2"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="btn btn-outline-warning btn-sm me-2"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="btn btn-outline-warning btn-sm me-2"><i class="fab fa-whatsapp"></i></a>
                        <a href="#" class="btn btn-outline-warning btn-sm"><i class="fab fa-tiktok"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <h5 class="fw-bold mb-3 text-warning">Información de Contacto</h5>
                    <p class="mb-2"><i class="fas fa-map-marker-alt text-warning me-2"></i>Jr. Tacna 245, Centro de Puno</p>
                    <p class="mb-2"><i class="fas fa-phone text-warning me-2"></i>+51 999 888 777</p>
                    <p class="mb-2"><i class="fas fa-phone text-warning me-2"></i>+51 051 123 456</p>
                    <p class="mb-2"><i class="fas fa-envelope text-warning me-2"></i>contacto@elbuensabor.com</p>
                    <p class="mb-2"><i class="fas fa-envelope text-warning me-2"></i>reservas@elbuensabor.com</p>
                </div>
                <div class="col-lg-4 col-md-6">
                    <h5 class="fw-bold mb-3 text-warning">Horario de Atención</h5>
                    <p class="mb-2"><strong>Lunes a Viernes:</strong></p>
                    <p class="mb-3">12:00 PM - 10:00 PM</p>
                    <p class="mb-2"><strong>Sábados y Domingos:</strong></p>
                    <p class="mb-3">12:00 PM - 11:00 PM</p>
                </div>
            </div>
            <hr class="my-4 border-secondary">
            <div class="row">
                <div class="col-md-6">
                    <p class="mb-0">&copy; 2024 Restaurante El Buen Sabor. Todos los derechos reservados.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p class="mb-0">Desarrollado con <i class="fas fa-heart text-danger"></i> en Puno, Perú</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
    
   

    <!-- Modal -->
    <div class="modal fade" id="confirmModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirmación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div id="modal-message"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 🛒 Carrito Flotante -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="cartButton" class="btn btn-warning btn-lg rounded-pill shadow-lg position-relative" 
         data-bs-toggle="offcanvas" data-bs-target="#cartOffcanvas" 
         style="width: 70px; height: 70px; display: flex; align-items: center; justify-content: center;">
        <i class="fas fa-shopping-cart fa-xl"></i>
        <span id="cartCount" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" 
              style="display: none;">0</span>
    </div>
</div>

<!-- Carrito Flotante -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <!-- Botón del carrito -->
    <div id="cartButton" class="btn btn-warning btn-lg rounded-pill shadow-lg position-relative" 
         data-bs-toggle="offcanvas" data-bs-target="#cartOffcanvas" 
         style="width: 70px; height: 70px; display: flex; align-items: center; justify-content: center;">
        <i class="fas fa-shopping-cart fa-xl"></i>
        <span id="cartCount" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" 
              style="display: none;">0</span>
    </div>
</div>

<!-- Offcanvas del Carrito -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="cartOffcanvas" style="width: 450px;">
    <div class="offcanvas-header bg-warning text-dark">
        <h5 class="offcanvas-title fw-bold">
            <i class="fas fa-shopping-cart me-2"></i>Mi Pedido
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>

    <div class="offcanvas-body p-0">
        <!-- Lista de productos -->
        <div id="cartItems" class="p-3" style="max-height: 300px; overflow-y: auto;">
            <div class="text-center text-muted">
                <i class="fas fa-shopping-cart fa-2x mb-2"></i>
                <p>Tu carrito está vacío</p>
            </div>
        </div>

        <!-- Resumen de precios -->
        <div class="border-top p-3 bg-light">
            <div id="priceBreakdown" class="mb-3"></div>

            <!-- Totales -->
            <div class="border-top pt-2">
                <div class="d-flex justify-content-between mb-2">
                    <span class="fw-bold">Subtotal:</span>
                    <span id="cartSubtotal" class="fw-bold">S/ 0.00</span>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <span>Delivery:</span>
                    <span id="deliveryCost">S/ 5.00</span>
                </div>
                <div class="d-flex justify-content-between border-top pt-2">
                    <strong class="h6">Total:</strong>
                    <strong id="cartTotal" class="text-warning h5">S/ 0.00</strong>
                </div>
            </div>
        </div>

        <!-- Formulario -->
        <div class="p-3">
            <h6 class="fw-bold mb-3">Datos para el pedido</h6>

            <form id="cartForm">
                <div class="mb-3">
                    <label class="form-label small fw-bold">Nombre completo *</label>
                    <input type="text" class="form-control form-control-sm" name="nombre" required>
                </div>

                <div class="row mb-3">
                    <div class="col-6">
                        <label class="form-label small fw-bold">Email *</label>
                        <input type="email" class="form-control form-control-sm" name="email" required>
                    </div>
                    <div class="col-6">
                        <label class="form-label small fw-bold">Celular *</label>
                        <input type="tel" class="form-control form-control-sm" name="celular" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label small fw-bold">Dirección</label>
                    <input type="text" class="form-control form-control-sm" name="direccion" placeholder="Calle, número, distrito">
                </div>

                <div class="mb-3">
                    <label class="form-label small fw-bold">Método de pago</label>
                    <select class="form-select form-select-sm" name="metodo_pago" id="paymentMethod">
                        <option value="efectivo">Efectivo</option>
                        <option value="tarjeta">Tarjeta</option>
                        <option value="yape">Yape/Plin</option>
                    </select>
                </div>

                <div id="tarjetaFields" style="display: none;">
                    <div class="row mb-2">
                        <div class="col-8">
                            <label class="form-label small fw-bold">Número de tarjeta *</label>
                            <input type="text" class="form-control form-control-sm" name="numero_tarjeta" placeholder="1234 5678 9012 3456">
                        </div>
                        <div class="col-4">
                            <label class="form-label small fw-bold">CVV *</label>
                            <input type="text" class="form-control form-control-sm" name="cvv" placeholder="123">
                        </div>
                    </div>
                    <div class="mb-2">
                        <label class="form-label small fw-bold">Titular *</label>
                        <input type="text" class="form-control form-control-sm" name="titular_tarjeta" placeholder="Como aparece en la tarjeta">
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-bold">Entidad bancaria</label>
                        <select class="form-select form-select-sm" name="entidad_bancaria">
                            <option value="">Seleccionar entidad</option>
                            <option value="bcp">BCP</option>
                            <option value="bbva">BBVA</option>
                            <option value="interbank">Interbank</option>
                            <option value="scotiabank">Scotiabank</option>
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label small fw-bold">Mensaje adicional</label>
                    <textarea class="form-control form-control-sm" name="mensaje" rows="2" placeholder="Indicaciones especiales..."></textarea>
                </div>

                <button type="submit" class="btn btn-warning w-100 fw-bold">
                    <i class="fas fa-check-circle me-2"></i>Confirmar Pedido - <span id="confirmTotal">S/ 0.00</span>
                </button>
            </form>
        </div>
    </div>
</div>

<script src="/js/cart.js"></script>

    
    <script>
        // Mostrar/ocultar sección de dirección según tipo de entrega
        document.getElementById('tipo_entrega').addEventListener('change', function() {
            const direccionSection = document.getElementById('direccion_section');
            const direccionInput = document.getElementById('direccion');
            
            if (this.value === 'delivery') {
                direccionSection.style.display = 'block';
                direccionInput.required = true;
            } else {
                direccionSection.style.display = 'none';
                direccionInput.required = false;
            }
        });

        // Agregar nuevo item al pedido
        function agregarItem() {
            const itemsContainer = document.getElementById('items_pedido');
            const nuevoItem = document.querySelector('.item-pedido').cloneNode(true);
            
            // Limpiar valores
            nuevoItem.querySelectorAll('select, input').forEach(el => {
                if (el.type === 'number') {
                    el.value = 1;
                } else {
                    el.value = '';
                }
            });
            
            itemsContainer.appendChild(nuevoItem);
        }

        // Eliminar item del pedido
        function eliminarItem(button) {
            const items = document.querySelectorAll('.item-pedido');
            if (items.length > 1) {
                button.closest('.item-pedido').remove();
            } else {
                alert('Debe haber al menos un plato en el pedido');
            }
        }
        </script>
        <script></script>
</body>
</html>