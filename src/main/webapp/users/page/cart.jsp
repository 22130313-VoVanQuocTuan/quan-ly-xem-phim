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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4-beta3/css/all.min.css" />
<link rel="stylesheet" href="<c:url value="/users/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/users/css/cart.css"/>">

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
                        <input name="action" type="hidden" value="login" />
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
                    <li class="propClone"> <a href="cart-items"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp; GIỎ
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

    <div id="section-content-1">
        <div class="cart-container">
            <div class="cart-left">
                <table class="cart-table">
                    <thead style="border-bottom: 2px solid #9e0000;">
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Hình ảnh</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Giá giảm</th>
                            <th>Tổng giá</th>
                            <th></th>
                        </tr>
                    </thead>

                        <tbody id="cart-items-container" class="cart-items-container">
                        <c:forEach var="item" items="${listItems}">
                                <tr class="cart-item" data-id="${item.id}">
                                <td>${item.name}</td>
                                <td><img src="${item.imageUrl}" alt="${item.name}" width="50" height="50"></td>
                                <td>
                                    <div class="quantity">
                                        <button class="qty-btn minus-btn"><a style="text-decoration: none " href="update-cart?id=${item.id}&quantity=${item.quantity - 1}">-</a></button>
                                        <input title="input" type="number" value="${item.quantity}" class="qty-input" min="1" />
                                        <button class="qty-btn plus-btn"><a style="text-decoration: none " href="update-cart?id=${item.id}&quantity=${item.quantity + 1}">+</a></button>
                                    </div>
                                </td>
                                <td><fmt:formatNumber value=" ${item.price}" type="number" groupingUsed="true"/>₫</td>
                                <td><fmt:formatNumber value=" ${item.discountAmount}" type="number" groupingUsed="true"/>₫</td>
                                <td><fmt:formatNumber value=" ${item.totalPrice}" type="number" groupingUsed="true"/>₫</td>
                                <td>
                                    <a style="text-decoration: none" href="cart-remove?id=${item.id}" class="remove-from-cart-button">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <div class="cart-buttons">
                    <a href="product"><button class="continue-btn">← Tiếp tục xem sản
                            phẩm</button></a>
                </div>
            </div>


            <div class="cart-right">
                <h2>Tổng Sản Phẩm</h2>
                <div class="cart-summary">
                    <div class="summary-item">
                        <span>Tạm tính:</span>
                        <span id="subtotal"><fmt:formatNumber value=" ${sessionScope.totalPrice}" type="number" groupingUsed="true"/>₫</span>
                    </div>
                    <div class="summary-item">
                        <span>Phí vận chuyển:</span>
                        <span id="vat"><fmt:formatNumber value=" ${sessionScope.totalShippingFee}" type="number" groupingUsed="true"/>₫</span>
                    </div>
                </div>
                <div class="summary-item total">
                    <span>Tổng cộng:</span>
                    <span id="total"><fmt:formatNumber value=" ${sessionScope.totalFinalPrice} " type="number" groupingUsed="true"/>₫</span>
                </div>
                <c:if test="${not empty message}">
                    <div class="alert alert-danger">${message}</div>
                </c:if>
                <a href="confirmation"><button class="checkout-btn">Tiến hành thanh toán</button></a>

                <div class="voucher">
                    <label for="voucher">Phiếu ưu đãi</label>
                    <form action="voucher" method="get">
                    <input type="text" name="voucher" id="voucher" placeholder="Mã ưu đãi" />
                    <button type="submit" id="apply-btn" class="apply-btn">
                        Áp dụng
                    </button>
                        <div id="error-message" style="color: red; font-size: 10px;">
                            <c:if test="${not empty error_code}">
                                ${error_code}
                            </c:if>
                        </div>
                    </form>


                    <div class="help">
                        <p><i style="font-size: 15px;" class="fas fa-question-circle spinning-icon"></i></p>
                        <p>Nhập mã ưu đãi nếu có.</p>
                        <p>Không có mã vui lòng bỏ qua và tiến hành thanh toán.</p>
                        <p>Mọi thắc mắc xin vui lòng liên hệ với hotline: </p>
                        <p class="blinking-text"
                            style="color: #ff0000; font-size: 15px; font-weight: bold; margin-top: 5px;"> 0386394258</p>
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
                    <li> <a href="https://www.facebook.com/profile.php?id=100044411504061"><i
                                class="fa-brands fa-facebook" style="color: #d1d1d1;"></i></a></li>
                    <li> <a href="https://www.instagram.com/paq.2012/"><i class="fa-brands fa-instagram-square"
                                style="color: #d1d1d1;"></i></a></li>
                    <li> <a href="https://x.com/?lang=vi"><i class="fa-brands fa-twitter"
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
                    target="_blank" rel="noopener"><i class="fa-brands fa-facebook-square icon" style="color: #0911ff;"></i></a></li>
        </div>
        <button id="backToTop" title="Quay về đầu trang">⬆</button>

    </div>

    <script src="<c:url value="/users/js/login-signup.js"/>"></script>
    <script src="<c:url value="/users/js/scripts.js"/>" defer></script>
    <script src="<c:url value="/users/js/cart.js"/>" defer></script>
</body>

</html>