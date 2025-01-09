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
<link rel="stylesheet" href="<c:url value="/users/css/terms_and_services.css"/>">

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

                        <form action="informationCustomer" method="post">
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
                            <span class="cart-count" id="cart-count">0</span>
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
        <div class="terms-container">
            <h2>Điều Khoản và Dịch Vụ</h2>
            <p>Chào mừng bạn đến với cửa hàng trực tuyến của chúng tôi! Dưới đây là các điều khoản và điều kiện áp dụng
                cho việc sử dụng dịch vụ của chúng tôi.</p>

            <h3>1. Giới Thiệu</h3>
            <p>Các điều khoản này điều chỉnh việc sử dụng trang web của chúng tôi và các dịch vụ mà chúng tôi cung cấp.
                Bằng cách sử dụng trang web này, bạn đồng ý tuân thủ các điều khoản và điều kiện này.</p>

            <h3>2. Đối Tượng Sử Dụng</h3>
            <p>Trang web của chúng tôi chỉ dành cho những người từ 18 tuổi trở lên. Nếu bạn chưa đủ tuổi, vui lòng không
                sử dụng dịch vụ này.</p>

            <h3>3. Đặt Hàng</h3>
            <p>Khi bạn đặt hàng, bạn đồng ý cung cấp thông tin chính xác và đầy đủ. Chúng tôi có quyền từ chối hoặc hủy
                bỏ đơn hàng nếu thông tin không chính xác.</p>

            <h3>4. Phương Thức Thanh Toán</h3>
            <p>Chúng tôi chấp nhận nhiều phương thức thanh toán, chuyển khoản ngân hàng và thanh toán khi nhận hàng. Bạn
                phải chịu trách nhiệm về việc đảm bảo rằng thông tin thanh toán của bạn là chính xác.</p>

            <h3>5. Chính Sách Giao Hàng</h3>
            <p>Chúng tôi sẽ cố gắng giao hàng trong thời gian đã thông báo, nhưng không đảm bảo thời gian giao hàng cụ
                thể. Bạn có thể theo dõi đơn hàng của mình qua trang web của chúng tôi.</p>

            <h3>6. Chính Sách Hoàn Trả</h3>
            <p>Nếu bạn không hài lòng với sản phẩm đã nhận, vui lòng liên hệ với chúng tôi trong vòng 7 ngày kể từ ngày
                nhận hàng để yêu cầu hoàn trả hoặc đổi sản phẩm.</p>

            <h3>7. Quyền Sở Hữu Trí Tuệ</h3>
            <p>Tất cả nội dung trên trang web này, bao gồm văn bản, hình ảnh và logo, đều thuộc quyền sở hữu trí tuệ của
                chúng tôi. Bạn không được sao chép hoặc sử dụng mà không có sự cho phép của chúng tôi.</p>

            <h3>8. Thay Đổi Điều Khoản</h3>
            <p>Chúng tôi có quyền thay đổi các điều khoản này bất kỳ lúc nào. Bạn nên thường xuyên kiểm tra trang này để
                cập nhật những thay đổi. Việc tiếp tục sử dụng dịch vụ sau khi có thay đổi có nghĩa là bạn đồng ý với
                các điều khoản mới.</p>

            <h3>9. Liên Hệ</h3>
            <p>Nếu bạn có bất kỳ câu hỏi nào về các điều khoản và dịch vụ này, xin vui lòng liên hệ với chúng tôi qua
                thông tin liên hệ trên trang web.</p>

            <p>Cảm ơn bạn đã lựa chọn cửa hàng của chúng tôi!</p>
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
                        class="fab fa-instagram icon " style="color: #f12020;"></i></a></li>
        </div>
        <div id="fb">
            <li style="list-style-type: none;"><a href="https://www.facebook.com/profile.php?id=100044411504061"
                    target="_blank" rel="noopener"><i class="fa-brands fa-facebook-square icon" style="color: #0911ff;"></i></a></li>
        </div>
        <button id="backToTop" title="Quay về đầu trang">⬆</button>

    </div>
   
    <script src="<c:url value="/users/js/login-signup.js"/>"></script>
    <script src="<c:url value="/users/js/scripts.js"/>" defer></script>
</body>

</html>