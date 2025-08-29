package vn.iostar.controller;

import java.io.IOException;
import java.sql.Timestamp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iostar.Service.UserService;
import vn.iostar.Service.Impl.UserServiceImpl;
import vn.iostar.model.User;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterController extends HttpServlet {

    public RegisterController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            response.sendRedirect(request.getContextPath() + "/waiting");
            return;
        }

        // Nếu có cookie thì tự động đăng nhập
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    session = request.getSession(true);
                    session.setAttribute("username", cookie.getValue());
                    response.sendRedirect(request.getContextPath() + "/waiting");
                    return;
                }
            }
        }

        // Nếu chưa login thì hiển thị trang register.jsp
        request.getRequestDispatcher("/views/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");

        String alertMsg = "";

        if (username == null || password == null || email == null || fullname == null || phone == null ||
            username.isEmpty() || password.isEmpty() || email.isEmpty() || fullname.isEmpty() || phone.isEmpty()) {
            alertMsg = "Vui lòng nhập đầy đủ thông tin";
            request.setAttribute("alert", alertMsg);
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        }

        UserService service = new UserServiceImpl();

        // kiểm tra username hoặc email đã tồn tại chưa
        if (service.checkExistUsername(username)) {
            alertMsg = "Tên đăng nhập đã tồn tại";
            request.setAttribute("alert", alertMsg);
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        }
        if (service.checkExistEmail(email)) {
            alertMsg = "Email đã tồn tại";
            request.setAttribute("alert", alertMsg);
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            return;
        }

        // Tạo User mới
        User user = new User();
        user.setUserName(username);
        user.setPassWord(password);
        user.setEmail(email);
        user.setFullName(fullname);
        user.setPhone(phone);
        user.setRoleid(1); // 2 = user thường, 1 = admin
        user.setCreatedDate(new Timestamp(System.currentTimeMillis()));

        service.insert(user);

        // Sau khi đăng ký thành công thì cho login luôn
        HttpSession session = request.getSession(true);
        session.setAttribute("account", user);
        response.sendRedirect(request.getContextPath() + "/waiting");
    }
}
