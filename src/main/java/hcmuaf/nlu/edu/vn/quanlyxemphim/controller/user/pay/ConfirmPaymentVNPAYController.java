//package hcmuaf.nlu.edu.vn.quanlyxemphim.controller.user.pay;
//
//import hcmuaf.nlu.edu.vn.dao.carts.CartItems;
//import hcmuaf.nlu.edu.vn.model.Users;
//import hcmuaf.nlu.edu.vn.service.CartService;
//import hcmuaf.nlu.edu.vn.service.EmailUtilService;
//import hcmuaf.nlu.edu.vn.service.OrderService;
//import hcmuaf.nlu.edu.vn.service.ProductService;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.List;
//
//@WebServlet(name = "ConfirmPayment", value = "/confirm-payment")
//public class ConfirmPaymentVNPAYController extends HttpServlet {
//    private  final EmailUtilService emailUtilService = new EmailUtilService();
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // Lấy các tham số từ VNPay trả về
//        String vnp_TxnRef = req.getParameter("vnp_TxnRef");
//        String vnp_ResponseCode = req.getParameter("vnp_ResponseCode");
//        String vnp_Amount = req.getParameter("vnp_Amount");
//
//        // Kiểm tra trạng thái giao dịch
//        String message;
//        if ("00".equals(vnp_ResponseCode)) {
//            message = "Thanh toán thành công! Mã giao dịch: " + vnp_TxnRef;
//
//        } else {
//            message = "Thanh toán thất bại! Vui lòng thử lại.";
//        }
//
//        // Chuyển các tham số tới JSP để hiển thị
//        req.setAttribute("vnp_TxnRef", vnp_TxnRef);
//        req.setAttribute("vnp_ResponseCode", vnp_ResponseCode);
//        req.setAttribute("vnp_Amount", vnp_Amount);
//        req.setAttribute("message", message);
//
//
//        //lấy id hóa đơn từ session
//        HttpSession session = req.getSession();
//        int orderId = (Integer) session.getAttribute("orderId");
//        OrderService orderService = new OrderService();
//        try {
//            CartService cartService = new CartService();
//            ProductService productService = new ProductService();
//            List<CartItems> cartItemsList = cartService.getCartFromSession(session).listItems();
//            for (CartItems cartItem : cartItemsList) {
//                // Cập nhật soldCount trong bảng products
//                boolean isUpdated = productService.updateSoldCountProduct(cartItem.getId(), cartItem.getQuantity());
//                if (!isUpdated) {
//                    System.out.println("Failed to update soldCount for product ID: " + cartItem.getId());
//                }
//            }
//            orderService.updateOrderPaymentStatus(orderId, "Đã thanh toán");
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//
//        // Chuyển tiếp tới file JSP
//        //Lấy user từ session để gửi email xác nhận thanh toán
//        Users user = (Users) session.getAttribute("user");
//        double totalFinalPrice = (double) session.getAttribute("totalFinalPrice");
//
//        req.setAttribute("message", "Đặt hàng thành công");
//        String emailContent = "<html>"
//                + "<body>"
//                + "<h2>Cảm ơn bạn đã đặt hàng tại cửa hàng của chúng tôi!</h2>"
//                + "<p>Chúng tôi đã nhận được đơn hàng của bạn và đang xử lý thanh toán.</p>"
//                + "<p>Thông tin đơn hàng của bạn:</p>"
//                + "<ul>"
//                + "<li><strong>Số đơn hàng:</strong>"+orderId+"</li>"
//                + "<li><strong>Tổng tiền:</strong>"+totalFinalPrice+"₫"+"</li>"
//                + "</ul>"
//                + "<p>Chúng tôi sẽ thông báo cho bạn khi đơn hàng của bạn được giao.</p>"
//                + "<p>Chân thành cảm ơn sự tin tưởng của bạn!</p>"
//                + "<footer>"
//                + "<p>Trân trọng,<br> Cửa hàng Vật liệu Xây dựng</p>"
//                + "</footer>"
//                + "</body>"
//                + "</html>";
//
//        emailUtilService.sendEmailAsync(user.getEmail(), "Xác nhận thanh toán", emailContent);
//        session.removeAttribute("cart");
//        req.getRequestDispatcher("users/page/check-pay.jsp").forward(req, resp);
//    }
//}
