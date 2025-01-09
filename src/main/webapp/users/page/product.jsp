<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vật Liệu Xây Dựng TQH </title>
</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4-beta3/css/all.min.css"/>
<link rel="stylesheet" href="<c:url value="/users/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/users/css/product.css"/>">
<link rel="stylesheet" href="<c:url value="/users/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/users/css/product.css"/>">

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
                    <a href="home-page"><img src="${pageContext.request.contextPath}/users/img/logo.png" alt="Logo"></a>
                </div>

                <!-- Thanh tìm kiếm ở giữa -->
                <form action="product" method="GET">
                    <div class="search-bar">
                        <input type="hidden" name="search" value="true">
                        <input name="name" type="text" placeholder="Tìm kiếm sản phẩm...">
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
                        <a href="cart-items">
                            <i class="fas fa-shopping-cart"></i>
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
                        <span class="none-a"><i class="fa-solid fa-list" style="color: #d0cdcd;"></i> &nbsp;&nbsp; DANH
                            MỤC SẢN
                            PHẨM</span>
                    <ul class="items">
                        <li><a href="/tqh/product-category?categoryId=1">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;GẠCH XÂY
                            DỰNG</a></li>
                        <li><a href="/tqh/product-category?categoryId=2">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;XI MĂNG VÀ
                            VỮA</a></li>
                        <li><a href="/tqh/product-category?categoryId=3">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;CÁT, ĐÁ VÀ
                            SỎI</a></li>
                        <li><a href="/tqh/product-category?categoryId=4">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;THÉP VÀ
                            SẮT</a></li>
                        <li><a href="/tqh/product-category?categoryId=5">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;GỖ VÀ VẬT
                            LIỆU GỖ</a></li>
                        <li><a href="/tqh/product-category?categoryId=6">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;SƠN VÀ PHỤ
                            GIA</a></li>
                        <li><a href="/tqh/product-category?categoryId=7">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;NGÓI VÀ TẤM
                            LỢP</a></li>
                        <li><a href="/tqh/product-category?categoryId=8">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;ỐNG NƯỚC VÀ
                            PHỤ KIỆN</a></li>
                        <li><a href="/tqh/product-category?categoryId=9">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;THIẾT BỊ
                            ĐIỆN NƯỚC</a></li>
                    </ul>
                </li>
                <li class="propClone"><a href="home-page"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; TRANG CHỦ
                </a></li>
                <li class="propClone"><a href="product"><i class="fa-brands fa-product-hunt"></i>
                    &nbsp;&nbsp;SẢN PHẨM</a>
                </li>
                <li class="propClone"><a href="cart-items"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
                    HÀNG</a>
                </li>
                <li class="propClone">
                    <span class="none-a"> <i class="fa-solid fa-book"></i> &nbsp;&nbsp; HƯỚNG DẪN </span>
                    <ul class="items">
                        <li><a href="turn-page?action=buyingHelp">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;HƯỚNG DẪN
                            MUA HÀNG</a>
                        </li>
                        <li><a href="turn-page?action=productUnit">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;BẢNG ĐƠN VỊ SẢN PHẨM</a>
                        </li>

                        <li><a href="turn-page?action=termAndService">&nbsp;&nbsp;<i
                                class="fa-solid fa-chevron-right"></i>&nbsp;&nbsp;ĐIỀU KHOẢN
                            VÀ DỊCH VỤ</a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</div>
<div class="conten">
    <div class="left-sidebar">
        <div class="danhmuc"><i class="fa-solid fa-list" style="color: #000000; margin-right: 10px;"></i>Danh mục
        </div>
        <div class="item" data-category="gach-xay-dung">
            <h3><a href="/tqh/product-category?categoryId=1"></i>Gạch xây dựng</a></h3>
        </div>
        <div class="item" data-category="xi-mang-va-vua">
            <h3><a href="/tqh/product-category?categoryId=2">Xi măng và Vữa</a></h3>
        </div>
        <div class="item" data-category="cat-da-va-soi">
            <h3><a href="/tqh/product-category?categoryId=3">Cát, Đá và Sỏi</a></h3>
        </div>
        <div class="item" data-category="thep-va-sat">
            <h3><a href="/tqh/product-category?categoryId=4">Thép và Sắt</a></h3>
        </div>
        <div class="item" data-category="go-va-vat-lieu-go">
            <h3><a href="/tqh/product-category?categoryId=5">Gỗ và Vật liệu gỗ</a></h3>
        </div>
        <div class="item" data-category="son-va-phu-gia">
            <h3><a href="/tqh/product-category?categoryId=6">Sơn và Phụ gia</a></h3>
        </div>
        <div class="item" data-category="ngoi-va-tam-lop">
            <h3><a href="/tqh/product-category?categoryId=7">Ngói và Tấm lợp</a></h3>
        </div>
        <div class="item" data-category="ong-nuoc-va-phu-kien">
            <h3><a href="/tqh/product-category?categoryId=8">Ống nước và Phụ kiện</a></h3>
        </div>
        <div class="item" data-category="thiet-bi-dien-nuoc">
            <h3><a href="/tqh/product-category?categoryId=9">Thiết bị điện nước</a></h3>
        </div>
        <div class="slide-discount">
            <c:forEach var="promotional" items="${sessionScope.promotionals}" begin="0" end="3">
                <div class="discount">
                    <span class="discount-label">Giảm giá:<fmt:formatNumber value="${promotional.value}" type="number" groupingUsed="true"/>₫</span>
                    <span class="discount-description">${promotional.code}</span>
                </div>
            </c:forEach>
        </div>
    </div>


    <!--conten_right-->
    <div class="right">
        <div class="filter">
            <p style="background-color: #c8c8c8; padding: 10px; border-radius: 5px;font-size: 15px; height: 15px;">Sắp
                xếp theo
                <i class="fa-sharp fa-solid fa-arrow-right" style="margin-left: 15px;"></i>
            </p>
            <p class="sort">
                <a style="text-decoration: none; color:#111111"
                   href="product-filter?filter=popular&categoryId=${categoryId}">Phổ biến</a>
            </p>
            <p class="sort"><a style="text-decoration: none; color:#111111"
                               href="product-filter?filter=newest&categoryId=${categoryId}">Mới
                nhất</a></p>
            <div class="sort-price">
                <p class="sort" style="width: auto;">Bán chạy <i class="fa-solid fa-angle-up fa-rotate-180"
                                                                 style="color: #000000;"></i></p>
                <div class="dropdown">
                    <ul class="dropdown-content">
                        <li><a style="text-decoration: none ;color:#111111"
                               href="product-filter?filter=priceAsc&categoryId=${categoryId}">Giá:
                            Thấp đến cao</a></li>
                        <li><a style="text-decoration: none ;color:#111111"
                               href="product-filter?filter=priceDesc&categoryId=${categoryId}">Giá:
                            Cao đến thấp</a></li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="row ps-5" id="product-list">
            <c:if test="${not empty products}">
                <c:forEach var="product" items="${products}">
                    <div class="name-cart">
                        <p style="position: absolute; padding: 8px; background-color: #ff0000; z-index: 5; border-radius: 10px;">
                                ${product.discountPercent}%</p>
                        <a href="product-detail?id=${product.id}&categoryId=${product.categoryId}"><img
                                src="${product.imageUrl}"
                                alt="${product.name}"></a>
                        <h3><a style="color: #110ec6"
                               href="product-detail?id=${product.id}&categoryId=${product.categoryId}">${product.name}</a>
                        </h3>
                        <p>Giá:
                            <del><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/>₫</del>
                        </p>
                        <p style="color: #ff0000;">Giá đã giảm: <fmt:formatNumber value="${product.discountPrice}"
                                                                                  type="number"
                                                                                  groupingUsed="true"/>₫</p>
                        <p>Giảm giá: ${product.discountPercent}%</p>
                        <span style="margin-left: 10px;">
                    <i class="fas fa-eye"></i>
                    <span style="font-size: 0.9em;">${product.view}</span>
                </span>
                        <span style="margin-left: 20px;">
                    <i class="fas fa-shopping-cart"></i>
                    <span style="font-size: 0.9em;">${product.soldCount}</span>
                </span>
                        <a href="add-cart?id=${product.id}" class="add-cart"><i class="ri-add-circle-line"></i>Thêm</a>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty products}">
                <p>Không có sản phẩm nào phù hợp với bộ lọc này.</p>
            </c:if>
        </div>


        <!--pagination-->
        <div id="pagination" class="pagination">
            <button id="prev" onclick="changePage(-1)">
                <<
            </button>
            <span id="page-info"></span>
            <button id="next" onclick="changePage(1)">>></button>
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
        <li style="list-style-type: none;"><a href="https://www.instagram.com/paq.2012/" target="_blank" rel="noopener"><i
                class="fab fa-instagram icon" style="color: #f12020;"></i></a></li>
    </div>
    <div id="fb">
        <li style="list-style-type: none;"><a href="https://www.facebook.com/profile.php?id=100044411504061"
                                              target="_blank" rel="noopener"><i
                class="fa-brands fa-facebook-square icon" style="color: #0911ff;"></i></a></li>
    </div>
    <button id="backToTop" title="Quay về đầu trang">⬆</button>
</div>

<script src="${pageContext.request.contextPath}/users/js/login-signup.js"></script>
<script src="${pageContext.request.contextPath}/users/js/product.js"></script>
<script src="${pageContext.request.contextPath}/users/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/users/js/home.js"></script>
</body>
</html>