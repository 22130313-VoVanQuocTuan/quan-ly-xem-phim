//package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.user.pay;
//
//import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
//
//import hcmuaf.nlu.edu.vn.model.OrderItem;
//import hcmuaf.nlu.edu.vn.model.Orders;
//import hcmuaf.nlu.edu.vn.model.Users;
//import hcmuaf.nlu.edu.vn.service.CartService;
//import hcmuaf.nlu.edu.vn.service.OrderService;
//
//import hcmuaf.nlu.edu.vn.util.VNPayUtil;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.List;
//
//@WebServlet(name = "VNPay", value = "/payVNPAY")
//public class VNPayController extends HttpServlet {
//
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        OrderService orderService = new OrderService();
//        double amount = Double.parseDouble(req.getParameter("amount"));
//        HttpSession session = req.getSession();
//        Users user = (Users) session.getAttribute("user");
//        int userId = user.getId();
//        double totalFinalPrice = (double) session.getAttribute("totalFinalPrice");
//        double totalShippingFee = (double) session.getAttribute("totalShippingFee");
//        double totalDiscount = (double) session.getAttribute("totalDiscount");
//        String status = "Đang xử lý";
//        String paymentStatus = "Chưa thanh toán";
//        String paymentMethod = "VNPay";
//        String shippingAddress = req.getParameter("shippingAddress");
//
//
//        Orders order = new Orders(userId, totalFinalPrice, totalShippingFee, totalDiscount, shippingAddress, paymentMethod, paymentStatus, status);
//        try {
//            // Lưu đơn hàng vào cơ sở dữ liệu
//            Orders o = orderService.addOrder(order); // Trả về ID của đơn hàng vừa tạo
//            session.setAttribute("orderId", o.getId());
//            if (o != null) {
//                // Lưu chi tiết các sản phẩm trong giỏ hàng vào `OrderItem`
//
//                CartService cartService = new CartService();
//                List<CartItems> cartItems = cartService.getCartFromSession(session).listItems();
//                for (CartItems cartItem : cartItems) {
//                    System.out.println(cartItem.getProductId());
//                    OrderItem orderItem = new OrderItem(o.getId(), cartItem.getId(), cartItem.getQuantity(),cartItem.getPrice(), cartItem.getTotalPrice(), cartItem.getDiscountAmount());
//                    orderService.addOrderItems(orderItem);
//                }
//
//
//            } else {
//                // Trường hợp lưu đơn hàng thất bại
//                resp.sendRedirect(req.getContextPath() +"/confirmation");
//                return;
//            }
//
//            // Tạo URL thanh toán VNPay
//            String paymentUrl = VNPayUtil.createPaymentUrl(req, amount);
//            System.out.println(paymentUrl);
//
//            // Điều hướng người dùng tới URL thanh toán
//            resp.sendRedirect(paymentUrl);
//        } catch (SQLException e) {
//            throw new RuntimeException("Lỗi trong quá trình lưu thông tin đơn hàng.", e);
//        }
//    }
//
//
//}
