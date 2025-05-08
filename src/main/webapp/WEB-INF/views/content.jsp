<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

	<meta charset="utf-8" />
	   <meta http-equiv="x-ua-compatible" content="ie=edge" />
	   <title>${product.title} 상세페이지</title>
	   <meta name="description" content="" />
	   <meta name="viewport" content="width=device-width, initial-scale=1" />
	   <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />

	   <!-- ========================= CSS here ========================= -->
	   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
	   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css ">
	   <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	   <link rel="stylesheet" href="assets/css/LineIcons.3.0.css" />
	   <link rel="stylesheet" href="assets/css/tiny-slider.css" />
	   <link rel="stylesheet" href="assets/css/glightbox.min.css" />
	   <link rel="stylesheet" href="assets/css/main.css" />
	   
	   <script src="${pageContext.request.contextPath}/resources/js/timer.js"></script>
	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>

</head>
<!-- product_id 받아와서 상세페이지 출력-->
<!-- 작성일      작성자   개발내용,수정내용 -->
<!-- 25/04/10    우주연   세션이랑 디자인전까지 완성됨-->
<!-- 25/04/11    우주연   세션추가 -->
<!-- 25/04/14 	 김채윤   css -->
<!-- 25/04/14 	 성유리   img 추가, nav바 추가, 재정렬 , 카테고리 추가 -->
<body>
	
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
	                                <a href="login.html">Sign In</a>
	                            </li>
	                            <li>
	                                <a href="register.html">Register</a>
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
	                        <span class="cat-button"><i class="lni lni-menu"></i>Categories</span>
	                        <ul class="sub-category">
	                            <li><a href="category?category_id=9">추천상품 <i class="lni lni-chevron-right"></i></a>
	                                <ul class="inner-sub-category">
	                                    <li><a href="product-grids.html">Digital Cameras</a></li>
	                                    <li><a href="product-grids.html">Camcorders</a></li>
	                                    <li><a href="product-grids.html">Camera Drones</a></li>
	                                    <li><a href="product-grids.html">Smart Watches</a></li>
	                                    <li><a href="product-grids.html">Headphones</a></li>
	                                    <li><a href="product-grids.html">MP3 Players</a></li>
	                                    <li><a href="product-grids.html">Microphones</a></li>
	                                    <li><a href="product-grids.html">Chargers</a></li>
	                                    <li><a href="product-grids.html">Batteries</a></li>
	                                    <li><a href="product-grids.html">Cables & Adapters</a></li>
	                                </ul>
	                            </li>
	                            <li><a href="category?category_id=8">반짝세일</a></li>
	                            <li><a href="category?category_id=1">식품</a></li>
	                            <li><a href="category?category_id=2">가구</a></li>
	                            <li><a href="category?category_id=3">도서</a></li>
	                            <li><a href="category?category_id=4">스포츠/레저</a></li>
	                            <li><a href="category?category_id=5">출산/유아용품</a></li>
	                            <li><a href="category?category_id=6">반려동물용품</a></li>
	                            <li><a href="category?category_id=7">뷰티</a></li>
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
	                                    <a href="index.html" aria-label="Toggle navigation">Home</a>
	                                </li>
	                                <li class="nav-item">
	                                    <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
	                                        data-bs-target="#submenu-1-2" aria-controls="navbarSupportedContent"
	                                        aria-expanded="false" aria-label="Toggle navigation">Pages</a>
	                                    <ul class="sub-menu collapse" id="submenu-1-2">
	                                        <li class="nav-item"><a href="about-us.html">About Us</a></li>
	                                        <li class="nav-item"><a href="faq.html">Faq</a></li>
	                                        <li class="nav-item"><a href="login.html">Login</a></li>
	                                        <li class="nav-item"><a href="register.html">Register</a></li>
	                                        <li class="nav-item"><a href="mail-success.html">Mail Success</a></li>
	                                        <li class="nav-item"><a href="404.html">404 Error</a></li>
	                                    </ul>
	                                </li>
	                                <li class="nav-item">
	                                    <a class="dd-menu active collapsed" href="javascript:void(0)"
	                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-3"
	                                        aria-controls="navbarSupportedContent" aria-expanded="false"
	                                        aria-label="Toggle navigation">Shop</a>
	                                    <ul class="sub-menu collapse" id="submenu-1-3">
	                                        <li class="nav-item"><a href="product-grids.html">Shop Grid</a></li>
	                                        <li class="nav-item"><a href="product-list.html">Shop List</a></li>
	                                        <li class="nav-item active"><a href="product-details.html">shop Single</a>
	                                        </li>
	                                        <li class="nav-item"><a href="cart.html">Cart</a></li>
	                                        <li class="nav-item"><a href="checkout.html">Checkout</a></li>
	                                    </ul>
	                                </li>
	                                <li class="nav-item">
	                                    <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
	                                        data-bs-target="#submenu-1-4" aria-controls="navbarSupportedContent"
	                                        aria-expanded="false" aria-label="Toggle navigation">Blog</a>
	                                    <ul class="sub-menu collapse" id="submenu-1-4">
	                                        <li class="nav-item"><a href="blog-grid-sidebar.html">Blog Grid Sidebar</a>
	                                        </li>
	                                        <li class="nav-item"><a href="blog-single.html">Blog Single</a></li>
	                                        <li class="nav-item"><a href="blog-single-sidebar.html">Blog Single
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
	
<!-- 	<a href="main">홈으로가기</a> -->



	<c:choose>
		    
		    <c:when test="${sessionScope.userType == 'customer'}">
		  	    <nav class="nav">
				  <a class="nav-link active" aria-current="page" href="main">ShoFriend</a>
				  <a class="nav-link" href="my_page">마이페이지</a>
				  <a class="nav-link" href="friend">친구</a>
				  <a class="nav-link disabled"  aria-disabled="true">${sessionScope.loginCustomer.name} 님은 seller 입니다.</a>
				  <a class="nav-link" href="logout">로그아웃</a>
			</nav>
		    </c:when>
		  
		    <c:when test="${sessionScope.userType == 'seller'}">
		       <nav class="nav">
				  <a class="nav-link active" aria-current="page" href="main">ShoFriend</a>
				  <a class="nav-link" href="my_page">마이페이지</a>
				  <a class="nav-link" href="store_list">점포관리</a>
				  <a class="nav-link" href="product_insert">상품추가</a>
				  <a class="nav-link disabled"  aria-disabled="true">${sessionScope.loginSeller.name} 님은 seller 입니다.</a>
				  <a class="nav-link" href="logout">로그아웃</a>
			</nav>
		    </c:when>
		    <c:otherwise>
		           <nav class="nav">
				  <a class="nav-link active" aria-current="page" href="main">ShoFriend</a>
				  <a class="nav-link" href="my_page">마이페이지</a>
				  <a class="nav-link" href="friend">친구</a>
				  <a class="nav-link disabled"  aria-disabled="true">로그인 상태가 아닙니다.</a>
				  <a class="nav-link" href="log/login">로그인</a>
			</nav>
		    </c:otherwise>
		   
		</c:choose>
		<br>
		<br>
		<br>
		<br>

<!-- 	<h1 class="text-center">쇼프렌입니다</h1> -->
<div align="center" style="overflow: scroll; width: 100%; ">
<img  src="resources/images/ShoFriend_rogo.PNG" class="img-fluid" alt="...">

	<br>


	

	
	<!-- Start Item Details -->
	   <section class="item-details section">
	       <div class="container">
	           <div class="top-area">
	               <div class="row align-items-center">
	                   <div class="col-lg-6 col-md-12 col-12">
	                       <div class="product-images">
	                           <main id="gallery">
	                       <div class="product-info">
							   <div class="product-container">
							   	<div class="product-image">
							      	<img src="${pageContext.request.contextPath}/resources/images/${product.picture}" class="img-thumbnail" width="200" height="200"/><br>
							   <%--     <img src="${product.picture}" width="200" height="200"/><br> --%>
							   	</div>
							   	<div class="product-info">

							       <h2 style="margin-bottom:30px; font-size: 60px;" >${product.title}</h2>
							       <strong>가게이름:</strong> ${storeName}<br>
							    
							       <p>
							   	  카테고리: 
							   	  <c:forEach var="cat" items="${categorylist}">
							   	    <c:if test="${cat.id == product.category_id}">
							   	      ${cat.name}
							   	    </c:if>
							   	  </c:forEach>
								  
								  <div style="margin-top: 200px;">
								  <strong style="font-size: 20px;">재고:</strong> ${product.stock}개<br>
								  <c:choose>
								  	<c:when test="${product.status == '품절'}">
								  		<span style="color: red; font-size: 20px;">해당 상품은 품절입니다. </span><br>
								  	</c:when>
								  	<c:when test="${product.status == '숨김'}">
								  		<span style="color: red; font-size: 20px;">해당 상품은 숨김상태입니다. </span><br>
								  	</c:when>
								  </c:choose>
							   	</p>
								
								<c:set var="now" value="<%= new java.util.Date() %>" />
								<c:choose>
								    <c:when test="${product.discount_start <= now and now <= product.discount_end}">
								        <del><fmt:formatNumber value="${product.price}" pattern="#,###" />원</del> ${product.discount_percentage}%<br>
								        <strong><fmt:formatNumber value="${product.price - (product.price * product.discount_percentage / 100)}" pattern="#,###" />원</strong>
										<br>
										
									    <small class="time-left">
											data-end-time="<fmt:formatDate value='${product.discount_end}' pattern='yyyy-MM-dd\'T\'HH:mm:ss' />">
										</small> 
										<small> 남았습니다! </small>
								    </c:when>
								    <c:otherwise>
								    <div style="font-size: 30px; color:blue; ">
								        <b><fmt:formatNumber value="${product.price}" pattern="#,###" />원</b>
								    </div>
								    </c:otherwise>
								</c:choose>
								
								<c:choose>
										<c:when test="${sessionScope.userType == 'seller'}">
											<input type="button"  class="btn btn-outline-secondary" style="margin-bottom:5px; margin-top: 20px;" value="수정하기" onclick="location.href='product_modify?id=${product.id}'">
											<input type="button" class="btn btn-outline-secondary" value="삭제하기" onclick="location.href='product_delete?id=${product.id}'">
										</c:when>
										<c:otherwise>
										    <c:choose>
										        <c:when test="${product.status == '품절' and sessionScope.userType == 'customer'}">
										            <input type="button" class="btn btn-secondary w-100" style="margin-top:25px;" value="구매하기" onclick="alert('⚠ 이 제품은 품절입니다!')" style="background-color: lightgray;">
										        </c:when>
										        
										        <c:otherwise>
										            <form id="orderForm" action="product_order" method="post">
													    <input type="hidden" name="product_id" value="${product.id}">
													    
													    
														<div class="product-container">
															<div class="product-description">
															<p>${product.description}</p>
															</div>
														    </div>
														    
														    
													    <!-- 수량 입력 폼 추가 -->
													    <label class="form-label mt-4">수량: </label>
													    <input type="number" class="form-control" name="quantity" value="1" min="1" max="${product.stock}" required>
													
													    <input type="submit" class="btn btn-primary w-100"   value="구매하기">
													</form>
										        </c:otherwise>
										    </c:choose>
										</c:otherwise>
									</c:choose>
	                           </main>
	                       </div>
	                   </div>
	                   <div class="col-lg-6 col-md-12 col-12">
	                           <h2 class="title">물건이름적는란</h2>
	                           <p class="category"><i class="lni lni-tag"></i> Drones:<a href="javascript:void(0)">Action
	                                   cameras</a></p>
	                           <h3 class="price">49,850<span>50,000</span></h3>
<!--	                           <h3 class="price">49,850<span>50,000</span></h3>-->
	                           <p class="info-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
	                               tempor incididunt
	                               ut labore et dolore magna aliqua.</p>
	                           <div class="row">
	                               <div class="col-lg-4 col-md-4 col-12">
	                                   <div class="form-group color-option">
	                                   </div>
	                               </div>
	                              
	                           </div>
	                           <div class="bottom-content">
	                               <div class="row align-items-end">
	                                   <div class="col-lg-4 col-md-4 col-12">
	                                       <div class="button cart-button">
	                                           <button class="btn" style="width: 100%;">Add to Cart</button>
	                                       </div>
	                                   </div>
	                                   <div class="col-lg-4 col-md-4 col-12">
	                                       <div class="wish-button">
	                                           <button class="btn"><i class="lni lni-reload"></i> Compare</button>
	                                       </div>
	                                   </div>
	                                   <div class="col-lg-4 col-md-4 col-12">
	                                       <div class="wish-button">
	                                           <button class="btn"><i class="lni lni-heart"></i> To Wishlist</button>
	                                       </div>
	                                   </div>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	           </div>
	           <div class="product-details-info">
	               <div class="single-block">
	                   <div class="row">
	                       <div class="col-lg-6 col-12">
	                           <div class="info-body custom-responsive-margin">
	                               <h4>Details</h4>
	                               <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
	                                   incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
	                                   exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
	                                   irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat.</p>
	                               <h4>Features</h4>
	                               <ul class="features">
	                                   <li>Capture 4K30 Video and 12MP Photos</li>
	                                   <li>Game-Style Controller with Touchscreen</li>
	                                   <li>View Live Camera Feed</li>
	                                   <li>Full Control of HERO6 Black</li>
	                                   <li>Use App for Dedicated Camera Operation</li>
	                               </ul>
	                           </div>
	                       </div>
	                       <div class="col-lg-6 col-12">
	                           <div class="info-body">
	                               <h4>Specifications</h4>
	                               <ul class="normal-list">
	                                   <li><span>Weight:</span> 35.5oz (1006g)</li>
	                                   <li><span>Maximum Speed:</span> 35 mph (15 m/s)</li>
	                                   <li><span>Maximum Distance:</span> Up to 9,840ft (3,000m)</li>
	                                   <li><span>Operating Frequency:</span> 2.4GHz</li>
	                                   <li><span>Manufacturer:</span> GoPro, USA</li>
	                               </ul>
	                               <h4>Shipping Options:</h4>
	                               <ul class="normal-list">
	                                   <li><span>Courier:</span> 2 - 4 days, $22.50</li>
	                                   <li><span>Local Shipping:</span> up to one week, $10.00</li>
	                                   <li><span>UPS Ground Shipping:</span> 4 - 6 days, $18.00</li>
	                                   <li><span>Unishop Global Export:</span> 3 - 4 days, $25.00</li>
	                               </ul>
	                           </div>
	                       </div>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </section>
	   <!-- End Item Details -->

	
	
	
	
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
   
</body>
</html>