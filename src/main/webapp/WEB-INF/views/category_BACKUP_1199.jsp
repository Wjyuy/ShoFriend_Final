<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>

    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Shop Grid - ShopGrids Bootstrap 5 eCommerce HTML Template.</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />


    <meta charset="UTF-8">
    <title>카테고리별 상품 출력</title>
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css"> -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/timer.js"></script>

</head>

<body>
    <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

	    <!-- Start Header Area -->
	    <header class="header navbar-area">
	        <!-- Start Topbar -->
	        <div class="topbar">
	            <div class="container">
	                <div class="row align-items-center">
	                    <div class="col-lg-4 col-md-4 col-12">
	                        <div class="top-left">
	                            <ul class="menu-top-link">
	                                <li>
	                                    <div class="select-position">
	                                        <select id="select4">
	                                            <option value="0" selected>$ USD</option>
	                                            <option value="1">€ EURO</option>
	                                            <option value="2">$ CAD</option>
	                                            <option value="3">₹ INR</option>
	                                            <option value="4">¥ CNY</option>
	                                            <option value="5">৳ BDT</option>
	                                        </select>
	                                    </div>
	                                </li>
	                                <li>
	                                    <div class="select-position">
	                                        <select id="select5">
	                                            <option value="0" selected>English</option>
	                                            <option value="1">Español</option>
	                                            <option value="2">Filipino</option>
	                                            <option value="3">Français</option>
	                                            <option value="4">العربية</option>
	                                            <option value="5">हिन्दी</option>
	                                            <option value="6">বাংলা</option>
	                                        </select>
	                                    </div>
	                                </li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-md-4 col-12">
	                        <div class="top-middle">
	                            <ul class="useful-links">
	                                <li><a href="main">Home</a></li>
	                                <li><a href="friend">Friend</a></li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-md-4 col-12">
	                        <div class="top-end">
	                            <div class="user">
									<c:choose>
										<c:when test="${sessionScope.userType == 'seller'}">
			                                <i class="lni lni-user"></i>
		                                	${sessionScope.loginSeller.name}
										</c:when>
										<c:when test="${sessionScope.userType == 'customer'}">
			                                <i class="lni lni-user"></i>
											${sessionScope.loginCustomer.name}
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
	                            </div>
	                            <ul class="user-login">
	                                <li>
	                                    <a href="my_page">My Page</a>
	                                </li>
	                                <li>
	                                    <a href="log/login">Sign In</a>
	                                </li>
	                                <li>
	                                    <a href="log/customer_register">Register</a>
	                                </li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- End Topbar -->
	        <!-- Start Header Middle -->
	        <div class="header-middle">
	            <div class="container">
	                <div class="row align-items-center">
	                    <div class="col-lg-3 col-md-3 col-7">
	                        <!-- Start Header Logo -->
	                        <a class="navbar-brand" href="main">
	<!--                            <img src="assets/images/logo/logo.svg" alt="Logo">-->
	                            <img src="assets/images/logo/ShoFriend_logo.png" alt="Logo" >
	                        </a>
	                        <!-- End Header Logo -->
	                    </div>
	                    <div class="col-lg-5 col-md-7 d-xs-none">
	                        <!-- Start Main Menu Search -->
	                        <div class="main-menu-search">
	                            <!-- navbar search start -->
	                            <div class="navbar-search search-style-5">
	                                <div class="search-select">
	                                    <div class="select-position">
	                                        <select id="select1">
	                                            <option selected>All</option>
	                                            <option value="1">option 01</option>
	                                            <option value="2">option 02</option>
	                                            <option value="3">option 03</option>
	                                            <option value="4">option 04</option>
	                                            <option value="5">option 05</option>
	                                        </select>
	                                    </div>
	                                </div>
	                                <div class="search-input">
	                                    <input type="text" placeholder="Search">
	                                </div>
	                                <div class="search-btn">
	                                    <button><i class="lni lni-search-alt"></i></button>
	                                </div>
	                            </div>
	                            <!-- navbar search Ends -->
	                        </div>
	                        <!-- End Main Menu Search -->
	                    </div>
	                    <div class="col-lg-4 col-md-2 col-5">
	                        <div class="middle-right-area">
	                            <div class="nav-hotline">
	                                <i class="lni lni-phone"></i>
	                                <h3>Hotline:
	<!--                                    <span>(+100) 123 456 7890</span>-->
	                                    <span> 051) 123 4567</span>
	                                </h3>
	                            </div>
	                            <div class="navbar-cart">
	                                <div class="wishlist">
	                                    <a href="javascript:void(0)">
	                                        <i class="lni lni-heart"></i>
	                                        <span class="total-items">0</span>
	                                    </a>
	                                </div>
	                                <div class="cart-items">
	                                    <a href="javascript:void(0)" class="main-btn">
	                                        <i class="lni lni-cart"></i>
	                                        <span class="total-items">2</span>
	                                    </a>
	                                    <!-- Shopping Item -->
	                                    <div class="shopping-item">
	                                        <div class="dropdown-cart-header">
	                                            <span>2 Items</span>
	                                            <a href="cart.html">View Cart</a>
	                                        </div>
	                                        <ul class="shopping-list">
	                                            <li>
	                                                <a href="javascript:void(0)" class="remove" title="Remove this item"><i
	                                                        class="lni lni-close"></i></a>
	                                                <div class="cart-img-head">
	                                                    <a class="cart-img" href="product-details.html"><img
	                                                            src="assets/images/header/cart-items/item1.jpg" alt="#"></a>
	                                                </div>

	                                                <div class="content">
	                                                    <h4><a href="product-details.html">
	                                                            Apple Watch Series 6</a></h4>
	                                                    <p class="quantity">1x - <span class="amount">$99.00</span></p>
	                                                </div>
	                                            </li>
	                                            <li>
	                                                <a href="javascript:void(0)" class="remove" title="Remove this item"><i
	                                                        class="lni lni-close"></i></a>
	                                                <div class="cart-img-head">
	                                                    <a class="cart-img" href="product-details.html"><img
	                                                            src="assets/images/header/cart-items/item2.jpg" alt="#"></a>
	                                                </div>
	                                                <div class="content">
	                                                    <h4><a href="product-details.html">Wi-Fi Smart Camera</a></h4>
	                                                    <p class="quantity">1x - <span class="amount">$35.00</span></p>
	                                                </div>
	                                            </li>
	                                        </ul>
	                                        <div class="bottom">
	                                            <div class="total">
	                                                <span>Total</span>
	                                                <span class="total-amount">$134.00</span>
	                                            </div>
	                                            <div class="button">
	                                                <a href="checkout.html" class="btn animate">Checkout</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <!--/ End Shopping Item -->
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- End Header Middle -->
	        <!-- Start Header Bottom -->
	        <div class="container">
	            <div class="row align-items-center">
	                <div class="col-lg-8 col-md-6 col-12">
	                    <div class="nav-inner">
	                        <!-- Start Mega Category Menu -->
	                        <div class="mega-category-menu">
	                            <span class="cat-button"><a href="category"><i class="lni lni-menu"></i>All Categories</a></span>
	                            <ul class="sub-category">
	                                <li><a href="product-grids.html">추천상품</a>
	<!--                                <li><a href="product-grids.html">추천상품<i class="lni lni-chevron-right"></i></a>-->
	<!--                                    <ul class="inner-sub-category">-->
	<!--                                        <li><a href="product-grids.html">하위목록1</a></li>-->
	<!--                                        <li><a href="product-grids.html">하위목록2</a></li>-->
	<!--                                        <li><a href="product-grids.html">하위목록3</a></li>-->
	<!--                                        <li><a href="product-grids.html">하위목록4</a></li>-->
	<!--                                    </ul>-->
	                                </li>
	                                <li><a href="product-grids.html">반짝세일</a></li>
	                                <li><a href="product-grids.html">식품</a></li>
	                                <li><a href="product-grids.html">가구</a></li>
	                                <li><a href="product-grids.html">도서</a></li>
	                                <li><a href="product-grids.html">스포츠/레저</a></li>
	                                <li><a href="product-grids.html">출산/유아용품</a></li>
	                                <li><a href="product-grids.html">반려동물용품</a></li>
	                                <li><a href="product-grids.html">뷰티</a></li>
	                            </ul>
	                        </div>
	                        <!-- End Mega Category Menu -->
	                        <!-- Start Navbar -->
	                        <nav class="navbar navbar-expand-lg">
	                            <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
	                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
	                                aria-expanded="false" aria-label="Toggle navigation">
	                                <span class="toggler-icon"></span>
	                                <span class="toggler-icon"></span>
	                                <span class="toggler-icon"></span>
	                            </button>
	                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
	                                <ul id="nav" class="navbar-nav ms-auto">
	                                    <li class="nav-item">
	                                        <a href="main" class="active" aria-label="Toggle navigation">Home</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
	                                            data-bs-target="#submenu-1-2" aria-controls="navbarSupportedContent"
	                                            aria-expanded="false" aria-label="Toggle navigation">Pages</a>
	                                        <ul class="sub-menu collapse" id="submenu-1-2">
	<!--                                            <li class="nav-item"><a href="faq.html">Faq</a></li>-->
	                                            <li class="nav-item"><a href="log/login">Login</a></li>
	                                            <li class="nav-item"><a href="log/customer_register">Register</a></li>
	                                        </ul>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
	                                            data-bs-target="#submenu-1-3" aria-controls="navbarSupportedContent"
	                                            aria-expanded="false" aria-label="Toggle navigation">Shop</a>
	                                        <ul class="sub-menu collapse" id="submenu-1-3">
	<!--                                            <li class="nav-item"><a href="product-grids.html">Shop Grid</a></li>-->
	<!--                                            <li class="nav-item"><a href="product-list.html">Shop List</a></li>-->
	<!--                                            <li class="nav-item"><a href="product-details.html">shop Single</a></li>-->
	                                            <li class="nav-item"><a href="cart_view">Cart</a></li>
	<!--                                            <li class="nav-item"><a href="checkout.html">Checkout</a></li>-->
	                                        </ul>
	                                    </li>
	<!--                                    <li class="nav-item">-->
	<!--                                        <a href="contact.html" aria-label="Toggle navigation">Contact Us</a>-->
	<!--                                    </li>-->
	                                </ul>
	                            </div> <!-- navbar collapse -->
	                        </nav>
	                        <!-- End Navbar -->
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-6 col-12">
	                    <!-- Start Nav Social -->
	                    <div class="nav-social">
	                        <h5 class="title">Follow Us:</h5>
	                        <ul>
	                            <li>
	                                <a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0)"><i class="lni lni-instagram"></i></a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0)"><i class="lni lni-skype"></i></a>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- End Nav Social -->
	                </div>
	            </div>
	        </div>
	        <!-- End Header Bottom -->
	    </header>
	    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Shop Grid</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="javascript:void(0)">Shop</a></li>
                        <li>Shop Grid</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Product Grids -->
    <section class="product-grids section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-12">
                    <!-- Start Product Sidebar -->
                    <div class="product-sidebar">
                        <!-- Start Single Widget -->
                        <div class="single-widget search">

                            <h3>Search Product</h3>
                            <form action="#">
                                <input type="text" placeholder="Search Here...">
                                <button type="submit"><i class="lni lni-search-alt"></i></button>
                            </form>
                        </div>

                        <!-- End Single Widget -->
                        <!-- Start Single Widget -->
                        <div class="single-widget">
                            <h3>모든 카테고리</h3>
                            <ul class="list">
                                <li>
                                    <a href="product-grids.html">추천상품</a><span>(1138)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">반짝세일</a><span>(2356)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">식품</a><span>(420)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">가구</a><span>(874)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">도서</a><span>(1239)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">스포츠/레저</a><span>(340)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">출산/유아용품</a><span>(512)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">반려동물용품</a><span>(512)</span>
                                </li>
                                <li>
                                    <a href="product-grids.html">뷰티</a><span>(512)</span>
                                </li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                        <!-- Start Single Widget -->
                        <div class="single-widget range">
                            <h3>가격 범위</h3>
                            <input type="range" class="form-range" name="range" step="5" min="100" max="1000000"
                                value="100" onchange="rangePrimary.value=value">
                            <div class="range-inner">
                                <input type="text" id="rangePrimary" placeholder="100" />
                                <label>원</label>
                            </div>
                        </div>
                        <!-- End Single Widget -->
                        <!-- Start Single Widget -->
                        <div class="single-widget condition">
                            <h3>가격조정</h3>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1">
                                <label class="form-check-label" for="flexCheckDefault1">
                                    0 - 10,000 (208)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
                                <label class="form-check-label" for="flexCheckDefault2">
                                    10,000 - 100,000 (311)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault3">
                                <label class="form-check-label" for="flexCheckDefault3">
                                    100,000 - 1,000,000 (485)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault4">
                                <label class="form-check-label" for="flexCheckDefault4">
                                    1,000,000 - 10,000,000 (213)
                                </label>
                            </div>
                        </div>
                        <!-- End Single Widget -->
                        <!-- Start Single Widget -->
                        <div class="single-widget condition">
                            <h3>브랜드 별</h3>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault11">
                                <label class="form-check-label" for="flexCheckDefault11">
                                    Apple (254)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault22">
                                <label class="form-check-label" for="flexCheckDefault22">
                                    Bosh (39)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault33">
                                <label class="form-check-label" for="flexCheckDefault33">
                                    Canon Inc. (128)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault44">
                                <label class="form-check-label" for="flexCheckDefault44">
                                    Dell (310)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault55">
                                <label class="form-check-label" for="flexCheckDefault55">
                                    Hewlett-Packard (42)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault66">
                                <label class="form-check-label" for="flexCheckDefault66">
                                    Hitachi (217)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault77">
                                <label class="form-check-label" for="flexCheckDefault77">
                                    LG Electronics (310)
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault88">
                                <label class="form-check-label" for="flexCheckDefault88">
                                    Panasonic (74)
                                </label>
                            </div>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                    <!-- End Product Sidebar -->
                </div>
                <div class="col-lg-9 col-12">
                    <div class="product-grids-head">
                        <div class="product-grid-topbar">
                            <div class="row align-items-center">
                                <div class="col-lg-7 col-md-8 col-12">
                                    <div class="product-sorting">
                                        <label for="sorting">Sort by:</label>
                                        <select class="form-control" id="sorting">
                                            <option>Popularity</option>
                                            <option>Low - High Price</option>
                                            <option>High - Low Price</option>
                                            <option>Average Rating</option>
                                            <option>A - Z Order</option>
                                            <option>Z - A Order</option>
                                        </select>
                                        <h3 class="total-show-product">Showing: <span>1 - 12 items</span></h3>
                                    </div>
                                </div>
                                <!-- 정렬 분류 버튼 없앰 -->
                                <!-- <div class="col-lg-5 col-md-4 col-12">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <button class="nav-link active" id="nav-grid-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-grid" type="button" role="tab"
                                                aria-controls="nav-grid" aria-selected="true"><i
                                                    class="lni lni-grid-alt"></i></button>
                                            <button class="nav-link" id="nav-list-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-list" type="button" role="tab"
                                                aria-controls="nav-list" aria-selected="false"><i
                                                    class="lni lni-list"></i></button>
                                        </div>
                                    </nav>
                                </div> -->
                            </div>
                        </div>

                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-grid" role="tabpanel"
                                aria-labelledby="nav-grid-tab">
                                <div class="row">
                                    <!-- Start Single Product -->
                                    <c:forEach var="dto" items="${list}" varStatus="catStatus">
                                        <div class="col-lg-4 col-md-6 col-12">
                                            <!-- single-product 카드 전체 포함 -->
                                            <div class="single-product">
                                                <div class="product-image">
                                                    <img src="/display?fileName=${dto.picture}" alt="${dto.title}"
                                                        onerror="this.onerror=null; this.src='assets/images/products/product-5.jpg'">
<!--                                                        onerror="this.onerror=null; this.src='assets/images/products/crack.png'">-->
                                                    <c:set var="now" value="<%= new java.util.Date() %>" />
                                                    <c:if
                                                        test="${dto.discount_start <= now and now <= dto.discount_end}">
                                                        <span class="sale-tag">${dto.discount_percentage}%</span>
                                                    </c:if>
                                                    <div class="button">
                                                        <a href="content?id=${dto.id}" class="btn"><i
                                                                class="lni lni-cart"></i> Add to Cart</a>
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <c:forEach var="category" items="${categorylist}">
                                                        <c:if test="${dto.category_id == category.id}">
                                                            <span class="category">${category.name}</span>
                                                        </c:if>
                                                    </c:forEach>
                                                    <h4 class="title"><a href="content?id=${dto.id}">${dto.title}</a>
                                                    </h4>
                                                    <ul class="review">
                                                        <li><i class="lni lni-star-filled"></i></li>
                                                        <li><i class="lni lni-star-filled"></i></li>
                                                        <li><i class="lni lni-star-filled"></i></li>
                                                        <li><i class="lni lni-star-filled"></i></li>
                                                        <li><i class="lni lni-star-filled"></i></li>
                                                        <li><span>5.0 Review(s)</span></li>
                                                    </ul>
                                                    <div class="price">
                                                        <c:choose>
                                                            <c:when
                                                                test="${dto.discount_start <= now and now <= dto.discount_end}">
                                                                <span>
                                                                    <fmt:formatNumber
                                                                        value="${dto.price - (dto.price * dto.discount_percentage / 100)}"
                                                                        pattern="#,###" />원
                                                                </span>
                                                                <span class="discount-price">
                                                                    <fmt:formatNumber value="${dto.price}"
                                                                        pattern="#,###" />원
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>
                                                                    <fmt:formatNumber value="${dto.price}"
                                                                        pattern="#,###" />원
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- End Single Product -->

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <!--  Start Pagination -->
                                    <div class="pagination">
                                        <ul class="pagination-list">
                                            <!-- 이전 페이지 버튼 -->
                                            <c:if test="${currentPage > 1}">
                                                <li>
                                                    <a href="/category?categoryId=${categoryId}&page=${currentPage - 1}">&lt;</a>
                                                </li>
                                            </c:if>
                                            <!-- 페이지 번호 -->
                                            <c:forEach var="i" begin="1" end="${totalPages}">
                                                <li class="${i == currentPage ? 'active' : ''}">
                                                    <a href="/category?categoryId=${categoryId}&page=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <!-- 다음 페이지 버튼 -->
                                            <c:if test="${currentPage < totalPages}">
                                                <li>
                                                    <a href="/category?categoryId=${categoryId}&page=${currentPage + 1}">&gt;</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                    <!--/ End Pagination -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
        </div>
        </div>
    </section>
    <!-- End Product Grids -->

    <!-- Start Footer Area -->
    <footer class="footer">
        <!-- Start Footer Top -->
        <div class="footer-top">
            <div class="container">
                <div class="inner-content">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-12">
                            <div class="footer-logo">
                                <a href="index.html">
                                    <img src="assets/images/logo/white-logo.svg" alt="#">
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-8 col-12">
                            <div class="footer-newsletter">
                                <h4 class="title">
                                    Subscribe to our Newsletter
                                    <span>Get all the latest information, Sales and Offers.</span>
                                </h4>
                                <div class="newsletter-form-head">
                                    <form action="#" method="get" target="_blank" class="newsletter-form">
                                        <input name="EMAIL" placeholder="Email address here..." type="email">
                                        <div class="button">
                                            <button class="btn">Subscribe<span class="dir-part"></span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Footer Top -->
        <!-- Start Footer Middle -->
        <div class="footer-middle">
            <div class="container">
                <div class="bottom-inner">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer f-contact">
                                <h3>Get In Touch With Us</h3>
                                <p class="phone">Phone: +1 (900) 33 169 7720</p>
                                <ul>
                                    <li><span>Monday-Friday: </span> 9.00 am - 8.00 pm</li>
                                    <li><span>Saturday: </span> 10.00 am - 6.00 pm</li>
                                </ul>
                                <p class="mail">
                                    <a href="mailto:support@shopgrids.com">support@shopgrids.com</a>
                                </p>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer our-app">
                                <h3>Our Mobile App</h3>
                                <ul class="app-btn">
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="lni lni-apple"></i>
                                            <span class="small-title">Download on the</span>
                                            <span class="big-title">App Store</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="lni lni-play-store"></i>
                                            <span class="small-title">Download on the</span>
                                            <span class="big-title">Google Play</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer f-link">
                                <h3>Information</h3>
                                <ul>
                                    <li><a href="javascript:void(0)">About Us</a></li>
                                    <li><a href="javascript:void(0)">Contact Us</a></li>
                                    <li><a href="javascript:void(0)">Downloads</a></li>
                                    <li><a href="javascript:void(0)">Sitemap</a></li>
                                    <li><a href="javascript:void(0)">FAQs Page</a></li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <!-- Single Widget -->
                            <div class="single-footer f-link">
                                <h3>Shop Departments</h3>
                                <ul>
                                    <li><a href="javascript:void(0)">Computers & Accessories</a></li>
                                    <li><a href="javascript:void(0)">Smartphones & Tablets</a></li>
                                    <li><a href="javascript:void(0)">TV, Video & Audio</a></li>
                                    <li><a href="javascript:void(0)">Cameras, Photo & Video</a></li>
                                    <li><a href="javascript:void(0)">Headphones</a></li>
                                </ul>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Footer Middle -->
        <!-- Start Footer Bottom -->
        <div class="footer-bottom">
            <div class="container">
                <div class="inner-content">
                    <div class="row align-items-center">
                        <div class="col-lg-4 col-12">
                            <div class="payment-gateway">
                                <span>We Accept:</span>
                                <img src="assets/images/footer/credit-cards-footer.png" alt="#">
                            </div>
                        </div>
                        <div class="col-lg-4 col-12">
                            <div class="copyright">
                                <p>Designed and Developed by<a href="https://graygrids.com/" rel="nofollow"
                                        target="_blank">GrayGrids</a></p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-12">
                            <ul class="socila">
                                <li>
                                    <span>Follow Us On:</span>
                                </li>
                                <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-instagram"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Footer Bottom -->
    </footer>
    <!--/ End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!--								<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>-->
    <!--								<script src="assets/js/bootstrap.bundle.min.js"></script>-->
    <script src="assets/js/tiny-slider.js"></script>
    <script src="assets/js/glightbox.min.js"></script>
    <script src="assets/js/main.js"></script>

<<<<<<< HEAD
																    <%-- 다음 페이지 버튼 --%>
																    <c:if test="${PageMaker.next}">
																      <li class="pagenate_button">
																        <a href="?pageNum=${PageMaker.endPage + 1}"><i class="lni lni-chevron-right"></i></a>
																		[다음]
																      </li>
																    </c:if>

																  </ul>
																</div>
																
																
																
						                                        <!--/ End Pagination -->
							                                    </div>
							                                </div>
							                            </div>
							                            </div>
							                            <div class="tab-pane fade" id="nav-list" role="tabpanel" aria-labelledby="nav-list-tab">
							                                <div class="row">
							                                        <!-- Start Single Product -->
																	<c:forEach var="dto" items="${list}" varStatus="catStatus">
							                                    <div class="col-lg-12 col-md-12 col-12">
							                                        <div class="single-product">
							                                            <div class="row align-items-center">
							                                                <div class="col-lg-4 col-md-4 col-12">
							                                                    <div class="product-image">
																					<img src="/display?fileName=${dto.picture}" alt="${dto.title}" onerror="this.onerror=null; this.src='assets/images/products/product-5.jpg'">
																						<c:set var="now" value="<%= new java.util.Date() %>" />
																                        <c:if test="${dto.discount_start <= now and now <= dto.discount_end}">
																							<span class="sale-tag">${dto.discount_percentage}%</span>
																                        </c:if>
							                                                        <div class="button">
							                                                              <a href="content?id=${dto.id}" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
							                                                        </div>
							                                                    </div>
							                                                </div>
							                                                <div class="col-lg-8 col-md-8 col-12">
							                                                    <div class="product-info">
																					<c:forEach var="category" items="${categorylist}" varStatus="catStatus">
																						<c:if test="${dto.category_id == category.id}">
														                            		<span class="category">${category.name}</span>
																						</c:if>
																					</c:forEach>
							                                                        <h4 class="title">
							                                                            <a href="content?id=${dto.id}">${dto.title}</a>
							                                                        </h4>
							                                                        <ul class="review">
							                                                            <li><i class="lni lni-star-filled"></i></li>
							                                                            <li><i class="lni lni-star-filled"></i></li>
							                                                            <li><i class="lni lni-star-filled"></i></li>
							                                                            <li><i class="lni lni-star-filled"></i></li>
							                                                            <li><i class="lni lni-star-filled"></i></li>
							                                                            <li><span>5.0 Review(s)</span></li>
							                                                        </ul>
							                                                        <div class="price">
																						<c:choose>
																	                        <c:when test="${dto.discount_start <= now and now <= dto.discount_end}">
																								<span><fmt:formatNumber value="${dto.price - (dto.price * dto.discount_percentage / 100)}" pattern="#,###" />원</span>
																                                <span class="discount-price"><fmt:formatNumber value="${dto.price}" pattern="#,###" />원</span>
																	                        </c:when>
																	                        <c:otherwise>
																	                            <span><fmt:formatNumber value="${dto.price}" pattern="#,###" />원</span>
																	                        </c:otherwise>
																	                    </c:choose>
							                                                        </div>
							                                                    </div>
							                                                </div>
							                                            </div>
							                                        </div>
																	</c:forEach>
							                                        <!-- End Single Product -->
							                                    </div>
							                                 
<!--							                  
							                                        <-- / End Pagination -->

																	<div class="pagination left">
																	  <ul class="pagination-list">

																	    <%-- 이전 페이지 버튼 --%>
																	    <c:if test="${PageMaker.prev}">
																	      <li class="pagenate_button">
																	        <a href="?pageNum=${PageMaker.startPage - 1}"><i class="lni lni-chevron-left"></i></a>
																	      </li>
																	    </c:if>

																	    <%-- 페이지 번호 리스트 --%>
																	    <c:forEach var="num" begin="${PageMaker.startPage}" end="${PageMaker.endPage}">
																	      <li class="pagenate_button ${PageMaker.cri.pageNum == num ? 'active' : ''}">
																	        <a href="?pageNum=${num}">${num}</a>
																	      </li>
																	    </c:forEach>

																	    <%-- 다음 페이지 버튼 --%>
																	    <c:if test="${PageMaker.next}">
																	      <li class="pagenate_button">
																	        <a href="?pageNum=${PageMaker.endPage + 1}"><i class="lni lni-chevron-right"></i></a>
																	      </li>
																	    </c:if>

																	  </ul>
																	</div>
																	
																	
																	
							                                        <!--/ End Pagination -->
																	
																	
																	<form id="actionForm" action="list" method="get">
																			<input type="hidden" name="pageNum" value="${PageMaker.cri.pageNum}">
																			<input type="hidden" name="amount" value="${PageMaker.cri.amount}">
																			<!-- 페이지 검색시 페이지 번호를 클릭핳때 필요한 파라미터 -->
																			<input type="hidden" name="type" value="${PageMaker.cri.type}">
																			<input type="hidden" name="keyword" value="${PageMaker.cri.keyword}">
																			<!-- 이름은 넘어갈때 사용되는거 값은 페이지 번호 : "${PageMaker.cri.pageNum}"  -->
																			<!-- 히든으로 넘어오는거는 Criteria.java dto에서 가져오면됨 -->

																		</form>

																	
							                                    </div>
							                                </div>
							                            </div>
							                        </div>
							                    </div>
							                </div>
							            </div>
							        </div>
							    </section>
							    <!-- End Product Grids -->

								   <!-- Start Footer Area -->
								    <footer class="footer">
								        <div class="footer-middle">
								            <div class="container">
								                <div class="bottom-inner">
								                    <div class="row">
								                        <div class="col-lg-3 col-md-6 col-12">
								                            <!-- Single Widget -->
								                            <div class="single-footer f-contact">
								                                <h3>customer service center</h3>
								                                <p class="phone">Phone: +82 (02) 252 5252</p>
								                                <ul>
								                                    <li><span>Monday-Friday: </span> 9.00 am - 8.00 pm</li>
								                                    <li><span>Saturday: </span> 10.00 am - 6.00 pm</li>
								                                </ul>
								                            </div>
								                            <!-- End Single Widget -->
								                        </div>
								                        <div class="col-lg-3 col-md-6 col-12">
								<!--                             Single Widget -->
								                            <div class="single-footer our-app">
								                                <h3>My Page</h3>
								                                <ul class="app-btn">
								                                    <li>
								                                        <a href="log/login">
								                                            <i class="lni lni-apple"></i>
								                                            <span class="small-title">login</span>
								                                            <span class="big-title">our store</span>
								                                        </a>
								                                    </li>
								<!--                                    <li>-->
								<!--                                        <a href="javascript:void(0)">-->
								<!--                                            <i class="lni lni-play-store"></i>-->
								<!--                                            <span class="small-title">Download on the</span>-->
								<!--                                            <span class="big-title">Google Play</span>-->
								<!--                                        </a>-->
								<!--                                    </li>-->
								                                </ul>
								                            </div>
								<!--                             End Single Widget -->
								                        </div>
								                        <div class="col-lg-3 col-md-6 col-12">
								                            <!-- Single Widget -->
								                            <div class="single-footer f-link">
								                                <h3>Information</h3>
								                                <ul>
								<!--                                    <li><a href="javascript:void(0)">About Us</a></li>-->
								                                    <li><a href="javascript:void(0)">Contact Us</a></li>
								                                    <li><a href="javascript:void(0)">Downloads</a></li>
								                                    <li><a href="javascript:void(0)">Sitemap</a></li>
								                                    <li><a href="javascript:void(0)">FAQs Page</a></li>
								                                </ul>
								                            </div>
								                            <!-- End Single Widget -->
								                        </div>
								                        <div class="col-lg-3 col-md-6 col-12">
								                            <!-- Single Widget -->
								                            <div class="single-footer f-link">
								                                <h3>Shop Departments</h3>
								                                <ul>
																   <li><a href="product-grids.html">반짝세일</a></li>
									                               <li><a href="product-grids.html">식품</a></li>
									                               <li><a href="product-grids.html">가구</a></li>
									                               <li><a href="product-grids.html">도서</a></li>
									                               <li><a href="product-grids.html">스포츠/레저</a></li>
									                               <li><a href="product-grids.html">출산/유아용품</a></li>
									                               <li><a href="product-grids.html">반려동물용품</a></li>
									                               <li><a href="product-grids.html">뷰티</a></li>
								                                </ul>
								                            </div>
								                            <!-- End Single Widget -->
								                        </div>
								                    </div>
								                </div>
								            </div>
								        </div>
								        <!-- End Footer Middle -->
								        <!-- Start Footer Bottom -->
								        <div class="footer-bottom">
								            <div class="container">
								                <div class="inner-content">
								                    <div class="row align-items-center">
								                        <div class="col-lg-3 col-md-6 col-12 mb-2">
															
															<div class="footer-logos" style="display: flex; align-items: center; gap: 16px;">
																<span>We Accept:</span>
															  <img src="assets/images/footer/카카오페이_CI_combination_with_BG.svg" alt="카카오페이" style="height: 24px; max-width: 80px; width: auto;">
															  <img src="assets/images/footer/credit-cards-footer.png" alt="카드로고" style="height: 24px; max-width: 200px; width: auto;">
															</div>
															
								<!--                            <div class="payment-gateway">-->
								<!--                                <span>We Accept:</span>-->
								<!--                                <img src="assets/images/footer/credit-cards-footer.png" alt="#">-->
								<!--                                <img src="assets/images/footer/카카오페이_CI_combination_with_BG.svg" alt="#">-->
								<!--                            </div>-->
								                        </div>
								                        <div class="col-lg-5 col-md-6 col-12 mb-2 text-center">
								                            <div class="copyright">
								                                <p>Designed and Developed by<a href="main" rel="nofollow"
								                                        target="_blank">Shofriend</a></p>
								                            </div>
								                        </div>
								                        <div class="col-lg-4 col-12 mb-2 text-end">
								                            <ul class="socila" style="display: flex; justify-content: end; align-items: center; gap: 8px; flex-wrap: wrap;">
								                                <li>
								                                    <span>Follow Us On:</span>
								                                </li>
								                                <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a></li>
								                                <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
								                                <li><a href="javascript:void(0)"><i class="lni lni-instagram"></i></a></li>
								                                <li><a href="javascript:void(0)"><i class="lni lni-google"></i></a></li>
								                            </ul>
								                        </div>
								                    </div>
								                </div>
								            </div>
								        </div>
								        <!-- End Footer Bottom -->
								    </footer>
								    <!--/ End Footer Area -->

							    <!-- ========================= scroll-top ========================= -->
							    <a href="#" class="scroll-top">
							        <i class="lni lni-chevron-up"></i>
							    </a>

							    <!-- ========================= JS here ========================= -->
							    <script src="assets/js/bootstrap.min.js"></script>
<!--								<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>-->
<!--								<script src="assets/js/bootstrap.bundle.min.js"></script>-->
							    <script src="assets/js/tiny-slider.js"></script>
							    <script src="assets/js/glightbox.min.js"></script>
							    <script src="assets/js/main.js"></script>
							</body>

							</html>
							<script>
								
								var actionForm = $("#actionForm");
=======
    <script>
        var actionForm = $("#actionForm");
>>>>>>> 35271c74e5e634c224658e72faaab219511b9797


        //페이지 번호 처리리
        $(".pagenate_button a").on("click", function (e) {
            e.preventDefault();
            console.log("click!!~~~");
            // console.log("$(this)"+$(this));
            console.log("@# href -> " + $(this).attr("href"));
            // console.log("@# href -> "+$(this).data("href"));


            //input 안에 속성-이름 대괄호 사용 - 클릭한 값 찾는다. 이걸 액션폼으로 ~
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));

            //버그처리
            //이동하려면 서브밋 사용 - 경로 지정 갔다오면 컨텐트를 물고있음 리스트를 넣어줘야합니다.
            //게시글 클릭후 뒤로가기 누른후 다른페이지 클릭할때 contentview물고있는거 해결 contentview옴.
            actionForm.attr("action", "list").submit();

        }); //end of pagenate_button click

        $(".move_link").on("click"), function (e) {
            e.preventDefault();
            //게시글 번호가찍힌다 - 클릭했을때 번호를 들고갈수 있겠다.
            console.log("@# href -> " + $(this).attr("href"));

            console.log("move_link click!!~~~");

            //변수사용할거다 대상은 보드 넘버다.
            var targetBno = $(this).attr("href");
            //넘어가는거 액션폼 사용 게시글 찾아가야하니까 어펜드 사용-태그를 넣는다. 화면단보면됨
            //이름은 보드넘버 값은 위에만든 타겟보드넘버인데 작은따옴표안에 큰따옴표 ++ 사용해서 넣으면됨
            // content_view?boardNo=${dto.boardNo} 를 actionForm으로 정리

            //버그처리 값이 있으면 리무브 ! = 값이 있으면
            //버그처리 (게시글 클릭후 뒤로가기 누른후 다른 게시글 클릭할때 &boardNo=번호 계속 누적방지)
            var bno = actionForm.find("input[name='id']").val();
            if (bno != "") {
                actionForm.find("input[name='id']").remove();

            }
        }
    </script>
</body>

</html>