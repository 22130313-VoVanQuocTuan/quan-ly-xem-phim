<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie</title>
</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4-beta3/css/all.min.css"/>
<link rel="stylesheet" href="<c:url value="/users/css/home.css"/>">

<body>
<div id="section-header1">
    <div class="container">
        <div class="banner">
            <div class="top-left">
                <p class="animated-text">
                    <marquee>Chào mừng bạn đến với website của chúng tôi !</marquee>
                </p>
            </div>
            <div class="top-right">
                       <span id="user-greeting" style="display: none; color: #ffffff;">
                           Xin chào,  <span
                               id="username">${sessionScope.user.username != null ? sessionScope.user.username : ''}</span>!</span>

                <form action="informationCustomer" method="get">
                    <button type="submit" class="account-link" id="signup-link"
                            style="display: none;">
                        <i class="fas fa-user-circle"></i> Tài khoản
                    </button>
                </form>
                <form action="login" method="post">
                    <input name="action" type="hidden" value="login"/>
                    <button type="submit" id="login-link">
                        <span><i class="fa fa-fw fa-user"></i> Đăng Nhập</span>
                    </button>
                </form>
                <form action="logout" method="post">
                    <button type="submit" id="logout-link"
                            style="display: none;"><span>Đăng Xuất</span></button>
                </form>
            </div>

        </div>

    </div>
</div>
<div class="fixed">
    <div id="section-header2">
        <div class="container">
            <div class="menu">
                <!-- Logo bên trái -->
                <div class="logo">
                    <a href="home-page"><img src="https://png.pngtree.com/png-vector/20220611/ourmid/pngtree-cinema-reel-icon-simple-vector-png-image_4849780.png" alt="Logo"></a>
                </div>

                <!-- Thanh tìm kiếm ở giữa -->
                <form action="product" method="GET">
                    <div class="search-bar">
                        <input type="hidden" name="search" value="true">
                        <input name="name" type="text" placeholder="Tìm kiếm tên phim...">
                        <button type="submit" title="icon"><i class="fa fa-fw fa-search"></i></button>
                    </div>
                </form>

                <!-- Thông tin bên phải -->
                <div class="info">
                    <div class="hotline">
                        <span class="hotline-text">HOTLINE LIÊN HỆ </span>
                        <a href=""> 0905.090.252</a>
                    </div>
                </div>
                <div class="cart">
                    <div class="cart-wrapper">
                        <!-- Giỏ hàng -->
                        <a href="favorite-items" style="color: #ff0081">
                            <i class="fas fa-heart"></i>
                        </a>
                        <span class="cart-count" id="cart-count">${sessionScope.cartItemCount}</span>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div id="section-nav">
        <div class="container">
            <button class="menu-toggle"><i class="fa-solid fa-bars"></i> Menu</button>
            <ul class="nav navbar-nav navbar-center">
                <li class="propClone">
                    <span class="none-a"><i class="fa-solid fa-list"
                                            style="color: #d0cdcd;"></i> &nbsp;&nbsp;THỂ LOẠI</span>
                    <ul class="items">
                        <li><a href="product-category?categoryId=1">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;HÀNH ĐỘNG</a></li>
                        <li><a href="/tqh/product-category?categoryId=2">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;HÀI</a></li>
                        <li><a href="/tqh/product-category?categoryId=3">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;TÌNH CẢM</a></li>

                    </ul>
                </li>
                <li class="propClone"><a href="home-page"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG CHỦ </a>
                </li>

                <li class="propClone"><a href="product"><i class="fa-brands fa-product-hunt"></i>
                    &nbsp;&nbsp;PHIM MỚI</a>
                </li>
                <li class="propClone"><a id="" href="cart-items"><i
                        class="fas fa-shopping-cart"></i>&nbsp;&nbsp; PHIM HOT</a>
                </li>
                <li class="propClone">
                    <span class="none-a"> <i class="fa-solid fa-book"></i> &nbsp;&nbsp; HƯỚNG DẪN </span>
                    <ul class="items">
                        <li><a href="turn-page?action=buyingHelp">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;HƯỚNG DẪN ĐẶT PHIM</a>

                    </ul>
                </li>

            </ul>

        </div>
    </div>
</div>

<div id="section-slider">
    <div class="slide-show-content-container">
        <p class="title-w" id="animatedText"> CHÚC BẠN XEM PHIM VUI VẺ, VỚI NHỮNG BỘ PHIM HAY</p>
        <div class="slide-show-content-image">
            <c:forEach var="poster" items="${poster}">
                <img src="${poster}" alt="baner">

            </c:forEach>
        </div>

        <div class="slide-show-content-btn">
            <div class="nut_trai">
                <i class="fa-solid fa-chevron-left"></i>
            </div>
            <div class="nut_phai">
                <i class="fa-solid fa-chevron-right"></i>
            </div>
        </div>
    </div>
</div>
<div id="section-content">
    <!-- List Product flash sales -->
    <div class="product-one-content">
        <div class="product-one-content-title">
            <div class="title">
                <h3>Phim hot</h3>
                <span><a class="highlight-text" href="movies">Xem thêm</a></span>
            </div>
        </div>
        <div class="product-one-content-items">
            <c:forEach var="movie" items="${movieList}" begin="0" end="7">
                <div class="product-one-content-item">
                    <div class="img-product">
                        <a href="product-detail?id=${movie.id}">
                            <img src="${movie.posterUrl}" alt="${movie.title}">
                        </a>
                        <span class="sale-box">NEW</span>
                    </div>
                    <div class="product-title">
                        <div class="name-product">
                            <a href="product-detail?id=${movie.id}">${movie.title}</a>
                        </div>
                        <div class="product-price">
                            <li>Thể loại: ${movie.genre}</li>
                            <li>Thời lượng: ${movie.duration} phút</li>
                            <a href="add-cart?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


    <!-- List Slider Products 1 -->
    <div class="slider-product-one-content">
        <div class="slider-product-one-content-title">
            <div class="title">
                <h3>Phim Hài</h3>
                <span><a class="highlight-text" href="/tqh/movie-category?genre=comedy">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-one-content-container">
            <div class="slider-product-one-content-items-content">
                <div class="slider-product-one-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre == 'Hài'}">
                            <div class="slider-product-one-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-one-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre == 'Hài'}">
                            <div class="slider-product-one-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-one-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre == 'Hài'}">
                            <div class="slider-product-one-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-one-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre == 'Hài'}">
                            <div class="slider-product-one-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
             </div>
            <div class="slider-product-one-content-btn">
                <div class="nut_trai-1">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-1">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>
    <!-- List Slider Products 2 -->
    <div class="slider-product-two-content">
        <div class="slider-product-two-content-title">
            <div class="title">
                <h3>Hành động</h3>
                <span><a class="highlight-text" href="/tqh/product-category?categoryId=2">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-two-content-container">
            <div class="slider-product-two-content-items-content">
                <div class="slider-product-two-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre == 'Hành động'}">
                            <div class="slider-product-two-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>

                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-two-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre == 'Hành động'}">
                            <div class="slider-product-two-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>

                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-two-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre == 'Hành động'}">
                            <div class="slider-product-two-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>

                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-two-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre == 'Hành động'}">
                            <div class="slider-product-two-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>

                        </c:if>
                    </c:forEach>
                </div>

            </div>
            <div class="slider-product-two-content-btn">
                <div class="nut_trai-2">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-2">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>
    <!-- List Slider Products 3 -->
    <div class="slider-product-three-content">
        <div class="slider-product-three-content-title">
            <div class="title">
                <h3>Cát,Đá Và Sỏi</h3>
                <span><a class="highlight-text" href="/tqh/product-category?categoryId=3">Xem thêm</a></span>
            </div>
        </div>
        <div class="slider-product-three-content-container">
            <div class="slider-product-three-content-items-content">
                <div class="slider-product-three-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre =='Tình cảm'}">
                            <div class="slider-product-three-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-three-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre =='Tình cảm'}">
                            <div class="slider-product-three-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-three-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre =='Tình cảm'}">
                            <div class="slider-product-three-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="slider-product-three-content-items">
                    <c:forEach var="movie" items="${movieList}">
                        <c:if test="${movie.genre =='Tình cảm'}">
                            <div class="slider-product-three-content-item">
                                <div class="img-product">
                                    <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">
                                        <img src="${movie.posterUrl}" alt="${movie.title}">
                                    </a>
                                </div>
                                <div class="product-title">
                                    <div class="name-product">
                                        <a href="movie-detail?id=${movie.id}&genre=${movie.genre}">${movie.title}</a>
                                    </div>
                                    <div class="product-price">
                                        <li>Thể loại: ${movie.genre}</li>
                                        <li>Thời lượng: ${movie.duration} phút</li>
                                        <a href="add-movie?id=${movie.id}" class="add-to-cart">Thêm vào yêu thích</a>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
             </div>
            <div class="slider-product-three-content-btn">
                <div class="nut_trai-3">
                    <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="nut_phai-3">
                    <i class="fa-solid fa-chevron-right"></i>
                </div>
            </div>
        </div>
    </div>
</div>



<div id="section-footer">
    <div class="container">
        <div class="contact-info">
            <h3>Vật Liệu Xây Dựng TQH </h3>
            <p>Địa chỉ: Trường ĐH Nông Lâm TP. HCM</p>
            <p>Điện thoại: 0314 597 812</p>
            <p>Hotline: 0905 090 252</p>
            <p>Email: 22130098@st.hcmuaf.edu.vn</p>
        </div>
        <div class="links">
            <h3>Liên kết</h3>
            <ul>
                <li><a href="turn-page?action=introduce">Giới thiệu</a></li>
                <li><a href="turn-page?action=termAndService">Điều khoản và dịch vụ</a></li>
            </ul>
        </div>
        <div class="social-media">
            <h3>Mạng xã hội</h3>
            <ul>
                <li><a href="https://www.facebook.com/profile.php?id=100044411504061"><i
                        class="fa-brands fa-facebook" style="color: #d1d1d1;"></i></a></li>
                <li><a href="https://www.instagram.com/paq.2012/"><i class="fa-brands fa-instagram-square"
                                                                     style="color: #d1d1d1;"></i></a></li>
                <li><a href="https://x.com/?lang=vi"><i class="fa-brands fa-twitter"
                                                        style="color: #d1d1d1;"></i></a></li>
            </ul>
        </div>
        <div class="copyright">
            <p>© 2024: Tất cả quyền được bảo lưu.</p>
        </div>
    </div>

    <div>
        <li style="list-style-type: none;"><a href="https://zaloweb.me/" target="_blank" rel="noopener"><i
                class="fa-solid fa-phone call" style="color: #02bc15d1;"></i></a></li>
    </div>
    <div>
        <li style="list-style-type: none;"><a href="https://www.instagram.com/paq.2012/" target="_blank"
                                              rel="noopener"><i class="fab fa-instagram icon"
                                                                style="color: #f12020;"></i></a></li>
    </div>
    <div id="fb">
        <li style="list-style-type: none;"><a href="https://www.facebook.com/profile.php?id=100044411504061"
                                              target="_blank" rel="noopener"><i
                class="fa-brands fa-facebook-square icon"
                style="color: #0911ff;"></i></a></li>
    </div>
    <button id="backToTop" title="Quay về đầu trang">⬆</button>
</div>

<script src="users/js/slider_Image-home.js"></script>
<script src="users/js/slider-products.js"></script>
<script src="users/js/home.js"></script>
<script src="<c:url value="/users/js/login-signup.js"/>"></script>
<script src="users/js/scripts.js"></script>

</body>

</html>