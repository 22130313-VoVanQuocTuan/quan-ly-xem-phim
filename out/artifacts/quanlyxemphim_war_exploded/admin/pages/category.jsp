
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
    <link rel="stylesheet" href="<c:url value="/admin/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/css/user.css"/>">
    <link rel="stylesheet" href="<c:url value="/admin/css/category.css"/>">
</head>
<style>
    .add-category {

        margin-bottom: 15px;
        text-align: center;
    }

    .add-category button {
    background-color: #202a3b;
    color: #f1f1f1;
    border-radius: 5px;
    font-size: 17px;
    cursor: pointer;
    padding: 0px 10px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.add-category button:hover {
    transform: scale(1.1); /* Phóng to mà không ảnh hưởng đến bố cục */
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3); /* Thêm hiệu ứng bóng */
}
</style>

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
                    <form action="category" method="GET">
                        <label>
                            <input type="text" name="name" placeholder="Tìm kiếm ở đây">
                                <ion-icon name="search-outline"><button type="submit" style="border: none; background: none; cursor: pointer;"></button></ion-icon>
                        </label>
                        <input type="hidden" name="search" value="true">
                    </form>
                </div>

                <div class="user">
                    <a href="passwordManagement.html"> <ion-icon name="person" style="color: #000000; font-size: 25px;"></ion-icon></a>

                </div>
            </div>



            <!-------------------- Danh Sách Chi Tiết người dùng------------------ -->
            <div class="details-user">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Danh sách danh mục</h2>
                        <a href="category?showAll=true" class="btn">Xem Tất Cả</a>
                    </div>
                    <div class="add-category">
                        <p style="font-size: 20px; margin-bottom: 10px;">Thêm danh mục</p>
                        <form action="add-delete-category" method="post">
                        <input type="text" name="name" style="font-size: 17px; border-radius: 5px;" placeholder="Nhập tên danh mục">
                            <c:if test="${not empty error}">
                                <p style="color: red;">${error}</p> <!-- Hiển thị lỗi nếu có -->
                            </c:if>
                            <button type="submit" >Thêm</button>
                        </form>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <td>id</td>
                                <td>Tên danh mục</td>
                                <td>Ngày tạo</td>

                                <td>Hành động</td>
                            </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="category" items="${list}">
                            <tr>
                                <td>${category.id}</td>
                                <td>${category.name}</td>
                                <td>${category.createDate}</td>

                                <td>
                                    <div class="v">
                                        <button class="delete-btn" data-id="${category.id}">Xóa</button>
                                    </div>
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                 <!-- Modal Xóa tài khoản -->
                 <div id="delete-modal" class="modal">
                    <div class="modal-content">
                        <h3>Xác nhận xóa</h3>
                        <label>Bạn có chắc chắn muốn xóa tài khoản này?</label>
                        <div class="button-container">
                            <button id="confirm-delete" class="confirm-delete">Xóa</button>
                            <button class="close-modal">Hủy</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script src="<c:url value="/admin/js/index.js"/>"></script>
    <script src="<c:url value="/admin/js/category.js"/>"></script>


</body>

</html>