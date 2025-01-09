<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển Quản trị viên </title>
    <!------------------ Kiểu dáng ------------------>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value="/admin/css/user.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/css/promotional.css"/>">

</head>

<body>
<!-- ------------------ Điều hướng -------------------->
<div class="container">
    <div class="navigation">
        <ul>
            <li>
                <a href="index.html">
                        <span class="icon">
                            <img src="${pageContext.request.contextPath}/users/img/logo.png" alt="">
                        </span>
                    <span class="title">Bán Vật Liệu Xây Dựng </span>
                </a>
            </li>

            <li>
                <a href="index.html">
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
                <a href="order">
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
                    <span class="title">Đăng Xuất</span>
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
                <form action="promotional-list" method="GET">
                    <label>
                        <input type="text" name="value" placeholder="Tìm kiếm ở đây">
                        <ion-icon name="search-outline"><button type="submit" style="border: none; background: none; cursor: pointer;"></button></ion-icon>
                    </label>
                    <input type="hidden" name="search" value="true">
                </form>
            </div>

            <div class="user">
                <a href="passwordManagement.html">
                    <ion-icon name="person"
                              style="color: #000000; font-size: 25px;"></ion-icon>
                </a>
            </div>
        </div>
        <!-------------------- Danh Sách Chi Tiết người dùng------------------ -->
        <div class="details-user">
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>Danh sách mã ưu đãi</h2>
                    <a href="promotional-list?showAll=true" class="btn">Xem Tất Cả</a>
                </div>
                <div class="update-user">
                    <p style="font-size: 20px; margin-bottom: 10px;">Cập nhật trạng thái mã ưu đãi</p>
                    <form action="update-status-pro" method="post">
                        <input type="text" name="id" placeholder="Nhập ID mã ưu đãi cần cập nhật" required
                               style="font-size: 15px; padding: 2px; border-radius: 5px;">
                        <select title="choice" name="status" id="statusSelect" required
                                style="font-size: 15px; border-radius: 5px; padding: 2px;">
                            <option value="Hoạt động">Hoạt động</option>
                            <option value="Không hoạt động">Không hoạt động</option>
                        </select>
                        <c:if test="${not empty error}">
                            <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                        </c:if>
                        <button type="submit">Cập nhật trạng thái</button>
                    </form>
                </div>

                <div class="list-promotions-content-button">
                    <button id="add_Promotions">Thêm ưu đãi</button>
                </div>

                <table>
                    <thead>
                    <tr>
                        <td>id</td>
                        <td>Mã ưu đãi</td>
                        <td>Giá trị</td>
                        <td>Ngày bắt đầu</td>
                        <td>Ngày kết thúc</td>
                        <td>Trạng thái</td>
                        <td>Hành động</td>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="promotion" items="${listPromotional}">
                        <tr>
                            <td>${promotion.id}</td>
                            <td>${promotion.code}</td>
                            <td><fmt:formatNumber value="${promotion.value}" type="number"
                                                  groupingUsed="true"/>đ
                            </td>
                            <td><fmt:formatDate value="${promotion.startDate}" pattern="dd-MM-yyyy HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${promotion.endDate}" pattern="dd-MM-yyyy HH:mm:ss"/></td>
                            <td><span class="statusText">${promotion.status}</span></td>
                            <td>
                                <div class="v">
                                    <button class="delete-btn" data-id="${promotion.id}">Xóa</button>
                                    <button class="edit-btn" data-id-update="${promotion.id}">Sửa</button>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>


                <!-- Thêm mã ưu đãi mới -->
                <div id="addPromotionModal" class="modal">
                    <div class="modal-content">
                        <h3>Thêm mã ưu đãi mới</h3>
                        <form id="addPromotionForm" action="add-promotional" method="post">
                            <label>Mã ưu đãi:</label>
                            <input type="text" id="promotionCode" name="code" required>

                            <label>Giá trị:</label>
                            <input type="text" id="promotionName" name="value" required>

                            <label>Ngày bắt đầu:</label>
                            <input type="datetime-local" id="promotionDateStart" name="startDate" required>

                            <label>Ngày kết thúc:</label>
                            <input type="datetime-local" id="promotionDateEnd" name="endDate" required>

                            <c:if test="${not empty error}">
                                <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                            </c:if>
                            <button type="submit" id="save_Product">Lưu ưu đãi</button>
                            <button type="button" class="close-modal">Thoát</button>
                        </form>

                    </div>
                </div>

                <!-- Modal cho chỉnh sửa thông tin  -->
                <div id="editPromotional" class="modal">
                    <div class="modal-content">
                        <span class="close-btn " onclick="closeModal1()" &times;></span>
                        <h2 style="color: #FFFFFF" class="modal-title">Chỉnh sửa ưu đãi</h2>

                        <div class="editPromotional">
                            <!-- Form chỉnh sửa thông tin -->
                            <form id="editInfoForm" action="update-promotional" method="POST">
                                <input type="hidden" name="id" id="promotionId">
                                <div class="mb-3">
                                    <label for="percent" class="form-label">Gía trị:</label>
                                    <input type="number" name="value" class="form-control" id="percent"
                                           placeholder="Nhập giá trị" required>
                                </div>
                                <div class="mb-3">
                                    <label for="startDate" class="form-label">Ngày bă đầu:</label>
                                    <input type="datetime-local" name="startDate" class="form-control" id="startDate"
                                           placeholder="Nhập ngày bắt đầu" required>
                                </div>
                                <div class="mb-3">
                                    <label for="endDate" class="form-label">Ngày kết thúc:</label>
                                    <input type="datetime-local" class="form-control" name="endDate" id="endDate"
                                           placeholder="Nhập địa chỉ" required></input>
                                </div>
                                <!-- Thông báo lỗi -->
                                <c:if test="${not empty error}">
                                    <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                                </c:if>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" id="saveChanges">Lưu thay đổi</button>
                                    <button type="button" class="close-modal btn btn-secondary ">Hủy</button>
                                </div>
                            </form>
                        </div>


                    </div>
                </div>

                <!-- Modal Xóa ưu đãi -->
                <div id="delete-modal" class="modal">
                    <div class="modal-content">
                        <h3>Xác nhận xóa</h3>
                        <label>Bạn có chắc chắn muốn xóa ưu đãi này?</label>
                        <div class="button-container">
                            <button id="confirm-delete" class="confirm-delete">Xóa</button>
                            <button type="button" class="close-modal">Hủy</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script src="<c:url value="/admin/js/index.js"/>"></script>
<script src="<c:url value="/admin/js/promotional.js"/>"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra nếu cần hiển thị modal
        const showModal = "${showModal}" === "true";
        if (showModal) {
            const modal = document.getElementById('addPromotionModal');
            modal.style.display = 'block';
        }
    });
</script>

</body>

</html>