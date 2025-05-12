<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Single Product - ShopGrids Bootstrap 5 eCommerce HTML Template.</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
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
                                <li><a href="index.html">Home</a></li>
                                <li><a href="about-us.html">About Us</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-12">
                        <div class="top-end">
                            <div class="user">
                                <i class="lni lni-user"></i>
                                Hello
                            </div>
                            <ul class="user-login">
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
                        <a class="navbar-brand" href="index.html">
                            <img src="assets/images/logo/logo.svg" alt="Logo">
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
                                    <span>(+100) 123 456 7890</span>
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
                                                <a href="javascript:void(0)" class="remove"
                                                    title="Remove this item"><i
                                                        class="lni lni-close"></i></a>
                                                <div class="cart-img-head">
                                                    <a class="cart-img" href="product-details.html"><img
                                                            src="assets/images/header/cart-items/item1.jpg"
                                                            alt="#"></a>
                                                </div>
                                                <div class="content">
                                                    <h4><a href="product-details.html">
                                                            Apple Watch Series 6</a></h4>
                                                    <p class="quantity">1x - <span
                                                            class="amount">$99.00</span></p>
                                                </div>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0)" class="remove"
                                                    title="Remove this item"><i
                                                        class="lni lni-close"></i></a>
                                                <div class="cart-img-head">
                                                    <a class="cart-img" href="product-details.html"><img
                                                            src="assets/images/header/cart-items/item2.jpg"
                                                            alt="#"></a>
                                                </div>
                                                <div class="content">
                                                    <h4><a href="product-details.html">Wi-Fi Smart
                                                            Camera</a></h4>
                                                    <p class="quantity">1x - <span
                                                            class="amount">$35.00</span></p>
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
                            <span class="cat-button"><i class="lni lni-menu"></i>All Categories</span>
                            <ul class="sub-category">
                                <li><a href="product-grids.html">Electronics <i
                                            class="lni lni-chevron-right"></i></a>
                                    <!--                                    <ul class="inner-sub-category">-->
                                    <!--                                        <li><a href="product-grids.html">Digital Cameras</a></li>-->
                                    <!--                                        <li><a href="product-grids.html">Camcorders</a></li>-->
                                    <!--                                    </ul>-->
                                </li>
                                <li><a href="product-grids.html">accessories</a></li>
                                <li><a href="product-grids.html">Televisions</a></li>
                                <li><a href="product-grids.html">best selling</a></li>
                                <li><a href="product-grids.html">top 100 offer</a></li>
                                <li><a href="product-grids.html">sunglass</a></li>
                                <li><a href="product-grids.html">watch</a></li>
                                <li><a href="product-grids.html">man’s product</a></li>
                                <li><a href="product-grids.html">Home Audio & Theater</a></li>
                                <li><a href="product-grids.html">Computers & Tablets </a></li>
                                <li><a href="product-grids.html">Video Games </a></li>
                                <li><a href="product-grids.html">Home Appliances </a></li>
                            </ul>
                        </div>
                        <!-- End Mega Category Menu -->
                        <!-- Start Navbar -->
                        <nav class="navbar navbar-expand-lg">
                            <button class="navbar-toggler mobile-menu-btn" type="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false"
                                aria-label="Toggle navigation">
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                                <span class="toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                                <ul id="nav" class="navbar-nav ms-auto">
                                    <li class="nav-item">
                                        <a href="index.html" aria-label="Toggle navigation">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="dd-menu collapsed" href="javascript:void(0)"
                                            data-bs-toggle="collapse" data-bs-target="#submenu-1-2"
                                            aria-controls="navbarSupportedContent" aria-expanded="false"
                                            aria-label="Toggle navigation">Pages</a>
                                        <ul class="sub-menu collapse" id="submenu-1-2">
                                            <li class="nav-item"><a href="about-us.html">About Us</a></li>
                                            <li class="nav-item"><a href="faq.html">Faq</a></li>
                                            <li class="nav-item"><a href="login.html">Login</a></li>
                                            <li class="nav-item"><a href="register.html">Register</a></li>
                                            <li class="nav-item"><a href="mail-success.html">Mail
                                                    Success</a></li>
                                            <li class="nav-item"><a href="404.html">404 Error</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="dd-menu active collapsed" href="javascript:void(0)"
                                            data-bs-toggle="collapse" data-bs-target="#submenu-1-3"
                                            aria-controls="navbarSupportedContent" aria-expanded="false"
                                            aria-label="Toggle navigation">Shop</a>
                                        <ul class="sub-menu collapse" id="submenu-1-3">
                                            <li class="nav-item"><a href="product-grids.html">Shop Grid</a>
                                            </li>
                                            <li class="nav-item"><a href="product-list.html">Shop List</a>
                                            </li>
                                            <li class="nav-item active"><a href="product-details.html">shop
                                                    Single</a>
                                            </li>
                                            <li class="nav-item"><a href="cart.html">Cart</a></li>
                                            <li class="nav-item"><a href="checkout.html">Checkout</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="dd-menu collapsed" href="javascript:void(0)"
                                            data-bs-toggle="collapse" data-bs-target="#submenu-1-4"
                                            aria-controls="navbarSupportedContent" aria-expanded="false"
                                            aria-label="Toggle navigation">Blog</a>
                                        <ul class="sub-menu collapse" id="submenu-1-4">
                                            <li class="nav-item"><a href="blog-grid-sidebar.html">Blog Grid
                                                    Sidebar</a>
                                            </li>
                                            <li class="nav-item"><a href="blog-single.html">Blog Single</a>
                                            </li>
                                            <li class="nav-item"><a href="blog-single-sidebar.html">Blog
                                                    Single
                                                    Sibebar</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a href="contact.html" aria-label="Toggle navigation">Contact Us</a>
                                    </li>
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
        <!-- Start Header Bottom -->
    </header>
    <!-- End Header Area -->
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Single Product</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="index.html">Shop</a></li>
                        <li>Single Product</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    <!-- Start Item Details -->
    <section class="item-details section">
        <div class="container">
            <div class="top-area">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-images">
                            <main id="gallery">
                                <div class="main-img">
									<img src="/display?fileName=${product.picture}" alt="${product.title}" onerror="this.onerror=null; this.src='assets/images/products/crack.png'">
<!--                                    <img src="assets/images/product-details/01.jpg" id="current" alt="#">-->
                                </div>
                                <!-- <div class="images">-->
                                <!--     <img src="assets/images/product-details/01.jpg" class="img" alt="#">-->
                                <!--     <img src="assets/images/product-details/02.jpg" class="img" alt="#">-->
                                <!--     <img src="assets/images/product-details/03.jpg" class="img" alt="#">-->
                                <!--     <img src="assets/images/product-details/04.jpg" class="img" alt="#">-->
                                <!--     <img src="assets/images/product-details/05.jpg" class="img" alt="#">-->
                                <!-- </div>-->
                            </main>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-info">
                            <h2 class="title">${product.title}</h2>
                            <strong>가게이름:</strong> ${storeName}<br>
                            <p class="category"><i class="lni lni-tag"></i> 카테고리:<a
                                    href="javascript:void(0)">
                                    <c:forEach var="cat" items="${categorylist}">
                                        <c:if test="${cat.id == product.category_id}">
                                            ${cat.name}
                                        </c:if>
                                    </c:forEach>
                                </a></p>
                            <h3 class="price">${product.price}</h3>
                            <!--                            <h3 class="price" >${product.price}<span><fmt:formatNumber value="${product.price}" pattern="#,###" />원</span> ${product.discount_percentage}%</h3>-->
                            <!--							<strong><fmt:formatNumber value="${product.price - (product.price * product.discount_percentage / 100)}" pattern="#,###" />원</strong>-->
                            <!--							<del><fmt:formatNumber value="${product.price}" pattern="#,###" />원</del> ${product.discount_percentage}%<br>-->
                            <p class="info-text">
                                <strong style="font-size: 20px;">재고:</strong> ${product.stock}개<br>
                                <c:choose>
                                    <c:when test="${product.status == '품절'}">
                                        <span style="color: red; font-size: 20px;">해당 상품은 품절입니다. </span><br>
                                    </c:when>
                                    <c:when test="${product.status == '숨김'}">
                                        <span style="color: red; font-size: 20px;">해당 상품은 숨김상태입니다.
                                        </span><br>
                                    </c:when>
                                </c:choose>
                                <c:set var="now" value="<%= new java.util.Date() %>" />
                                <c:choose>
                                    <c:when
                                        test="${product.discount_start <= now and now <= product.discount_end}">
                                        <del>
                                            <fmt:formatNumber value="${product.price}" pattern="#,###" />원
                                        </del> ${product.discount_percentage}%<br>
                                        <strong>
                                            <fmt:formatNumber
                                                value="${product.price - (product.price * product.discount_percentage / 100)}"
                                                pattern="#,###" />원
                                        </strong>
                                        <br>
                                        <small class="time-left">
                                            data-end-time="
                                            <fmt:formatDate value='${product.discount_end}'
                                                pattern='yyyy-MM-dd\' T\'HH:mm:ss' />">
                                        </small>
                                        <small> 남았습니다! </small>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="font-size: 30px; color:blue; ">
                                            <b>
                                                <fmt:formatNumber value="${product.price}"
                                                    pattern="#,###" />원
                                            </b>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <br>
                                <form id="orderForm" action="product_order" method="post">
                                    <input type="hidden" name="product_id" value="${product.id}">
                                    <input type="hidden" name="product_title" value="${product.title}">
                                    <input type="hidden" name="product_price" value="${product.price}">
                            </p>
                            <div class="row">
                            </div>
                            <div class="bottom-content">
                                <div class="row align-items-end">
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="button cart-button">
                                            <input type="submit" class="btn" formaction="addToCart" style="width: 100%;" value="Add to Cart">
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="wish-button">
                                            <button class="btn" type="button"><i class="lni lni-heart"></i> To
                                                Wishlist</button>
                                        </div>
                                    </div>
                                    <!-- 25.05.09 권준우 : 친구 관련 기능 추가 -->
                                    <!-- 공유 버튼 영역 -->
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="wish-button">
                                            <button class="btn w-100" type="button" onclick="toggleFriendShare()">
                                                <i class="lni lni-share-alt"></i> 친구에게 공유
                                            </button>
                                        </div>
                                    </div>
                                    <!-- 버튼 아래 row 전체에 공유 박스 추가 -->
                                    <div class="col-12" id="friendShareBox"
                                        style="display: none; margin-top: 15px;">
                                        <div class="input-group">
                                            <select id="friendSelect" class="form-select">
                                                <option value="">공유할 친구 선택</option>
                                                <c:forEach var="friend" items="${myFriends}">
                                                    <option value="${friend.id}">${friend.name}
                                                        (${friend.email})</option>
                                                </c:forEach>
                                            </select>
                                            <button onclick="shareProduct()" type="button"
                                                class="btn btn-primary">공유하기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 수량 입력 폼 추가 -->
                            <label class="form-label mt-4">수량: </label>
                            <input type="number" class="form-control" name="quantity" value="1" min="1"
                                max="${product.stock}" required>
<!--                            <input type="submit" class="btn btn-primary w-100" value="구매하기">-->
							<button type="button" class="btn btn-primary w-100" onclick="goToPay()">구매하기</button>
                            </form>
<!--                             테스트용 임시코드 주연 추가(goToPay 스크립트 이동도 있음) -->
<!--                            <form id="orderForm2" action="product_order" method="post">-->
<!--                                테스트용입니다 아래는 폼이 별개라 수량도 따로뺐어요-->
<!--                                <input type="hidden" name="contentId" value="${product.id}">-->
<!--                                <input type="number" class="form-control" name="quantity" value="1" min="1"-->
<!--                                max="${product.stock}" required>-->
<!--                                <button type="button" onclick="goToPay()">바로 구매하기</button>-->
<!--                            </form>-->
                            <script>
								
<!--								단품용-->
<!--                                function goToPay() {-->
<!--                                    const form = document.getElementById('orderForm');-->
<!--                                    form.action = '/pay/checkout';-->
<!--                                    form.submit();-->
<!--                                }-->
								function goToPay() {
								    const form = document.getElementById('orderForm');
								    const productId = form.querySelector('input[name="product_id"]').value;
								    const quantity = form.querySelector('input[name="quantity"]').value;

									console.log("productId"+productId);
									console.log("quantity"+quantity);
									
								    // 새로운 폼을 생성하여 POST 방식으로 /checkout URL로 데이터를 전송
								    const goToPayForm = document.createElement('form');
								    goToPayForm.action = '/pay/checkout';

								    const productIdInput = document.createElement('input');
								    productIdInput.type = 'hidden';
								    productIdInput.name = 'product_id[]';
								    productIdInput.value = productId;
								    goToPayForm.appendChild(productIdInput);

								    const quantityInput = document.createElement('input');
								    quantityInput.type = 'hidden';
								    quantityInput.name = 'quantity[]';
								    quantityInput.value = quantity;
								    goToPayForm.appendChild(quantityInput);

								    document.body.appendChild(goToPayForm);
								    goToPayForm.submit();
								}

								// (기존 장바구니 담기 관련 JavaScript 코드는 그대로 유지)
                            </script>
                        </div>
                    </div>
                </div>
                <!--		<hr>-->
                <div class="product-container">
                    <div class="product-description">
                        <p>${product.description}</p>
                    </div>
                </div>
            </div>


            <!-- 리뷰 영역 시작 -->
            <div class="product-details-info">
                <div class="single-block">
                    <div class="row">

                        <!-- 별점 통계 -->
                        <div class="col-lg-4 col-12">
                            <div class="single-block give-review">
                                <h4>평균 별점: <fmt:formatNumber value="${averageRating}" type="number" maxFractionDigits="1"/> / 5</h4>
                                <ul>
                                    <!-- <c:set var="ratings" value="${[5,4,3,2,1]}" /> -->
                                    <c:set var="ratings" value="${fn:split('5,4,3,2,1', ',')}" />
                                    <c:forEach var="i" items="${ratings}">
                                        <li>
                                            <span>${i} stars -
                                                <c:choose>
                                                    <c:when test="${ratingCounts[i] != null}">
                                                        ${ratingCounts[i]}
                                                    </c:when>
                                                    <c:otherwise>
                                                        0
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                            <c:forEach var="j" begin="1" end="5">
                                                <i class="lni ${j <= i ? 'lni-star-filled' : 'lni-star'}"></i>
                                            </c:forEach>
                                        </li>
                                    </c:forEach>
                                </ul>

                                <!-- 리뷰 버튼 -->
                                <button type="button" class="btn review-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Leave a Review
                                </button>
                            </div>
                        </div>
                        <!-- 별점 통계 끝 -->

                        <!-- 리뷰 리스트 (최대 5개 까지 노출) -->
                        <div class="col-lg-8 col-12">
                            <div class="single-block">
                                <div class="reviews">
                                    <h4 class="title">Latest Reviews</h4>   
                                    <c:forEach var="review" items="${reviews}" varStatus="status">
                                        <c:if test="${status.index < 5}">
                                            <div class="single-review">
                                                <img src="assets/images/blog/comment1.jpg" alt="#">
                                                <div class="review-info">
                                                    <h4>${review.title}
                                                        <span>by ${review.customerName}</span>
                                                    </h4>
                                                    <ul class="stars">
                                                        <c:forEach var="i" begin="1" end="5">
                                                            <li>
                                                                <i class="lni ${i <= review.rating ? 'lni-star-filled' : 'lni-star'}"></i>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                    <p>${review.content}</p>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- 리뷰 리스트 끝 -->
                    </div>
                </div>
            </div>
            <!-- 리뷰 영역 끝 -->
        </div>

    </section>
    <!-- End Item Details -->
    <!-- Review Modal -->
    <form action="/review/write" method="post">
        <input type="hidden" name="productId" value="${product.id}" />
        <div class="modal fade review-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Leave a Review</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="review-name">Your Name</label>
                                    <input class="form-control" type="text" id="review-name" value="${loginCustomer.name}" readonly>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="review-email">Your Email</label>
                                    <input class="form-control" type="email" id="review-email" value="${loginCustomer.email}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="review-subject">Subject</label>
                                    <input class="form-control" type="text" name="title" id="review-subject" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="review-rating">Rating</label>
                                    <select class="form-control" name="rating" id="review-rating" required>
                                        <option value="5">5 Stars</option>
                                        <option value="4">4 Stars</option>
                                        <option value="3">3 Stars</option>
                                        <option value="2">2 Stars</option>
                                        <option value="1">1 Star</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="review-message">Review</label>
                            <textarea class="form-control" name="content" id="review-message" rows="8" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer button">
                        <button type="submit" class="btn btn-primary">Submit Review</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- End Review Modal -->

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
                                        <input name="EMAIL" placeholder="Email address here..."
                                            type="email">
                                        <div class="button">
                                            <button class="btn">Subscribe<span
                                                    class="dir-part"></span></button>
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
                                <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a>
                                </li>
                                <li><a href="javascript:void(0)"><i
                                            class="lni lni-twitter-original"></i></a></li>
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
    <script src="assets/js/tiny-slider.js"></script>
    <script src="assets/js/glightbox.min.js"></script>
    <script src="assets/js/main.js"></script>
    <!--	<script>-->
    <!--		const senderName = "${loginCustomer.name}";-->
    <!--	</script>-->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // 🔸 WebSocket 연결
            let socket = new WebSocket("ws://localhost:8485/chat");
            socket.onopen = function () {
                console.log("✅ WebSocket 연결됨");
            };
            socket.onmessage = function (event) {
                console.log("📩 받은 메시지: " + event.data);
            };
            socket.onclose = function () {
                console.log("❌ WebSocket 연결 종료됨");
            };
            socket.onerror = function (error) {
                console.log("⚠️ WebSocket 오류 발생:", error);
            };
            // 🔸 친구 공유 toggle
            window.toggleFriendShare = function () {
                const box = document.getElementById("friendShareBox");
                box.style.display = (box.style.display === "none") ? "block" : "none";
            };
            // 🔸 상품 링크 공유
            window.shareProduct = function () {
                const friendId = document.getElementById("friendSelect").value;
                if (!friendId) {
                    alert("공유할 친구를 선택하세요.");
                    return;
                }
                const currentUrl = window.location.href;
                const senderName = "${loginCustomer.name}"; // JSP에서 전달받은 로그인 고객 이름
                const productTitle = "${product.title}";
                const composedMessage =
                    senderName + " 님이 [" + productTitle + "] 상품을 공유하고 싶어합니다.\n" + currentUrl;
                if (socket && socket.readyState === WebSocket.OPEN) {
                    socket.send(friendId + ":" + composedMessage);
                    alert("공유 완료!");
                } else {
                    alert("WebSocket 연결이 안 되어 있습니다.");
                }
            };
            // 🔸 이미지 클릭 이벤트
            const current = document.getElementById("current");
            const opacity = 0.6;
            const imgs = document.querySelectorAll(".img");
            imgs.forEach(img => {
                img.addEventListener("click", (e) => {
                    imgs.forEach(img => img.style.opacity = 1);
                    current.src = e.target.src;
                    e.target.style.opacity = opacity;
                });
            });
        });
    </script>
</body>
</html>