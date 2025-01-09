<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển Quản trị viên </title>
    <!------------------ Kiểu dáng ------------------>
    <link rel="stylesheet" href="admin/css/style.css">
    <link rel="stylesheet" href="admin/css/order.css">
</head>
<body>
<!-- ------------------ Điều hướng -------------------->
<div class="container">
    <div class="navigation">
        <ul>
            <li>
                <a href="home">
                        <span class="icon">
                            <img src="<c:url value="/users/img/logo.png"/>" alt="">
                        </span>
                    <span class="title">Bán Vật Liệu Xây Dựng </span>
                </a>
            </li>

            <li>
                <a href="home">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                    <span class="title">Trang chủ</span>
                </a>
            </li>

            <li>
                <a href="accounts">
                        <span class="icon">
                            <ion-icon name="people-outline"></ion-icon>
                        </span>
                    <span class="title">Khách Hàng</span>
                </a>
            </li>

            <li>
                <a href="products-list">
                        <span class="icon">
                            <ion-icon name="cube-outline"></ion-icon>
                        </span>
                    <span class="title">Sản phẩm</span>
                </a>
            </li>
            <li>
                <a href="order-list">
                        <span class="icon">
                            <ion-icon name="receipt-outline"></ion-icon>
                        </span>
                    <span class="title">Hóa đơn</span>
                </a>
            </li>
            <li>
                <a href="promotional-list">
                        <span class="icon">
                            <ion-icon name="pricetag-outline"></ion-icon>
                        </span>
                    <span class="title">Mã giảm giá</span>
                </a>
            </li>

            <li>
                <a href="category">
                        <span class="icon">
                            <ion-icon name="list-outline"></ion-icon>
                        </span>
                    <span class="title">Danh mục</span>
                </a>
            </li>
            <li>
                <a href="list-rating">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                    <span class="title">Review</span>
                </a>
            </li>

            <li>
                <a href="logout">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                    <span class="title" onclick="lockout()">Đăng Xuất</span>
                </a>
            </li>
        </ul>
    </div>
    <!------------------- Chính ------------------>
    <div class="main">
        <div class="topbar">
            <div class="toggle">
                <ion-icon name="menu-outline"></ion-icon>
            </div>

            <div class="search">
                <form action="order-list" method="get">
                    <label>
                        <input type="text" name="id" placeholder="Tìm kiếm ở đây">
                        <ion-icon name="search-outline"><button type="submit" style="border: none; background: none; cursor: pointer;"></button></ion-icon>
                    </label>
                    <input type="hidden" name="search" value="id">
                </form>
            </div>

            <div class="user">
                <a href="passwordManagement.html">
                    <ion-icon name="person"
                              style="color: #000000; font-size: 25px;"></ion-icon>
                </a>

            </div>
        </div>

        <!-- Phần chính -->
        <div class="order">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>Danh sách hóa đơn</h2>
                    <a href="order-list?showAll=true" class="btn">Xem Tất Cả</a>
                </div>
                <div class="update-order">
                    <p style="font-size: 20px; margin-bottom: 10px;">Cập nhật trạng thái hóa đơn</p>
                    <form action="update-status-order" method="post">
                        <input type="text" name="id" placeholder="Nhập ID hóa đơn cần cập nhật" required
                               style="font-size: 15px; padding: 2px; border-radius: 5px;">
                        <select title="choice" name="status" id="statusSelect" required
                                style="font-size: 15px; border-radius: 5px; padding: 2px;">
                            <option value="Đang xử lý">Đang xử lý</option>
                            <option value="Đã hoàn thành">Đã hoàn thành</option>
                            <option value="Đã hủy">Đã hủy</option>

                        </select>
                        <c:if test="${not empty error}">
                            <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                        </c:if>
                        <c:if test="${not empty successStatus}">
                            <p style="color: green;">${successStatus}</p>
                        </c:if>
                        <c:if test="${not empty errorDelete}">
                            <p style="color: red;">${errorDelete}</p> <!-- Hiển thị lỗi nếu có -->
                        </c:if>
                        <c:if test="${not empty successDelete}">
                            <p style="color: green;">${successDelete}</p> <!-- Hiển thị lỗi nếu có -->
                        </c:if>
                        <button type="submit" >Cập nhật trạng thái</button>
                    </form>
                </div>
                <table>
                    <thead>
                    <tr>
                        <td>Mã đơn hàng</td>
                        <td>Mã khách hàng</td>
                        <td>Ngày đặt hàng</td>
                        <td>Tổng tiền</td>
                        <td>Hình thức thanh toán</td>
                        <td>Trạng thái</td>
                        <td>Hành động</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.userId}</td>
                            <td><fmt:formatDate value="${order.createdAt}" pattern="dd-MM-yyyy HH:mm:ss"/></td>
                            <td><fmt:formatNumber value="${order.totalPrice}" type="number"/></td>
                            <td>${order.paymentMethod}</td>
                            <td>${order.status}</td>
                            <td class="v">
                                <button> <a href="GetDetailOrder?id=${order.id}" class="view-detail-btn">Chi tiết</a>
                                </button>
                                <button class="delete-btn" data-id="${order.id}">Xóa</button>
                            </td>
                        </tr>
                    </c:forEach>

                    <!-- Thêm các dòng dữ liệu khác tại đây -->
                    </tbody>
                </table>
            </div>


        </div>
        <!-- Modal Chi tiết đơn hàng -->
        <div id="orderDetailModal" class="modal">
            <div class="modal-content">
                <span class="close-modal">&times;</span>
                <h2 class="modal-title">Chi tiết đơn hàng</h2>
                <div id="orderDetailContent">
                    <!-- Thông tin chi tiết -->
                    <table class="order-detail-table">
                        <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Giảm giá</th>
                            <th>Tổng giá</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="oi" items="${orIt}">
                            <tr>
                                <td>${oi.productName}</td>
                                <td>${oi.quantity}</td>
                                <td>${oi.price}</td>
                                <td>${oi.discount}</td>
                                <td>${oi.totalPrice}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="order-info">
                        <p><strong>Mã đơn hàng:</strong> <span class="info-highlight">${orIn.id}</span></p>
                        <p><strong>Tổng tiền:</strong> <span class="info-highlight"><fmt:formatNumber value="${orIn.totalPrice}" type="number"/> ₫</span></p>
                        <p><strong>Phí giao hàng:</strong> <span class="info-highlight"><fmt:formatNumber value="${orIn.shippingFee}" type="number"/> ₫</span></p>
                        <p><strong>Số tiền giảm giá:</strong> <span class="info-highlight total-price"><fmt:formatNumber value="${orIn.discountAmount}" type="number"/> ₫</span></p>
                        <p><strong>Phương thức thanh toán:</strong> <span class="badge success">${orIn.paymentMethod}</span></p>
                        <p><strong>Trạng thái thanh toán:</strong> <span class="badge success">${orIn.paymentStatus}</span></p>
                        <p><strong>Địa chỉ:</strong>${orIn.shippingAddress}</p>
                        <p><strong>Số lượng:</strong>${orIn.quantity}</p>
                        <p><strong>Email:</strong>${orIn.email}</p>
                        <p><strong>Người nhận hàng:</strong>${orIn.name}</p>
                        <p><strong>Số điện thoại:</strong>${orIn.phoneNumber}</p>
                        <p><strong>Ghi chú:</strong>${orIn.note}</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Xóa tài khoản -->
        <div id="delete-modal" class="modal">
            <div class="modal-content">
                <h3>Xác nhận xóa</h3>
                <label>Bạn có chắc chắn muốn xóa hóa đơn này?</label>
                <div class="button-container">
                    <button id="confirm-delete" class="confirm-delete">Xóa</button>
                    <button type="button" class="close-modal">Hủy</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra nếu cần hiển thị modal
        const showModal = "${showModal}" === "true";
        if (showModal) {
            const modal = document.getElementById('orderDetailModal');
            modal.style.display = 'block';
        }
    });
</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="<c:url value="/admin/js/order.js"/>"></script>
<script src="<c:url value="/admin/js/index.js"/>"></script>
</body>
</html>